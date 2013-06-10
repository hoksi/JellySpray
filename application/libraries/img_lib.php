<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Img_lib {
	
	private $CI;
	
	/**
	*	--------------------------------------------------------------------------------
	*	Constructor
	*	--------------------------------------------------------------------------------
	*/
	
	public function __construct()
	{
		$this->CI = get_instance();
	}
	
	/**
	 * 
	 */
	function url_exists($url) {
		if(file_get_contents($url,0,NULL,0,1)){return 1;}else{ return 0;}
	}
}

// EOF