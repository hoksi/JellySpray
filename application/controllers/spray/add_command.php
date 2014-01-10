<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');
/**
 * 새로운 전문을 만든다.
 *
 * @author		한대승 <hoksi2k@hanmail.net>
 */

class Add_command extends Jelly {
	public $post_data;
	
	public function __construct()
	{
		parent::__construct();
		
		$this->load->model('spray/add_command_model');
		if(FALSE) $this->add_command_model = new Add_command_model;
	}
	
	public function run($group = NULL)
	{
		if($this->validation($group)) {
			if($this->add_command_model->add_command($group, $this->post_data)) {
				$this->responseCode = 0;
				$this->responseMessage = 'Add command success';
			} else {
				$this->responseCode = 3;
				$this->responseMessage = '사용 불가능한 전문명 입니다.';

				$this->data = $this->post_data;
			}
		}
		
		return $this->get_res();
	}
	
	public function validation($group)
	{
		$ret = FALSE;

		// validation 조건 확인
		$config = array(
				array( 'field' => 'command_name', 'label' => 'CommandName', 'rules' => 'required|xss_clean|alpha_dash'),
				array( 'field' => 'ptype', 'label' => 'Ptype', 'rules' => 'required|xss_clean')
		);

		$this->post_data = array(
			'command_name' => strtolower($this->input->post('command_name')),
			'ptype' => $this->input->post('ptype'),
			'desc' => $this->input->post('desc'),
			'default_errmsg' => $this->input->post('default_errmsg')
		);

		$item_len = (int) $this->input->post('item_len');
		if($item_len > 0) {
			for($i=1; $i <= $item_len; $i++) {
				if($fname = strtolower($this->input->post('item' . $i))) {
					$opt = '';
					for($j=1; $j <= 4; $j++) {
						$opt .= ($this->input->post('item' . $i . '_opt' . $j) . '|');
					}
					$this->post_data['v_config'][] = array(
						'field' => $fname,
						'label' => ucfirst($fname),
						'rules' => rtrim(str_replace('||', '|', $opt), '|'),
						'err_msg' => $this->input->post('item' . $i . '_errmsg')
					);
				}
			}
		} else {
			$this->post_data['v_config'] = array();
		}

		if($this->form_chk($config)) {
			if($group) {
				$ret = TRUE;
			} else {
				$this->responseCode = 3;
				$this->responseMessage = '전문을 추가할 그룹명 누락';
			}
		} else {
			$this->responseCode = -1;
			
			foreach($this->error_chk() as $err) {
				if(strstr($err, 'CommandName')) {
					$this->responseCode = 1;
					$err = '전문명을 확인 하세요.';
					break;
				}
				if(strstr($err, 'Ptype')) {
					$this->responseCode = 2;
					$err = '접근 권한을 설정 하세요.';
					break;
				}
			}

			$this->responseMessage = $err ? $err : '새로운 전문을 추가 합니다.';
			$this->data = $this->post_data;
		}

		return $ret;
	}
}