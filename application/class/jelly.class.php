<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');
/**
 * 웹페이지 처리기
 *
 * @author		한대승 <hoksi2k@hanmail.net>
 */
abstract class Jelly extends CI_Controller {
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
	 * Default view file name
	 * 
	 * @var string
	 */
	public $default_view_file;	 

	/**
	 * Default header view file name
	 * 
	 * @var string
	 */
	public $default_header_file;

	/**
	 * Default footer view file name
	 * 
	 * @var string
	 */
	public $default_footer_file;
	
	/**
	 * Base_url
	 *
	 * @var string
	 */
	public $base_url;
	
	/**
	 * Self url
	 *
	 * @var string
	 */
	public $self;
	
	/**
	 * 생성자
	 * 젤리를 초기화 한다. 
	 *
	 * @return void
	 */
	public function __construct()
	{
		parent::__construct();

		// 인증키 생성
		session_start();
		$this->_auth_key = md5(session_id() . $this->config->item('auth_session_key'));

		// 환경 파일 load
		$this->config->load('jelly');
		
		// 필수 라이브러리 등록
		$this->load->library('form_validation');
		
		// Session 처리용 모델
		$this->load->model('mysql/session_model');
		
		// Debug mode
		$this->_debug = isset($_GET[$this->config->item('debug_get_var_name')]) ? TRUE : FALSE;
		
		// Base URL 
		$this->base_url = '/' . $this->uri->segment(1);
		$this->self = $this->base_url . '/' . $this->router->fetch_class();
				
		// Default view file
		$this->default_view_file = $this->uri->segment(1) . '/' . $this->router->fetch_class();
		$this->default_header_file = $this->uri->segment(1) . '/' . $this->config->item('default_header');
		$this->default_footer_file = $this->uri->segment(1) . '/' . $this->config->item('default_footer');

		// 캐시 삭제용 헤더

		// $this->output->set_header("Cache-Control: no-store, no-cache, must-revalidate");
		// $this->output->set_header("Cache-Control: post-check=0, pre-check=0");
		// $this->output->set_header('Expires: Mon, 26 Jul 1997 05:00:00 GMT');
		// $this->output->set_header("Pragma: no-cache");*/

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
	public function _remap($param , $params=array())
	{
		// 파라미터
		$this->_params = array_merge(array($param != 'index' ? $param : NULL), $params);
		
		// POST로 전송된 값 Debug 하기 위해 Log로 남긴다.
		if($this->config->item('log_threshold')) {
			$this->load->library('user_agent');

			// 디버그
			if($this->input->post()) {
				$post_debug = 'POST ';
				foreach($this->input->post() as $key => $val)	$post_debug .= "`{$key} => {$val}` ";
			} elseif($this->input->get()) {
				$post_debug = 'GET ';
				foreach($this->input->get() as $key => $val)	$post_debug .= "`{$key} => {$val}` ";
			} else {
				$post_debug = $this->uri->uri_string();
			}

			log_message('error', $this->input->server('REMOTE_ADDR') . '-' . $this->agent->agent_string() . '-' .$this->router->fetch_class(). ' : ' . $post_debug);
		}

		// 세션 검증 로직
		if($this->_auth_key != NULL && $this->session_model->exists_session_id($this->_auth_key)) {
			// 로그인 한 사용자의 정보를 가져온다.
			$this->bu_session = $this->session_model->get_userdata($this->_auth_key);
			// 세션 시간 만료 확인
			$this->is_valid_auth();
		} elseif(in_array($this->router->fetch_class(), $this->public_cmd) === FALSE) {
			// 로그인이 필요한 전문인 경우 로그인 요청을 한다.
			$this->responseCode = 9997;
			$this->responseMessage = '로그인이 필요합니다.';
		}

		// 전문 실행
		$_data = $this->responseCode == 0 ? call_user_func_array(array($this, 'run'), $this->_params) : $this->get_res();

		if($this->responseCode == 9997 || $this->responseCode == 9996) {
			$this->load->view($this->default_header_file, $_data);
			$this->load->view($this->config->item('default_login_view') ? $this->config->item('default_login_view') : '/spray/login', $_data);
			$this->load->view($this->default_footer_file, $_data);
		} elseif($this->_debug) {
			$this->output->enable_profiler(TRUE);
			$_data['_debug'] = $this->_debug;
			$this->load->view('spray', $_data);
		} else {
			$this->load->view($this->default_header_file, $_data);
			$this->load->view($this->default_view_file, $_data);
			$this->load->view($this->default_footer_file, $_data);
		}
	}

	/**
	 * 전문을 실행 한다.
	 * 개발자가 실제 구현해야 하는 부분
	 */
	public function run() {
		if($this->validation()) {
			$this->responseCode = 0;
			$this->responseMessage = 'Jelly install success';
		} else {
			$this->responseCode = 9996;
			$this->responseMessage = 'Jelly error message';
		}

		return $this->get_res();
	}

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
			'self' => $this->self,
			'base_url' => $this->base_url,
			'segment' => $this->_params,
			'data' => $this->data
		);
	}

	/**
	 * 만료된 세션키인지 확인 한다.
	 *
	 * @return boolean
	 */
    protected function is_valid_auth()
    {
    	$ret = FALSE;

		if((time() - $this->bu_session['last_activity']) > $this->config->item('alive_session_time')) {
			$this->responseCode = 9996;
			$this->responseMessage = '세션이 만료 되었습니다.';
			$this->session_model->delete_session($this->_auth_key);
		} else {
			$this->session_model->update_last_activity($this->_auth_key);
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