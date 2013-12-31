<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Admin_model extends MY_Model {
	private $table = 'apray_admin';
	
	public function __construct()
	{
		parent::__construct();
	}
	
	public function login($email, $pw)
	{
		return $this->set_select('admin_id')
			 ->set_table($this->table)
			 ->set_where('email', $email)
			 ->set_where('pw', "md5('{$pw}')", FALSE)
		     ->get_one();
	}
}
