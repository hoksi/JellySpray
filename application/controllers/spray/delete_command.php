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
		
		$this->load->model('spray/delete_command_model');
		if(FALSE) $this->delete_command_model = new Delete_command_model;
	}
	
	public function run($group = NULL, $command = NULL)
	{
		if($this->validation($group, $command)) {
			$this->delete_command_model->delete_command($group, $command);

			$this->responseCode = 0;
			$this->responseMessage = 'Delete command Success';
		} else {
			$this->responseCode = 1;
			$this->responseMessage = '삭제 할 수 없습니다.';
		}
		return $this->get_res();
	}
	
	public function validation($group, $command)
	{
		$ret = $group && $command ? TRUE : FALSE;
		
		return $ret;
	}
}