<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');
require_once APPPATH . 'class/spray.php';
/**
 * MA04(회원정보수정전문)
 *
 * @author		한대승 <hoksi2k@hanmail.net>
 */

class member_modify extends Spray {
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

	function validation()
	{
		$ret = FALSE;

		$this->load->library('form_validation');

		// validation 조건 확인
		$config = array(
				array( 'field' => 'nickname', 'label' => 'Nickname', 'rules' => 'required')
		);

		$this->form_validation->set_rules($config);

		if($this->form_validation->run()) {
			$this->post_data = array(
				// 'password' => $this->input->post('password'),
				'nickname' => $this->input->post('nickname')
				// 'uuid' => $this->input->post('uuid'),
				// 'profile_img_path' => '',
				// 'devicekey' => $this->input->post('devicekey')
			);

			// 등록된 Email인지 검사 한다.
			if($this->member_model->exists_nickname($this->post_data['nickname'], $this->bu_session['member_id'])){
				$this->responseCode = 'MA04_0003';
				$this->responseMessage = '등록된 NickName 입니다.';
			} else {
				/*
				// debug
				$this->post_data['password'] = (
					  $this->_debug && strlen($this->post_data['password']) < 32
					? md5($this->post_data['password'])
					: $this->post_data['password']
				);
				*/

				$ret = TRUE;
			}

			return $ret;
		} else {
			foreach(explode("\n", strip_tags(validation_errors())) as $err) {
				if(strstr($err, 'Nickname')) {
					$this->responseCode = 'MA04_0001';
					$err = 'Nickname 누락';
					break;
				} else {
					$this->responseCode = 'MA04_0001';
					$err = validation_errors();
				}
			}

			$this->responseMessage = $err;
		}

		return $ret;
	}
}