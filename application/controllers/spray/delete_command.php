<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');
/**
 * 전문을 삭제 합니다.
 *
 * @author		한대승 <hoksi2k@hanmail.net>
 */

class Delete_command extends Jelly {
	public function __construct()
	{
		parent::__construct();
		
		$this->load->model('spray/spray_commands_model');
		if(FALSE) $this->spray_commands_model = new Spray_commands_model;
	}
	
	public function run($group = NULL, $command = NULL)
	{
		if($this->validation($group, $command)) {
			$this->responseCode = 0;
			$this->responseMessage = 'Delete command Success';
			$this->spray_commands_model->delete_command($group, $command);
		} else {
			$this->responseCode = 1;
			$this->responseMessage = '그룹명 누락';
		}
		return $this->get_res();
	}
	
	public function validation($group, $command)
	{
		$ret = $group && $command ? TRUE : FALSE;
		
		return $ret;
	}
}