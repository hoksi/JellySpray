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
		
		$this->load->model('comment/cwrite_model');
		if(FALSE) $this->cwrite_model = new Cwrite_model;
	}
	
	public function run($group = NULL)
	{
		if($this->validation()) {
			$this->cwrite_model->cwrite($this->post_data);

			$this->responseCode = 0;
			$this->responseMessage = '댓글이 등록 되었습니다.';
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
			if($this->cwrite_model->exists_feed($this->input->post('fid'))) {
				$this->post_data = array(
					'fid' => $this->input->post('fid'),
					'content' => $this->input->post('content'),
					'fimg' => $this->do_upload('fimg', './upload')
				);
	
				$ret = TRUE;
			} else {
				$this->responseCode = 3;
				$this->responseMessage = '존재하지 않거나 삭제된 Feed 입니다.';
			}
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