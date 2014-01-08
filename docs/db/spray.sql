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

insert  into `ci_sessions`(`session_id`,`ip_address`,`user_agent`,`last_activity`,`user_data`) values ('18c8fe6b2c11ac6f5e9bc1d5ff336746','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64; rv:26.0) Gecko/20100101 Firefox/26.0',1389155586,'a:3:{s:8:\"admin_id\";s:1:\"1\";s:16:\"test_session_key\";s:32:\"d96e825b94954c495a715fddc9c7f58a\";s:5:\"email\";s:11:\"admin@t.com\";}');
insert  into `ci_sessions`(`session_id`,`ip_address`,`user_agent`,`last_activity`,`user_data`) values ('d96e825b94954c495a715fddc9c7f58a','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64; rv:26.0) Gecko/20100101 Firefox/26.0',1389063201,'a:3:{s:9:\"member_id\";s:1:\"2\";s:5:\"email\";s:7:\"t@t.com\";s:8:\"nickname\";s:5:\"test3\";}');
insert  into `ci_sessions`(`session_id`,`ip_address`,`user_agent`,`last_activity`,`user_data`) values ('l2gagsi4a4cc7bvglvaggegfs2','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64; rv:26.0) Gecko/20100101 Firefox/26.0',1388479233,'a:2:{s:8:\"admin_id\";s:1:\"1\";s:5:\"email\";s:11:\"admin@t.com\";}');
insert  into `ci_sessions`(`session_id`,`ip_address`,`user_agent`,`last_activity`,`user_data`) values ('notphifjdfgsfa7h7mg2hqdes1','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/31.0.1650.63 Safari/537.36',1388465185,'a:2:{s:8:\"admin_id\";s:1:\"1\";s:5:\"email\";s:11:\"admin@t.com\";}');

/*Table structure for table `feed_comments` */

