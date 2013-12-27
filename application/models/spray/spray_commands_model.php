<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Spray_commands_model extends MY_Model {
	private $table = NULL;
	private $spray_cmd_list = NULL;
	private $spray_dir = NULL;
	
	public function __construct()
	{
		parent::__construct();
		
		$this->table = 'spray_commands';
		
		$this->config->load('spray');
		$this->load->helper('directory');
		
		$this->spray_dir = APPPATH . 'controllers/';
		$this->spray_cmd_list = $this->_get_command_group_and_command();
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
	
	private function _get_command_group_and_command()
	{
		$no_spray_groups = $this->config->item('no_spray_groups');
		$map = directory_map($this->spray_dir);
		$cmd_list = array();
		
		foreach($map as $group => $command) {
			if(is_array($command) && in_array($group, $no_spray_groups) === FALSE) {
				$cmd_list[$group] = array('len' => 0, 'command' => array());
				foreach($command as $cmd_file) {
					$file_info = pathinfo($cmd_file);
					if($file_info['extension'] == 'php' && $this->_is_spray_command($group, $file_info['filename'])) {
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