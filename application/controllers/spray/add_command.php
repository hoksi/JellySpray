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
		
		$this->load->model('spray/spray_commands_model');
		if(FALSE) $this->spray_commands_model = new Spray_commands_model;
	}
	
	public function run($group = NULL)
	{
		$this->data = array('command_name' => $this->input->post('command_name'));

		if($this->validation($group)) {
			if($this->spray_commands_model->add_command($group, $this->post_data['command_name'], $this->post_data['v_config'])) {
				$this->responseCode = 0;
				$this->responseMessage = 'Add command success';
			} else {
				$this->responseCode = 3;
				$this->responseMessage = '이미 존재하는 전문 입니다.';
				$this->data['vconfig'] = isset($this->post_data['v_config']) ? $this->post_data['v_config'] : NULL;
			}
		}
		
		
		return $this->get_res();
	}
	
	public function validation($group)
	{
		$ret = FALSE;

		// validation 조건 확인
		$config = array(
				array( 'field' => 'command_name', 'label' => 'CommandName', 'rules' => 'required|xss_clean')
		);

		if($this->form_chk($config)) {
			if($group) {
				$this->post_data = array(
					'command_name' => $this->input->post('command_name')
				);
				
				$item_len = (int) $this->input->post('item_len');
				for($i=1; $i <= $item_len; $i++) {
					if($fname = $this->input->post('item' . $i)) {
						$opt = '';
						for($j=1; $j <= 4; $j++) {
							$opt .= ($this->input->post('item' . $i . '_opt' . $j) . '|');
						}
						$this->post_data['v_config'][] = array(
							'field' => $fname,
							'label' => ucfirst($fname),
							'rules' => rtrim(str_replace('||', '|', $opt), '|')
						);
					}
				}
				
				$ret = TRUE;
			} else {
				$this->responseCode = 2;
				$this->responseMessage = '전문을 추가할 그룹명 누락';
			}
		} else {
			$this->responseCode = -1;
			
			foreach($this->error_chk() as $err) {
				if(strstr($err, 'CommandName')) {
					$this->responseCode = 1;
					$err = '새로운 전문이름을 입력하세요.';
					break;
				}
			}

			$this->responseMessage = $err ? $err : '새로운 전문을 추가 합니다.';
		}

		return $ret;
	}
}