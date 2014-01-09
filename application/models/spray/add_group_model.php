<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Add_group_model extends MY_Model {
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
	
	public function add_group($data)
	{
		$ret = FALSE;
		
		$group_name = $data['group_name'];
		
		if($this->validation_group_name($group_name)) {
			// Model group
			$group = $this->spray_model_dir . $group_name;
			$ret = @mkdir($group);

			// View group
			$group = $this->spray_view_dir . $group_name;
			$ret = $ret && @mkdir($group);
			
			// Controller group
			$group = $this->spray_controller_dir . $group_name;
			$ret = @mkdir($group);

			// Default Crud create
			if($data['crud_create'] == 'Y') {}
			
			if($ret) {
				$this->add_spray_group($data);
			}
		}
		
		return $ret;
	}
	
	public function add_spray_group($post_data)
	{
		$data = array(
			'group_name' => $post_data['group_name'],
			'command' => '',
			'stype' => 'group',
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
}