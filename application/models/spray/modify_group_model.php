<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Modify_group_model extends MY_Model {
	private $table = NULL;
	private $word_tbl = NULL;
	
	private $spray_model_dir = NULL;
	private $spray_view_dir = NULL;
	private $spray_controller_dir = NULL;
	
	public function __construct()
	{
		parent::__construct();
		
		$this->table = 'spray_command';
		$this->word_tbl = 'spray_bad_word';
		
		$this->spray_controller_dir = APPPATH . 'controllers/';
		$this->spray_view_dir = APPPATH . 'views/';
		$this->spray_model_dir = APPPATH . 'models/'; 
	}

	public function modify_group($post_data)
	{
		$ret = FALSE;
		
		if($this->set_table($this->table)->set_where('spray_command_id', $post_data['gid'])->get_count() == 1) {
			$data['ptype'] = $post_data['ptype'];
			$data['desc'] = $post_data['desc'];
			
			$ret = $this->set_table($this->table)
				->set_where('spray_command_id', $post_data['gid'])
				->update($data);
		}
		
		return $ret;
	}

	public function get_group($group_name)
	{
		$ret = $this->set_table($this->table)
			->set_select('spray_command_id gid')
			->set_select('group_name')
			->set_select('ptype')
			->set_select('desc')
			->set_where('group_name', $group_name)
			->set_where('stype', 'group')
			->get_one();
			
		return $ret;
	}
	
	public function rename_group($post_data)
	{
		$ret = FALSE;

/*		
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
*/	
		return $ret;
	}
}