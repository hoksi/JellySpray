<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');
/**
 * Spray contrroller Clist
 *
 * @package spray
 * @author  한대승 <hoksi2k@hanmail.net>
 */
class Clist extends Spray {
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
			$this->responseMessage = '댓글 목록 조회';
			
			$this->data = array(
				'comments' => $this->default_model->get_comment_page($this->post_data['fid'], $this->post_data['page'], 20)
			);
			$this->data['next'] = count($this->data['comments']) == 20 ? $this->post_data['page'] + 1 : '';
		}
		
		return $this->get_res();
	}
	
	public function validation()
	{
		$ret = FALSE;

		// validation 조건 확인
		$config = array(
			array('field' => 'fid', 'label' => 'fid', 'rules' => 'required|trim|xss_clean|intager' ),
			array('field' => 'page', 'label' => 'Page', 'rules' => 'required|trim|xss_clean|intager' ),
		);

		if($this->form_chk($config)) {
			$this->post_data = array(
				'fid' => $this->input->post('fid'),
				'page' => $this->input->post('page'),
			);

			$ret = TRUE;
		} else {
			$this->responseCode = -1;
			
			foreach($this->error_chk() as $err) {
				if(strstr($err, 'fid')) {
					$this->responseCode = 1;
					break;
				}
				if(strstr($err, 'Page')) {
					$this->responseCode = 2;
					break;
				}
			}

			$this->responseMessage = $err ? $err : '데이터가 입력되지 않았습니다.';
		}

		return $ret;
	}
} 
/* End of file clist.php */