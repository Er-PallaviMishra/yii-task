/*
SQLyog Community v13.1.6 (64 bit)
MySQL - 10.4.11-MariaDB : Database - petstore
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`petstore` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `petstore`;

/*Table structure for table `categories` */

DROP TABLE IF EXISTS `categories`;

CREATE TABLE `categories` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `categories` */

insert  into `categories`(`id`,`name`) values 
(1,'Dogs'),
(2,'Cats');

/*Table structure for table `migration` */

DROP TABLE IF EXISTS `migration`;

CREATE TABLE `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `migration` */

insert  into `migration`(`version`,`apply_time`) values 
('m000000_000000_base',1604210307),
('m201101_055319_create_register_table',1604210309);

/*Table structure for table `pets` */

DROP TABLE IF EXISTS `pets`;

CREATE TABLE `pets` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `cost` decimal(10,0) NOT NULL,
  `picture` varchar(255) NOT NULL,
  `dateposted` datetime NOT NULL,
  `category_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pets_ibfk_1` (`category_id`),
  CONSTRAINT `pets_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

/*Data for the table `pets` */

insert  into `pets`(`id`,`name`,`description`,`cost`,`picture`,`dateposted`,`category_id`) values 
(8,'FERRO','',50,'','2020-10-31 22:56:23',1),
(9,'Dog','cvbnm,',100,'vbhjk','0000-00-00 00:00:00',1);

/*Table structure for table `register` */

DROP TABLE IF EXISTS `register`;

CREATE TABLE `register` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `authKey` varchar(255) DEFAULT NULL,
  `accessToken` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

/*Data for the table `register` */

insert  into `register`(`id`,`username`,`email`,`password`,`authKey`,`accessToken`) values 
(1,'admin','admin@gmail.com','$argon2i$v=19$m=65536,t=4,p=1$UGg1Wkc1b1NIZjdnSkpnbw$iltAXOVx7cZBiKaA01T3HGZvCgbVrODcyv1R+nqPfc0','d67aee1cbf535851b59385334b3e57cc','$2y$10$.dJWwhtjuaqTUKol2UtIr.d.zb8BPI0ZTOqQ/AhV/T2jBwFSfjnk2');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
