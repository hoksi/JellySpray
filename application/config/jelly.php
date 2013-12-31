<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');
/**
 * 인증을 거치지 않고 사용 가능한 명령어 리스트
 *
 * @var array
 */
$config['public_cmd'] = array('test', 'welcome', 'login');
/**
 * 디버그시 사용할 get 변수 이름
 *
 * @var string
 */
$config['debug_get_var_name'] = '_debug';
/**
 * Default header view
 *
 * @var string
 */
$config['default_header'] = 'header';
/**
 * Default header view
 *
 * @var string
 */
$config['default_footer'] = 'footer';