<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');
/**
 * 전문 처리기
 * json, xml 반환
 *
 * @author		한대승 <hoksi2k@hanmail.net>
 */
class Spray extends CI_Controller {
	public $_debug = FALSE;
	public $_mode;
	public $_auth_key;
	public $_ptype;
	public $_login;
	public $bu_session;
	public $data;
	protected $_params;
	protected $responseCode = 0;
	protected $responseMessage = '';
	private $public_cmd;

	public function __construct()
	{
		parent::__construct();

		// 환경 파일 load
		$this->config->load('spray');
		
		// Session 처리용 모델
		$this->load->model('mysql/session_model');

		// 캐시 삭제용 헤더
		$this->output->set_header("Cache-Control: no-store, no-cache, must-revalidate");
		$this->output->set_header("Cache-Control: post-check=0, pre-check=0");
		$this->output->set_header('Expires: Mon, 26 Jul 1997 05:00:00 GMT');
		$this->output->set_header("Pragma: no-cache");

		$this->data = array();
		$this->_auth_key = $this->uri->segment(4);
		$this->_ptype = strtoupper($this->uri->segment(5));
		$this->public_cmd = $this->config->item('public_cmd');
	}

	public function _remap($method, $params=array())
	{
		$cmd = array('debug', 'json', 'xml', 'test');
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
	 * @param String $command
	 */
	public function test($auth = NULL)
	{
		$this->load->view('spray_test', array('command' => $this->router->fetch_class(), 'auth' => $auth));
	}


	/**
	 * 전문 Debug
	 * @param String $command
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
	 * @param String $command
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
	 * @param String $command
	 */
	public function json()
	{
		$this->output->set_content_type('application/json');

		$this->_mode = 'JSON';
		$this->_request();
	}

	/**
	 * 요청에 해당하는 전문을 처리후 적절한 방식에 따라 출력
	 * @param String $command
	 */
	private function _request()
	{

		// POST로 전송된 값 Debug
		if($this->config->item('log_threshold')) {
			$this->load->library('user_agent');

			$post_debug = '';
			if($this->input->post()) foreach($this->input->post() as $key => $val)	$post_debug .= "`{$key} => {$val}` ";
			else $post_debug = $this->uri->uri_string();

			log_message('error', $this->input->server('REMOTE_ADDR') . '-' . $this->agent->agent_string() . '-' .$this->router->fetch_class(). ' : ' . $post_debug);
		}

		// 세션 검증 로직
		if($this->session_model->exists_session_id($this->_auth_key)) {
			$this->bu_session = $this->session_model->get_userdata($this->_auth_key);
		} elseif(in_array($this->router->fetch_class(), $this->public_cmd) === FALSE) {
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

	function run()
	{
		if($this->validation()) {
			return $this->get_res();
		}
	}

	function validation()
	{
		return TRUE;
	}

/*
 * Utility 함수
 */
	function get_res($data = NULL)
	{
		return array(
			'responseCode' => $this->responseCode,
			'responseMessage' => $this->responseMessage,
			'transactionDate' => date('YmdHis'),
			'data' => $this->data
		);
	}

    function is_valid_auth()
    {
    	$ret = isset($this->bu_session['session_id']) && $this->bu_session['session_id'] == $this->_auth_key;
		if(!$ret) {
			$this->responseCode = 9996;
			$this->responseMessage = '세션이 만료 되었습니다.';
		}
        return $ret;
    }

	function get_param($idx)
	{
		return isset($this->_params[$idx]) ? $this->_params[$idx] : NULL;
	}
}