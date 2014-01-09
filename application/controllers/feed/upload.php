<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');
/**
 * Spray contrroller Upload
 *
 * @package spray
 * @author  한대승 <hoksi2k@hanmail.net>
 */
class Upload extends Spray {
	private $post_data;

	public function __construct()
	{
		parent::__construct();
		
		$this->load->model('feed/upload_model');
		if(FALSE) $this->upload_model = new Upload_model;
	}
	
	public function run($group = NULL)
	{
		if($this->validation()) {
			$this->responseCode = 0;
			$this->responseMessage = '파일이 업로드 되었습니다.';
			
			$this->upload_model->upload($this->post_data['fimg'], 'ready');
		}
		
		return $this->get_res();
	}
	
	public function validation()
	{
		$ret = FALSE;

		// validation 조건 확인
		$fimg = $this->do_upload('fimg', './upload');
		
		if($fimg['error'] == '' && !empty($fimg['upload_data'])) {
			$this->post_data = array(
				'fimg' => $fimg['upload_data'],
			);

			$ret = TRUE;
		} else {
			$this->responseCode = 1;
			$err = '업로드된 파일이 없습니다.';
			
			$this->responseMessage = $err;
		}

		return $ret;

	}
} 
/* End of file upload.php */