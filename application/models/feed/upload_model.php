<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Upload_model extends MY_Model {
	private $table = NULL;
	
	public function __construct()
	{
		parent::__construct();
		
		$this->table = 'feed_files';
	}
	
	public function upload($data, $status = 'ready')
	{
		$this->set_table($this->table);
		
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
}