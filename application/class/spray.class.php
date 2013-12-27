<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');
/**
 * 전문 처리기
 * json, xml 반환
 *
 * @author		한대승 <hoksi2k@hanmail.net>
 */
abstract class Spray extends CI_Controller {
	/**
	 * Debug 상태 여부 확인
	 *
	 * @var string
	 */
	public $_debug = FALSE;
	
	/**
	 * 결과값 반환 형식
	 *
	 * @var string
	 */
	public $_mode;
	
	/**
	 * 세션키
	 *
	 * @var string
	 */
	public $_auth_key;
	
	/**
	 * 사용자 데이터를 관리 하는 세션 객체 또는 배열
	 *
	 * @var array or object
	 */
	public $bu_session;
	
	/**
	 * 모델에서 반환한 데이터를 관리 하는 객체 또는 배열
	 *
	 * @var array or object
	 */
	public $data;
	
	/**
	 * URI 세그먼트를 관리 하는 배열
	 *
	 * @var array
	 */
	protected $_params;
	
	/**
	 * 반환 코드 : 에러인 경우 0 이 아닌 값을 가지게 됨
	 *
	 * @var int
	 */
	protected $responseCode = 0;
	
	/**
	 * 반환 메시지  : 에러인 경우 해당 에러를 문자열로 가지게 됨
	 *
	 * @var string
	 */
	protected $responseMessage = '';
	
	/**
	 * 로그인 하지 않고 사용 가능한 커맨드를 관리 하는 배열
	 *
	 * @var array
	 */
	private $public_cmd;

	/**
	 * 생성자
	 * 스프레이를 초기화 한다. 
	 *
	 * @return void
	 */
	public function __construct()
	{
		parent::__construct();

		// 인증키 생성
		// session_start();

		// 환경 파일 load
		$this->config->load('spray');
		
		// 필수 라이브러리 등록
		$this->load->library('form_validation');
		
		// Session 처리용 모델
		$this->load->model('mysql/session_model');

		// 캐시 삭제용 헤더
		$this->output->set_header("Cache-Control: no-store, no-cache, must-revalidate");
		$this->output->set_header("Cache-Control: post-check=0, pre-check=0");
		$this->output->set_header('Expires: Mon, 26 Jul 1997 05:00:00 GMT');
		$this->output->set_header("Pragma: no-cache");

		$this->data = array();
		$this->public_cmd = $this->config->item('public_cmd');
	}

	/**
	 * 라우팅을 관리 하여 전문을 분석한다.
	 *
	 * @param string $method
	 * @param array $params
	 * @return void
	 */
	public function _remap($method, $params=array())
	{
		$cmd = $this->config->item('return_method');
		$method = strtolower($method);
		if(in_array($method, $cmd) !== FALSE) {
			$this->_auth_key = array_shift($params);
			$this->_params = $params;
			$this->$method();
		}else {
			show_404();
		}
	}

	/**
	 * 전문 테스트
	 */
	public function test()
	{
		if(in_array($this->router->fetch_class(), $this->public_cmd) !== FALSE || $this->session_model->exists_session_id($this->_auth_key)) {
			$params = array(
				'spray_dir' => $this->uri->segment(1),
				'command' => $this->router->fetch_class(), 
				'auth' => $this->_auth_key
			);
			
			$this->load->view('spray_test', $params);
		} else {
			echo "<a href='/spray/login/test'>Login first!! - Click me</a>";
		}
	}


	/**
	 * 전문 Debug
	 */
	public function debug()
	{
		$this->output->set_profiler_sections(array('config'  => TRUE, 'queries' => TRUE));
		$this->output->enable_profiler(TRUE);
		$this->_debug = TRUE;
		$this->_mode = 'XML';

		$this->_request();
	}

	/**
	 * XML형식으로 출력
	 */
	public function xml()
	{
		$this->output->set_header('Content-type: text/xml; charset=UTF-8');
		$this->output->append_output('<?xml version="1.0" encoding="UTF-8"?>');

		$this->_mode = 'XML';
		$this->_request();
	}

	/**
	 * JSON형식으로 출력
	 */
	public function json()
	{
		$this->output->set_content_type('application/json');

		$this->_mode = 'JSON';
		$this->_request();
	}

	/**
	 * 요청에 해당하는 전문을 처리후 적절한 방식에 따라 출력
	 */
	private function _request()
	{
		// POST로 전송된 값 Debug 하기 위해 Log로 남긴다.
		if($this->config->item('log_threshold')) {
			$this->load->library('user_agent');

			$post_debug = '';
			if($this->input->post()) foreach($this->input->post() as $key => $val)	$post_debug .= "`{$key} => {$val}` ";
			else $post_debug = $this->uri->uri_string();

			log_message('error', $this->input->server('REMOTE_ADDR') . '-' . $this->agent->agent_string() . '-' .$this->router->fetch_class(). ' : ' . $post_debug);
		}

		// 세션 검증 로직
		if($this->session_model->exists_session_id($this->_auth_key)) {
			// 로그인 한 사용자의 정보를 가져온다.
			$this->bu_session = $this->session_model->get_userdata($this->_auth_key);
		} elseif(in_array($this->router->fetch_class(), $this->public_cmd) === FALSE) {
			// 로그인이 필요한 전문인 경우 로그인 요청을 한다.
			$this->responseCode = 9997;
			$this->responseMessage = '로그인이 필요합니다.';
		}

		// 전문 실행
		$_data = $this->responseCode == 0 ? call_user_func_array(array($this, 'run'), $this->_params) : $this->get_res();
		$_data['_debug'] = $this->_debug;

		if($this->_mode == 'JSON') {
			$this->output->append_output(json_encode($_data));
		} elseif($this->_mode == 'XML') $this->load->view('spray', $_data);
		else show_404();
	}

	/**
	 * 전문을 실행 한다.
	 * 개발자가 실제 구현해야 하는 부분
	 */
	public function run() {}

	/**
	 * 전문을 실행하기전 사용자가 입력한 값을 검증 한다.
	 * 개발자가 실제 구현해야 하는 부분
	 *
	 * @return void
	 */
	public function validation()
	{
		return TRUE;
	}

	/**
	 * 전문 형식에 맞추어 결과 값을 리턴 한다.
	 *
	 * @return array
	 */
	protected function get_res()
	{
		return array(
			'responseCode' => $this->responseCode,
			'responseMessage' => $this->responseMessage,
			'transactionDate' => date('YmdHis'),
			'data' => $this->data
		);
	}

	/**
	 * 만료된 세션키인지 호가인 한다.
	 *
	 * @return boolean
	 */
    protected function is_valid_auth()
    {
    	$ret = isset($this->bu_session['session_id']) && $this->bu_session['session_id'] == $this->_auth_key;
		if(!$ret) {
			$this->responseCode = 9996;
			$this->responseMessage = '세션이 만료 되었습니다.';
		}
        return $ret;
    }

	/**
	 * $this->_params 배열에서 idx에 해당 하는 값을 반환 한다.
	 *
	 * @return string or NULL
	 */
	protected function get_param($idx)
	{
		return isset($this->_params[$idx]) ? $this->_params[$idx] : NULL;
	}
	
	/**
	 * 입력된 사용자 값을 확인 한다.
	 *
	 * @return void
	 */
	protected function form_chk($config) {
		$this->form_validation->set_rules($config);
		return $this->form_validation->run();
	}

	/**
	 * 사용자 값 검증 후 에러를 검증 한다.
	 *
	 * @return array
	 */
	function error_chk() {
		return explode("\n", strip_tags(validation_errors()));
	}	
}