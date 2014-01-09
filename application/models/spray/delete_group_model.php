<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Delete_group_model extends MY_Model {
	private $table = NULL;
	private $t_table = NULL;
	
	private $spray_model_dir = NULL;
	private $spray_view_dir = NULL;
	private $spray_controller_dir = NULL;
	
	public function __construct()
	{
		parent::__construct();
		
		$this->table = 'spray_command';
		$this->t_table = 'spray_template';
		
		$this->spray_controller_dir = APPPATH . 'controllers/';
		$this->spray_view_dir = APPPATH . 'views/';
		$this->spray_model_dir = APPPATH . 'models/'; 
	}

	public function delete_group($group_name, $remove_all = FALSE)
	{
		$ret = FALSE;
		
		if($this->exists_group($group_name)) {
			// Controller group
			$group = $this->spray_controller_dir . $group_name;
			$ret = @rmdir($group);

			// Model group
			$group = $this->spray_model_dir . $group_name;
			$ret = $ret && @rmdir($group);
			
			// View group
			$group = $this->spray_view_dir . $group_name;
			$ret = $ret && @rmdir($group);
			
			if($ret) {
				$this->set_table($this->table)
					->set_where('group_name', $group_name)
					->set_where('stype', 'group')
					->delete();
			}
		}
		
		return $ret;
	}

	public function exists_group($group_name)
	{
		return $this->set_table($this->table)->set_where('group_name', $group_name)->set_where('stype', 'group')->get_count() == 1
			&& $this->set_table($this->table)->set_where('group_name', $group_name)->set_where('stype', 'command')->get_count() == 0 
			&& file_exists($this->spray_controller_dir . $group_name) 
			&& file_exists($this->spray_model_dir . $group_name) 
			&& file_exists($this->spray_view_dir . $group_name);
	}

}