<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Default_model extends MY_Model {
	private $table = NULL;
	
	public function __construct()
	{
		parent::__construct();
		// $this->table = 'feed_comments';
	}
}
