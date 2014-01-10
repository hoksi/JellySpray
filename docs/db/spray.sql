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

insert  into `ci_sessions`(`session_id`,`ip_address`,`user_agent`,`last_activity`,`user_data`) values ('18c8fe6b2c11ac6f5e9bc1d5ff336746','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64; rv:26.0) Gecko/20100101 Firefox/26.0',1389331295,'a:3:{s:8:\"admin_id\";s:1:\"1\";s:16:\"test_session_key\";s:32:\"d96e825b94954c495a715fddc9c7f58a\";s:5:\"email\";s:11:\"admin@t.com\";}');
insert  into `ci_sessions`(`session_id`,`ip_address`,`user_agent`,`last_activity`,`user_data`) values ('d96e825b94954c495a715fddc9c7f58a','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64; rv:26.0) Gecko/20100101 Firefox/26.0',1389234340,'a:3:{s:9:\"member_id\";s:1:\"2\";s:5:\"email\";s:7:\"t@t.com\";s:8:\"nickname\";s:5:\"test3\";}');
insert  into `ci_sessions`(`session_id`,`ip_address`,`user_agent`,`last_activity`,`user_data`) values ('l2gagsi4a4cc7bvglvaggegfs2','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64; rv:26.0) Gecko/20100101 Firefox/26.0',1388479233,'a:2:{s:8:\"admin_id\";s:1:\"1\";s:5:\"email\";s:11:\"admin@t.com\";}');
insert  into `ci_sessions`(`session_id`,`ip_address`,`user_agent`,`last_activity`,`user_data`) values ('notphifjdfgsfa7h7mg2hqdes1','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/31.0.1650.63 Safari/537.36',1388465185,'a:2:{s:8:\"admin_id\";s:1:\"1\";s:5:\"email\";s:11:\"admin@t.com\";}');

/*Table structure for table `feed_comments` */

