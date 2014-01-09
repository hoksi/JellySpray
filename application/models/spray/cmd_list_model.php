<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Cmd_list_model extends MY_Model {
	private $table = NULL;
	private $word_tbl = NULL;
	
	private $spray_model_dir = NULL;
	private $spray_view_dir = NULL;
	private $spray_controller_dir = NULL;
	
	public function __construct()
	{
		parent::__construct();
		
		$this->table = 'spray_command';
		$this->word_tbl = 'spray_bad_word';
		
		$this->spray_controller_dir = APPPATH . 'controllers/';
		$this->spray_view_dir = APPPATH . 'views/';
		$this->spray_model_dir = APPPATH . 'models/'; 
	}

	public function cmd_list($group = NULL)
	{
		$ret = $this->set_table($this->table . ' g')
			->set_select('g.group_name name')
			->set_select('g.ptype')
			->set_select('g.desc')
			->set_select("(select count(*) from {$this->table} c where c.group_name = g.group_name and c.stype='command') len")
			->set_where('stype', 'group')
			->get_all();
		
		$len = count($ret);
		
		if($group != NULL && $len > 0) {
			for($i=0; $i < $len; $i++) {
				if($ret[$i]['name'] == $group) {
					$ret[$i]['command'] = $this->set_table($this->table)
						->set_select('command name')
						->set_select('ptype')
						->set_select('desc')
						->set_where('stype', 'command')
						->set_where('group_name', $ret[$i]['name'])
						->get_all();

					break;
				}
			}
		}
/*		
		foreach($this->spray_cmd_list as $key => $val) {
			$ret[] = $group != NULL && $group == $key ? array('name' => $key, 'len' => $val['len'], 'command' => $val['command']) : array('name' => $key, 'len' => $val['len']);
		}
 */
		
		return $ret;
	}
}