CREATE TABLE `feed_comments` (
  `feed_comments_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `feed_datas_id` int(11) DEFAULT NULL,
  `member_id` int(11) DEFAULT NULL,
  `content` text,
  `reg_date` datetime DEFAULT NULL,
  `del_tag` enum('undel','del') DEFAULT 'undel',
  PRIMARY KEY (`feed_comments_id`),
  KEY `member_id` (`member_id`),
  KEY `djbdata_id` (`feed_datas_id`)
) ENGINE=InnoDB AUTO_INCREMENT=250 DEFAULT CHARSET=utf8;

/*Data for the table `feed_comments` */

insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`reg_date`,`del_tag`) values (1,1,2,'1 test comment','2013-12-23 11:40:01','del');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`reg_date`,`del_tag`) values (2,1,1,'2 test comment','2013-12-23 11:42:57','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`reg_date`,`del_tag`) values (3,1,1,'3 test comment','2013-12-23 11:42:58','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`reg_date`,`del_tag`) values (4,1,1,'4 test comment','2013-12-23 11:42:58','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`reg_date`,`del_tag`) values (6,1,1,'6 test comment','2013-12-23 11:42:59','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`reg_date`,`del_tag`) values (7,1,1,'7 test comment','2013-12-23 11:42:59','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`reg_date`,`del_tag`) values (8,1,1,'8 test comment','2013-12-23 11:42:59','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`reg_date`,`del_tag`) values (9,1,1,'9 test comment','2013-12-23 11:42:59','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`reg_date`,`del_tag`) values (13,1,1,'13 test comment','2013-12-23 11:43:00','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`reg_date`,`del_tag`) values (14,1,1,'14 test comment','2013-12-23 11:43:00','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`reg_date`,`del_tag`) values (15,1,1,'15 test comment','2013-12-23 11:43:00','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`reg_date`,`del_tag`) values (16,1,1,'16 test comment','2013-12-23 11:43:00','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`reg_date`,`del_tag`) values (17,1,1,'17 test comment','2013-12-23 11:43:00','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`reg_date`,`del_tag`) values (18,1,1,'18 test comment','2013-12-23 11:43:00','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`reg_date`,`del_tag`) values (19,1,1,'19 test comment','2013-12-23 11:43:00','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`reg_date`,`del_tag`) values (20,1,1,'20 test comment','2013-12-23 11:43:00','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`reg_date`,`del_tag`) values (28,1,1,'28 test comment','2013-12-23 11:43:01','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`reg_date`,`del_tag`) values (29,1,1,'29 test comment','2013-12-23 11:43:01','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`reg_date`,`del_tag`) values (30,1,1,'30 test comment','2013-12-23 11:43:01','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`reg_date`,`del_tag`) values (31,1,1,'31 test comment','2013-12-23 11:43:01','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`reg_date`,`del_tag`) values (32,1,1,'32 test comment','2013-12-23 11:43:01','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`reg_date`,`del_tag`) values (33,1,1,'33 test comment','2013-12-23 11:43:01','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`reg_date`,`del_tag`) values (34,1,1,'34 test comment','2013-12-23 11:43:01','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`reg_date`,`del_tag`) values (35,1,1,'35 test comment','2013-12-23 11:43:01','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`reg_date`,`del_tag`) values (36,1,1,'36 test comment','2013-12-23 11:43:01','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`reg_date`,`del_tag`) values (37,1,1,'37 test comment','2013-12-23 11:43:01','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`reg_date`,`del_tag`) values (38,1,1,'38 test comment','2013-12-23 11:43:01','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`reg_date`,`del_tag`) values (39,1,1,'39 test comment','2013-12-23 11:43:01','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`reg_date`,`del_tag`) values (40,1,1,'40 test comment','2013-12-23 11:43:01','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`reg_date`,`del_tag`) values (41,1,1,'41 test comment','2013-12-23 11:43:01','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`reg_date`,`del_tag`) values (42,1,1,'42 test comment','2013-12-23 11:43:01','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`reg_date`,`del_tag`) values (43,1,1,'43 test comment','2013-12-23 11:43:01','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`reg_date`,`del_tag`) values (59,1,1,'59 test comment','2013-12-23 11:43:01','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`reg_date`,`del_tag`) values (60,1,1,'60 test comment','2013-12-23 11:43:01','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`reg_date`,`del_tag`) values (61,1,1,'61 test comment','2013-12-23 11:43:01','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`reg_date`,`del_tag`) values (62,1,1,'62 test comment','2013-12-23 11:43:01','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`reg_date`,`del_tag`) values (63,1,1,'63 test comment','2013-12-23 11:43:01','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`reg_date`,`del_tag`) values (64,1,1,'64 test comment','2013-12-23 11:43:01','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`reg_date`,`del_tag`) values (65,1,1,'65 test comment','2013-12-23 11:43:01','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`reg_date`,`del_tag`) values (66,1,1,'66 test comment','2013-12-23 11:43:01','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`reg_date`,`del_tag`) values (67,1,1,'67 test comment','2013-12-23 11:43:01','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`reg_date`,`del_tag`) values (68,1,1,'68 test comment','2013-12-23 11:43:01','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`reg_date`,`del_tag`) values (69,1,1,'69 test comment','2013-12-23 11:43:01','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`reg_date`,`del_tag`) values (70,1,1,'70 test comment','2013-12-23 11:43:01','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`reg_date`,`del_tag`) values (71,1,1,'71 test comment','2013-12-23 11:43:01','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`reg_date`,`del_tag`) values (72,1,1,'72 test comment','2013-12-23 11:43:01','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`reg_date`,`del_tag`) values (73,1,1,'73 test comment','2013-12-23 11:43:01','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`reg_date`,`del_tag`) values (74,1,1,'74 test comment','2013-12-23 11:43:01','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`reg_date`,`del_tag`) values (75,1,1,'75 test comment','2013-12-23 11:43:01','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`reg_date`,`del_tag`) values (76,1,1,'76 test comment','2013-12-23 11:43:01','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`reg_date`,`del_tag`) values (77,1,1,'77 test comment','2013-12-23 11:43:01','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`reg_date`,`del_tag`) values (78,1,1,'78 test comment','2013-12-23 11:43:01','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`reg_date`,`del_tag`) values (79,1,1,'79 test comment','2013-12-23 11:43:01','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`reg_date`,`del_tag`) values (80,1,1,'80 test comment','2013-12-23 11:43:01','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`reg_date`,`del_tag`) values (81,1,1,'81 test comment','2013-12-23 11:43:01','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`reg_date`,`del_tag`) values (82,1,1,'82 test comment','2013-12-23 11:43:01','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`reg_date`,`del_tag`) values (83,1,1,'83 test comment','2013-12-23 11:43:01','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`reg_date`,`del_tag`) values (84,1,1,'84 test comment','2013-12-23 11:43:01','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`reg_date`,`del_tag`) values (85,1,1,'85 test comment','2013-12-23 11:43:01','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`reg_date`,`del_tag`) values (86,1,1,'86 test comment','2013-12-23 11:43:01','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`reg_date`,`del_tag`) values (87,1,1,'87 test comment','2013-12-23 11:43:01','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`reg_date`,`del_tag`) values (88,1,1,'88 test comment','2013-12-23 11:43:01','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`reg_date`,`del_tag`) values (89,1,1,'89 test comment','2013-12-23 11:43:01','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`reg_date`,`del_tag`) values (90,1,1,'90 test comment','2013-12-23 11:43:01','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`reg_date`,`del_tag`) values (122,1,1,'122 test comment','2013-12-23 11:43:02','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`reg_date`,`del_tag`) values (123,1,1,'123 test comment','2013-12-23 11:43:02','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`reg_date`,`del_tag`) values (124,1,1,'124 test comment','2013-12-23 11:43:02','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`reg_date`,`del_tag`) values (125,1,1,'125 test comment','2013-12-23 11:43:02','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`reg_date`,`del_tag`) values (126,1,1,'126 test comment','2013-12-23 11:43:02','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`reg_date`,`del_tag`) values (127,1,1,'127 test comment','2013-12-23 11:43:02','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`reg_date`,`del_tag`) values (128,1,1,'128 test comment','2013-12-23 11:43:02','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`reg_date`,`del_tag`) values (129,1,1,'129 test comment','2013-12-23 11:43:02','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`reg_date`,`del_tag`) values (130,1,1,'130 test comment','2013-12-23 11:43:02','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`reg_date`,`del_tag`) values (131,1,1,'131 test comment','2013-12-23 11:43:02','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`reg_date`,`del_tag`) values (132,1,1,'132 test comment','2013-12-23 11:43:02','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`reg_date`,`del_tag`) values (133,1,1,'133 test comment','2013-12-23 11:43:02','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`reg_date`,`del_tag`) values (134,1,1,'134 test comment','2013-12-23 11:43:02','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`reg_date`,`del_tag`) values (135,1,1,'135 test comment','2013-12-23 11:43:02','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`reg_date`,`del_tag`) values (136,1,1,'136 test comment','2013-12-23 11:43:02','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`reg_date`,`del_tag`) values (137,1,1,'137 test comment','2013-12-23 11:43:02','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`reg_date`,`del_tag`) values (138,1,1,'138 test comment','2013-12-23 11:43:02','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`reg_date`,`del_tag`) values (139,1,1,'139 test comment','2013-12-23 11:43:02','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`reg_date`,`del_tag`) values (140,1,1,'140 test comment','2013-12-23 11:43:02','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`reg_date`,`del_tag`) values (141,1,1,'141 test comment','2013-12-23 11:43:02','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`reg_date`,`del_tag`) values (142,1,1,'142 test comment','2013-12-23 11:43:02','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`reg_date`,`del_tag`) values (143,1,1,'143 test comment','2013-12-23 11:43:02','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`reg_date`,`del_tag`) values (144,1,1,'144 test comment','2013-12-23 11:43:02','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`reg_date`,`del_tag`) values (145,1,1,'145 test comment','2013-12-23 11:43:02','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`reg_date`,`del_tag`) values (146,1,1,'146 test comment','2013-12-23 11:43:02','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`reg_date`,`del_tag`) values (147,1,1,'147 test comment','2013-12-23 11:43:02','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`reg_date`,`del_tag`) values (148,1,1,'148 test comment','2013-12-23 11:43:02','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`reg_date`,`del_tag`) values (149,1,1,'149 test comment','2013-12-23 11:43:02','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`reg_date`,`del_tag`) values (150,1,1,'150 test comment','2013-12-23 11:43:02','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`reg_date`,`del_tag`) values (151,1,1,'151 test comment','2013-12-23 11:43:02','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`reg_date`,`del_tag`) values (152,1,1,'152 test comment','2013-12-23 11:43:02','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`reg_date`,`del_tag`) values (153,1,1,'153 test comment','2013-12-23 11:43:02','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`reg_date`,`del_tag`) values (154,1,1,'154 test comment','2013-12-23 11:43:02','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`reg_date`,`del_tag`) values (155,1,1,'155 test comment','2013-12-23 11:43:02','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`reg_date`,`del_tag`) values (156,1,1,'156 test comment','2013-12-23 11:43:02','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`reg_date`,`del_tag`) values (157,1,1,'157 test comment','2013-12-23 11:43:02','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`reg_date`,`del_tag`) values (158,1,1,'158 test comment','2013-12-23 11:43:02','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`reg_date`,`del_tag`) values (159,1,1,'159 test comment','2013-12-23 11:43:02','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`reg_date`,`del_tag`) values (160,1,1,'160 test comment','2013-12-23 11:43:02','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`reg_date`,`del_tag`) values (161,1,1,'161 test comment','2013-12-23 11:43:02','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`reg_date`,`del_tag`) values (162,1,1,'162 test comment','2013-12-23 11:43:02','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`reg_date`,`del_tag`) values (163,1,1,'163 test comment','2013-12-23 11:43:02','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`reg_date`,`del_tag`) values (164,1,1,'164 test comment','2013-12-23 11:43:02','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`reg_date`,`del_tag`) values (165,1,1,'165 test comment','2013-12-23 11:43:02','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`reg_date`,`del_tag`) values (166,1,1,'166 test comment','2013-12-23 11:43:02','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`reg_date`,`del_tag`) values (167,1,1,'167 test comment','2013-12-23 11:43:02','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`reg_date`,`del_tag`) values (168,1,1,'168 test comment','2013-12-23 11:43:02','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`reg_date`,`del_tag`) values (169,1,1,'169 test comment','2013-12-23 11:43:02','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`reg_date`,`del_tag`) values (170,1,1,'170 test comment','2013-12-23 11:43:02','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`reg_date`,`del_tag`) values (171,1,1,'171 test comment','2013-12-23 11:43:02','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`reg_date`,`del_tag`) values (172,1,1,'172 test comment','2013-12-23 11:43:02','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`reg_date`,`del_tag`) values (173,1,1,'173 test comment','2013-12-23 11:43:02','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`reg_date`,`del_tag`) values (174,1,1,'174 test comment','2013-12-23 11:43:02','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`reg_date`,`del_tag`) values (175,1,1,'175 test comment','2013-12-23 11:43:02','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`reg_date`,`del_tag`) values (176,1,1,'176 test comment','2013-12-23 11:43:02','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`reg_date`,`del_tag`) values (177,1,1,'177 test comment','2013-12-23 11:43:02','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`reg_date`,`del_tag`) values (178,1,1,'178 test comment','2013-12-23 11:43:02','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`reg_date`,`del_tag`) values (179,1,1,'179 test comment','2013-12-23 11:43:02','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`reg_date`,`del_tag`) values (180,1,1,'180 test comment','2013-12-23 11:43:02','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`reg_date`,`del_tag`) values (181,1,1,'181 test comment','2013-12-23 11:43:02','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`reg_date`,`del_tag`) values (182,1,1,'182 test comment','2013-12-23 11:43:02','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`reg_date`,`del_tag`) values (183,1,1,'183 test comment','2013-12-23 11:43:02','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`reg_date`,`del_tag`) values (184,1,1,'184 test comment','2013-12-23 11:43:02','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`reg_date`,`del_tag`) values (185,1,1,'185 test comment','2013-12-23 11:43:02','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`reg_date`,`del_tag`) values (249,1,2,'오예!!!','2013-12-23 13:57:59','undel');

/*Table structure for table `feed_datas` */

CREATE TABLE `feed_datas` (
  `feed_datas_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'data id',
  `member_id` int(11) DEFAULT NULL,
  `title` varchar(200) DEFAULT NULL,
  `content` longtext,
  `hit` int(11) DEFAULT '0',
  `like_cnt` int(11) DEFAULT '0',
  `cmt_cnt` int(11) DEFAULT '0',
  `created` datetime DEFAULT NULL,
  `del_tag` enum('undel','del') DEFAULT 'undel',
  PRIMARY KEY (`feed_datas_id`),
  KEY `member_id` (`member_id`),
  KEY `like_cnt` (`like_cnt`)
) ENGINE=InnoDB AUTO_INCREMENT=190 DEFAULT CHARSET=utf8;

