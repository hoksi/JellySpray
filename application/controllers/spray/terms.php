<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');
require_once APPPATH . 'class/spray.php';
/**
 * MR01(약관 조회)
 *
 * @author		한대승 <hoksi2k@hanmail.net>
 */
class Terms extends Spray {
	private $tos_file = 'assets/terms.txt';

	function __construct()
	{
		parent::__construct();
	}

	function run()
	{
		$this->responseCode = '0000';
		$this->responseMessage = 'Feed All';
		$this->data = array('terms'=>file_get_contents($this->tos_file));

		return  $this->get_res();
	}

}
