<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');
/**
 * Spray 관리자 로그인
 *
 * @package spray
 * @author  한대승 <hoksi2k@hanmail.net>
 */
class Login extends Jelly {
	public function __construct()
	{
		parent::__construct();
		
		$this->load->model('spray/admin_model');
		if(FALSE) $this->session_model = new Session_model;
	}
	
	public function run($group = NULL)
	{
		if($this->validation()) {
			$this->data = $this->admin_model->login($this->post_data['email'], $this->post_data['password']);
			
			if(isset($this->data['admin_id'])) {
				$this->responseCode = 0;
				$this->responseMessage = 'Login 성공';
				
				$this->data['email'] = $this->post_data['email'];
				$this->session_model->replace_session($this->_auth_key, $this->data);
			} else {
				$this->responseCode = 5;
				$this->responseMessage = 'Login 실패 (Email과 Password를 확인하여 주십시오.)';
			}
		}
		
		$this->data['email'] = $this->input->post('email');
		
		return $this->get_res();
	}
	
	public function validation()
	{
		$ret = FALSE;

		// validation 조건 확인
		$config = array(
				array( 'field' => 'email', 'label' => 'Email', 'rules' => 'required|valid_email|trim|xss_clean'),
				array( 'field' => 'passwd', 'label' => 'Passwd', 'rules' => 'required|xss_clean')
		);

		if($this->form_chk($config)) {
			$this->post_data = array(
				'email' => $this->input->post('email'),
				'password' => $this->input->post('passwd')
			);

			$ret = TRUE;
		} else {
			foreach($this->error_chk() as $err) {
				if(strstr($err, 'Email')) {
					$this->responseCode = 3;
					$err = '올바른 Email 형식이 아님';
					break;
				} elseif(strstr($err, 'Passwd')) {
					$this->responseCode = 4;
					$err = 'password 누락';
					break;
				} else {
					$this->responseCode = 1;
					$err = 'email 과 비밀번호를 입력해 주십시오.';
				}
			}

			$this->responseMessage = $err;
		}

		return $ret;

	}
} 
/* End of file setup.php */
/* Location: ./application/controllers/setup.php */