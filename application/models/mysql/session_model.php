<?php
class Session_model extends MY_Model {
	public $table = 'ci_sessions';

	public function __construct()
	{
		parent::__construct();
	}

	public function exists_session_id($session_id)
	{
		return $this->set_table($this->table)
					->set_where('session_id', $session_id)
					->get_count() > 0;
	}

	public function replace_session($session_id, $user_data)
	{
		$data['user_data'] = serialize($user_data);
		$data['ip_address'] = $_SERVER['REMOTE_ADDR'];
		$data['user_agent'] = $_SERVER['HTTP_USER_AGENT'];
		$data['last_activity'] = time();
		
		if($this->exists_session_id($session_id)) {
			$ret = $this->set_table($this->table)
						->set_where('session_id', $session_id)
						->update($data);
		} else {
			$data['session_id'] = $session_id;

			$ret = $this->set_table($this->table)
						->insert($data);
		}
		
		return $ret;
	}

	public function get_userdata($session_id, $key = NULL)
	{
		$ret = NULL;

		$row = $this->set_table($this->table)
					->set_where('session_id', $session_id)
					->get_one();
		
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
		return $this->set_table($this->table)
					->set_where('session_id', $session_id)
					->delete();
	}
}