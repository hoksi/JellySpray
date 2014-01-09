<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Login_model extends MY_Model {
	public $table = NULL;

	public function __construct()
	{
		parent::__construct();
		
		$this->table = 'member';
	}
	
	public function login($email)
	{
		return $this->set_table($this->table)
					->set_where('email', $email)
					->set_select('member_id, password, nickname, auth_date')
					->get_one();
	}
	
	public function update_last_login($member_id)
	{
		return $this->set_table($this->table)
					->set_data('last_login', 'sysdate()', FALSE)
					->set_where('member_id', $member_id)
					->update();
	}
}