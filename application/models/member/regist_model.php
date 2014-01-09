<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Regist_model extends MY_Model {
	public $table = NULL;

	public function __construct()
	{
		parent::__construct();
		
		$this->table = 'member';
	}
	
	public function regist($data)
	{
		return $this->set_data('reg_date', 'sysdate()', FALSE)
					->set_table($this->table)
					->insert($data);
	}

	public function exists_email($email)
	{
		return $this->set_table($this->table)
					->set_where('email', $email)
					->get_count() > 0;
	}

	public function exists_nickname($nickname, $member_id = NULL)
	{
		$this->set_table($this->table)
			 ->set_where('nickname', $nickname);

		if($member_id != NULL) {
			$this->set_where('member_id != ', $member_id);
		}

		return $this->get_count() > 0;
	}
}