CREATE TABLE `feed_comments` (
  `feed_comments_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `feed_datas_id` int(11) DEFAULT NULL,
  `member_id` int(11) DEFAULT NULL,
  `content` text,
  `created` datetime DEFAULT NULL,
  `del_tag` enum('undel','del') DEFAULT 'undel',
  PRIMARY KEY (`feed_comments_id`),
  KEY `member_id` (`member_id`),
  KEY `feed_datas_id` (`feed_datas_id`)
) ENGINE=InnoDB AUTO_INCREMENT=257 DEFAULT CHARSET=utf8;

/*Data for the table `feed_comments` */

insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`created`,`del_tag`) values (1,1,2,'1 test comment','2013-12-23 11:40:01','del');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`created`,`del_tag`) values (2,1,3,'2 test comment','2013-12-23 11:42:57','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`created`,`del_tag`) values (3,1,3,'3 test comment','2013-12-23 11:42:58','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`created`,`del_tag`) values (4,1,3,'4 test comment','2013-12-23 11:42:58','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`created`,`del_tag`) values (6,1,3,'6 test comment','2013-12-23 11:42:59','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`created`,`del_tag`) values (7,1,3,'7 test comment','2013-12-23 11:42:59','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`created`,`del_tag`) values (8,1,3,'8 test comment','2013-12-23 11:42:59','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`created`,`del_tag`) values (9,1,3,'9 test comment','2013-12-23 11:42:59','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`created`,`del_tag`) values (13,1,3,'13 test comment','2013-12-23 11:43:00','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`created`,`del_tag`) values (14,1,3,'14 test comment','2013-12-23 11:43:00','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`created`,`del_tag`) values (15,1,3,'15 test comment','2013-12-23 11:43:00','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`created`,`del_tag`) values (16,1,3,'16 test comment','2013-12-23 11:43:00','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`created`,`del_tag`) values (17,1,3,'17 test comment','2013-12-23 11:43:00','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`created`,`del_tag`) values (18,1,3,'18 test comment','2013-12-23 11:43:00','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`created`,`del_tag`) values (19,1,3,'19 test comment','2013-12-23 11:43:00','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`created`,`del_tag`) values (20,1,3,'20 test comment','2013-12-23 11:43:00','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`created`,`del_tag`) values (28,1,3,'28 test comment','2013-12-23 11:43:01','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`created`,`del_tag`) values (29,1,3,'29 test comment','2013-12-23 11:43:01','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`created`,`del_tag`) values (30,1,3,'30 test comment','2013-12-23 11:43:01','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`created`,`del_tag`) values (31,1,3,'31 test comment','2013-12-23 11:43:01','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`created`,`del_tag`) values (32,1,3,'32 test comment','2013-12-23 11:43:01','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`created`,`del_tag`) values (33,1,3,'33 test comment','2013-12-23 11:43:01','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`created`,`del_tag`) values (34,1,3,'34 test comment','2013-12-23 11:43:01','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`created`,`del_tag`) values (35,1,3,'35 test comment','2013-12-23 11:43:01','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`created`,`del_tag`) values (36,1,3,'36 test comment','2013-12-23 11:43:01','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`created`,`del_tag`) values (37,1,3,'37 test comment','2013-12-23 11:43:01','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`created`,`del_tag`) values (38,1,3,'38 test comment','2013-12-23 11:43:01','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`created`,`del_tag`) values (39,1,3,'39 test comment','2013-12-23 11:43:01','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`created`,`del_tag`) values (40,1,3,'40 test comment','2013-12-23 11:43:01','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`created`,`del_tag`) values (41,1,3,'41 test comment','2013-12-23 11:43:01','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`created`,`del_tag`) values (42,1,3,'42 test comment','2013-12-23 11:43:01','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`created`,`del_tag`) values (43,1,3,'43 test comment','2013-12-23 11:43:01','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`created`,`del_tag`) values (59,1,3,'59 test comment','2013-12-23 11:43:01','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`created`,`del_tag`) values (60,1,3,'60 test comment','2013-12-23 11:43:01','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`created`,`del_tag`) values (61,1,3,'61 test comment','2013-12-23 11:43:01','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`created`,`del_tag`) values (62,1,3,'62 test comment','2013-12-23 11:43:01','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`created`,`del_tag`) values (63,1,3,'63 test comment','2013-12-23 11:43:01','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`created`,`del_tag`) values (64,1,3,'64 test comment','2013-12-23 11:43:01','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`created`,`del_tag`) values (65,1,3,'65 test comment','2013-12-23 11:43:01','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`created`,`del_tag`) values (66,1,3,'66 test comment','2013-12-23 11:43:01','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`created`,`del_tag`) values (67,1,3,'67 test comment','2013-12-23 11:43:01','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`created`,`del_tag`) values (68,1,3,'68 test comment','2013-12-23 11:43:01','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`created`,`del_tag`) values (69,1,3,'69 test comment','2013-12-23 11:43:01','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`created`,`del_tag`) values (70,1,3,'70 test comment','2013-12-23 11:43:01','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`created`,`del_tag`) values (71,1,3,'71 test comment','2013-12-23 11:43:01','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`created`,`del_tag`) values (72,1,3,'72 test comment','2013-12-23 11:43:01','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`created`,`del_tag`) values (73,1,3,'73 test comment','2013-12-23 11:43:01','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`created`,`del_tag`) values (74,1,3,'74 test comment','2013-12-23 11:43:01','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`created`,`del_tag`) values (75,1,3,'75 test comment','2013-12-23 11:43:01','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`created`,`del_tag`) values (76,1,3,'76 test comment','2013-12-23 11:43:01','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`created`,`del_tag`) values (77,1,3,'77 test comment','2013-12-23 11:43:01','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`created`,`del_tag`) values (78,1,3,'78 test comment','2013-12-23 11:43:01','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`created`,`del_tag`) values (79,1,3,'79 test comment','2013-12-23 11:43:01','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`created`,`del_tag`) values (80,1,3,'80 test comment','2013-12-23 11:43:01','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`created`,`del_tag`) values (81,1,3,'81 test comment','2013-12-23 11:43:01','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`created`,`del_tag`) values (82,1,3,'82 test comment','2013-12-23 11:43:01','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`created`,`del_tag`) values (83,1,3,'83 test comment','2013-12-23 11:43:01','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`created`,`del_tag`) values (84,1,3,'84 test comment','2013-12-23 11:43:01','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`created`,`del_tag`) values (85,1,3,'85 test comment','2013-12-23 11:43:01','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`created`,`del_tag`) values (86,1,3,'86 test comment','2013-12-23 11:43:01','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`created`,`del_tag`) values (87,1,3,'87 test comment','2013-12-23 11:43:01','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`created`,`del_tag`) values (88,1,3,'88 test comment','2013-12-23 11:43:01','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`created`,`del_tag`) values (89,1,3,'89 test comment','2013-12-23 11:43:01','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`created`,`del_tag`) values (90,1,3,'90 test comment','2013-12-23 11:43:01','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`created`,`del_tag`) values (122,1,3,'122 test comment','2013-12-23 11:43:02','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`created`,`del_tag`) values (123,1,3,'123 test comment','2013-12-23 11:43:02','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`created`,`del_tag`) values (124,1,3,'124 test comment','2013-12-23 11:43:02','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`created`,`del_tag`) values (125,1,3,'125 test comment','2013-12-23 11:43:02','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`created`,`del_tag`) values (126,1,3,'126 test comment','2013-12-23 11:43:02','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`created`,`del_tag`) values (127,1,3,'127 test comment','2013-12-23 11:43:02','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`created`,`del_tag`) values (128,1,3,'128 test comment','2013-12-23 11:43:02','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`created`,`del_tag`) values (129,1,3,'129 test comment','2013-12-23 11:43:02','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`created`,`del_tag`) values (130,1,3,'130 test comment','2013-12-23 11:43:02','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`created`,`del_tag`) values (131,1,3,'131 test comment','2013-12-23 11:43:02','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`created`,`del_tag`) values (132,1,3,'132 test comment','2013-12-23 11:43:02','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`created`,`del_tag`) values (133,1,3,'133 test comment','2013-12-23 11:43:02','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`created`,`del_tag`) values (134,1,3,'134 test comment','2013-12-23 11:43:02','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`created`,`del_tag`) values (135,1,3,'135 test comment','2013-12-23 11:43:02','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`created`,`del_tag`) values (136,1,3,'136 test comment','2013-12-23 11:43:02','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`created`,`del_tag`) values (137,1,3,'137 test comment','2013-12-23 11:43:02','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`created`,`del_tag`) values (138,1,3,'138 test comment','2013-12-23 11:43:02','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`created`,`del_tag`) values (139,1,3,'139 test comment','2013-12-23 11:43:02','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`created`,`del_tag`) values (140,1,3,'140 test comment','2013-12-23 11:43:02','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`created`,`del_tag`) values (141,1,3,'141 test comment','2013-12-23 11:43:02','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`created`,`del_tag`) values (142,1,3,'142 test comment','2013-12-23 11:43:02','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`created`,`del_tag`) values (143,1,3,'143 test comment','2013-12-23 11:43:02','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`created`,`del_tag`) values (144,1,3,'144 test comment','2013-12-23 11:43:02','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`created`,`del_tag`) values (145,1,3,'145 test comment','2013-12-23 11:43:02','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`created`,`del_tag`) values (146,1,3,'146 test comment','2013-12-23 11:43:02','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`created`,`del_tag`) values (147,1,3,'147 test comment','2013-12-23 11:43:02','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`created`,`del_tag`) values (148,1,3,'148 test comment','2013-12-23 11:43:02','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`created`,`del_tag`) values (149,1,3,'149 test comment','2013-12-23 11:43:02','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`created`,`del_tag`) values (150,1,3,'150 test comment','2013-12-23 11:43:02','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`created`,`del_tag`) values (151,1,3,'151 test comment','2013-12-23 11:43:02','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`created`,`del_tag`) values (152,1,3,'152 test comment','2013-12-23 11:43:02','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`created`,`del_tag`) values (153,1,3,'153 test comment','2013-12-23 11:43:02','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`created`,`del_tag`) values (154,1,3,'154 test comment','2013-12-23 11:43:02','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`created`,`del_tag`) values (155,1,3,'155 test comment','2013-12-23 11:43:02','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`created`,`del_tag`) values (156,1,3,'156 test comment','2013-12-23 11:43:02','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`created`,`del_tag`) values (157,1,3,'157 test comment','2013-12-23 11:43:02','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`created`,`del_tag`) values (158,1,3,'158 test comment','2013-12-23 11:43:02','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`created`,`del_tag`) values (159,1,3,'159 test comment','2013-12-23 11:43:02','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`created`,`del_tag`) values (160,1,3,'160 test comment','2013-12-23 11:43:02','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`created`,`del_tag`) values (161,1,3,'161 test comment','2013-12-23 11:43:02','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`created`,`del_tag`) values (162,1,3,'162 test comment','2013-12-23 11:43:02','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`created`,`del_tag`) values (163,1,3,'163 test comment','2013-12-23 11:43:02','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`created`,`del_tag`) values (164,1,3,'164 test comment','2013-12-23 11:43:02','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`created`,`del_tag`) values (165,1,3,'165 test comment','2013-12-23 11:43:02','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`created`,`del_tag`) values (166,1,3,'166 test comment','2013-12-23 11:43:02','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`created`,`del_tag`) values (167,1,3,'167 test comment','2013-12-23 11:43:02','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`created`,`del_tag`) values (168,1,3,'168 test comment','2013-12-23 11:43:02','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`created`,`del_tag`) values (169,1,3,'169 test comment','2013-12-23 11:43:02','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`created`,`del_tag`) values (170,1,3,'170 test comment','2013-12-23 11:43:02','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`created`,`del_tag`) values (171,1,3,'171 test comment','2013-12-23 11:43:02','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`created`,`del_tag`) values (172,1,3,'172 test comment','2013-12-23 11:43:02','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`created`,`del_tag`) values (173,1,3,'173 test comment','2013-12-23 11:43:02','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`created`,`del_tag`) values (174,1,3,'174 test comment','2013-12-23 11:43:02','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`created`,`del_tag`) values (175,1,3,'175 test comment','2013-12-23 11:43:02','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`created`,`del_tag`) values (176,1,3,'176 test comment','2013-12-23 11:43:02','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`created`,`del_tag`) values (177,1,3,'177 test comment','2013-12-23 11:43:02','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`created`,`del_tag`) values (178,1,3,'178 test comment','2013-12-23 11:43:02','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`created`,`del_tag`) values (179,1,3,'179 test comment','2013-12-23 11:43:02','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`created`,`del_tag`) values (180,1,3,'180 test comment','2013-12-23 11:43:02','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`created`,`del_tag`) values (181,1,3,'181 test comment','2013-12-23 11:43:02','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`created`,`del_tag`) values (182,1,3,'182 test comment','2013-12-23 11:43:02','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`created`,`del_tag`) values (183,1,3,'183 test comment','2013-12-23 11:43:02','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`created`,`del_tag`) values (184,1,3,'184 test comment','2013-12-23 11:43:02','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`created`,`del_tag`) values (185,1,3,'185 test comment','2013-12-23 11:43:02','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`created`,`del_tag`) values (249,1,2,'오예!!!','2013-12-23 13:57:59','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`created`,`del_tag`) values (250,1,2,'test','2014-01-08 15:52:16','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`created`,`del_tag`) values (251,1,2,'test','2014-01-08 15:53:09','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`created`,`del_tag`) values (252,1,2,'test','2014-01-08 15:53:44','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`created`,`del_tag`) values (253,1,2,'test','2014-01-08 15:53:56','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`created`,`del_tag`) values (254,1,2,'test','2014-01-08 16:01:00','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`created`,`del_tag`) values (255,1,2,'asdfasdf','2014-01-09 12:39:18','undel');
insert  into `feed_comments`(`feed_comments_id`,`feed_datas_id`,`member_id`,`content`,`created`,`del_tag`) values (256,1,2,'asdfasdf','2014-01-09 12:39:56','undel');

/*Table structure for table `feed_datas` */

CREATE TABLE `feed_datas` (
  `feed_datas_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'data id',
  `member_id` int(11) DEFAULT NULL,
  `title` varchar(200) DEFAULT NULL,
  `content` longtext,
  `hit` int(11) DEFAULT '0',
  `like_cnt` int(11) DEFAULT '0',
  `cmt_cnt` int(11) DEFAULT '0',
  `file_cnt` int(11) DEFAULT '0',
  `created` datetime DEFAULT NULL,
  `del_tag` enum('undel','del') DEFAULT 'undel',
  PRIMARY KEY (`feed_datas_id`),
  KEY `member_id` (`member_id`),
  KEY `like_cnt` (`like_cnt`)
) ENGINE=InnoDB AUTO_INCREMENT=191 DEFAULT CHARSET=utf8;

