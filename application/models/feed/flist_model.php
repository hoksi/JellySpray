<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Flist_model extends MY_Model {
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
	
	public function flist($page, $len = 20)
	{
		$offset = ($page - 1) * $len;
		$limit = array($len, $offset);
		
		$table = $this->member_tbl . ' m join ' . $this->table . ' f ' . 'on m.member_id = f.member_id';
		
		return $this->set_table($table)
			->set_select('f.feed_datas_id fid')
			->set_select('m.nickname')
			->set_select('f.title')
			->set_select('f.content')
			->set_select("(select stored_file_name from {$this->file_tbl} fl where fl.feed_datas_id = f.feed_datas_id order by fl.feed_files_id limit 1) fimg", FALSE)
			->set_select('f.hit')
			->set_select('f.like_cnt')
			->set_select('f.cmt_cnt')
			->set_where('del_tag', 'undel')
			->set_order_by('feed_datas_id', 'desc')
			->get_all($limit);
	}
}