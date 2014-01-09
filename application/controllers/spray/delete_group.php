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
		
		$this->load->model('spray/delete_group_model');
		if(FALSE) $this->delete_group_model = new Delete_group_model;
	}
	
	public function run($group = NULL)
	{
		if($this->validation($group)) {
			if($this->delete_group_model->delete_group($group)) {
				$this->responseCode = 0;
				$this->responseMessage = 'Delete Group Success';
			} else {
				$this->responseCode = 2;
				$this->responseMessage = '전문이 모두 삭제 되지 않았습니다.';
			}
		} else {
			$this->responseCode = 1;
			$this->responseMessage = '존재하지 않는 그룹';
		}
		return $this->get_res();
	}
	
	public function validation($group)
	{
		$ret = $group ? TRUE : FALSE;
		
		return $ret;
	}
}