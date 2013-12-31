<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');
/**
 * 스프레이 리스트
 *
 * @author		한대승 <hoksi2k@hanmail.net>
 */

class Cmd_list extends Jelly {
	public function __construct()
	{
		parent::__construct();
		
		$this->load->model('spray/spray_commands_model');
		if(FALSE) $this->spray_commands_model = new Spray_commands_model;
	}
	
	public function run($group = NULL)
	{
		if($this->validation()) {
			$this->responseCode = 0;
			$this->responseMessage = 'Spry file list';
			$this->data = array(
				'groups' => $this->spray_commands_model->get_spray_groups($group)
			);
		}
		
		return $this->get_res();
	}
	
	public function validation()
	{
		return TRUE;
	}
}