<?php
class Spray_commands_model_tests extends Toast
{
	function __construct()
	{
		parent::__construct(__FILE__);
		
		$this->load->model('spray/spray_commands_model', 'test_model');
		if(FALSE) $this->test_model = new Spray_commands_model();
	}

	function test_add_group()
	{
		$this->_assert_true($this->test_model->add_group('test'));
		$this->_assert_true($this->test_model->add_group('test1'));
	}
	
	function test_rename_group()
	{
		$this->_assert_true($this->test_model->rename_group('test1', 'test2'));
	}

	function test_delete_group()
	{
		$this->_assert_true($this->test_model->delete_group('test2'));
	}

	function test_add_command()
	{
		$this->_assert_true($this->test_model->add_command('test', 'test'));
	}

	function test_remove_all_group()
	{
		$this->_assert_true($this->test_model->delete_group('test', TRUE));
	}
}

// End of file example_test.php */
// Location: ./system/application/controllers/test/example_test.php */