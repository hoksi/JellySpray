<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');
/**
 * Spray 관리자 로그인
 *
 * @package spray
 * @author  한대승 <hoksi2k@hanmail.net>
 */
class Fwrite extends Spray {
	private $post_data;
	
	public function __construct()
	{
		parent::__construct();
		
		$this->load->model('feed/fwrite_model');
		
		$this->post_data = array();
		
		if(FALSE) $this->fwrite_model = new Fwrite_model;
	}
	
	public function run($group = NULL)
	{
		if($this->validation()) {
			$this->responseCode = 0;
			$this->responseMessage = 'Feed가 등록 되었습니다.';
			
			$this->fwrite_model->fwrite($this->post_data);
		}
		
		return $this->get_res();
	}
	
	public function validation()
	{
		$ret = FALSE;

		// validation 조건 확인
		$config = array(
			array('field' => 'title', 'label' => 'Title', 'rules' => 'required|trim|xss_clean' ),
			array('field' => 'content', 'label' => 'Content', 'rules' => 'required|trim|xss_clean' ),
		);

		if($this->form_chk($config)) {
			$this->post_data = array(
				'title' => $this->input->post('title'),
				'content' => $this->input->post('content'),
				'fimg1' => $this->do_upload('fimg1', './upload'),
				'fimg2' => $this->do_upload('fimg2', './upload'),
				'fimg3' => $this->do_upload('fimg3', './upload'),
				'fimg4' => $this->do_upload('fimg4', './upload'),
			);
			
			$ret = TRUE;
		} else {
			$this->responseCode = -1;
			
			foreach($this->error_chk() as $err) {
				if(strstr($err, 'Title')) {
					$this->responseCode = 1;
					break;
				}
				if(strstr($err, 'Content')) {
					$this->responseCode = 2;
					break;
				}
			}

			$this->responseMessage = $err ? $err : '데이터가 입력되지 않았습니다.';
		}

		return $ret;

	}
} 
/* End of file {command_name}.php */