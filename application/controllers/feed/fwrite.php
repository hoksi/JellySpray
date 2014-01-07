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
		
		$this->load->model('feed/default_model');
		
		$this->post_data = array();
		
		if(FALSE) $this->default_model = new Default_model;
	}
	
	public function run($group = NULL)
	{
		if($this->validation()) {
			$this->responseCode = 0;
			$this->responseMessage = '검증 성공';
			
			$this->default_model->add_feed($this->post_data);
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
			$err = validation_errors();
			
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

			$this->responseMessage = $err;
		}

		return $ret;

	}
} 
/* End of file {command_name}.php */