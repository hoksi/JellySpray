<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');
/**
 * 그룹을 삭제 합니다.
 *
 * @author		한대승 <hoksi2k@hanmail.net>
 */

class Delete_group extends Jelly {
	public function __construct()
	{
		parent::__construct();
		
		$this->load->model('spray/spray_commands_model');
		if(FALSE) $this->spray_commands_model = new Spray_commands_model;
	}
	
	public function run($group = NULL)
	{
		if($this->validation($group)) {
			$this->responseCode = 0;
			$this->responseMessage = 'Delete Group Success';
			$this->spray_commands_model->delete_group($group);
		} else {
			$this->responseCode = 1;
			$this->responseMessage = '그룹명 누락';
		}
		return $this->get_res();
	}
	
	public function validation($group)
	{
		$ret = $group ? TRUE : FALSE;
		
		return $ret;
	}
}