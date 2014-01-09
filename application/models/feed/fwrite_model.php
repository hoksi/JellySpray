<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Fwrite_model extends MY_Model {
	private $table = NULL;
		
	public function __construct()
	{
		parent::__construct();
		
		$this->table = 'feed_datas';
	}

	public function fwrite($post_data)
	{
		$this->load->model('feed/upload_model');
		
		$data['member_id'] = $this->bu_session['member_id'];
		$data['title'] = $post_data['title'];
		$data['content'] = $post_data['content'];
		$feed_id = $this->set_table($this->table)
			->set_data('created', 'sysdate()', FALSE)
			->insert($data);
		
		for($idx = 1; $idx <= 4; $idx++) {
			$fid = 'fimg' . $idx;
			if(!empty($post_data[$fid]['upload_data'])) {
				$post_data[$fid]['upload_data']['feed_datas_id'] = $feed_id;
				$this->upload_model->upload($post_data[$fid]['upload_data'], 'complete');
			} else {
				log_message('error', $post_data[$fid]['error']);
			}
		}
		
		return $feed_id;
	}
}