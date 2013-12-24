<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');
/**
 * 회원로그아웃 전문
 *
 * @author		한대승 <hoksi2k@hanmail.net>
 */

class logout extends Spray {
	/**
	 * 생성자 함수
	 * 
	 * 전문의 기본적인 사항을 설정한다.
	 */
	public function __construct()
	{
		parent::__construct();
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
			$this->responseMessage = 'Member Logout';
			$this->session_model->delete_session($this->_auth_key);
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
		return TRUE;
	}
}