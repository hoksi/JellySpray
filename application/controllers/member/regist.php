<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');
/**
 * 회원가입전문
 *
 * @author		한대승 <hoksi2k@hanmail.net>
 */
class Regist extends Spray {
	/**
	 * 회원 가입을 위해 입력한 데이터
	 *
	 * @var array
	 */
	public $post_data;

	/**
	 * 생성자 함수
	 * 
	 * 전문의 기본적인 사항을 설정한다.
	 */
	public function __construct()
	{
		parent::__construct();

		$this->load->model('mysql/member_model');
	}

	/**
	 * 전문 실행 : 개발자가 직접 작성
	 *
	 * @return array
	 */
	public function run()
	{
		if($this->validation()) {
			$this->responseCode = 0;
			$this->responseMessage = 'Member Regist';

			$this->member_model->add_member($this->post_data);
		}

		return $this->get_res();
	}

	/**
	 * 전문 실행전 사용자가 입력한 데이터를 검증 한다.
	 *
	 * @return boolean
	 */
	public function validation()
	{
		$ret = FALSE;

		// validation 조건 을 설정 한다.
		$config = array(
				array( 'field' => 'email', 'label' => 'Email', 'rules' => 'required|valid_email|trim|xss_clean'),
				array( 'field' => 'password', 'label' => 'Password', 'rules' => 'required'),
				array( 'field' => 'nickname', 'label' => 'Nickname', 'rules' => 'required')
		);

		if($this->form_chk($config)) {
			$this->post_data = array(
				'email' => $this->input->post('email'),
				'password' => $this->input->post('password'),
				'nickname' => $this->input->post('nickname'),
				'auth_date' => date('Y-m-d H:i:s')
			);

			// 등록된 Email인지 검사 한다.
			if($this->member_model->exists_email($this->post_data['email'])) {
				$this->responseCode = 2;
				$this->responseMessage = '등록된 Email 입니다.';
			} elseif($this->member_model->exists_nickname($this->post_data['nickname'])){
				$this->responseCode = 4;
				$this->responseMessage = '등록된 NickName 입니다.';
			} else {
				// test 모듈에서 호출 한 경우 암호를 md5로 변환 한다.
				$this->post_data['password'] = (
					  $this->_debug && strlen($this->post_data['password']) < 32
					? md5($this->post_data['password'])
					: $this->post_data['password']
				);

				$ret = TRUE;
			}
		} else {
			foreach($this->error_chk() as $err) {
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