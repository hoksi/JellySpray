<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');
/**
 * 전문 그룹을 만든다.
 *
 * @author		한대승 <hoksi2k@hanmail.net>
 */

class Add_group extends Jelly {
	public $post_data;
	
	public function __construct()
	{
		parent::__construct();
		
		$this->load->model('spray/add_group_model');
		if(FALSE) $this->add_group_model = new Add_group_model;
	}
	
	public function run($group = NULL)
	{
		if($this->validation()) {
			if($this->add_group_model->add_group($this->post_data)) {
				$this->responseCode = 0;
				$this->responseMessage = 'Add group success';
			} else {
				$this->responseCode = 3;
				$this->responseMessage = '사용 불가능한 그룹명 입니다.';
				
				$this->data = $this->post_data;
			}
		}
		
		return $this->get_res();
	}
	
	public function validation()
	{
		$ret = FALSE;

		// validation 조건 확인
		$config = array(
				array( 'field' => 'group_name', 'label' => 'GroupName', 'rules' => 'required|xss_clean|alpha_dash'),
				array( 'field' => 'ptype', 'label' => 'Ptype', 'rules' => 'required|xss_clean'),
		);

		if($this->form_chk($config)) {
			$this->post_data = array(
				'group_name' => strtolower($this->input->post('group_name')),
				'ptype' => $this->input->post('ptype'),
				'crud_create' => $this->input->post('crud_create'),
				'desc' => $this->input->post('desc')
			);

			$ret = TRUE;
		} else {
			$this->responseCode = -1;
			
			foreach($this->error_chk() as $err) {
				if(strstr($err, 'GroupName')) {
					$this->responseCode = 1;
					$err = '신규 그룹이름을 입력하세요.';
					break;
				}
				if(strstr($err, 'Ptype')) {
					$this->responseCode = 2;
					$err = '접근 권한을 설정 하세요.';
					break;
				}
			}

			$this->responseMessage = $err ? $err : '신규 그룹을 생성 합니다.';
		}

		return $ret;
	}
}