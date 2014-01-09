<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Modify_model extends MY_Model {
	public $table = NULL;

	public function __construct()
	{
		parent::__construct();
		
		$this->table = 'member';
	}
	
	public function modify($member_id, $data)
	{
		$ret = FALSE;
		
		if($this->set_table($this->table)->set_where('member_id', $member_id)->get_count() == 1) {
			$ret = $this->set_table($this->table)
				->set_where('member_id', $member_id)
				->update($data);
		}
		
		return $ret;
	}
}