<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Default_model extends MY_Model {
	private $table = NULL;
	
	public function __construct()
	{
		parent::__construct();
		$this->table = 'feed_datas';
	}
	
	public function get_page($page, $len = 20)
	{
		$offset = ($page - 1) * $len;
		
		$limit = array($len, $offset);
		
		return $this->set_table($this->table)
			->set_where('del_tag', 'undel')
			->set_order_by('feed_datas_id', 'desc')
			->get_all($limit);
	}
	
	public function add_feed($post_data)
	{
		print_r($post_data);
	}
}
