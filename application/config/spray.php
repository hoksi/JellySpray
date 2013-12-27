<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');
/**
 * 인증을 거치지 않고 사용 가능한 명령어 리스트
 *
 * @var array
 */
$config['public_cmd'] = array('terms', 'login', 'regist');
/**
 * Spray 결과를 반환 하는 방법
 * 
 * debug : 실행결과를 디버그 정보와 함께 xml 형태로 출력 
 * json : 실행 결과를 JSON 형태로 출력
 * xml : 실행 결과를 XML 형태로 출력
 * test : 웹브라우져를 통하여 테스트 가능하도록 테스트폼을 출력 
 *
 * @var string
 */
$config['return_method'] = array('debug', 'json', 'xml', 'test');
/**
 * Spray 명령어 그룹에서 제외 시킬 그룹
 *
 * @var string
 */
$config['no_spray_groups'] = array('spray', 'toast');
