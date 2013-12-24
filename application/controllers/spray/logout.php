<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');
/**
 * 회원로그아웃 전문
 *
 * @author		한대승 <hoksi2k@hanmail.net>
 */

class logout extends Spray {
	public $post_data;

	function __construct()
	{
		parent::__construct();
	}

	function run()
	{
		if($this->validation()) {
			$this->responseCode = 0;
			$this->responseMessage = 'Member Logout';
			$this->session_model->delete_session($this->_auth_key);
		}

		return $this->get_res();
	}
}