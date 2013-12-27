<?php
class User extends CI_Controller {
	public function index()
	{
		echo __CLASS__;
		
		$method = strtolower($this->input->server('REQUEST_METHOD'));
		$data = json_decode(file_get_contents('php://input'));
		
		if($data) {
			echo json_encode(array('name' => $data->name, 'email' => $data->email));
		} else {
			echo '{}';
		}
	}
}
