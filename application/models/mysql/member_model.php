<?php
class Member_model extends MY_Model {
	public $table = 'member';

	public function __construct()
	{
		parent::__construct();
	}
	public function exists_email($email)
	{
		return $this->set_table($this->table)
					->set_where('email', $email)
					->get_count() > 0;
	}

	public function exists_nickname($nickname, $member_id = NULL)
	{
		$this->set_table($this->table)
			 ->set_where('nickname', $nickname);

		if($member_id != NULL) {
			$this->set_where('member_id != ', $member_id);
		}

		return $this->get_count() > 0;
	}

	public function add_member($data)
	{
		return $this->set_data('reg_date', 'sysdate()', FALSE)
					->set_table($this->table)
					->insert($data);
	}

	public function get_id_password($email)
	{
		return $this->set_table($this->table)
					->set_where('email', $email)
					->set_select('member_id, password, nickname, auth_date')
					->get_one();
	}

	public function update_last_login($member_id)
	{
		return $this->set_table($this->table)
					->set_data('last_login', 'sysdate()', FALSE)
					->set_where('member_id', $member_id)
					->update();
	}

	public function update_member($member_id, $data)
	{
		$this->db->where('member_id', $member_id);
		$this->db->update($this->table, $data);

		return TRUE;
	}
}
