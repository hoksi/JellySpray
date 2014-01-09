<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Get_model extends MY_Model {
	private $table = NULL;
	private $file_tbl = NULL;
	private $member_tbl = NULL;
		
	public function __construct()
	{
		parent::__construct();
		
		$this->table = 'feed_datas';
		$this->file_tbl = 'feed_files';
		$this->member_tbl = 'member';
	}

	public function get($fid)
	{
		$this->set_table($this->table)
			->set_data('hit', 'hit + 1', FALSE)
			->set_where('feed_datas_id', $fid)
			->update();
		
		$table = $this->member_tbl . ' m join ' . $this->table . ' f ' . 'on m.member_id = f.member_id';
		
		$feed = $this->set_table($table)
			->set_select('f.feed_datas_id fid')
			->set_select('m.nickname')
			->set_select('f.title')
			->set_select('f.content')
			->set_select('f.hit')
			->set_select('f.like_cnt')
			->set_select('f.cmt_cnt')
			->set_where('del_tag', 'undel')
			->set_where('f.feed_datas_id', $fid)
			->set_order_by('f.feed_datas_id', 'desc')
			->get_one();
		
		if(!empty($feed)) {
			$feed['files'] = $this->set_table($this->file_tbl)
				->set_select('stored_file_name fimg')
				->set_where('feed_datas_id', $fid)
				->set_order_by('feed_files_id')
				->get_all();	
		}	
		
		return $feed;
	}
}