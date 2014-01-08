<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');
/**
 * Spray contrroller Cdel
 *
 * @package spray
 * @author  한대승 <hoksi2k@hanmail.net>
 */
class Cdel extends Spray {
	private $post_data;

	public function __construct()
	{
		parent::__construct();
		
		$this->load->model('feed/default_model');
		if(FALSE) $this->default_model = new Default_model;
	}
	
	public function run()
	{
		if($this->validation()) {
			$this->responseCode = 0;
			$this->responseMessage = '삭제 성공';

			$this->default_model->del_comment($this->post_data['cid']);
		}
		
		return $this->get_res();
	}
	
	public function validation()
	{
		$ret = FALSE;

		// validation 조건 확인
		$config = array(
			array('field' => 'cid', 'label' => 'Cid', 'rules' => 'required|trim|xss_clean|integer' ),
		);

		if($this->form_chk($config)) {
			$this->post_data = array(
				'cid' => $this->input->post('cid'),
			);
			
			$ret = TRUE;
		} else {
			$this->responseCode = -1;
			
			foreach($this->error_chk() as $err) {
				if(strstr($err, 'Cid')) {
					$this->responseCode = 1;
					break;
				}
			}

			$this->responseMessage = $err ? $err : '데이터가 입력되지 않았습니다.';
		}

		return $ret;
	}
} 
/* End of file cdel.php */