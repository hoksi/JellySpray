<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');
/**
 * 전문 그룹을 만든다.
 *
 * @author		한대승 <hoksi2k@hanmail.net>
 */

class Rename_group extends Jelly {
	public $post_data;
	
	public function __construct()
	{
		parent::__construct();
		
		$this->load->model('spray/spray_commands_model');
		if(FALSE) $this->spray_commands_model = new Spray_commands_model;
	}
	
	public function run($group = NULL)
	{
		if($this->validation($group)) {
			if($this->spray_commands_model->rename_group($group, $this->post_data['group_name'])) {
				$this->responseCode = 0;
				$this->responseMessage = 'Add group success';
			} else {
				$this->responseCode = 3;
				$this->responseMessage = '이미 존재하는 그룹 입니다.';
			}
		}
		
		$this->data = array('group_name' => $this->input->post('group_name'));
		
		return $this->get_res();
	}
	
	public function validation($group)
	{
		$ret = FALSE;

		// validation 조건 확인
		$config = array(
				array( 'field' => 'group_name', 'label' => 'GroupName', 'rules' => 'required|xss_clean')
		);

		if($this->form_chk($config)) {
			if($group) {
				$this->post_data = array(
					'group_name' => $this->input->post('group_name')
				);
	
				$ret = TRUE;
			} else {
				$this->responseCode = 2;
				$this->responseMessage = '그룹명 누락';
			}
		} else {
			$this->responseCode = -1;

			foreach($this->error_chk() as $err) {
				if(strstr($err, 'GroupName')) {
					$this->responseCode = 1;
					$err = '바꿀 그룹 이름을 입력하세요.';
					break;
				}
			}

			$this->responseMessage = $err ? $err : '그룹 이름을 변경 합니다.';
		}

		return $ret;
	}
}