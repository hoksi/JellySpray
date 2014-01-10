<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');
/**
 * 전문 그룹을 만든다.
 *
 * @author		한대승 <hoksi2k@hanmail.net>
 */

class Modify_group extends Jelly {
	public $post_data;
	
	public function __construct()
	{
		parent::__construct();
		
		$this->load->model('spray/modify_group_model');
		if(FALSE) $this->modify_group_model = new Modify_group_model;
	}
	
	public function run($group = NULL)
	{
		if($this->validation($group)) {
			if($this->modify_group_model->modify_group($this->post_data)) {
				$this->responseCode = 0;
				$this->responseMessage = 'Modify group success';
			}
		} else {
			$this->data = $this->post_data;
		}
		
		return $this->get_res();
	}
	
	public function validation($group)
	{
		$ret = FALSE;

		// validation 조건 확인
		$config = array(
				array( 'field' => 'gid', 'label' => 'Gid', 'rules' => 'required|xss_clean'),
				array( 'field' => 'ptype', 'label' => 'Ptype', 'rules' => 'required|xss_clean')
		);

		$this->post_data = array(
			'gid' => $this->input->post('gid'),
			'group_name' => $this->input->post('group_name'),
			'ptype' => $this->input->post('ptype'),
			'desc' => $this->input->post('desc')
		);

		if($this->form_chk($config)) {
			$ret = TRUE;
		} else {
			$this->responseCode = -1;

			foreach($this->error_chk() as $err) {
				if(strstr($err, 'Gid')) {
					$this->responseCode = 1;
					$err = '그룹 ID 누락';
					break;
				}
				if(strstr($err, 'Ptype')) {
					$this->responseCode = 2;
					$err = '접근권한을 설정 해 주십시오.';
					break;
				}
			}
			
			if($this->responseCode == -1) {
				$this->post_data = $this->modify_group_model->get_group($group);
			}

			$this->responseMessage = $err ? $err : '그룹 정보를 수정 합니다.';
		}

		return $ret;
	}
}