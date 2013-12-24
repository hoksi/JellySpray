<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Setup extends CI_Controller {
	var $version = 1;

	function __construct()
	{
		parent::__construct();
		$this->load->library('migration');
	}

	function index()
	{
		echo "<a href='/setup/up'>Setup</a>";
		echo "<br/><br/>";
		echo "<a href='/setup/down'>Rollback</a>";
	}

	function up()
	{
		// Setup
		if (!$this->migration->version( $this->version )) {
			echo $this->migration->error_string();
		} else {
			echo "Migration OK";
		}
	}

	function down()
	{
		// Rollback
		if (!$this->migration->version( $this->version - 1 )) {
			echo "Rollback OK";
		} else {
			echo $this->migration->error_string();
		}

	}
}

/* End of file welcome.php */
/* Location: ./application/controllers/welcome.php */