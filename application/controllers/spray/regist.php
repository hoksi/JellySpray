<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');
/**
 * 회원가입전문
 *
 * @author		한대승 <hoksi2k@hanmail.net>
 */

class Regist extends Spray {
	public $post_data;

	function __construct()
	{
		parent::__construct();

		$this->load->model('mysql/member_model');
	}

	function run()
	{
		if($this->validation()) {
			$this->responseCode = 0;
			$this->responseMessage = 'Member Regist';

			$this->member_model->add_member($this->post_data);
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
				array( 'field' => 'password', 'label' => 'Password', 'rules' => 'required'),
				array( 'field' => 'nickname', 'label' => 'Nickname', 'rules' => 'required')
		);

		$this->form_validation->set_rules($config);

		if($this->form_validation->run()) {
			$this->post_data = array(
				'email' => $this->input->post('email'),
				'password' => $this->input->post('password'),
				'nickname' => $this->input->post('nickname')
			);

			// 등록된 Email인지 검사 한다.
			if($this->member_model->exists_email($this->post_data['email'])) {
				$this->responseCode = 2;
				$this->responseMessage = '등록된 Email 입니다.';
			} elseif($this->member_model->exists_nickname($this->post_data['nickname'])){
				$this->responseCode = 4;
				$this->responseMessage = '등록된 NickName 입니다.';
			} else {
				// debug
				$this->post_data['password'] = (
					  $this->_debug && strlen($this->post_data['password']) < 32
					? md5($this->post_data['password'])
					: $this->post_data['password']
				);

				$ret = TRUE;
			}

			return $ret;
		} else {
			foreach(explode("\n", strip_tags(validation_errors())) as $err) {
				if(strstr($err, 'Email')) {
					$this->responseCode = 3;
					$err = '올바른 Email 형식이 아님';
					break;
				} elseif(strstr($err, 'Password')) {
					$this->responseCode = 5;
					$err = 'password 누락';
					break;
				} elseif(strstr($err, 'Nickname')) {
					$this->responseCode = 6;
					$err = 'Nickname 누락';
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