<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Logout_model extends MY_Model {
	public $table = NULL;

	public function __construct()
	{
		parent::__construct();
		
		$this->table = 'member';
	}
	
	public function logout($data)
	{
		return $data;
	}
}