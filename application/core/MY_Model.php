<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');
/**
 * Spray_model Class include 
 */
include_once APPPATH . 'class/spray_model.class.php';

class MY_Model extends Spray_model {
	public function __construct()
	{
		/*
		 * 1. config/database.php 에 DB 환경을 설정 
		 * 2. DB 리플리케이션이 되어 있지 않은 경우  : 'single'
		 * 3. DB 리플리케이션이 되어 있는 경우 master DB(읽기/쓰기 가능 DB)를 기술해 준다. ex> master, writedb ....   
		 */
		parent::__construct('single'); // set master database configure
	}
}
