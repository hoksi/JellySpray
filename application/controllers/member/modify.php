<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');
/**
 * 회원정보수정전문
 *
 * @author		한대승 <hoksi2k@hanmail.net>
 */

class modify extends Spray {
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
	function __construct()
	{
		parent::__construct();

		$this->load->model('mysql/member_model');
	}

	/**
	 * 전문 실행 : 개발자가 직접 작성
	 *
	 * @return array
	 */
	function run()
	{
		if($this->validation()) {
			$this->responseCode = 0;
			$this->responseMessage = 'Member Info update';

			/*
			if($this->post_data['os'] == 'A') {
				$this->post_data['adevicekey'] = $this->post_data['devicekey'];
			}

			unset($this->post_data['os']);
			unset($this->post_data['devicekey']);
			*/

			$this->member_model->update_member($this->bu_session['member_id'], $this->post_data);
		}

		return $this->get_res();
	}

	/**
	 * 전문 실행전 사용자가 입력한 데이터를 검증 한다.
	 *
	 * @return boolean
	 */
	function validation()
	{
		$ret = FALSE;

		// validation 조건 확인
		$config = array(
				array( 'field' => 'nickname', 'label' => 'Nickname', 'rules' => 'required')
		);

		if($this->validation()) {
			$this->post_data = array(
				// 'password' => $this->input->post('password'),
				'nickname' => $this->input->post('nickname')
				// 'profile_img_path' => '',
			);

			// 등록된 Email인지 검사 한다.
			if($this->member_model->exists_nickname($this->post_data['nickname'], $this->bu_session['member_id'])){
				$this->responseCode = 3;
				$this->responseMessage = '등록된 NickName 입니다.';
			} else {
				$ret = TRUE;
			}
		} else {
			foreach($this->error_chk() as $err) {
				if(strstr($err, 'Nickname')) {
					$this->responseCode = 1;
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