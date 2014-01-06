/*
SQLyog Ultimate v11.11 (64 bit)
MySQL - 5.5.32 : Database - spray
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
/*Table structure for table `ci_sessions` */

CREATE TABLE `ci_sessions` (
  `session_id` varchar(40) NOT NULL DEFAULT '0',
  `ip_address` varchar(16) NOT NULL DEFAULT '0',
  `user_agent` varchar(120) NOT NULL,
  `last_activity` int(10) unsigned NOT NULL DEFAULT '0',
  `user_data` text NOT NULL,
  PRIMARY KEY (`session_id`),
  KEY `last_activity_idx` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `ci_sessions` */

insert  into `ci_sessions`(`session_id`,`ip_address`,`user_agent`,`last_activity`,`user_data`) values ('18c8fe6b2c11ac6f5e9bc1d5ff336746','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64; rv:26.0) Gecko/20100101 Firefox/26.0',1388999770,'a:2:{s:8:\"admin_id\";s:1:\"1\";s:5:\"email\";s:11:\"admin@t.com\";}');
insert  into `ci_sessions`(`session_id`,`ip_address`,`user_agent`,`last_activity`,`user_data`) values ('d96e825b94954c495a715fddc9c7f58a','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64; rv:26.0) Gecko/20100101 Firefox/26.0',1388990022,'a:3:{s:9:\"member_id\";s:1:\"2\";s:5:\"email\";s:7:\"t@t.com\";s:8:\"nickname\";s:5:\"test3\";}');
insert  into `ci_sessions`(`session_id`,`ip_address`,`user_agent`,`last_activity`,`user_data`) values ('l2gagsi4a4cc7bvglvaggegfs2','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64; rv:26.0) Gecko/20100101 Firefox/26.0',1388479233,'a:2:{s:8:\"admin_id\";s:1:\"1\";s:5:\"email\";s:11:\"admin@t.com\";}');
insert  into `ci_sessions`(`session_id`,`ip_address`,`user_agent`,`last_activity`,`user_data`) values ('notphifjdfgsfa7h7mg2hqdes1','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/31.0.1650.63 Safari/537.36',1388465185,'a:2:{s:8:\"admin_id\";s:1:\"1\";s:5:\"email\";s:11:\"admin@t.com\";}');

/*Table structure for table `member` */

CREATE TABLE `member` (
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
  `auth_date` datetime DEFAULT NULL COMMENT '인증키발급일',
  `reg_date` datetime NOT NULL COMMENT '등록일',
  PRIMARY KEY (`member_id`),
  KEY `email_idx` (`email`),
  KEY `nickname_idx` (`nickname`) KEY_BLOCK_SIZE=1024
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `member` */

insert  into `member`(`member_id`,`email`,`password`,`nickname`,`last_login`,`status`,`profile_img_path`,`emailsend`,`point`,`mileage`,`level`,`auth_date`,`reg_date`) values (2,'t@t.com','b59c67bf196a4758191e42f76670ceba','test3','2014-01-06 15:33:42',0,'','Y',0,0,1,'2013-12-24 17:26:00','2013-12-24 15:32:15');
insert  into `member`(`member_id`,`email`,`password`,`nickname`,`last_login`,`status`,`profile_img_path`,`emailsend`,`point`,`mileage`,`level`,`auth_date`,`reg_date`) values (3,'t1@t.com','b59c67bf196a4758191e42f76670ceba','test2','0000-00-00 00:00:00',0,'','Y',0,0,1,'2013-12-24 09:51:27','2013-12-24 17:51:27');

/*Table structure for table `migrations` */

CREATE TABLE `migrations` (
  `version` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `migrations` */

insert  into `migrations`(`version`) values (1);

/*Table structure for table `spray_admin` */

CREATE TABLE `spray_admin` (
  `admin_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary key',
  `email` varchar(100) DEFAULT NULL COMMENT 'email',
  `pw` char(32) DEFAULT NULL COMMENT 'password md5 hash',
  `created` datetime DEFAULT NULL COMMENT '생성일',
  `updated` datetime DEFAULT NULL COMMENT '수정일',
  PRIMARY KEY (`admin_id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `spray_admin` */

insert  into `spray_admin`(`admin_id`,`email`,`pw`,`created`,`updated`) values (1,'admin@t.com','b59c67bf196a4758191e42f76670ceba','2013-12-31 09:34:00','2013-12-31 09:34:02');

/*Table structure for table `spray_template` */

CREATE TABLE `spray_template` (
  `spray_template_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL COMMENT '템플릿 이름',
  `type` enum('controller','model','view') DEFAULT NULL COMMENT '템플릿 타입',
  `content` longtext,
  PRIMARY KEY (`spray_template_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `spray_template` */

insert  into `spray_template`(`spray_template_id`,`name`,`type`,`content`) values (1,'default','controller','<?php  if ( ! defined(\'BASEPATH\')) exit(\'No direct script access allowed\');\r\n/**\r\n * Spray 관리자 로그인\r\n *\r\n * @package spray\r\n * @author  한대승 <hoksi2k@hanmail.net>\r\n */\r\nclass {class_name} extends Spray {\r\n	public function __construct()\r\n	{\r\n		parent::__construct();\r\n		\r\n		// $this->load->model(\'{group_name}/default_model\');\r\n		if(FALSE) $this->default_model = new Default_model;\r\n	}\r\n	\r\n	public function run($group = NULL)\r\n	{\r\n		if($this->validation()) {\r\n			$this->responseCode = 0;\r\n			$this->responseMessage = \'검증 성공\';\r\n				\r\n		} else {\r\n				$this->responseCode = 1;\r\n				$this->responseMessage = \'검증실패\';\r\n		}\r\n		\r\n		return $this->get_res();\r\n	}\r\n	\r\n	public function validation()\r\n	{\r\n		$ret = FALSE;\r\n\r\n		// validation 조건 확인\r\n		$config = array(\r\n			{validation}\r\n		);\r\n\r\n		if($this->form_chk($config)) {\r\n			$this->post_data = array(\r\n				{post_data}\r\n			);\r\n\r\n			$ret = TRUE;\r\n		} else {\r\n			$this->responseCode = -1;\r\n			$err = validation_errors();\r\n			\r\n			foreach($this->error_chk() as $err) {\r\n				{err_code}\r\n			}\r\n\r\n			$this->responseMessage = $err;\r\n		}\r\n\r\n		return $ret;\r\n\r\n	}\r\n} \r\n/* End of file {command_name}.php */');
insert  into `spray_template`(`spray_template_id`,`name`,`type`,`content`) values (2,'default','view','<table class=\"table\">\r\n    <thead>\r\n    <tr>\r\n        <th class=\"span2\">Field</th>\r\n        <th></th>\r\n        <th></th>\r\n    </tr>\r\n    </thead>\r\n    <tr>\r\n        <td>email</td>\r\n        <td><input type=\"text\" name=\"email\" value=\"\" id=\"email\" /></td>\r\n        <td>사용자 Email</td>\r\n    </tr>\r\n    <tr>\r\n        <td>password</td>\r\n        <td><input type=\"text\" name=\"password\" value=\"\" id=\"next\" /></td>\r\n        <td>사용자암호</td>\r\n    </tr>\r\n	<tr>\r\n		<td></td>\r\n		<td>\r\n			<input type=\"submit\" value=\"실 행\" />\r\n			<input type=\"reset\" />\r\n		</td>\r\n		<td></td>\r\n	</tr>\r\n</table>');
insert  into `spray_template`(`spray_template_id`,`name`,`type`,`content`) values (3,'default','model','<?php  if ( ! defined(\'BASEPATH\')) exit(\'No direct script access allowed\');\r\nclass Default_model extends MY_Model {\r\n	private $table = NULL;\r\n	\r\n	public function __construct()\r\n	{\r\n		parent::__construct();\r\n		// $this->table = \'{table}\';\r\n	}\r\n}\r\n');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
