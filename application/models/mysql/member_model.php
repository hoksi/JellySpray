<?php
class Member_model extends CI_Model {
	public $table = 'member';

	public function __construct()
	{
		parent::__construct();
	}

	private function get_one($sql, $params = array())
	{
		if(!strstr('limit', $sql)) $sql .= ' limit 1';
		$rs = $this->db->query($sql, $params)->row_array();
		$ret = is_array($rs) ? array_shift($rs) : $rs;

		return $ret;
	}

	private function get_ret($rs)
	{
		return is_array($rs) ? array_shift($rs) : $rs;
	}

	public function exists_email($email)
	{
		$sql = "select count(*) cnt from {$this->table} where email = ?";
		return $this->get_one($sql, array($email)) > 0;
	}

	public function exists_nickname($nickname, $member_id = NULL)
	{
		$sql = "select count(*) cnt from {$this->table} where nickname = ?";
		if($member_id != NULL) {
			$sql .= ' and member_id != ?';
			$val = array($nickname, $member_id);
		} else {
			$val = array($nickname);
		}

		return $this->get_one($sql, $val) > 0;
	}

	public function add_member($data)
	{
		$this->db->set('reg_date', 'sysdate()', FALSE);
		$this->db->insert($this->table, $data);
		return $this->db->insert_id();
	}

	public function get_id_password($email)
	{
		$this->db->where('email', $email);
		$this->db->select('member_id, password, nickname');
		return $this->db->get($this->table)->row_array();
	}

	public function update_last_login($member_id, $data = NULL)
	{
		$this->db->set('last_login', 'sysdate()', FALSE);
		$this->db->where('member_id', $member_id);
		
		$this->db->update($this->table, $data);

		return TRUE;
	}

	public function update_member($member_id, $data)
	{
		$this->db->where('member_id', $member_id);
		$this->db->update($this->table, $data);

		return TRUE;
	}
}
