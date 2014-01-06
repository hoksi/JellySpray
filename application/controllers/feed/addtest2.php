<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');
/**
 * Spray 관리자 로그인
 *
 * @package spray
 * @author  한대승 <hoksi2k@hanmail.net>
 */
class Addtest2 extends Spray {
	public function __construct()
	{
		parent::__construct();
		
		// $this->load->model('feed/default_model');
		if(FALSE) $this->default_model = new Default_model;
	}
	
	public function run($group = NULL)
	{
		if($this->validation()) {
			$this->responseCode = 0;
			$this->responseMessage = '검증 성공';
				
		}
		
		return $this->get_res();
	}
	
	public function validation()
	{
		$ret = FALSE;

		// validation 조건 확인
		$config = array(
			array('field' => 'test1', 'label' => 'Test1', 'label' => 'required|trim|valid_email|xss_clean', ),
		);

		if($this->form_chk($config)) {
			$this->post_data = array(
				'test1' => $this->input->post('test1'),
			);

			$ret = TRUE;
		} else {
			$this->responseCode = -1;
			$err = validation_errors();
			
			foreach($this->error_chk() as $err) {
				if(strstr($err, 'Test1')) {
					$this->responseCode = 1;
					break;
				}
			}

			$this->responseMessage = $err;
		}

		return $ret;

	}
} 
/* End of file {command_name}.php */