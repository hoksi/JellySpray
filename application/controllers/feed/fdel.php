<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');
/**
 * Spray contrroller Fdel
 *
 * @package spray
 * @author  한대승 <hoksi2k@hanmail.net>
 */
class Fdel extends Spray {
	private $post_data;

	public function __construct()
	{
		parent::__construct();
		
		$this->load->model('feed/fdel_model');
		if(FALSE) $this->fdel_model = new Fdel_model;
	}
	
	public function run($group = NULL)
	{
		if($this->validation()) {
			if($this->fdel_model->fdel($this->post_data['fid'])) {
				$this->responseCode = 0;
				$this->responseMessage = 'Feed 삭제';
			} else {
				$this->responseCode = 2;
				$this->responseMessage = '삭제 되었거나 삭제 권한이 없습니다.';
			}
		}
		
		return $this->get_res();
	}
	
	public function validation()
	{
		$ret = FALSE;

		// validation 조건 확인
		$config = array(
			array('field' => 'fid', 'label' => 'Fid', 'rules' => 'required|trim|xss_clean|integer' ),
		);

		if($this->form_chk($config)) {
			$this->post_data = array(
				'fid' => $this->input->post('fid'),
			);

			$ret = TRUE;
		} else {
			$this->responseCode = -1;
			
			foreach($this->error_chk() as $err) {
				if(strstr($err, 'Fid')) {
					$this->responseCode = 1;
					break;
				}
			}

			$this->responseMessage = $err ? $err : '데이터가 입력되지 않았습니다.';
		}

		return $ret;
	}
} 
/* End of file fdel.php */