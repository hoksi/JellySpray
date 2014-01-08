<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');
/**
 * Spray contrroller Cwrite
 *
 * @package spray
 * @author  한대승 <hoksi2k@hanmail.net>
 */
class Cwrite extends Spray {
	private $post_data;

	public function __construct()
	{
		parent::__construct();
		
		$this->load->model('feed/default_model');
		if(FALSE) $this->default_model = new Default_model;
	}
	
	public function run($group = NULL)
	{
		if($this->validation()) {
			$this->responseCode = 0;
			$this->responseMessage = '댓글이 등록 되었습니다.';
			
			$this->default_model->add_comment($this->post_data);
		}
		
		return $this->get_res();
	}
	
	public function validation()
	{
		$ret = FALSE;

		// validation 조건 확인
		$config = array(
			array('field' => 'fid', 'label' => 'Fid', 'rules' => 'required|trim|xss_clean' ),
			array('field' => 'content', 'label' => 'Content', 'rules' => 'required|trim|xss_clean' ),
		);

		if($this->form_chk($config)) {
			$this->post_data = array(
				'fid' => $this->input->post('fid'),
				'content' => $this->input->post('content'),
				'fimg' => $this->do_upload('fimg', 'upload')
			);

			$ret = TRUE;
		} else {
			$this->responseCode = -1;
			
			foreach($this->error_chk() as $err) {
				if(strstr($err, 'Fid')) {
					$this->responseCode = 1;
					break;
				}
				if(strstr($err, 'Content')) {
					$this->responseCode = 2;
					break;
				}
			}

			$this->responseMessage = $err ? $err : '데이터가 입력되지 않았습니다.';;
		}

		return $ret;
	}
} 
/* End of file cwrite.php */