<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Terms_model extends MY_Model {
	public $table = NULL;

	public function __construct()
	{
		parent::__construct();
		
		$this->table = 'member';
	}
	
	public function terms($data)
	{
		return $data;
	}
}