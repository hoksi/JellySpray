<?php
class Session_model extends CI_Model {
	public $table = 'ci_sessions';

	public function __construct()
	{
		parent::__construct();
	}

	private function get_ret($rs)
	{
		return is_array($rs) ? array_shift($rs) : $rs;
	}

	public function exists_session_id($session_id)
	{
		$sql = "select count(*) cnt from {$this->table} where session_id = ?";

		return $this->get_ret($this->db->query($sql, array($session_id))->row_array()) > 0;
	}

	public function replace_session($session_id, $user_data)
	{
		$data['user_data'] = serialize($user_data);
		$data['ip_address'] = $_SERVER['REMOTE_ADDR'];
		$data['user_agent'] = $_SERVER['HTTP_USER_AGENT'];
		$data['last_activity'] = time();
		if($this->exists_session_id($session_id)) {
			$this->db->where('session_id', $session_id);
			$this->db->update($this->table, $data);
		} else {
			$data['session_id'] = $session_id;
			$this->db->insert($this->table, $data);
		}
	}

	public function get_userdata($session_id, $key = NULL)
	{
		$ret = NULL;

		$this->db->select('user_data');
		$this->db->where('session_id', $session_id);
		$row = $this->db->get($this->table)->row_array();
		if(isset($row['user_data']) && !empty($row['user_data'])) {
			$user_data = unserialize($row['user_data']);
			if($key != NULL) {
				$ret = isset($user_data[$key]) ? $user_data[$key] : NULL;
			} else {
				$ret = $user_data;
			}
		}

		return $ret;
	}

	public function delete_session($session_id)
	{
		$this->db->where('session_id', $session_id);
		$this->db->delete($this->table);
	}
}