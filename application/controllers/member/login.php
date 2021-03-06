<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');
/**
 * 회원 로그인 전문
 *
 * @author		한대승 <hoksi2k@hanmail.net>
 */

class Login extends Spray {
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

		$this->load->model('member/login_model');
		
		if(FALSE) $this->login_model = new Login_model;
	}

	/**
	 * 전문 실행 : 개발자가 직접 작성
	 *
	 * @return array
	 */
	public function run()
	{
		if($this->validation()) {
			$row = $this->login_model->login($this->post_data['email']);

			if(isset($row['password']) && $row['password'] == $this->post_data['password']) {
				$this->login_model->update_last_login($row['member_id']);

				$session_id = md5($row['password'] . $row['member_id'] . $row['auth_date']);
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

				$this->responseCode = 0;
				$this->responseMessage = 'Login 성공';
			} else {
				$this->responseCode = 3;
				$this->responseMessage = '등록되지 않은 Email 이거나 비밀번호 오류';
			}
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

		// validation 조건 확인
		$config = array(
				array( 'field' => 'email', 'label' => 'Email', 'rules' => 'required|valid_email|trim|xss_clean'),
				array( 'field' => 'password', 'label' => 'Password', 'rules' => 'required|trim|xss_clean')
		);

		if($this->form_chk($config)) {
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
		} else {
			$this->responseCode = -1;
			
			foreach($this->error_chk() as $err) {
				if(strstr($err, 'Email')) {
					$this->responseCode = 1;
					$err = '올바른 Email 형식이 아님';
					break;
				} 
				
				if(strstr($err, 'Password')) {
					$this->responseCode = 2;
					$err = 'password 누락';
					break;
				}
			}

			$this->responseMessage = $err ? $err : '데이터가 입력되지 않았습니다.';
		}

		return $ret;
	}
}