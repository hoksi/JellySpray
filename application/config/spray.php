<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');
/**
 * Spray 결과를 반환 하는 방법
 * 
 * debug : 실행결과를 디버그 정보와 함께 xml 형태로 출력 
 * json : 실행 결과를 JSON 형태로 출력
 * xml : 실행 결과를 XML 형태로 출력
 * test : 웹브라우져를 통하여 테스트 가능하도록 테스트폼을 출력 
 *
 * @var array
 */
$config['return_method'] = array('debug', 'json', 'xml', 'test');

/**
 * 로그인 하진 않았을때 보여줄 메시지
 *
 * @var boolean
 */
$config['login_info_message'] = "<a href='/member/login/test'>Login first!! - Click me</a>";

/**
 * 
 *//**
 * 디버거 동작을 활성화 시킨다.
 *
 * @var boolean
 */
$config['debug_mode'] = TRUE;

/**
 * 전문 디버그용 뷰파일
 *
 * @var int
 */
$config['debug_view_file'] = 'spray/debug';

/**
 * 전문 테스트용 뷰파일
 *
 * @var int
 */
$config['test_view_file'] = 'spray/spray_test';

/**
 * 썸네일 이미지 크기
 *
 * @var array
 */
$config['thumb_size'] = array('height' => 100, 'width' => 100);
 
/**
 * 업로드 파일 타입 
 *
 * @var string
 */
$config['upload_alloed_types'] = 'jpg|png';
 
/**
 * 업로드 파일  크기 제한
 *
 * @var int
 */
$config['upload_max_size'] = 10240;