/*Data for the table `feed_datas` */

insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`created`,`del_tag`) values (1,3,'title1','content',0,0,128,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`created`,`del_tag`) values (2,3,'title2','content',0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`created`,`del_tag`) values (3,3,'title3','content',0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`created`,`del_tag`) values (4,3,'title4','content',0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`created`,`del_tag`) values (6,3,'title6','content',0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`created`,`del_tag`) values (7,3,'title7','content',0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`created`,`del_tag`) values (8,3,'title8','content',0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`created`,`del_tag`) values (9,3,'title9','content',0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`created`,`del_tag`) values (13,3,'title13','content',0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`created`,`del_tag`) values (14,3,'title14','content',0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`created`,`del_tag`) values (15,3,'title15','content',0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`created`,`del_tag`) values (16,3,'title16','content',0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`created`,`del_tag`) values (17,3,'title17','content',0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`created`,`del_tag`) values (18,3,'title18','content',0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`created`,`del_tag`) values (19,3,'title19','content',0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`created`,`del_tag`) values (20,3,'title20','content',0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`created`,`del_tag`) values (28,3,'title28','content',0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`created`,`del_tag`) values (29,3,'title29','content',0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`created`,`del_tag`) values (30,3,'title30','content',0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`created`,`del_tag`) values (31,3,'title31','content',0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`created`,`del_tag`) values (32,3,'title32','content',0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`created`,`del_tag`) values (33,3,'title33','content',0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`created`,`del_tag`) values (34,3,'title34','content',0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`created`,`del_tag`) values (35,3,'title35','content',0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`created`,`del_tag`) values (36,3,'title36','content',0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`created`,`del_tag`) values (37,3,'title37','content',0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`created`,`del_tag`) values (38,3,'title38','content',0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`created`,`del_tag`) values (39,3,'title39','content',0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`created`,`del_tag`) values (40,3,'title40','content',0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`created`,`del_tag`) values (41,3,'title41','content',0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`created`,`del_tag`) values (42,3,'title42','content',0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`created`,`del_tag`) values (43,3,'title43','content',0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`created`,`del_tag`) values (59,3,'title59','content',0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`created`,`del_tag`) values (60,3,'title60','content',0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`created`,`del_tag`) values (61,3,'title61','content',0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`created`,`del_tag`) values (62,3,'title62','content',0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`created`,`del_tag`) values (63,3,'title63','content',0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`created`,`del_tag`) values (64,3,'title64','content',0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`created`,`del_tag`) values (65,3,'title65','content',0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`created`,`del_tag`) values (66,3,'title66','content',0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`created`,`del_tag`) values (67,3,'title67','content',0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`created`,`del_tag`) values (68,3,'title68','content',0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`created`,`del_tag`) values (69,3,'title69','content',0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`created`,`del_tag`) values (70,3,'title70','content',0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`created`,`del_tag`) values (71,3,'title71','content',0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`created`,`del_tag`) values (72,3,'title72','content',0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`created`,`del_tag`) values (73,3,'title73','content',0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`created`,`del_tag`) values (74,3,'title74','content',0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`created`,`del_tag`) values (75,3,'title75','content',0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`created`,`del_tag`) values (76,3,'title76','content',0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`created`,`del_tag`) values (77,3,'title77','content',0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`created`,`del_tag`) values (78,3,'title78','content',0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`created`,`del_tag`) values (79,3,'title79','content',0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`created`,`del_tag`) values (80,3,'title80','content',0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`created`,`del_tag`) values (81,3,'title81','content',0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`created`,`del_tag`) values (82,3,'title82','content',0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`created`,`del_tag`) values (83,3,'title83','content',0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`created`,`del_tag`) values (84,3,'title84','content',0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`created`,`del_tag`) values (85,3,'title85','content',0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`created`,`del_tag`) values (86,3,'title86','content',0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`created`,`del_tag`) values (87,3,'title87','content',0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`created`,`del_tag`) values (88,3,'title88','content',0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`created`,`del_tag`) values (89,3,'title89','content',0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`created`,`del_tag`) values (90,3,'title90','content',0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`created`,`del_tag`) values (122,3,'title122','content',0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`created`,`del_tag`) values (123,3,'title123','content',0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`created`,`del_tag`) values (124,3,'title124','content',0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`created`,`del_tag`) values (125,3,'title125','content',0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`created`,`del_tag`) values (126,3,'title126','content',0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`created`,`del_tag`) values (127,3,'title127','content',0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`created`,`del_tag`) values (128,3,'title128','content',0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`created`,`del_tag`) values (129,3,'title129','content',0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`created`,`del_tag`) values (130,3,'title130','content',0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`created`,`del_tag`) values (131,3,'title131','content',0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`created`,`del_tag`) values (132,3,'title132','content',0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`created`,`del_tag`) values (133,3,'title133','content',0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`created`,`del_tag`) values (134,3,'title134','content',0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`created`,`del_tag`) values (135,3,'title135','content',0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`created`,`del_tag`) values (136,3,'title136','content',0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`created`,`del_tag`) values (137,3,'title137','content',0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`created`,`del_tag`) values (138,3,'title138','content',0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`created`,`del_tag`) values (139,3,'title139','content',0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`created`,`del_tag`) values (140,3,'title140','content',0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`created`,`del_tag`) values (141,3,'title141','content',0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`created`,`del_tag`) values (142,3,'title142','content',0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`created`,`del_tag`) values (143,3,'title143','content',0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`created`,`del_tag`) values (144,3,'title144','content',0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`created`,`del_tag`) values (145,3,'title145','content',0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`created`,`del_tag`) values (146,3,'title146','content',0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`created`,`del_tag`) values (147,3,'title147','content',0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`created`,`del_tag`) values (148,3,'title148','content',0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`created`,`del_tag`) values (149,3,'title149','content',0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`created`,`del_tag`) values (150,3,'title150','content',0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`created`,`del_tag`) values (151,3,'title151','content',0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`created`,`del_tag`) values (152,3,'title152','content',0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`created`,`del_tag`) values (153,3,'title153','content',0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`created`,`del_tag`) values (154,3,'title154','content',0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`created`,`del_tag`) values (155,3,'title155','content',0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`created`,`del_tag`) values (156,3,'title156','content',0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`created`,`del_tag`) values (157,3,'title157','content',0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`created`,`del_tag`) values (158,3,'title158','content',0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`created`,`del_tag`) values (159,3,'title159','content',0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`created`,`del_tag`) values (160,3,'title160','content',0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`created`,`del_tag`) values (161,3,'title161','content',0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`created`,`del_tag`) values (162,3,'title162','content',0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`created`,`del_tag`) values (163,3,'title163','content',0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`created`,`del_tag`) values (164,3,'title164','content',0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`created`,`del_tag`) values (165,3,'title165','content',0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`created`,`del_tag`) values (166,3,'title166','content',0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`created`,`del_tag`) values (167,3,'title167','content',0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`created`,`del_tag`) values (168,3,'title168','content',0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`created`,`del_tag`) values (169,3,'title169','content',0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`created`,`del_tag`) values (170,3,'title170','content',0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`created`,`del_tag`) values (171,3,'title171','content',0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`created`,`del_tag`) values (172,3,'title172','content',0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`created`,`del_tag`) values (173,3,'title173','content',0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`created`,`del_tag`) values (174,3,'title174','content',0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`created`,`del_tag`) values (175,3,'title175','content',0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`created`,`del_tag`) values (176,3,'title176','content',0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`created`,`del_tag`) values (177,3,'title177','content',0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`created`,`del_tag`) values (178,3,'title178','content',0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`created`,`del_tag`) values (179,3,'title179','content',0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`created`,`del_tag`) values (180,3,'title180','content',0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`created`,`del_tag`) values (181,3,'title181','content',0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`created`,`del_tag`) values (182,3,'title182','content',0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`created`,`del_tag`) values (183,3,'title183','content',0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`created`,`del_tag`) values (184,3,'title184','content',0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`created`,`del_tag`) values (185,3,'title185','content',0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`created`,`del_tag`) values (186,NULL,'test','test',0,0,0,'2014-01-08 09:22:49','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`created`,`del_tag`) values (187,NULL,'test','test',0,0,0,'2014-01-08 09:24:01','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`created`,`del_tag`) values (188,2,'test','test',0,0,0,'2014-01-08 09:24:25','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`created`,`del_tag`) values (189,2,'test','test',0,0,0,'2014-01-08 10:07:06','undel');

/*Table structure for table `feed_files` */

CREATE TABLE `feed_files` (
  `feed_files_id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'Primary key',
  `feed_datas_id` int(10) NOT NULL COMMENT '본문 Primary key',
  `feed_comments_id` int(10) NOT NULL COMMENT '댓글 Primary key',
  `member_id` int(10) NOT NULL COMMENT '회원 Primary key',
  `origin_file_name` varchar(100) NOT NULL COMMENT 'Orgin file name',
  `stored_file_name` varchar(100) NOT NULL COMMENT '저장된 file name',
  `file_path` varchar(100) NOT NULL COMMENT '저장된 위치',
  `file_type` varchar(20) DEFAULT NULL COMMENT '파일 Type',
  `file_size` double DEFAULT NULL COMMENT '파일 사이즈 (KB)',
  `is_image` enum('N','Y') DEFAULT 'Y' COMMENT '이미지여부',
  `image_width` int(11) DEFAULT NULL COMMENT '이미지 너비',
  `image_height` int(11) DEFAULT NULL COMMENT '이미지높이',
  `image_type` varchar(10) DEFAULT NULL COMMENT '이미지타입. 점이 없는 파일 확장자',
  `image_size_str` varchar(20) DEFAULT NULL COMMENT '이미지 태그에 삽입할 문자열',
  `status` enum('ready','complete') DEFAULT 'ready' COMMENT '상태',
  `created` datetime NOT NULL COMMENT '생성일',
  PRIMARY KEY (`feed_files_id`,`feed_comments_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `feed_files` */

insert  into `feed_files`(`feed_files_id`,`feed_datas_id`,`feed_comments_id`,`member_id`,`origin_file_name`,`stored_file_name`,`file_path`,`file_type`,`file_size`,`is_image`,`image_width`,`image_height`,`image_type`,`image_size_str`,`status`,`created`) values (5,0,0,2,'Penguins.jpg','b3cb367ff46d22afc79aec99e96ae6e0.jpg','C:/Users/hoksi/Documents/jelly/JellySpray/www/upload/b3cb367ff46d22afc79aec99e96ae6e0.jpg','.jpg',759.6,'Y',1024,768,'jpeg','width=\"1024\" height=','ready','0000-00-00 00:00:00');

/*Table structure for table `feed_likes` */

CREATE TABLE `feed_likes` (
  `feed_datas_id` int(10) unsigned NOT NULL,
  `member_id` int(11) NOT NULL,
  `reg_date` datetime DEFAULT NULL,
  PRIMARY KEY (`feed_datas_id`,`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `feed_likes` */

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

insert  into `member`(`member_id`,`email`,`password`,`nickname`,`last_login`,`status`,`profile_img_path`,`emailsend`,`point`,`mileage`,`level`,`auth_date`,`reg_date`) values (2,'t@t.com','b59c67bf196a4758191e42f76670ceba','test3','2014-01-07 11:53:21',0,'','Y',0,0,1,'2013-12-24 17:26:00','2013-12-24 15:32:15');
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
  `test_session_key` char(32) DEFAULT NULL COMMENT '전문 테스트용 세션키',
  `created` datetime DEFAULT NULL COMMENT '생성일',
  `updated` datetime DEFAULT NULL COMMENT '수정일',
  PRIMARY KEY (`admin_id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `spray_admin` */

insert  into `spray_admin`(`admin_id`,`email`,`pw`,`test_session_key`,`created`,`updated`) values (1,'admin@t.com','b59c67bf196a4758191e42f76670ceba','d96e825b94954c495a715fddc9c7f58a','2013-12-31 09:34:00','2013-12-31 09:34:02');

/*Table structure for table `spray_template` */

CREATE TABLE `spray_template` (
  `spray_template_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL COMMENT '템플릿 이름',
  `type` enum('controller','model','view') DEFAULT NULL COMMENT '템플릿 타입',
  `content` longtext,
  PRIMARY KEY (`spray_template_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `spray_template` */

insert  into `spray_template`(`spray_template_id`,`name`,`type`,`content`) values (1,'default','controller','<?php  if ( ! defined(\'BASEPATH\')) exit(\'No direct script access allowed\');\r\n/**\r\n * Spray contrroller {class_name}\r\n *\r\n * @package spray\r\n * @author  한대승 <hoksi2k@hanmail.net>\r\n */\r\nclass {class_name} extends Spray {\r\n	private $post_data;\r\n\r\n	public function __construct()\r\n	{\r\n		parent::__construct();\r\n		\r\n		// $this->load->model(\'{group_name}/default_model\');\r\n		if(FALSE) $this->default_model = new Default_model;\r\n	}\r\n	\r\n	public function run($group = NULL)\r\n	{\r\n		if($this->validation()) {\r\n			$this->responseCode = 0;\r\n			$this->responseMessage = \'검증 성공\';\r\n		}\r\n		\r\n		return $this->get_res();\r\n	}\r\n	\r\n	public function validation()\r\n	{\r\n		$ret = FALSE;\r\n\r\n		// validation 조건 확인\r\n		$config = array(\r\n			{validation}\r\n		);\r\n\r\n		if($this->form_chk($config)) {\r\n			$this->post_data = array(\r\n				{post_data}\r\n			);\r\n\r\n			$ret = TRUE;\r\n		} else {\r\n			$this->responseCode = -1;\r\n			\r\n			foreach($this->error_chk() as $err) {\r\n				{err_code}\r\n			}\r\n\r\n			$this->responseMessage = $err;\r\n		}\r\n\r\n		return $ret ? $ret : \'데이터가 입력되지 않았습니다.\';\r\n\r\n	}\r\n} \r\n/* End of file {command_name}.php */');
insert  into `spray_template`(`spray_template_id`,`name`,`type`,`content`) values (2,'default','view','<table class=\"table\">\r\n	<thead>\r\n	<tr>\r\n		<th class=\"span2\">Field</th>\r\n		<th></th>\r\n		<th></th>\r\n	</tr>\r\n	</thead>\r\n{field_list}\r\n	<tr>\r\n		<td></td>\r\n		<td>\r\n			<input type=\"submit\" value=\"실 행\" />\r\n			<input type=\"reset\" />\r\n		</td>\r\n		<td></td>\r\n	</tr>\r\n</table>');
insert  into `spray_template`(`spray_template_id`,`name`,`type`,`content`) values (3,'default','model','<?php  if ( ! defined(\'BASEPATH\')) exit(\'No direct script access allowed\');\r\nclass Default_model extends MY_Model {\r\n	private $table = NULL;\r\n	\r\n	public function __construct()\r\n	{\r\n		parent::__construct();\r\n		// $this->table = \'{table}\';\r\n	}\r\n}\r\n');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
