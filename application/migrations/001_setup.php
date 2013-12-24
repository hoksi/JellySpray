<?php
defined('BASEPATH') OR exit('No direct script access allowed');
/*
 * 멀티 업로드를 지원하기 위해 buddyup 테이블에 이미지용 컬럼 3개 추가.
 */
class Migration_Setup extends CI_Migration {

	function __construct()
	{
		// $this->output->enable_profiler(TRUE);
		$this->load->dbforge();
	}

	public function up()
	{
		if(!$this->db->table_exists('ci_sessions')) {
			$this->db->query("CREATE TABLE `ci_sessions` (
				  `session_id` varchar(40) NOT NULL DEFAULT '0',
				  `ip_address` varchar(16) NOT NULL DEFAULT '0',
				  `user_agent` varchar(120) NOT NULL,
				  `last_activity` int(10) unsigned NOT NULL DEFAULT '0',
				  `user_data` text NOT NULL,
				  PRIMARY KEY (`session_id`),
				  KEY `last_activity_idx` (`last_activity`)
				) DEFAULT CHARSET=utf8;"
			);
		}
		
		if(!$this->db->table_exists('member')) {
			$this->db->query("CREATE TABLE `member` (
				  `member_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '회원고유ID',
				  `email` varchar(50) NOT NULL COMMENT 'email',
				  `password` char(32) NOT NULL COMMENT '비밀번호',
				  `nickname` varchar(50) NOT NULL DEFAULT '' COMMENT '별명',
				  `last_login` datetime NOT NULL COMMENT '마지막로그인',
				  `status` int(11) NOT NULL COMMENT '탈퇴여부',
				  `profile_img_path` varchar(100) NOT NULL COMMENT '프로필 사진',
				  `emailsend` char(1) DEFAULT 'Y' COMMENT '친구요청/수락 이메일 수신여부',
				  `point` int(11) NOT NULL DEFAULT '0' COMMENT '포인트',
				  `mileage` int(11) NOT NULL DEFAULT '0' COMMENT '마일리지',
				  `level` int(1) NOT NULL DEFAULT '1' COMMENT '레벨',
				  `reg_date` datetime NOT NULL COMMENT '등록일',
				  PRIMARY KEY (`member_id`),
				  KEY `email_idx` (`email`),
				  KEY `nickname_idx` (`nickname`) KEY_BLOCK_SIZE=1024
				) DEFAULT CHARSET=utf8;"
			);
		}
	}

	public function down()
	{
		if($this->db->table_exists('member')) $this->dbforge->drop_table('member');
		if($this->db->table_exists('ci_sessions')) $this->dbforge->drop_table('ci_sessions');
	}
}