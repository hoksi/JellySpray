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
		
		$this->load->model('feed/flist_model');
		$this->post_data = array();
		if(FALSE) $this->flist_model = new Flist_model;
	}
	
	public function run($group = NULL)
	{
		if($this->validation()) {
			$this->responseCode = 0;
			$this->responseMessage = 'Feed list';
			
			$this->data = array('feed' => $this->flist_model->flist($this->post_data['page'], 20));
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
			
			foreach($this->error_chk() as $err) {
				if(strstr($err, 'Page')) {
					$this->responseCode = 1;
					break;
				}
			}

			$this->responseMessage = $err ? $err : '데이터가 입력되지 않았습니다.';
		}

		return $ret;

	}
} 
/* End of file {command_name}.php */