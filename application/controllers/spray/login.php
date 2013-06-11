<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');
require_once APPPATH . '/class/spray.php';
/**
 * 회원 로그인 전문
 *
 * @author		한대승 <hoksi2k@hanmail.net>
 */

class Login extends Spray {
	public $post_data;

	function __construct()
	{
		parent::__construct();

		$this->load->model('mysql/member_model');
	}

	function run()
	{
		if($this->validation()) {
			$row = $this->member_model->get_id_password($this->post_data['email']);

			if(isset($row['password']) && $row['password'] == $this->post_data['password']) {
				$this->responseCode = 0;
				$this->responseMessage = 'Member Login';
				
				$this->member_model->update_last_login($row['member_id'], NULL);

				$session_id = md5($row['password'] . $row['member_id']);
				$data = array(
					'member_id' => $row['member_id'],
					'email' => $this->post_data['email'],
					'nickname' => $row['nickname']
				);

				$this->session_model->replace_session($session_id, $data);
				$this->data = array(
					'member_id' => $row['member_id'],
					'email' => $this->post_data['email'],
					'nickname' => $row['nickname'],
					'auth' => $session_id
				);
			} else {
				$this->responseCode = 2;
				$this->responseMessage = '등록되지 않은 Email 이거나 비밀번호 오류';
			}
		}

		return $this->get_res();
	}

	function validation()
	{
		$ret = FALSE;

		$this->load->library('form_validation');

		// validation 조건 확인
		$config = array(
				array( 'field' => 'email', 'label' => 'Email', 'rules' => 'required|valid_email|trim|xss_clean'),
				array( 'field' => 'password', 'label' => 'Password', 'rules' => 'required')
		);

		$this->form_validation->set_rules($config);

		if($this->form_validation->run()) {
			$this->post_data = array(
				'email' => $this->input->post('email'),
				'password' => $this->input->post('password')
			);

			// debug
			$this->post_data['password'] = (
				  $this->_debug && strlen($this->post_data['password']) < 32
				? md5($this->post_data['password'])
				: $this->post_data['password']
			);

			$ret = TRUE;

			return $ret;
		} else {
			foreach(explode("\n", strip_tags(validation_errors())) as $err) {
				if(strstr($err, 'Email')) {
					$this->responseCode = 3;
					$err = '올바른 Email 형식이 아님';
					break;
				} elseif(strstr($err, 'Password')) {
					$this->responseCode = 4;
					$err = 'password 누락';
					break;
				} else {
					$this->responseCode = 1;
					$err = validation_errors();
				}
			}

			$this->responseMessage = $err;
		}

		return $ret;
	}
}