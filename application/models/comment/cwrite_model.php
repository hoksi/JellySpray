<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Cwrite_model extends MY_Model {
	private $table = NULL;
	private $feed_tbl = NULL;
	
	public function __construct()
	{
		parent::__construct();
		$this->table = 'feed_comments';
		$this->feed_tbl = 'feed_datas';
	}

	public function cwrite($post_data)
	{
		$data['member_id'] = $this->bu_session['member_id'];
		$data['feed_datas_id'] = $post_data['fid'];
		$data['content'] = $post_data['content'];
		
		$comment_id = $this->set_table($this->table)
			->set_data('created', 'sysdate()', FALSE)
			->insert($data);
		
		if($comment_id) {
			$this->set_table($this->feed_tbl)
				->set_data('cmt_cnt', 'cmt_cnt + 1', FALSE)
				->set_where('feed_datas_id', $post_data['fid'])
				->update();
			
			if(!empty($post_data['fimg']['upload_data'])) {
				$this->load->model('feed/upload_model');
				
				$post_data[$fid]['upload_data']['feed_comments_id'] = $comment_id;
				$this->upload_model->upload($post_data['fimg']['upload_data'], 'complete');
			} else {
				log_message('error', $post_data['fimg']['error']);
			}
		}
		
		return $comment_id;
	}
	
	public function exists_feed($fid)
	{
		return $this->set_table($this->feed_tbl)
			->set_where('feed_datas_id', $fid)
			->set_where('del_tag', 'undel')
			->get_count() == 1;
	}
}
