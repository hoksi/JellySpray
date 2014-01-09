<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Add_command_model extends MY_Model {
	private $table = NULL;
	private $t_table = NULL;
	private $word_tbl = NULL;
	
	private $spray_model_dir = NULL;
	private $spray_view_dir = NULL;
	private $spray_controller_dir = NULL;
	
	public function __construct()
	{
		parent::__construct();
		
		$this->table = 'spray_command';
		$this->t_table = 'spray_template';
		$this->word_tbl = 'spray_bad_word';
		
		$this->spray_controller_dir = APPPATH . 'controllers/';
		$this->spray_view_dir = APPPATH . 'views/';
		$this->spray_model_dir = APPPATH . 'models/'; 
	}
	
	public function add_command($group_name, $post_data, $template_name = 'default')
	{
		$ret = FALSE;
		
		$finfo = explode('.', $post_data['command_name']);
		$command_name = $finfo[0];
		
		if($command_name != NULL && $this->validation_command($group_name, $command_name)) {
			// Validation
			$vconfig = $post_data['v_config'];
			
			// Model file create
			$ret = $this->make_model($group_name, $command_name, $vconfig, $template_name);
			
			// View file create
			$ret = $ret && $this->make_view($group_name, $command_name, $vconfig, $template_name);

			// Controller file create
			$ret = $ret && $this->make_cntroller($group_name, $command_name, $post_data['default_errmsg'], $vconfig, $template_name);
			
			if($ret) {
				$this->add_spray_command($group_name, $post_data);
			}
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
	
	public function validation_command($group_name, $command)
	{
		return $this->set_table($this->table)->set_where('group_name', $group_name)->set_where('command', $command)->get_count() == 0 
			&& $this->set_table($this->word_tbl)->set_where('word', $command)->get_count() == 0
			&& !file_exists($this->spray_controller_dir . $group_name . '/' . $command . '.php')
			&& !file_exists($this->spray_model_dir . $group_name . '/' . $command . '_model.php')
			&& !file_exists($this->spray_view_dir . $group_name . '/' . $command . '.php');
	}

	public function add_spray_command($group_name, $post_data)
	{
		$data = array(
			'group_name' => $group_name,
			'command' => $post_data['command_name'],
			'stype' => 'command',
			'ptype' => $post_data['ptype'],
			'desc' => $post_data['desc']
		);
		
		return $this->set_table($this->table)
			->set_data('created', 'sysdate()', FALSE)
			->insert($data);
	}
	
	public function validation_group_name($group_name)
	{
		
		return $this->set_table($this->table)->set_where('group_name', $group_name)->get_count() == 0 
			&& $this->set_table($this->word_tbl)->set_where('word', $group_name)->get_count() == 0
			&& !file_exists($this->spray_controller_dir . $group_name) 
			&& !file_exists($this->spray_model_dir . $group_name) 
			&& !file_exists($this->spray_view_dir . $group_name);
	}
	
	public function make_model($group_name, $command_name, $vconfig = NULL, $template_name = 'default')
	{
		$data = array(
			'class_name' => ucfirst($command_name),
			'command_name' => $command_name,
			'group_name' => $group_name
		); 
		
		return file_put_contents($this->spray_model_dir . $group_name . '/' . $command_name . '_model.php', $this->templeate_parse($template_name, 'model', $data));
	}

	public function make_view($group_name, $command_name, $vconfig = NULL, $template_name = 'default')
	{
		$v_str = '';

		if(!empty($vconfig)) {
			foreach($vconfig as $vitem) {
				if(isset($vitem['field']) && isset($vitem['rules'])) {
					$v_str .= "\t<tr>\n";
					$v_str .= "\t\t<td>{$vitem['field']}</td>\n";
					$v_str .= "\t\t<td><input type=\"text\" name=\"{$vitem['field']}\" value=\"\" id=\"{$vitem['field']}\" /></td>\n";
					if(strstr($vitem['rules'], 'required')) {
						$v_str .= "\t\t<td>필수입력</td>\n";
					} else {
						$v_str .= "\t\t<td></td>\n";
					}
					$v_str .= "\t</tr>\n";
				}
			}
		}

		$data = array('field_list' => rtrim($v_str));
		
		return file_put_contents($this->spray_view_dir . $group_name . '/' . $command_name . '.php', $this->templeate_parse($template_name, 'view', $data));
	}
	
	public function make_cntroller($group_name, $command_name, $default_errmsg, $vconfig = NULL, $template_name = 'default')
	{
		$validation = "\$ret = TRUE;";
		
		if(!empty($vconfig)) {
			$v_str = '';
			$d_str = '';
			$e_str = '';
			$err_code = 1;

			foreach($vconfig as $vitem) {
				if(isset($vitem['field']) && isset($vitem['label']) && isset($vitem['rules'])) {
					$v_str .= 'array(';
					$v_str .= "'field' => '{$vitem['field']}', ";
					$v_str .= "'label' => '{$vitem['label']}', ";
					$v_str .= "'rules' => '{$vitem['rules']}' ";
					$v_str .= '),' . "\n\t\t\t";
					
					$d_str .= "'{$vitem['field']}' => \$this->input->post('{$vitem['field']}'),\n\t\t\t\t";
					
					$e_str .= "if(strstr(\$err, '{$vitem['label']}')) {\n";
					$e_str .= "\t\t\t\t\t\$this->responseCode = {$err_code};\n";
					if($vitem['err_msg']) {
						$e_str .= "\t\t\t\t\t\$this->responseMessage = '{$vitem['err_msg']}';\n";
					}
					$e_str .= "\t\t\t\t\tbreak;\n";
					$e_str .= "\t\t\t\t}\n\t\t\t\t";
					$err_code++;
				}
			}
			
			if($v_str != '') {
				$data = array(
					'validation' => rtrim($v_str), 
					'post_data' => rtrim($d_str), 
					'err_code' => rtrim($e_str),
					'default_errmsg' => trim($default_errmsg)
				);
				
				$validation = $this->templeate_parse($template_name, 'controller_validation', $data);
			}
		}
		
		
		$data = array(
			'class_name' => ucfirst($command_name), 
			'command_name' => $command_name,
			'group_name' => $group_name,
			'validation' => trim($validation)
		);
		
		return file_put_contents($this->spray_controller_dir . $group_name . '/' . $command_name . '.php', $this->templeate_parse($template_name, 'controller', $data));
	}
	
	public function templeate_parse($template_name, $template_type, $parse_data)
	{
		if(is_array($parse_data) && !empty($parse_data)) {
			$template = $this->get_template($template_name, $template_type);
			
			foreach($parse_data as $key => $val) {
				$template['content'] = str_replace('{' . $key . '}', $val, $template['content']);
			}
			
			return $template['content'];
		} else {
			return NULL;
		}
	}
}