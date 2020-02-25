/*
SQLyog Ultimate v10.00 Beta1
MySQL - 5.7.20 : Database - postbar
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`postbar` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `postbar`;

/*Table structure for table `account` */

DROP TABLE IF EXISTS `account`;

CREATE TABLE `account` (
  `account_id` int(11) NOT NULL AUTO_INCREMENT,
  `account_name` varchar(20) DEFAULT NULL,
  `account_password` varchar(20) NOT NULL,
  `account_phone` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`account_id`),
  UNIQUE KEY `account_name` (`account_name`),
  UNIQUE KEY `account_phone` (`account_phone`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `account` */

insert  into `account`(`account_id`,`account_name`,`account_password`,`account_phone`) values (1,'haha','admin','13799720853'),(2,'哈哈','admin','13255720853'),(3,'吉祥','admin','13497582253'),(4,'孙悟空','admin','13497582533'),(5,'猪八戒','admin123','13275846982');

/*Table structure for table `bar` */

DROP TABLE IF EXISTS `bar`;

CREATE TABLE `bar` (
  `bar_id` int(11) NOT NULL AUTO_INCREMENT,
  `bar_name` varchar(20) DEFAULT NULL,
  `bar_describe` varchar(100) DEFAULT NULL,
  `registration_date` date DEFAULT NULL,
  `account_id` int(11) DEFAULT NULL,
  `bar_code` int(11) DEFAULT NULL,
  PRIMARY KEY (`bar_id`),
  UNIQUE KEY `bar_name` (`bar_name`),
  KEY `bar_acc_fk` (`account_id`),
  CONSTRAINT `bar_acc_fk` FOREIGN KEY (`account_id`) REFERENCES `account` (`account_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

/*Data for the table `bar` */

insert  into `bar`(`bar_id`,`bar_name`,`bar_describe`,`registration_date`,`account_id`,`bar_code`) values (1,'火箭吧','Red Nation!凝聚红色力量','2019-07-11',4,100),(2,'洛杉矶湖人吧','洛杉矶湖人吧，湖人球迷聚集地','2019-10-11',NULL,88),(3,'凯尔特人吧','天下凯密一家人','2019-10-18',NULL,75),(4,'林书豪吧','全球最大的林书豪球迷中文论坛','2019-11-06',NULL,66),(5,'LOL吧','第一手电竞资讯/英雄攻略/尽在LOL吧','2019-06-14',NULL,111),(6,'dota2吧','DOTA２玩家聚集地','2019-11-05',NULL,78),(7,'地下城于勇士吧','阿拉德闲聊茶馆,休闲侃侃,一切尽在笑谈中','2019-11-08',NULL,98),(8,'天涯明月刀ol吧','天涯风啸四方海，明月心醉一人刀。','2019-11-01',NULL,99),(9,'美食吧','世界美食爱好者交流中心','2019-11-11',NULL,68);

/*Table structure for table `post` */

DROP TABLE IF EXISTS `post`;

CREATE TABLE `post` (
  `post_id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` int(11) DEFAULT NULL,
  `bar_id` int(11) DEFAULT NULL,
  `post_subject` varchar(50) DEFAULT NULL,
  `post_content` varchar(300) DEFAULT NULL,
  `post_state` int(11) DEFAULT '2',
  `post_date` date DEFAULT NULL,
  `check_date` date DEFAULT NULL,
  `admin_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`post_id`),
  KEY `post_acc_fk` (`account_id`),
  KEY `post_bar_fk` (`bar_id`),
  CONSTRAINT `post_acc_fk` FOREIGN KEY (`account_id`) REFERENCES `account` (`account_id`),
  CONSTRAINT `post_bar_fk` FOREIGN KEY (`bar_id`) REFERENCES `bar` (`bar_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

/*Data for the table `post` */

insert  into `post`(`post_id`,`account_id`,`bar_id`,`post_subject`,`post_content`,`post_state`,`post_date`,`check_date`,`admin_id`) values (1,5,9,'唯有美食不可辜负也','鸡腿这么做 好吃又下饭 给大家分享一下老爸的❤',2,'2019-11-11','2019-11-12',1),(2,5,9,'最爱螺狮粉','有没有人喜欢吃螺狮粉',2,'2019-11-07',NULL,1),(4,1,9,'asdf','afsd',2,'2019-11-17',NULL,NULL),(5,1,5,'【夜谈S9】零封G2 凤凰涅槃新王登基 我们又是冠军！','各位看官晚上好，欢迎来到LOL吧赛事专栏【夜谈S9】。S9总决赛已经结束，今夜的巴黎是沉默的，今夜的LPL是沸腾的，今年我们也可以自豪的告诉全世界，我们LPL是冠军！\n今年的决赛，正如主题所言新生不息，G2和FPX都是首次登上S系列赛的决赛舞台，让我们看看这两只新队伍都碰撞出了什么火花吧~\n看看今晚都有什么好聊的吧~\n一起迎接那场属于我们的金色的雨，一起喊出那句：LPL牛逼！FPX牛逼！',2,'2019-11-17',NULL,NULL),(6,1,5,'【11.7 9.22版本改动内容 新英雄新皮肤新物品 英雄改动】','大家好 我是阿立 今天为大家带来9.22版本更新（除自走棋外）的翻译',2,'2019-11-17',NULL,NULL),(7,3,9,'【11.7 9.22版本改动内容 新英雄新皮肤新物品 英雄改动】','asdfasdfasdfasdf',2,'2019-11-19',NULL,NULL),(8,3,6,'【夜谈S9】零封G2 凤凰涅槃新王登基 我们又是冠军！','【夜谈S9】零封G2 凤凰涅槃新王登基 我们又是冠军！【夜谈S9】零封G2 凤凰涅槃新王登基 我们又是冠军！【夜谈S9】零封G2 凤凰涅槃新王登基 我们又是冠军！【夜谈S9】零封G2 凤凰涅槃新王登基 我们又是冠军！【夜谈S9】零封G2 凤凰涅槃新王登基 我们又是冠军',2,'2019-11-19',NULL,NULL),(9,3,4,'【夜谈S9】零封G2 凤凰涅槃新王登基 我们又是冠军！','中国牛逼',2,'2019-11-26',NULL,NULL);

/*Table structure for table `reply` */

DROP TABLE IF EXISTS `reply`;

CREATE TABLE `reply` (
  `reply_id` int(11) NOT NULL AUTO_INCREMENT,
  `post_id` int(11) DEFAULT NULL,
  `account_id` int(11) DEFAULT NULL,
  `replies_id` int(11) DEFAULT NULL,
  `reply_content` varchar(300) DEFAULT NULL,
  `attachment_url` varchar(50) DEFAULT NULL,
  `reply_date` date DEFAULT NULL,
  `like_sum` int(11) DEFAULT '0',
  `unlike_sum` int(11) DEFAULT '0',
  PRIMARY KEY (`reply_id`),
  KEY `reply_post_fk` (`post_id`),
  KEY `reply_acc_fk` (`account_id`),
  KEY `reply_rep_fk` (`replies_id`),
  CONSTRAINT `reply_acc_fk` FOREIGN KEY (`account_id`) REFERENCES `account` (`account_id`),
  CONSTRAINT `reply_post_fk` FOREIGN KEY (`post_id`) REFERENCES `post` (`post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

/*Data for the table `reply` */

insert  into `reply`(`reply_id`,`post_id`,`account_id`,`replies_id`,`reply_content`,`attachment_url`,`reply_date`,`like_sum`,`unlike_sum`) values (1,5,1,0,'各位看官晚上好，欢迎来到LOL吧赛事专栏【夜谈S9】。S9总决赛已经结束，今夜的巴黎是沉默的，今夜的LPL是沸腾的，今年我们也可以自豪的告诉全世界，我们LPL是冠军！\n今年的决赛，正如主题所言新生不息，G2和FPX都是首次登上S系列赛的决赛舞台，让我们看看这两只新队伍都碰撞出了什么火花吧~\n看看今晚都有什么好聊的吧~\n一起迎接那场属于我们的金色的雨，一起喊出那句：LPL牛逼！FPX牛逼！','','2019-11-17',2,0),(2,6,1,0,'大家好 我是阿立 今天为大家带来9.22版本更新（除自走棋外）的翻译','','2019-11-17',2,0),(3,5,3,1,'中国厉害！！LPL牛逼！FPX牛逼！',NULL,'2019-11-17',1,1),(4,5,3,1,'中国厉害！！LPL牛逼！FPX牛逼！',NULL,'2019-11-17',1,1),(5,5,1,1,'中国厉害！！LPL牛逼！FPX牛逼！中国厉害！！LPL牛逼！FPX牛逼！中国厉害！！LPL牛逼！FPX牛逼！','2019111723150381874800000001.jpg','2019-11-17',2,0),(8,5,1,1,'厉害了','2019111723275504978000000001.jpg','2019-11-17',2,0),(9,7,3,0,'asdfasdfasdfasdf','','2019-11-19',1,0),(10,8,3,0,'【夜谈S9】零封G2 凤凰涅槃新王登基 我们又是冠军！【夜谈S9】零封G2 凤凰涅槃新王登基 我们又是冠军！【夜谈S9】零封G2 凤凰涅槃新王登基 我们又是冠军！【夜谈S9】零封G2 凤凰涅槃新王登基 我们又是冠军！【夜谈S9】零封G2 凤凰涅槃新王登基 我们又是冠军','','2019-11-19',0,0),(11,9,3,0,'中国牛逼','','2019-11-26',1,0);

/*Table structure for table `reply_evaluate` */

DROP TABLE IF EXISTS `reply_evaluate`;

CREATE TABLE `reply_evaluate` (
  `evaluate_id` int(11) NOT NULL AUTO_INCREMENT,
  `reply_id` int(11) DEFAULT NULL,
  `account_id` int(11) DEFAULT NULL,
  `evaluate_state` int(11) DEFAULT NULL,
  PRIMARY KEY (`evaluate_id`),
  KEY `eval_acc_fk` (`account_id`),
  KEY `eval_reply_fk` (`reply_id`),
  CONSTRAINT `eval_acc_fk` FOREIGN KEY (`account_id`) REFERENCES `account` (`account_id`),
  CONSTRAINT `eval_reply_fk` FOREIGN KEY (`reply_id`) REFERENCES `reply` (`reply_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

/*Data for the table `reply_evaluate` */

insert  into `reply_evaluate`(`evaluate_id`,`reply_id`,`account_id`,`evaluate_state`) values (8,1,1,1),(9,3,1,1),(10,1,3,1),(11,8,1,1),(12,5,1,1),(13,4,1,1),(14,2,3,1),(15,8,3,1),(16,5,3,1),(17,4,3,2),(18,3,3,2),(19,9,3,1),(20,2,1,1),(21,11,3,1);

/*Table structure for table `post_info_v` */

DROP TABLE IF EXISTS `post_info_v`;

/*!50001 DROP VIEW IF EXISTS `post_info_v` */;
/*!50001 DROP TABLE IF EXISTS `post_info_v` */;

/*!50001 CREATE TABLE  `post_info_v`(
 `post_id` int(11) ,
 `account_id` int(11) ,
 `bar_id` int(11) ,
 `post_subject` varchar(50) ,
 `post_content` varchar(300) ,
 `post_state` int(11) ,
 `post_date` date ,
 `check_date` date ,
 `admin_id` int(11) ,
 `account_name` varchar(20) ,
 `bar_name` varchar(20) ,
 `bar_describe` varchar(100) 
)*/;

/*Table structure for table `reply_info_v` */

DROP TABLE IF EXISTS `reply_info_v`;

/*!50001 DROP VIEW IF EXISTS `reply_info_v` */;
/*!50001 DROP TABLE IF EXISTS `reply_info_v` */;

/*!50001 CREATE TABLE  `reply_info_v`(
 `reply_id` int(11) ,
 `post_id` int(11) ,
 `account_id` int(11) ,
 `replies_id` int(11) ,
 `reply_content` varchar(300) ,
 `attachment_url` varchar(50) ,
 `reply_date` date ,
 `like_sum` int(11) ,
 `unlike_sum` int(11) ,
 `account_name` varchar(20) 
)*/;

/*View structure for view post_info_v */

/*!50001 DROP TABLE IF EXISTS `post_info_v` */;
/*!50001 DROP VIEW IF EXISTS `post_info_v` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `post_info_v` AS select `p`.`post_id` AS `post_id`,`p`.`account_id` AS `account_id`,`p`.`bar_id` AS `bar_id`,`p`.`post_subject` AS `post_subject`,`p`.`post_content` AS `post_content`,`p`.`post_state` AS `post_state`,`p`.`post_date` AS `post_date`,`p`.`check_date` AS `check_date`,`p`.`admin_id` AS `admin_id`,`a`.`account_name` AS `account_name`,`b`.`bar_name` AS `bar_name`,`b`.`bar_describe` AS `bar_describe` from ((`post` `p` join `account` `a` on((`p`.`account_id` = `a`.`account_id`))) join `bar` `b` on((`b`.`bar_id` = `p`.`bar_id`))) */;

/*View structure for view reply_info_v */

/*!50001 DROP TABLE IF EXISTS `reply_info_v` */;
/*!50001 DROP VIEW IF EXISTS `reply_info_v` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `reply_info_v` AS select `r`.`reply_id` AS `reply_id`,`r`.`post_id` AS `post_id`,`r`.`account_id` AS `account_id`,`r`.`replies_id` AS `replies_id`,`r`.`reply_content` AS `reply_content`,`r`.`attachment_url` AS `attachment_url`,`r`.`reply_date` AS `reply_date`,`r`.`like_sum` AS `like_sum`,`r`.`unlike_sum` AS `unlike_sum`,`a`.`account_name` AS `account_name` from (`reply` `r` join `account` `a` on((`r`.`account_id` = `a`.`account_id`))) */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
