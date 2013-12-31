<?php
class Admin_model_tests extends Toast
{
	function __construct()
	{
		parent::__construct(__FILE__);
		
		$this->load->model('spray/admin_model');
	}

	function test_login()
	{
		// Login 실패
		$data = $this->admin_model->login('t@t.com', '1111');
		$this->_assert_empty($data);
		// Login 성공
		$data = $this->admin_model->login('admin@t.com', '1111');
		$this->_assert_true(isset($data['admin_id']));
	}
}

// End of file example_test.php */
// Location: ./system/application/controllers/test/example_test.php */