/*Data for the table `feed_datas` */

insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`file_cnt`,`created`,`del_tag`) values (1,3,'title1','content',11,1,130,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`file_cnt`,`created`,`del_tag`) values (2,3,'title2','content',0,0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`file_cnt`,`created`,`del_tag`) values (3,3,'title3','content',0,0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`file_cnt`,`created`,`del_tag`) values (4,3,'title4','content',0,0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`file_cnt`,`created`,`del_tag`) values (6,3,'title6','content',0,0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`file_cnt`,`created`,`del_tag`) values (7,3,'title7','content',0,0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`file_cnt`,`created`,`del_tag`) values (8,3,'title8','content',0,0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`file_cnt`,`created`,`del_tag`) values (9,3,'title9','content',0,0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`file_cnt`,`created`,`del_tag`) values (13,3,'title13','content',0,0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`file_cnt`,`created`,`del_tag`) values (14,3,'title14','content',0,0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`file_cnt`,`created`,`del_tag`) values (15,3,'title15','content',0,0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`file_cnt`,`created`,`del_tag`) values (16,3,'title16','content',0,0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`file_cnt`,`created`,`del_tag`) values (17,3,'title17','content',0,0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`file_cnt`,`created`,`del_tag`) values (18,3,'title18','content',0,0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`file_cnt`,`created`,`del_tag`) values (19,3,'title19','content',0,0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`file_cnt`,`created`,`del_tag`) values (20,3,'title20','content',0,0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`file_cnt`,`created`,`del_tag`) values (28,3,'title28','content',0,0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`file_cnt`,`created`,`del_tag`) values (29,3,'title29','content',0,0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`file_cnt`,`created`,`del_tag`) values (30,3,'title30','content',0,0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`file_cnt`,`created`,`del_tag`) values (31,3,'title31','content',0,0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`file_cnt`,`created`,`del_tag`) values (32,3,'title32','content',0,0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`file_cnt`,`created`,`del_tag`) values (33,3,'title33','content',0,0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`file_cnt`,`created`,`del_tag`) values (34,3,'title34','content',0,0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`file_cnt`,`created`,`del_tag`) values (35,3,'title35','content',0,0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`file_cnt`,`created`,`del_tag`) values (36,3,'title36','content',0,0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`file_cnt`,`created`,`del_tag`) values (37,3,'title37','content',0,0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`file_cnt`,`created`,`del_tag`) values (38,3,'title38','content',0,0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`file_cnt`,`created`,`del_tag`) values (39,3,'title39','content',0,0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`file_cnt`,`created`,`del_tag`) values (40,3,'title40','content',0,0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`file_cnt`,`created`,`del_tag`) values (41,3,'title41','content',0,0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`file_cnt`,`created`,`del_tag`) values (42,3,'title42','content',0,0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`file_cnt`,`created`,`del_tag`) values (43,3,'title43','content',0,0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`file_cnt`,`created`,`del_tag`) values (59,3,'title59','content',0,0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`file_cnt`,`created`,`del_tag`) values (60,3,'title60','content',0,0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`file_cnt`,`created`,`del_tag`) values (61,3,'title61','content',0,0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`file_cnt`,`created`,`del_tag`) values (62,3,'title62','content',0,0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`file_cnt`,`created`,`del_tag`) values (63,3,'title63','content',0,0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`file_cnt`,`created`,`del_tag`) values (64,3,'title64','content',0,0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`file_cnt`,`created`,`del_tag`) values (65,3,'title65','content',0,0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`file_cnt`,`created`,`del_tag`) values (66,3,'title66','content',0,0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`file_cnt`,`created`,`del_tag`) values (67,3,'title67','content',0,0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`file_cnt`,`created`,`del_tag`) values (68,3,'title68','content',0,0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`file_cnt`,`created`,`del_tag`) values (69,3,'title69','content',0,0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`file_cnt`,`created`,`del_tag`) values (70,3,'title70','content',0,0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`file_cnt`,`created`,`del_tag`) values (71,3,'title71','content',0,0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`file_cnt`,`created`,`del_tag`) values (72,3,'title72','content',0,0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`file_cnt`,`created`,`del_tag`) values (73,3,'title73','content',0,0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`file_cnt`,`created`,`del_tag`) values (74,3,'title74','content',0,0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`file_cnt`,`created`,`del_tag`) values (75,3,'title75','content',0,0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`file_cnt`,`created`,`del_tag`) values (76,3,'title76','content',0,0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`file_cnt`,`created`,`del_tag`) values (77,3,'title77','content',0,0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`file_cnt`,`created`,`del_tag`) values (78,3,'title78','content',0,0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`file_cnt`,`created`,`del_tag`) values (79,3,'title79','content',0,0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`file_cnt`,`created`,`del_tag`) values (80,3,'title80','content',0,0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`file_cnt`,`created`,`del_tag`) values (81,3,'title81','content',0,0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`file_cnt`,`created`,`del_tag`) values (82,3,'title82','content',0,0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`file_cnt`,`created`,`del_tag`) values (83,3,'title83','content',0,0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`file_cnt`,`created`,`del_tag`) values (84,3,'title84','content',0,0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`file_cnt`,`created`,`del_tag`) values (85,3,'title85','content',0,0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`file_cnt`,`created`,`del_tag`) values (86,3,'title86','content',0,0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`file_cnt`,`created`,`del_tag`) values (87,3,'title87','content',0,0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`file_cnt`,`created`,`del_tag`) values (88,3,'title88','content',0,0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`file_cnt`,`created`,`del_tag`) values (89,3,'title89','content',0,0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`file_cnt`,`created`,`del_tag`) values (90,3,'title90','content',0,0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`file_cnt`,`created`,`del_tag`) values (122,3,'title122','content',0,0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`file_cnt`,`created`,`del_tag`) values (123,3,'title123','content',0,0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`file_cnt`,`created`,`del_tag`) values (124,3,'title124','content',0,0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`file_cnt`,`created`,`del_tag`) values (125,3,'title125','content',0,0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`file_cnt`,`created`,`del_tag`) values (126,3,'title126','content',0,0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`file_cnt`,`created`,`del_tag`) values (127,3,'title127','content',0,0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`file_cnt`,`created`,`del_tag`) values (128,3,'title128','content',0,0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`file_cnt`,`created`,`del_tag`) values (129,3,'title129','content',0,0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`file_cnt`,`created`,`del_tag`) values (130,3,'title130','content',0,0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`file_cnt`,`created`,`del_tag`) values (131,3,'title131','content',0,0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`file_cnt`,`created`,`del_tag`) values (132,3,'title132','content',0,0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`file_cnt`,`created`,`del_tag`) values (133,3,'title133','content',0,0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`file_cnt`,`created`,`del_tag`) values (134,3,'title134','content',0,0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`file_cnt`,`created`,`del_tag`) values (135,3,'title135','content',0,0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`file_cnt`,`created`,`del_tag`) values (136,3,'title136','content',0,0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`file_cnt`,`created`,`del_tag`) values (137,3,'title137','content',0,0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`file_cnt`,`created`,`del_tag`) values (138,3,'title138','content',0,0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`file_cnt`,`created`,`del_tag`) values (139,3,'title139','content',0,0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`file_cnt`,`created`,`del_tag`) values (140,3,'title140','content',0,0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`file_cnt`,`created`,`del_tag`) values (141,3,'title141','content',0,0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`file_cnt`,`created`,`del_tag`) values (142,3,'title142','content',0,0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`file_cnt`,`created`,`del_tag`) values (143,3,'title143','content',0,0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`file_cnt`,`created`,`del_tag`) values (144,3,'title144','content',0,0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`file_cnt`,`created`,`del_tag`) values (145,3,'title145','content',0,0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`file_cnt`,`created`,`del_tag`) values (146,3,'title146','content',0,0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`file_cnt`,`created`,`del_tag`) values (147,3,'title147','content',0,0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`file_cnt`,`created`,`del_tag`) values (148,3,'title148','content',0,0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`file_cnt`,`created`,`del_tag`) values (149,3,'title149','content',0,0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`file_cnt`,`created`,`del_tag`) values (150,3,'title150','content',0,0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`file_cnt`,`created`,`del_tag`) values (151,3,'title151','content',0,0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`file_cnt`,`created`,`del_tag`) values (152,3,'title152','content',0,0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`file_cnt`,`created`,`del_tag`) values (153,3,'title153','content',0,0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`file_cnt`,`created`,`del_tag`) values (154,3,'title154','content',0,0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`file_cnt`,`created`,`del_tag`) values (155,3,'title155','content',0,0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`file_cnt`,`created`,`del_tag`) values (156,3,'title156','content',0,0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`file_cnt`,`created`,`del_tag`) values (157,3,'title157','content',0,0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`file_cnt`,`created`,`del_tag`) values (158,3,'title158','content',0,0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`file_cnt`,`created`,`del_tag`) values (159,3,'title159','content',0,0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`file_cnt`,`created`,`del_tag`) values (160,3,'title160','content',0,0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`file_cnt`,`created`,`del_tag`) values (161,3,'title161','content',0,0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`file_cnt`,`created`,`del_tag`) values (162,3,'title162','content',0,0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`file_cnt`,`created`,`del_tag`) values (163,3,'title163','content',0,0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`file_cnt`,`created`,`del_tag`) values (164,3,'title164','content',0,0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`file_cnt`,`created`,`del_tag`) values (165,3,'title165','content',0,0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`file_cnt`,`created`,`del_tag`) values (166,3,'title166','content',0,0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`file_cnt`,`created`,`del_tag`) values (167,3,'title167','content',0,0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`file_cnt`,`created`,`del_tag`) values (168,3,'title168','content',0,0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`file_cnt`,`created`,`del_tag`) values (169,3,'title169','content',0,0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`file_cnt`,`created`,`del_tag`) values (170,3,'title170','content',0,0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`file_cnt`,`created`,`del_tag`) values (171,3,'title171','content',0,0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`file_cnt`,`created`,`del_tag`) values (172,3,'title172','content',0,0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`file_cnt`,`created`,`del_tag`) values (173,3,'title173','content',0,0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`file_cnt`,`created`,`del_tag`) values (174,3,'title174','content',0,0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`file_cnt`,`created`,`del_tag`) values (175,3,'title175','content',0,0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`file_cnt`,`created`,`del_tag`) values (176,3,'title176','content',0,0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`file_cnt`,`created`,`del_tag`) values (177,3,'title177','content',0,0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`file_cnt`,`created`,`del_tag`) values (178,3,'title178','content',0,0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`file_cnt`,`created`,`del_tag`) values (179,3,'title179','content',0,0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`file_cnt`,`created`,`del_tag`) values (180,3,'title180','content',0,0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`file_cnt`,`created`,`del_tag`) values (181,3,'title181','content',0,0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`file_cnt`,`created`,`del_tag`) values (182,3,'title182','content',0,0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`file_cnt`,`created`,`del_tag`) values (183,3,'title183','content',0,0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`file_cnt`,`created`,`del_tag`) values (184,3,'title184','content',0,0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`file_cnt`,`created`,`del_tag`) values (185,3,'title185','content',0,0,0,0,'2013-12-22 17:47:29','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`file_cnt`,`created`,`del_tag`) values (186,2,'test','test',0,0,0,0,'2014-01-08 09:22:49','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`file_cnt`,`created`,`del_tag`) values (187,2,'test','test',0,0,0,0,'2014-01-08 09:24:01','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`file_cnt`,`created`,`del_tag`) values (188,2,'test','test',0,0,0,0,'2014-01-08 09:24:25','undel');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`file_cnt`,`created`,`del_tag`) values (189,2,'test','test',0,0,0,0,'2014-01-08 10:07:06','del');
insert  into `feed_datas`(`feed_datas_id`,`member_id`,`title`,`content`,`hit`,`like_cnt`,`cmt_cnt`,`file_cnt`,`created`,`del_tag`) values (190,2,'test','1111',0,0,0,0,'2014-01-09 09:49:16','del');

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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

/*Data for the table `feed_files` */

insert  into `feed_files`(`feed_files_id`,`feed_datas_id`,`feed_comments_id`,`member_id`,`origin_file_name`,`stored_file_name`,`file_path`,`file_type`,`file_size`,`is_image`,`image_width`,`image_height`,`image_type`,`image_size_str`,`status`,`created`) values (8,190,0,2,'Lighthouse.jpg','93ff28575c205da95301438cb487b48e.jpg','C:/Users/hoksi/Documents/jelly/JellySpray/www/upload/93ff28575c205da95301438cb487b48e.jpg','.jpg',548.12,'Y',1024,768,'jpeg','width=\"1024\" height=','complete','0000-00-00 00:00:00');
insert  into `feed_files`(`feed_files_id`,`feed_datas_id`,`feed_comments_id`,`member_id`,`origin_file_name`,`stored_file_name`,`file_path`,`file_type`,`file_size`,`is_image`,`image_width`,`image_height`,`image_type`,`image_size_str`,`status`,`created`) values (9,190,0,2,'Penguins.jpg','dbb5fac42dbe692cae13e5dc99284eaf.jpg','C:/Users/hoksi/Documents/jelly/JellySpray/www/upload/dbb5fac42dbe692cae13e5dc99284eaf.jpg','.jpg',759.6,'Y',1024,768,'jpeg','width=\"1024\" height=','complete','0000-00-00 00:00:00');
insert  into `feed_files`(`feed_files_id`,`feed_datas_id`,`feed_comments_id`,`member_id`,`origin_file_name`,`stored_file_name`,`file_path`,`file_type`,`file_size`,`is_image`,`image_width`,`image_height`,`image_type`,`image_size_str`,`status`,`created`) values (10,190,0,2,'Hydrangeas.jpg','89be5a72ae710f2525c502c8d3e456d7.jpg','C:/Users/hoksi/Documents/jelly/JellySpray/www/upload/89be5a72ae710f2525c502c8d3e456d7.jpg','.jpg',581.33,'Y',1024,768,'jpeg','width=\"1024\" height=','complete','0000-00-00 00:00:00');
insert  into `feed_files`(`feed_files_id`,`feed_datas_id`,`feed_comments_id`,`member_id`,`origin_file_name`,`stored_file_name`,`file_path`,`file_type`,`file_size`,`is_image`,`image_width`,`image_height`,`image_type`,`image_size_str`,`status`,`created`) values (11,190,0,2,'Desert.jpg','fe89c08e5847ea49003700710ce580c5.jpg','C:/Users/hoksi/Documents/jelly/JellySpray/www/upload/fe89c08e5847ea49003700710ce580c5.jpg','.jpg',826.11,'Y',1024,768,'jpeg','width=\"1024\" height=','complete','0000-00-00 00:00:00');

/*Table structure for table `feed_likes` */

CREATE TABLE `feed_likes` (
  `feed_datas_id` int(10) unsigned NOT NULL,
  `member_id` int(11) NOT NULL,
  `created` datetime DEFAULT NULL,
  PRIMARY KEY (`feed_datas_id`,`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `feed_likes` */

insert  into `feed_likes`(`feed_datas_id`,`member_id`,`created`) values (1,2,NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `member` */

insert  into `member`(`member_id`,`email`,`password`,`nickname`,`last_login`,`status`,`profile_img_path`,`emailsend`,`point`,`mileage`,`level`,`auth_date`,`reg_date`) values (2,'t@t.com','b59c67bf196a4758191e42f76670ceba','test4','2014-01-09 11:25:40',0,'','Y',0,0,1,'2013-12-24 17:26:00','2013-12-24 15:32:15');
insert  into `member`(`member_id`,`email`,`password`,`nickname`,`last_login`,`status`,`profile_img_path`,`emailsend`,`point`,`mileage`,`level`,`auth_date`,`reg_date`) values (3,'t1@t.com','b59c67bf196a4758191e42f76670ceba','test2','0000-00-00 00:00:00',0,'','Y',0,0,1,'2013-12-24 09:51:27','2013-12-24 17:51:27');
insert  into `member`(`member_id`,`email`,`password`,`nickname`,`last_login`,`status`,`profile_img_path`,`emailsend`,`point`,`mileage`,`level`,`auth_date`,`reg_date`) values (4,'t2@t.com','b59c67bf196a4758191e42f76670ceba','test','0000-00-00 00:00:00',0,'','Y',0,0,1,'2014-01-09 03:49:42','2014-01-09 11:49:42');

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

/*Table structure for table `spray_bad_word` */

CREATE TABLE `spray_bad_word` (
  `word` varchar(40) NOT NULL,
  PRIMARY KEY (`word`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `spray_bad_word` */

insert  into `spray_bad_word`(`word`) values ('abstract');
insert  into `spray_bad_word`(`word`) values ('and');
insert  into `spray_bad_word`(`word`) values ('apppath');
insert  into `spray_bad_word`(`word`) values ('array');
insert  into `spray_bad_word`(`word`) values ('arrayiterator');
insert  into `spray_bad_word`(`word`) values ('arrayobject');
insert  into `spray_bad_word`(`word`) values ('as');
insert  into `spray_bad_word`(`word`) values ('basepath');
insert  into `spray_bad_word`(`word`) values ('break');
insert  into `spray_bad_word`(`word`) values ('cachingiterator');
insert  into `spray_bad_word`(`word`) values ('cachingrecursiveiterator');
insert  into `spray_bad_word`(`word`) values ('callable');
insert  into `spray_bad_word`(`word`) values ('case');
insert  into `spray_bad_word`(`word`) values ('catch');
insert  into `spray_bad_word`(`word`) values ('ci_base');
insert  into `spray_bad_word`(`word`) values ('ci_version');
insert  into `spray_bad_word`(`word`) values ('class');
insert  into `spray_bad_word`(`word`) values ('clone');
insert  into `spray_bad_word`(`word`) values ('closure');
insert  into `spray_bad_word`(`word`) values ('config');
insert  into `spray_bad_word`(`word`) values ('config_item');
insert  into `spray_bad_word`(`word`) values ('const');
insert  into `spray_bad_word`(`word`) values ('continue');
insert  into `spray_bad_word`(`word`) values ('controller');
insert  into `spray_bad_word`(`word`) values ('declare');
insert  into `spray_bad_word`(`word`) values ('default');
insert  into `spray_bad_word`(`word`) values ('default_include_path');
insert  into `spray_bad_word`(`word`) values ('die');
insert  into `spray_bad_word`(`word`) values ('directory');
insert  into `spray_bad_word`(`word`) values ('directoryiterator');
insert  into `spray_bad_word`(`word`) values ('dir_read_mode');
insert  into `spray_bad_word`(`word`) values ('dir_write_mode');
insert  into `spray_bad_word`(`word`) values ('do');
insert  into `spray_bad_word`(`word`) values ('domattr');
insert  into `spray_bad_word`(`word`) values ('domcdatasection');
insert  into `spray_bad_word`(`word`) values ('domcharacterdata');
insert  into `spray_bad_word`(`word`) values ('domcomment');
insert  into `spray_bad_word`(`word`) values ('domconfiguration');
insert  into `spray_bad_word`(`word`) values ('domdocument');
insert  into `spray_bad_word`(`word`) values ('domdocumentfragment');
insert  into `spray_bad_word`(`word`) values ('domdocumenttype');
insert  into `spray_bad_word`(`word`) values ('domdomerror');
insert  into `spray_bad_word`(`word`) values ('domelement');
insert  into `spray_bad_word`(`word`) values ('domentity');
insert  into `spray_bad_word`(`word`) values ('domentityreference');
insert  into `spray_bad_word`(`word`) values ('domerrorhandler');
insert  into `spray_bad_word`(`word`) values ('domexception');
insert  into `spray_bad_word`(`word`) values ('domimplementation');
insert  into `spray_bad_word`(`word`) values ('domimplementationlist');
insert  into `spray_bad_word`(`word`) values ('domimplementationsource');
insert  into `spray_bad_word`(`word`) values ('domlocator');
insert  into `spray_bad_word`(`word`) values ('domnamednodemap');
insert  into `spray_bad_word`(`word`) values ('domnamelist');
insert  into `spray_bad_word`(`word`) values ('domnamespacenode');
insert  into `spray_bad_word`(`word`) values ('domnode');
insert  into `spray_bad_word`(`word`) values ('domnodelist');
insert  into `spray_bad_word`(`word`) values ('domnotation');
insert  into `spray_bad_word`(`word`) values ('domprocessinginstruction');
insert  into `spray_bad_word`(`word`) values ('domstringextend');
insert  into `spray_bad_word`(`word`) values ('domstringlist');
insert  into `spray_bad_word`(`word`) values ('domtext');
insert  into `spray_bad_word`(`word`) values ('domtypeinfo');
insert  into `spray_bad_word`(`word`) values ('domuserdatahandler');
insert  into `spray_bad_word`(`word`) values ('domxpath');
insert  into `spray_bad_word`(`word`) values ('echo');
insert  into `spray_bad_word`(`word`) values ('else');
insert  into `spray_bad_word`(`word`) values ('elseif');
insert  into `spray_bad_word`(`word`) values ('empty');
insert  into `spray_bad_word`(`word`) values ('enddeclare');
insert  into `spray_bad_word`(`word`) values ('endfor');
insert  into `spray_bad_word`(`word`) values ('endforeach');
insert  into `spray_bad_word`(`word`) values ('endif');
insert  into `spray_bad_word`(`word`) values ('endswitch');
insert  into `spray_bad_word`(`word`) values ('endwhile');
insert  into `spray_bad_word`(`word`) values ('environment');
insert  into `spray_bad_word`(`word`) values ('errorexception');
insert  into `spray_bad_word`(`word`) values ('eval');
insert  into `spray_bad_word`(`word`) values ('exception');
insert  into `spray_bad_word`(`word`) values ('exit');
insert  into `spray_bad_word`(`word`) values ('ext');
insert  into `spray_bad_word`(`word`) values ('extends');
insert  into `spray_bad_word`(`word`) values ('e_all');
insert  into `spray_bad_word`(`word`) values ('e_compile_error');
insert  into `spray_bad_word`(`word`) values ('e_compile_warning');
insert  into `spray_bad_word`(`word`) values ('e_core_error');
insert  into `spray_bad_word`(`word`) values ('e_core_warning');
insert  into `spray_bad_word`(`word`) values ('e_deprecated');
insert  into `spray_bad_word`(`word`) values ('e_error');
insert  into `spray_bad_word`(`word`) values ('e_notice');
insert  into `spray_bad_word`(`word`) values ('e_parse');
insert  into `spray_bad_word`(`word`) values ('e_strict');
insert  into `spray_bad_word`(`word`) values ('e_user_deprecated');
insert  into `spray_bad_word`(`word`) values ('e_user_error');
insert  into `spray_bad_word`(`word`) values ('e_user_notice');
insert  into `spray_bad_word`(`word`) values ('e_user_warning');
insert  into `spray_bad_word`(`word`) values ('e_warning');
insert  into `spray_bad_word`(`word`) values ('false');
insert  into `spray_bad_word`(`word`) values ('fcpath');
insert  into `spray_bad_word`(`word`) values ('file_read_mode');
insert  into `spray_bad_word`(`word`) values ('file_write_mode');
insert  into `spray_bad_word`(`word`) values ('filteriterator');
insert  into `spray_bad_word`(`word`) values ('final');
insert  into `spray_bad_word`(`word`) values ('finally');
insert  into `spray_bad_word`(`word`) values ('fopen_read');
insert  into `spray_bad_word`(`word`) values ('fopen_read_write');
insert  into `spray_bad_word`(`word`) values ('fopen_read_write_create');
insert  into `spray_bad_word`(`word`) values ('fopen_read_write_create_destructive');
insert  into `spray_bad_word`(`word`) values ('fopen_read_write_create_strict');
insert  into `spray_bad_word`(`word`) values ('fopen_write_create');
insert  into `spray_bad_word`(`word`) values ('fopen_write_create_destructive');
insert  into `spray_bad_word`(`word`) values ('fopen_write_create_strict');
insert  into `spray_bad_word`(`word`) values ('for');
insert  into `spray_bad_word`(`word`) values ('foreach');
insert  into `spray_bad_word`(`word`) values ('function');
insert  into `spray_bad_word`(`word`) values ('generator');
insert  into `spray_bad_word`(`word`) values ('get_config');
insert  into `spray_bad_word`(`word`) values ('get_instance');
insert  into `spray_bad_word`(`word`) values ('global');
insert  into `spray_bad_word`(`word`) values ('goto');
insert  into `spray_bad_word`(`word`) values ('if');
insert  into `spray_bad_word`(`word`) values ('implements');
insert  into `spray_bad_word`(`word`) values ('include');
insert  into `spray_bad_word`(`word`) values ('include_once');
insert  into `spray_bad_word`(`word`) values ('instanceof');
insert  into `spray_bad_word`(`word`) values ('insteadof');
insert  into `spray_bad_word`(`word`) values ('interface');
insert  into `spray_bad_word`(`word`) values ('isset');
insert  into `spray_bad_word`(`word`) values ('is_really_writable');
insert  into `spray_bad_word`(`word`) values ('lang');
insert  into `spray_bad_word`(`word`) values ('limititerator');
insert  into `spray_bad_word`(`word`) values ('list');
insert  into `spray_bad_word`(`word`) values ('load_class');
insert  into `spray_bad_word`(`word`) values ('log_message');
insert  into `spray_bad_word`(`word`) values ('mimes');
insert  into `spray_bad_word`(`word`) values ('namespace');
insert  into `spray_bad_word`(`word`) values ('new');
insert  into `spray_bad_word`(`word`) values ('null');
insert  into `spray_bad_word`(`word`) values ('or');
insert  into `spray_bad_word`(`word`) values ('parent');
insert  into `spray_bad_word`(`word`) values ('parentiterator');
insert  into `spray_bad_word`(`word`) values ('pear_extension_dir');
insert  into `spray_bad_word`(`word`) values ('pear_install_dir');
insert  into `spray_bad_word`(`word`) values ('php_binary');
insert  into `spray_bad_word`(`word`) values ('php_bindir');
insert  into `spray_bad_word`(`word`) values ('php_config_file_path');
insert  into `spray_bad_word`(`word`) values ('php_config_file_scan_dir');
insert  into `spray_bad_word`(`word`) values ('php_datadir');
insert  into `spray_bad_word`(`word`) values ('php_debug');
insert  into `spray_bad_word`(`word`) values ('php_eol');
insert  into `spray_bad_word`(`word`) values ('php_extension_dir');
insert  into `spray_bad_word`(`word`) values ('php_extra_version');
insert  into `spray_bad_word`(`word`) values ('php_int_max');
insert  into `spray_bad_word`(`word`) values ('php_int_size');
insert  into `spray_bad_word`(`word`) values ('php_libdir');
insert  into `spray_bad_word`(`word`) values ('php_localstatedir');
insert  into `spray_bad_word`(`word`) values ('php_major_version');
insert  into `spray_bad_word`(`word`) values ('php_mandir');
insert  into `spray_bad_word`(`word`) values ('php_maxpathlen');
insert  into `spray_bad_word`(`word`) values ('php_minor_version');
insert  into `spray_bad_word`(`word`) values ('php_os');
insert  into `spray_bad_word`(`word`) values ('php_prefix');
insert  into `spray_bad_word`(`word`) values ('php_release_version');
insert  into `spray_bad_word`(`word`) values ('php_sapi');
insert  into `spray_bad_word`(`word`) values ('php_shlib_suffix');
insert  into `spray_bad_word`(`word`) values ('php_sysconfdir');
insert  into `spray_bad_word`(`word`) values ('php_user_filter');
insert  into `spray_bad_word`(`word`) values ('php_version');
insert  into `spray_bad_word`(`word`) values ('php_version_id');
insert  into `spray_bad_word`(`word`) values ('php_zts');
insert  into `spray_bad_word`(`word`) values ('print');
insert  into `spray_bad_word`(`word`) values ('private');
insert  into `spray_bad_word`(`word`) values ('protected');
insert  into `spray_bad_word`(`word`) values ('public');
insert  into `spray_bad_word`(`word`) values ('recursivedirectoryiterator');
insert  into `spray_bad_word`(`word`) values ('recursiveiteratoriterator');
insert  into `spray_bad_word`(`word`) values ('reflection');
insert  into `spray_bad_word`(`word`) values ('reflectionclass');
insert  into `spray_bad_word`(`word`) values ('reflectionexception');
insert  into `spray_bad_word`(`word`) values ('reflectionextension');
insert  into `spray_bad_word`(`word`) values ('reflectionfunction');
insert  into `spray_bad_word`(`word`) values ('reflectionmethod');
insert  into `spray_bad_word`(`word`) values ('reflectionobject');
insert  into `spray_bad_word`(`word`) values ('reflectionparameter');
insert  into `spray_bad_word`(`word`) values ('reflectionproperty');
insert  into `spray_bad_word`(`word`) values ('require');
insert  into `spray_bad_word`(`word`) values ('require_once');
insert  into `spray_bad_word`(`word`) values ('return');
insert  into `spray_bad_word`(`word`) values ('self');
insert  into `spray_bad_word`(`word`) values ('show_404');
insert  into `spray_bad_word`(`word`) values ('show_error');
insert  into `spray_bad_word`(`word`) values ('simplexmlelement');
insert  into `spray_bad_word`(`word`) values ('simplexmliterator');
insert  into `spray_bad_word`(`word`) values ('sqlitedatabase');
insert  into `spray_bad_word`(`word`) values ('sqliteexception');
insert  into `spray_bad_word`(`word`) values ('sqliteresult');
insert  into `spray_bad_word`(`word`) values ('sqliteunbuffered');
insert  into `spray_bad_word`(`word`) values ('static');
insert  into `spray_bad_word`(`word`) values ('stdclass');
insert  into `spray_bad_word`(`word`) values ('switch');
insert  into `spray_bad_word`(`word`) values ('throw');
insert  into `spray_bad_word`(`word`) values ('toast');
insert  into `spray_bad_word`(`word`) values ('trait');
insert  into `spray_bad_word`(`word`) values ('true');
insert  into `spray_bad_word`(`word`) values ('try');
insert  into `spray_bad_word`(`word`) values ('unset');
insert  into `spray_bad_word`(`word`) values ('use');
insert  into `spray_bad_word`(`word`) values ('var');
insert  into `spray_bad_word`(`word`) values ('while');
insert  into `spray_bad_word`(`word`) values ('xor');
insert  into `spray_bad_word`(`word`) values ('xsltprocessor');
insert  into `spray_bad_word`(`word`) values ('yield');
insert  into `spray_bad_word`(`word`) values ('_ci_scaffolding');
insert  into `spray_bad_word`(`word`) values ('_exception_handler');
insert  into `spray_bad_word`(`word`) values ('__class__');
insert  into `spray_bad_word`(`word`) values ('__compiler_halt_offset__');
insert  into `spray_bad_word`(`word`) values ('__dir__');
insert  into `spray_bad_word`(`word`) values ('__file__');
insert  into `spray_bad_word`(`word`) values ('__function__');
insert  into `spray_bad_word`(`word`) values ('__halt_compiler');
insert  into `spray_bad_word`(`word`) values ('__line__');
insert  into `spray_bad_word`(`word`) values ('__method__');
insert  into `spray_bad_word`(`word`) values ('__namespace__');
insert  into `spray_bad_word`(`word`) values ('__php_incomplete_class');
insert  into `spray_bad_word`(`word`) values ('__trait__');

/*Table structure for table `spray_command` */

CREATE TABLE `spray_command` (
  `spray_command_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary key',
  `group_name` varchar(100) DEFAULT NULL COMMENT 'Group name',
  `command` varchar(100) DEFAULT NULL COMMENT 'Command name',
  `stype` enum('group','command') DEFAULT NULL COMMENT 'Type',
  `ptype` enum('public','member','admin') DEFAULT NULL COMMENT 'Acl',
  `desc` text COMMENT 'Description',
  `created` datetime DEFAULT NULL,
  PRIMARY KEY (`spray_command_id`),
  KEY `group_name` (`group_name`),
  KEY `command` (`command`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;

/*Data for the table `spray_command` */

insert  into `spray_command`(`spray_command_id`,`group_name`,`command`,`stype`,`ptype`,`desc`,`created`) values (1,'comment','','group','public','댓글 관련 전문','2014-01-09 18:36:38');
insert  into `spray_command`(`spray_command_id`,`group_name`,`command`,`stype`,`ptype`,`desc`,`created`) values (2,'feed','','group','public','Feed 관련 전문','2014-01-09 18:36:38');
insert  into `spray_command`(`spray_command_id`,`group_name`,`command`,`stype`,`ptype`,`desc`,`created`) values (3,'member','','group','public','회원 관련 전문','2014-01-09 18:36:38');
insert  into `spray_command`(`spray_command_id`,`group_name`,`command`,`stype`,`ptype`,`desc`,`created`) values (13,'comment','cdel','command','member','댓글을 삭제 합니다.','2014-01-09 18:36:38');
insert  into `spray_command`(`spray_command_id`,`group_name`,`command`,`stype`,`ptype`,`desc`,`created`) values (14,'comment','clist','command','public','댓글 리스트를 출력 합니다.','2014-01-09 18:36:38');
insert  into `spray_command`(`spray_command_id`,`group_name`,`command`,`stype`,`ptype`,`desc`,`created`) values (15,'comment','cwrite','command','member','댓글을 작성 합니다.','2014-01-09 18:36:38');
insert  into `spray_command`(`spray_command_id`,`group_name`,`command`,`stype`,`ptype`,`desc`,`created`) values (16,'feed','fdel','command','member','Feed를 삭제 합니다.','2014-01-09 18:36:38');
insert  into `spray_command`(`spray_command_id`,`group_name`,`command`,`stype`,`ptype`,`desc`,`created`) values (17,'feed','flike','command','member','Feed 좋아요 및 좋아요 해제','2014-01-09 18:36:38');
insert  into `spray_command`(`spray_command_id`,`group_name`,`command`,`stype`,`ptype`,`desc`,`created`) values (18,'feed','flist','command','public','Feed List 출력','2014-01-09 18:36:38');
insert  into `spray_command`(`spray_command_id`,`group_name`,`command`,`stype`,`ptype`,`desc`,`created`) values (19,'feed','fwrite','command','member','Feed를 작성 합니다.','2014-01-09 18:36:38');
insert  into `spray_command`(`spray_command_id`,`group_name`,`command`,`stype`,`ptype`,`desc`,`created`) values (20,'feed','get','command','public','Feed의 상세한 정보를 출력 합니다.','2014-01-09 18:36:38');
insert  into `spray_command`(`spray_command_id`,`group_name`,`command`,`stype`,`ptype`,`desc`,`created`) values (21,'feed','upload','command','member','이미지를 업로드 합니다.','2014-01-09 18:36:38');
insert  into `spray_command`(`spray_command_id`,`group_name`,`command`,`stype`,`ptype`,`desc`,`created`) values (22,'member','login','command','public','로그인','2014-01-09 18:36:38');
insert  into `spray_command`(`spray_command_id`,`group_name`,`command`,`stype`,`ptype`,`desc`,`created`) values (23,'member','logout','command','member','로그아웃','2014-01-09 18:36:38');
insert  into `spray_command`(`spray_command_id`,`group_name`,`command`,`stype`,`ptype`,`desc`,`created`) values (24,'member','modify','command','member','회원 정보를 수정 합니다.','2014-01-09 18:36:38');
insert  into `spray_command`(`spray_command_id`,`group_name`,`command`,`stype`,`ptype`,`desc`,`created`) values (25,'member','regist','command','public','회원 가입을 합니다.','2014-01-09 18:36:38');
insert  into `spray_command`(`spray_command_id`,`group_name`,`command`,`stype`,`ptype`,`desc`,`created`) values (26,'member','terms','command','public','회원가입 약관을 출력합니다.','2014-01-09 18:36:38');

/*Table structure for table `spray_template` */

CREATE TABLE `spray_template` (
  `spray_template_id` int(11) NOT NULL AUTO_INCREMENT,
  `group` enum('Spray','Jelly') DEFAULT 'Spray' COMMENT '템플릿 그룹',
  `name` varchar(100) DEFAULT NULL COMMENT '템플릿 이름',
  `type` enum('controller','model','view','controller_validation','toast') DEFAULT NULL COMMENT '템플릿 타입',
  `content` longtext,
  PRIMARY KEY (`spray_template_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `spray_template` */

insert  into `spray_template`(`spray_template_id`,`group`,`name`,`type`,`content`) values (1,'Spray','default','controller','<?php  if ( ! defined(\'BASEPATH\')) exit(\'No direct script access allowed\');\r\n/**\r\n * Spray contrroller {class_name}\r\n *\r\n * @package spray\r\n * @author 한대승 <hoksi2k@hanmail.net>\r\n * @author Spray auto_gen\r\n */\r\nclass {class_name} extends Spray {\r\n	private $post_data;\r\n\r\n	public function __construct()\r\n	{\r\n		parent::__construct();\r\n		\r\n		$this->load->model(\'{group_name}/{command_name}_model\');\r\n		if(FALSE) $this->{command_name}_model = new {class_name}_model;\r\n	}\r\n	\r\n	public function run()\r\n	{\r\n		if($this->validation()) {\r\n			$this->responseCode = 0;\r\n			$this->responseMessage = \'검증 성공\';\r\n\r\n			$this->data = array(\r\n				\'post_data\' => $this->{command_name}_model->{command_name}($this->post_data)\r\n			);\r\n		}\r\n		\r\n		return $this->get_res();\r\n	}\r\n	\r\n	public function validation()\r\n	{\r\n		{validation}\r\n\r\n		return $ret;\r\n	}\r\n} \r\n/* End of file {group_name}/{command_name}.php */');
insert  into `spray_template`(`spray_template_id`,`group`,`name`,`type`,`content`) values (2,'Spray','default','view','<table class=\"table\">\r\n	<thead>\r\n	<tr>\r\n		<th class=\"span2\">Field</th>\r\n		<th></th>\r\n		<th></th>\r\n	</tr>\r\n	</thead>\r\n{field_list}\r\n	<tr>\r\n		<td></td>\r\n		<td>\r\n			<input type=\"submit\" value=\"실 행\" />\r\n			<input type=\"reset\" />\r\n		</td>\r\n		<td></td>\r\n	</tr>\r\n</table>');
insert  into `spray_template`(`spray_template_id`,`group`,`name`,`type`,`content`) values (3,'Spray','default','model','<?php  if ( ! defined(\'BASEPATH\')) exit(\'No direct script access allowed\');\r\n/**\r\n * Spray model {class_name}_model\r\n *\r\n * @package Toast\r\n * @author  한대승 <hoksi2k@hanmail.net>\r\n */\r\nclass {class_name}_model extends MY_Model {\r\n	private $table = NULL;\r\n	\r\n	public function __construct()\r\n	{\r\n		parent::__construct();\r\n		\r\n		$this->table = \'{group_name}\';\r\n	}\r\n	\r\n	public function {command_name}($data)\r\n	{\r\n		return array($data);\r\n	}\r\n}\r\n// End of file models/{group_name}/{command_name}_model_tests.php //');
insert  into `spray_template`(`spray_template_id`,`group`,`name`,`type`,`content`) values (4,'Spray','default','controller_validation','		$ret = FALSE;\r\n\r\n		// validation 조건 확인\r\n		$config = array(\r\n			{validation}\r\n		);\r\n\r\n		if($this->form_chk($config)) {\r\n			$this->post_data = array(\r\n				{post_data}\r\n			);\r\n\r\n			$ret = TRUE;\r\n		} else {\r\n			$this->responseCode = -1;\r\n			\r\n			foreach($this->error_chk() as $err) {\r\n				{err_code}\r\n			}\r\n\r\n			$this->responseMessage = $err ? $err : \'데이터가 입력되지 않았습니다.\';\r\n		}\r\n');
insert  into `spray_template`(`spray_template_id`,`group`,`name`,`type`,`content`) values (5,'Spray','default','toast','<?php  if ( ! defined(\'BASEPATH\')) exit(\'No direct script access allowed\');\r\n/**\r\n * Toast contrroller {group_name}_{command_name}_model_tests\r\n *\r\n * @package Toast\r\n * @author  한대승 <hoksi2k@hanmail.net>\r\n */\r\nclass {class_name}_{command_name}_model_tests extends Spray_toast\r\n{\r\n	public function __construct()\r\n	{\r\n		parent::__construct(__FILE__);\r\n\r\n		$this->load->model(\'{group_name}/{command_name}_model\');\r\n		if(FALSE) $this->{command_name}_model = new {model_class_name}_model;\r\n	}\r\n\r\n	public function test_{command_name}()\r\n	{\r\n		{test_data}\r\n		\r\n		$ret = $this->{command_name}_model->{command_name}($data);\r\n\r\n		$this->_assert_true(FALSE);\r\n	}\r\n}\r\n\r\n// End of file toast/{group_name}_{command_name}_model_tests.php //');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
