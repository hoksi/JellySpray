<?php
class Feed_model_tests extends Toast
{
	public function __construct()
	{
		parent::__construct(__FILE__);
		
		$this->output->enable_profiler();
		
		$this->load->model('feed/default_model', 'test_model');
		if(FALSE) $this->test_model = new Default_model();
	}

	public function test_feed_list()
	{
		$this->_assert_true(count($this->test_model->get_page(1)) == 20);
	}
	
}

// End of file feed_model_test.php */