<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Spray_commands_model extends MY_Model {
	private $table = NULL;
	private $t_table = NULL;
	private $spray_cmd_list = NULL;
	private $spray_dir = NULL;
	
	public function __construct()
	{
		parent::__construct();
		
		$this->table = 'spray_commands';
		$this->t_table = 'spray_template';
		
		$this->config->load('spray');
		$this->load->helper('directory');
		
		$this->spray_dir = APPPATH . 'controllers/';
		$this->spray_view_dir = APPPATH . 'views/';
		$this->spray_model_dir = APPPATH . 'models/'; 
		
		$this->spray_cmd_list = $this->_get_group_and_command();
	}
	
	public function get_spray_groups($group = NULL)
	{
		$ret = array();
		
		foreach($this->spray_cmd_list as $key => $val) {
			$ret[] = $group != NULL && $group == $key ? array('name' => $key, 'len' => $val['len'], 'command' => $val['command']) : array('name' => $key, 'len' => $val['len']);
		}
		
		return $ret;
	}
	
	public function get_spray_commands($group)
	{
		return array_key_exists($group, $this->spray_cmd_list) ? $this->spray_cmd_list[$group]['command'] : NULL;
	}
	
	public function add_group($group_name, $create_model)
	{
		$ret = FALSE;
		
		if(!$this->_exists_group($group_name)) {
			// Controller group
			$group = $this->spray_dir . $group_name;
			$ret = @mkdir($group);

			// Model group
			$group = $this->spray_model_dir . $group_name;
			$ret = @mkdir($group);
			
			// Default Model create
			if($create_model == 'Y') {
				$model_file = $group . '/default_model.php';
				$template = $this->get_template('default', 'model');
				$content = str_replace('{table}', $group_name, $template['content']);
				file_put_contents($model_file, $content);
			}

			// View group
			$group = $this->spray_view_dir . $group_name;
			$ret = $ret && @mkdir($group);
		}
		
		return $ret;
	}
	
	public function rename_group($org_group_name, $new_group_name)
	{
		$ret = FALSE;
		
		if($this->_exists_group($org_group_name)) {
			// Controller group
			$group = $this->spray_dir . $org_group_name;
			$new_group = $this->spray_dir . $new_group_name;
			$ret = @rename($group, $new_group);

			// Model group
			$group = $this->spray_model_dir . $org_group_name;
			$new_group = $this->spray_model_dir . $new_group_name;
			$ret = @rename($group, $new_group);
			
			// View group
			$group = $this->spray_view_dir . $org_group_name;
			$new_group = $this->spray_view_dir . $new_group_name;
			$ret = $ret && @rename($group, $new_group);
		}
		
		return $ret;
	}
	
	public function delete_group($group_name, $remove_all = FALSE)
	{
		$ret = FALSE;
		
		if($this->_exists_group($group_name)) {
			// Controller group
			$group = $this->spray_dir . $group_name;
			$ret = ($remove_all == TRUE ? $this->_remove_all($group) : @rmdir($group));

			// Model group
			$group = $this->spray_model_dir . $group_name;

			// Default model file remove
			$model_file = $group . '/default_model.php';
			if(file_exists($model_file)) {
				unlink($model_file);
			}
			
			// Model group remove
			$ret = ($remove_all == TRUE ? $this->_remove_all($group) : @rmdir($group));
			
			// View group
			$group = $this->spray_view_dir . $group_name;
			$ret = $ret && ($remove_all == TRUE ? $this->_remove_all($group) : @rmdir($group));
		}
		
		return $ret;
	}
	
	public function add_command($group_name, $command_name, $vconfig = NULL)
	{
		$ret = FALSE;
		
		$finfo = explode('.', $command_name);
		$command_name = $finfo[0];
		if($command_name != NULL && !$this->_exists_command($group_name, $command_name)) {
			// Controller file create
			$command = $this->spray_dir . $group_name . '/' . $command_name . '.php';
			$template = $this->get_template('default', 'controller');
			$v_str = '';
			$d_str = '';
			$e_str = '';
			$err_code = 1;
			foreach($vconfig as $vitem) {
				$v_str .= 'array(';
				$v_str .= "'field' => '{$vitem['field']}', ";
				$v_str .= "'label' => '{$vitem['label']}', ";
				$v_str .= "'rules' => '{$vitem['rules']}' ";
				$v_str .= '),' . "\n\t\t\t";
				
				$d_str .= "'{$vitem['field']}' => \$this->input->post('{$vitem['field']}'),\n\t\t\t\t";
				
				$e_str .= "if(strstr(\$err, '{$vitem['label']}')) {\n";
				$e_str .= "\t\t\t\t\t\$this->responseCode = {$err_code};\n";
				$e_str .= "\t\t\t\t\tbreak;\n";
				$e_str .= "\t\t\t\t}\n\t\t\t\t";
				$err_code++;
			}
			$parser = array('{class_name}', '{group_name}', '{validation}', '{post_data}', '{err_code}');
			$pval = array(ucfirst($command_name), $group_name, rtrim($v_str), rtrim($d_str), rtrim($e_str));
			$content = str_replace($parser, $pval, $template['content']);
			$ret = file_put_contents($command, $content);

			// View file create
			$command = $this->spray_view_dir . $group_name . '/' . $command_name . '.php';
			$template = $this->get_template('default', 'view');

			$v_str = '';
			foreach($vconfig as $vitem) {
				$v_str .= "\t<tr>\n";
				$v_str .= "\t\t<td>{$vitem['field']}</td>\n";
				$v_str .= "\t\t<td><input type=\"text\" name=\"{$vitem['field']}\" value=\"\" id=\"{$vitem['field']}\" /></td>\n";
				$v_str .= "\t\t<td></td>\n";
				$v_str .= "\t</tr>\n";
			}
			$parser = array('{field_list}');
			$pval = array(rtrim($v_str));
			$content = str_replace($parser, $pval, $template['content']);
			$ret = file_put_contents($command, $content);
		}
		
		return $ret;
	}

	public function delete_command($group_name, $command_name)
	{
		$ret = FALSE;
		
		if($this->_exists_command($group_name, $command_name)) {
			$command = $this->spray_dir . $group_name . '/' . $command_name . '.php';
			$ret = unlink($command);
			$command = $this->spray_view_dir . $group_name . '/' . $command_name . '.php';
			$ret = unlink($command);
		}
		
		return $ret;
	}

	public function get_template($name, $type)
	{
		return $this->set_table($this->t_table)
			->set_select('content')
			->set_where('name', $name)
			->set_where('type', $type)
			->get_one();
	}
	
	private function _exists_group($group_name)
	{
		return file_exists($this->spray_dir . $group_name) 
			   && is_dir($this->spray_dir . $group_name)
			   && file_exists($this->spray_model_dir . $group_name) 
			   && is_dir($this->spray_model_dir . $group_name)
			   && file_exists($this->spray_view_dir . $group_name)
			   && is_dir($this->spray_view_dir . $group_name);
	}
	
	private function _exists_command($group_name, $command)
	{
		return file_exists($this->spray_dir . $group_name . '/' . $command . '.php') 
			   && file_exists($this->spray_view_dir . $group_name . '/' . $command . '.php');
	}
	
	private function _remove_all($dir)
	{
		$files = array_diff(scandir($dir), array('.','..'));
		foreach ($files as $file) {
			(is_dir("{$dir}/{$file}")) ? $this->_remove_all("{$dir}/{$file}") : unlink("{$dir}/{$file}");
	    } 
		
	    return @rmdir($dir); 
	}
	
	private function _get_group_and_command()
	{
		$no_spray_groups = $this->config->item('no_spray_groups');
		$map = directory_map($this->spray_dir);
		$cmd_list = array();
		
		foreach($map as $group => $command) {
			if(is_array($command) && in_array($group, $no_spray_groups) === FALSE) {
				$cmd_list[$group] = array('len' => 0, 'command' => array());
				foreach($command as $cmd_file) {
					$file_info = pathinfo($cmd_file);
					if(isset($file_info['extension']) && $file_info['extension'] == 'php' && $this->_is_spray_command($group, $file_info['filename'])) {
						$cmd_list[$group]['command'][] = $file_info['filename'];
					}
					$cmd_list[$group]['len'] = count($cmd_list[$group]['command']);
				}
			}
		}
		
		return $cmd_list;
	}
	
	private function _is_spray_command($group, $cmd_file)
	{
		$ret = FALSE;
		$cmd_file = $this->spray_dir . $group . '/' . $cmd_file . '.php';
		$fp = fopen($cmd_file, 'rb');
		if($fp) {
			$ret = strstr(fread($fp, 2048), 'extends Spray');
			fclose($fp);
		}
		
		return $ret;
	}
}