<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Fdel_model extends MY_Model {
	private $table = NULL;
	
	public function __construct()
	{
		parent::__construct();
		
		$this->table = 'feed_datas';
	}
	
	public function fdel($fid)
	{
		$ret = FALSE;
		
		$where = array(
			'feed_datas_id' => $fid,
			'member_id' => $this->bu_session['member_id'],
			'del_tag' => 'undel'		
		);
		
		$data = $this->set_table($this->table)
			->set_select('feed_datas_id fid')
			->set_where($where)
			->get_one();
		
		if(isset($data['fid']) && $data['fid']) {
			$ret = $this->set_table($this->table)
				->set_data('del_tag', 'del')
				->set_where($where)
				->update();
		}
			
		return $ret;
	}
}