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

/*Table structure for table `migrations` */

CREATE TABLE `migrations` (
  `version` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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

/*Table structure for table `spray_template` */

CREATE TABLE `spray_template` (
  `spray_template_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL COMMENT '템플릿 이름',
  `type` enum('controller','model','view') DEFAULT NULL COMMENT '템플릿 타입',
  `content` longtext,
  PRIMARY KEY (`spray_template_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
