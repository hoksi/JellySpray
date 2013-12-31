<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');
/**
 * 전문을 추가 합니다.
 *
 * @author		한대승 <hoksi2k@hanmail.net>
 */

class Add_command extends Jelly {
	public $post_data;
	
	public function __construct()
	{
		parent::__construct();
		
		$this->load->model('spray/spray_commands_model');
		if(FALSE) $this->spray_commands_model = new Spray_commands_model;
	}
	
	public function run($group = NULL)
	{
		if($this->validation()) {
			if($this->spray_commands_model->add_group($this->post_data['group_name'])) {
				$this->responseCode = 0;
				$this->responseMessage = 'Add group success';
			} else {
				$this->responseCode = 3;
				$this->responseMessage = '이미 존재하는 그룹 입니다.';
			}
		}
		
		return $this->get_res();
	}
	
	public function validation()
	{
		$ret = FALSE;

		// validation 조건 확인
		$config = array(
				array( 'field' => 'group_name', 'label' => 'GroupName', 'rules' => 'required|xss_clean')
		);

		if($this->form_chk($config)) {
			$this->post_data = array(
				'group_name' => $this->input->post('group_name')
			);

			$ret = TRUE;
		} else {
			foreach($this->error_chk() as $err) {
				if(strstr($err, 'GroupName')) {
					$this->responseCode = 2;
					$err = '신규 그룹이름을 입력하세요.';
					break;
				} else {
					$this->responseCode = 1;
					$err = '신규 그룹을 생성 합니다.';
				}
			}

			$this->responseMessage = $err;
		}

		return $ret;
	}
}