<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Cdel_model extends MY_Model {
	private $table = NULL;
	private $feed_tbl = NULL;
	
	public function __construct()
	{
		parent::__construct();
		$this->table = 'feed_comments';
		$this->feed_tbl = 'feed_datas';
	}

	public function cdel($cid)
	{
		$ret = FALSE;
		
		$where = array(
			'feed_comments_id' => $cid,
			'member_id' => $this->bu_session['member_id'],
			'del_tag' => 'undel'		
		);
		
		$data = $this->set_table($this->table)
			->set_select('feed_datas_id fid')
			->set_where($where)
			->get_one();
		
		if(isset($data['fid']) && $data['fid']) {
			$ret = $this->set_table($this->table)
				->set_data('del_tag', 'del')
				->set_where($where)
				->update();
	
			if($ret > 0) {
				$this->set_table($this->feed_tbl)
					->set_data('cmt_cnt', 'cmt_cnt - 1', FALSE)
					->set_where('feed_datas_id', $data['fid'])
					->update();
			}
		}
		
		return $ret;
	}
}
