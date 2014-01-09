<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Clist_model extends MY_Model {
	private $table = NULL;
	private $feed_tbl = NULL;
	private $member_tbl = NULL;
	private $file_tbl = NULL;
	
	
	public function __construct()
	{
		parent::__construct();
		$this->table = 'feed_comments';
		$this->feed_tbl = 'feed_datas';
		$this->member_tbl = 'member';
		$this->file_tbl = 'feed_files';
	}

	public function clist($fid, $page, $len = 20)
	{
		$ret = FALSE;
		
		$cnt = $this->set_table($this->feed_tbl)
			->set_where('feed_datas_id', $fid)
			->set_where('del_tag', 'undel')
			->get_count();
			
		if($cnt == 1) {
			$offset = ($page - 1) * $len;
			$limit = array($len, $offset);
			
			$table = $this->member_tbl . ' m join ' . $this->table . ' c ' . 'on m.member_id = c.member_id';
			
			$ret = $this->set_table($table)
				->set_select('c.feed_comments_id cid')
				->set_select('m.nickname')
				->set_select('c.content')
				->set_select("(select stored_file_name from {$this->file_tbl} fl where fl.feed_comments_id = c.feed_comments_id order by fl.feed_files_id limit 1) fimg", FALSE)
				->set_select('c.created')
				->set_where('c.feed_datas_id', $fid)
				->set_where('c.del_tag', 'undel')
				->set_order_by('c.feed_comments_id', 'desc')
				->get_all($limit);
		}
			
		return $ret;
	}
}
