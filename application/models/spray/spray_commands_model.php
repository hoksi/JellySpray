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
	
	private function _exists_group($group_name)
	{
		return file_exists($this->spray_dir . $group_name) 
			   && is_dir($this->spray_dir . $group_name)
			   && file_exists($this->spray_model_dir . $group_name) 
			   && is_dir($this->spray_model_dir . $group_name)
			   && file_exists($this->spray_view_dir . $group_name)
			   && is_dir($this->spray_view_dir . $group_name);
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