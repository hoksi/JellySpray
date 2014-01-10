<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Delete_command_model extends MY_Model {
	private $table = NULL;
	
	private $spray_model_dir = NULL;
	private $spray_view_dir = NULL;
	private $spray_controller_dir = NULL;
	private $toast_dir = NULL;
	
	public function __construct()
	{
		parent::__construct();
		
		$this->table = 'spray_command';
		
		$this->spray_controller_dir = APPPATH . 'controllers/';
		$this->spray_view_dir = APPPATH . 'views/';
		$this->spray_model_dir = APPPATH . 'models/';
		$this->toast_dir = $this->spray_controller_dir . 'spray_toast/';
	}
	
	public function delete_command($group_name, $command_name)
	{
		$ret = FALSE;
		
		if($this->exists_command($group_name, $command_name)) {
			$file_name = $this->spray_controller_dir . $group_name . '/' . $command_name . '.php';
			$ret = unlink($file_name);
			$file_name = $this->spray_model_dir . $group_name . '/' . $command_name . '_model.php';
			$ret = $ret && unlink($file_name);
			$file_name = $this->toast_dir . $group_name . '_' . $command_name . '_model_tests.php';
			$ret = $ret && unlink($file_name);
			$file_name = $this->spray_view_dir . $group_name . '/' . $command_name . '.php';
			$ret = $ret && unlink($file_name);
			
			if($ret) {
				$this->delete_spray_command($group_name, $command_name);
			}
		}
		
		return $ret;
	}

	public function delete_spray_command($group_name, $command)
	{
		return $this->set_table($this->table)
			->set_where('group_name', $group_name)
			->set_where('command', $command)
			->delete();
	}

	public function exists_command($group_name, $command)
	{
		return $this->set_table($this->table)->set_where('group_name', $group_name)->set_where('command', $command)->get_count() == 1 
			&& file_exists($this->spray_controller_dir . $group_name . '/' . $command . '.php')
			&& file_exists($this->spray_model_dir . $group_name . '/' . $command . '_model.php')
			&& file_exists($this->spray_view_dir . $group_name . '/' . $command . '.php');
	}
}