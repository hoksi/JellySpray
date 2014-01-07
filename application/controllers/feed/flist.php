<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');
/**
 * Spray 관리자 로그인
 *
 * @package spray
 * @author  한대승 <hoksi2k@hanmail.net>
 */
class Flist extends Spray {
	protected $post_data;
	
	public function __construct()
	{
		parent::__construct();
		
		$this->load->model('feed/default_model');
		$this->post_data = array();
		if(FALSE) $this->default_model = new Default_model;
	}
	
	public function run($group = NULL)
	{
		if($this->validation()) {
			$this->responseCode = 0;
			$this->responseMessage = 'Feed list';
			
			$this->data = array('feed' => $this->default_model->get_page($this->post_data['page'], 20));
			$this->data['next_page'] = count($this->data['feed']) == 20 ? $this->post_data['page'] + 1 : '';
		}
		
		return $this->get_res();
	}
	
	public function validation()
	{
		$ret = FALSE;

		// validation 조건 확인
		$config = array(
			array('field' => 'page', 'label' => 'Page', 'rules' => 'required|trim|xss_clean|integer' ),
		);

		if($this->form_chk($config)) {
			$this->post_data = array(
				'page' => $this->input->post('page'),
			);

			$ret = TRUE;
		} else {
			$this->responseCode = -1;
			$err = '필수 데이터 입력이 되지 않았습니다.';
			
			foreach($this->error_chk() as $err) {
				if(strstr($err, 'Page')) {
					$this->responseCode = 1;
					break;
				}
			}

			$this->responseMessage = $err;
		}

		return $ret;

	}
} 
/* End of file {command_name}.php */