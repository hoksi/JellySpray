<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');
/**
 * 인증을 거치지 않고 사용 가능한 명령어 리스트
 *
 * @var array
 */
$config['public_cmd'] = array('test', 'welcome', 'login');
/**
 * 세션키를 암호화 할 문자열
 *
 * @var array
 */
$config['auth_session_key'] = 'd96e825b94954c495a715fddc9c7f58a';
/**
 * 세션키를 유효 시간
 *
 * @var int
 */
$config['alive_session_time'] = 600; // 10분
/**
 * 인증을 거치지 않은 경우 사용할 login URL
 *
 * @var string
 */
$config['default_login_url'] = '/spray/login';
/**
 * 인증을 거치지 않은 경우 사용할 login URL
 *
 * @var string
 */
$config['default_login_view'] = 'spray/login';
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