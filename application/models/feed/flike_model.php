<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Flike_model extends MY_Model {
	private $table = NULL;
	private $feed_tbl = NULL;
	
	public function __construct()
	{
		parent::__construct();
		
		$this->table = 'feed_likes';
		$this->feed_tbl = 'feed_datas';
	}
	
	public function flike($fid)
	{
		$where = array(
			'feed_datas_id' => $fid,
			'member_id' => $this->bu_session['member_id']
		);
		
		$this->set_table($this->table)
			->set_where($where);
			
		if($this->get_count() > 0) {
			$this->set_table($this->feed_tbl)->set_data('like_cnt', 'like_cnt - 1', FALSE)->set_where('feed_datas_id', $fid)->update();
			$ret = $this->set_table($this->table)->set_where($where)->delete();
		} else {
			$this->set_table($this->feed_tbl)->set_data('like_cnt', 'like_cnt + 1', FALSE)->set_where('feed_datas_id', $fid)->update();
			$ret = $this->set_table($this->table)->set_data($where)->insert();
		}
		
		return $ret;
	}
}