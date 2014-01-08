<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Default_model extends MY_Model {
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
	
	public function get_page($page, $len = 20)
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
	
	public function get_feed($fid)
	{
		$this->set_table($this->table)
			->set_data('hit', 'hit + 1', FALSE)
			->set_where('feed_datas_id', $fid)
			->update();
		
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
			->set_where('f.feed_datas_id', $fid)
			->set_order_by('f.feed_datas_id', 'desc')
			->get_one();
	}
	
	public function add_feed($post_data)
	{
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
				$this->add_file($post_data[$fid]['upload_data'], 'complete');
			} else {
				log_message('error', $post_data[$fid]['error']);
			}
		}
		
		return $feed_id;
	}
	
	public function add_file($data, $status = 'ready')
	{
		$this->set_table($this->file_tbl);
		
		if(isset($data['feed_datas_id'])) {
			$this->set_data('feed_datas_id', $data['feed_datas_id']);
		}
		if(isset($data['feed_comments_id'])) {
			$this->set_data('feed_comments_id', $data['feed_comments_id']);
		}
		
		$file_data = array(
			'member_id' => $this->bu_session['member_id'],
			'origin_file_name' => $data['orig_name'],
			'stored_file_name' => $data['file_name'],
			'file_path' => $data['full_path'],
			'file_type' => $data['file_ext'],
			'file_size' => $data['file_size'],
			'is_image' => $data['is_image'] + 1,
			'image_width' => $data['image_width'],
			'image_height' => $data['image_height'],
			'image_type' => $data['image_type'],
			'image_size_str' => $data['image_size_str'],
			'status' => $status
		);
		
		return $this->insert($file_data);
	}
	
	public function get_files($mode, $fid)
	{
		return $this->set_table($this->file_tbl)
			->set_select('stored_file_name fimg')
			->set_where($mode, $fid)
			->set_order_by('feed_files_id')
			->get_all();			
	}
}
