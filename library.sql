/*
SQLyog Ultimate v11.11 (64 bit)
MySQL - 5.6.14 : Database - libraryng
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`libraryng` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `libraryng`;

/*Table structure for table `account` */

DROP TABLE IF EXISTS `account`;

CREATE TABLE `account` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `username` varchar(64) NOT NULL COMMENT 'Username',
  `password` varchar(64) NOT NULL COMMENT 'Password',
  `last_login` datetime DEFAULT NULL COMMENT 'Last Login',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `account` */

insert  into `account`(`id`,`username`,`password`,`last_login`) values (1,'daniel','0de89bec7c16eecb59c10fa43f416d9c',NULL),(2,'desy','0de89bec7c16eecb59c10fa43f416d9c',NULL),(3,'nathanael','0de89bec7c16eecb59c10fa43f416d9c',NULL),(4,'carlos','eefb3150c146b43f35ae4850ae471c55',NULL);

/*Table structure for table `authassignment` */

DROP TABLE IF EXISTS `authassignment`;

CREATE TABLE `authassignment` (
  `itemname` varchar(64) NOT NULL,
  `userid` varchar(64) NOT NULL,
  `bizrule` text,
  `data` text,
  PRIMARY KEY (`userid`),
  KEY `authassignment_ibfk_1` (`itemname`),
  CONSTRAINT `authassignment_ibfk_1` FOREIGN KEY (`itemname`) REFERENCES `authitem` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `authassignment` */

insert  into `authassignment`(`itemname`,`userid`,`bizrule`,`data`) values ('admin','1',NULL,'N;'),('staff','2',NULL,NULL),('member','3','',''),('member','4',NULL,NULL);

/*Table structure for table `authitem` */

DROP TABLE IF EXISTS `authitem`;

CREATE TABLE `authitem` (
  `name` varchar(64) NOT NULL,
  `type` int(11) NOT NULL,
  `description` text,
  `bizrule` text,
  `data` text,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `authitem` */

insert  into `authitem`(`name`,`type`,`description`,`bizrule`,`data`) values ('admin',2,'representing  a admin',NULL,'N;'),('approve_loans',0,'to approve loans',NULL,'N;'),('assign_member',0,'assign member',NULL,'N;'),('cancel_loans',0,'to  cancel loans',NULL,'N;'),('create',1,'a  group  of  create',NULL,'N;'),('create_book',0,'to create book',NULL,'N;'),('create_copies',0,'to  create copies',NULL,'N;'),('create_loans',0,'to create loans',NULL,'N;'),('delete_book',0,'to  delete book',NULL,'N;'),('delete_copies',0,'to  delete copies',NULL,'N;'),('guest',2,'guest,  could  be unregistered or a non-logged in member',NULL,'N;'),('Loans',1,'a  group  of  loans',NULL,'N;'),('login',0,'login to the web',NULL,'N;'),('manage',1,'a  group  of  manage',NULL,'N;'),('manageLoans',1,'a  group  of  manage loans',NULL,'N;'),('manage_account',0,'to manage account',NULL,'N;'),('manage_author',0,'to manage author',NULL,'N;'),('manage_bookCopy',0,'to manage bookCopy',NULL,'N;'),('manage_model',1,'a  group  of  management for model',NULL,'N;'),('manage_publisher',0,'to manage publisher',NULL,'N;'),('member',2,'representing  a member',NULL,'N;'),('profil',1,'a  group  of  profil',NULL,'N;'),('register',0,'register as a new member',NULL,'N;'),('returned_loans',0,'to  return loans',NULL,'N;'),('revoke_member',0,'revoke member',NULL,'N;'),('staff',2,'representing  a staff',NULL,'N;'),('update_book',0,'to update book',NULL,'N;'),('update_copies',0,'to update copies',NULL,'N;'),('update_profil',0,'to  update profil of member',NULL,'N;'),('view',1,'a  group  of  view',NULL,'N;'),('view_book',0,'to  view  the  detail  of  a specified book',NULL,'N;'),('view_list_book',0,'to  view list book )',NULL,'N;'),('view_list_copies',0,'to  view list copies',NULL,'N;'),('view_list_due',0,'to view list due loans',NULL,'N;'),('view_list_due_fine',0,'to  view list due fine loans',NULL,'N;'),('view_list_loans',0,'to  view list loans )',NULL,'N;'),('view_list_member',0,'to  view list member )',NULL,'N;'),('view_Loans',0,'to view the detail of loans',NULL,'N;'),('view_profil',0,'to  view  the  detail  of  a specified profil',NULL,'N;');

/*Table structure for table `authitemchild` */

DROP TABLE IF EXISTS `authitemchild`;

CREATE TABLE `authitemchild` (
  `parent` varchar(64) NOT NULL,
  `child` varchar(64) NOT NULL,
  PRIMARY KEY (`parent`,`child`),
  KEY `child` (`child`),
  CONSTRAINT `authitemchild_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `authitem` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `authitemchild_ibfk_2` FOREIGN KEY (`child`) REFERENCES `authitem` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `authitemchild` */

insert  into `authitemchild`(`parent`,`child`) values ('manageLoans','approve_loans'),('admin','assign_member'),('Loans','cancel_loans'),('admin','create'),('staff','create'),('create','create_book'),('create','create_copies'),('Loans','create_loans'),('manage','delete_book'),('manage','delete_copies'),('admin','Loans'),('member','Loans'),('staff','Loans'),('guest','login'),('admin','manage'),('staff','manage'),('admin','manageLoans'),('staff','manageLoans'),('manage_model','manage_account'),('manage_model','manage_author'),('manage_model','manage_bookCopy'),('admin','manage_model'),('staff','manage_model'),('manage_model','manage_publisher'),('admin','profil'),('member','profil'),('staff','profil'),('guest','register'),('manageLoans','returned_loans'),('admin','revoke_member'),('manage','update_book'),('manage','update_copies'),('profil','update_profil'),('admin','view'),('member','view'),('staff','view'),('view','view_book'),('view','view_list_book'),('view','view_list_copies'),('manageLoans','view_list_due'),('manageLoans','view_list_due_fine'),('admin','view_list_loans'),('member','view_list_loans'),('staff','view_list_loans'),('admin','view_list_member'),('staff','view_list_member'),('admin','view_Loans'),('member','view_Loans'),('staff','view_Loans'),('profil','view_profil');

/*Table structure for table `author` */

DROP TABLE IF EXISTS `author`;

CREATE TABLE `author` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `first_name` varchar(64) NOT NULL COMMENT 'First Name',
  `last_name` varchar(64) DEFAULT NULL COMMENT 'Last Name',
  `email` varchar(128) DEFAULT NULL COMMENT 'E-mail',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `author` */

insert  into `author`(`id`,`first_name`,`last_name`,`email`) values (1,'Mega','Susanti','megaSusanti@publisher.com'),(2,'david','degea','david@gea.com');

/*Table structure for table `book` */

DROP TABLE IF EXISTS `book`;

CREATE TABLE `book` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `author_id` int(10) unsigned DEFAULT NULL COMMENT 'Author ID',
  `publisher_id` int(10) unsigned DEFAULT NULL COMMENT 'Publisher ID',
  `isbn` varchar(16) DEFAULT NULL COMMENT 'ISBN',
  `title` varchar(64) DEFAULT NULL COMMENT 'Title',
  `year` char(4) DEFAULT NULL COMMENT 'Year',
  `description` text COMMENT 'Description',
  `image` varchar(30) DEFAULT NULL COMMENT 'Image',
  PRIMARY KEY (`id`),
  KEY `book_ref_author` (`author_id`),
  KEY `book_ref_publisher` (`publisher_id`),
  CONSTRAINT `book_ref_author` FOREIGN KEY (`author_id`) REFERENCES `author` (`id`),
  CONSTRAINT `book_ref_publisher` FOREIGN KEY (`publisher_id`) REFERENCES `publisher` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=latin1;

/*Data for the table `book` */

insert  into `book`(`id`,`author_id`,`publisher_id`,`isbn`,`title`,`year`,`description`,`image`) values (29,1,1,'1234567890','Death Note','2013','Kematian hanyalah kehidupan yang terenggut untuk menciptakan kehidupan lainnya ...','Kematian.jpg'),(30,1,1,'1212121212','Kemampuan','2005','Lila adalah seorang penyandang disabilitas yang sangat ramah. Walaupun dia memiliki banyak kekurangan tapi dia punya cinta yang membangkitkan kemampuannya. ','Kemampuan.jpg'),(31,2,2,'76472364376278','Pemrograman Web dengan PHP','2014','Pemrograman Web dengan PHP. Mau tau cara mudah belajar PHP, ini rahasianya....','Pemrograman Web dengan PHP.jpg'),(32,1,2,'43029430294','Secret Admirer','2009','Stop, dan liat sekelilingmu, pasti kau kan melihat seorang pemuda yang diam diam mencintaimu...','Secret Admirer.gif');

/*Table structure for table `book_copy` */

DROP TABLE IF EXISTS `book_copy`;

CREATE TABLE `book_copy` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `book_id` int(10) unsigned NOT NULL COMMENT 'Book ID',
  `call_number` varchar(16) NOT NULL COMMENT 'Call Number',
  `year` char(4) DEFAULT NULL COMMENT 'Year',
  `availability` tinyint(1) DEFAULT '0' COMMENT 'Availability',
  `loanable` tinyint(1) DEFAULT '0' COMMENT 'Loanable',
  PRIMARY KEY (`id`),
  KEY `copy_ref_book` (`book_id`),
  CONSTRAINT `copy_ref_book` FOREIGN KEY (`book_id`) REFERENCES `book` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

/*Data for the table `book_copy` */

insert  into `book_copy`(`id`,`book_id`,`call_number`,`year`,`availability`,`loanable`) values (1,29,'21IIDbkmn','2014',1,0),(2,29,'21IIBckmn','2014',1,1),(3,29,'21IIBdkmn','2014',1,1),(4,29,'21IIBekmn','2014',1,1),(5,30,'35JLCalmk','2005',1,0),(6,30,'35JLCblmk','2005',1,1),(7,30,'35JLCclmk','2005',1,1),(8,30,'35JLCdlmk','2005',1,1),(9,31,'67jkla','2014',1,0),(10,31,'67jklb','2014',1,1),(11,31,'67jklc','2014',1,1),(12,31,'67jkld','2014',1,1),(13,32,'hjdsa7a','2009',1,0),(14,32,'hjdsa7b','2009',1,1),(15,32,'hjdsa7c','2009',1,1),(16,32,'hjdsa7d','2009',1,1),(17,32,'hjdsa7e','2009',1,1);

/*Table structure for table `loan` */

DROP TABLE IF EXISTS `loan`;

CREATE TABLE `loan` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `borrower_id` int(10) unsigned NOT NULL COMMENT 'Borrower ID',
  `copy_id` int(10) unsigned NOT NULL COMMENT 'Copy ID',
  `book_id` int(10) unsigned NOT NULL COMMENT 'Book ID',
  `start_date` date NOT NULL COMMENT 'Start Date',
  `due_date` date DEFAULT NULL COMMENT 'Due Date',
  `return_date` date DEFAULT NULL COMMENT 'Return Date',
  `fines` float(5,2) DEFAULT '0.00' COMMENT 'Fines',
  `status` varchar(16) DEFAULT NULL COMMENT 'Status',
  PRIMARY KEY (`id`),
  KEY `loan_ref_borrower` (`borrower_id`),
  KEY `loan_ref_copy` (`copy_id`),
  CONSTRAINT `loan_ref_borrower` FOREIGN KEY (`borrower_id`) REFERENCES `member` (`id`),
  CONSTRAINT `loan_ref_copy` FOREIGN KEY (`copy_id`) REFERENCES `book_copy` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=latin1;

/*Data for the table `loan` */

insert  into `loan`(`id`,`borrower_id`,`copy_id`,`book_id`,`start_date`,`due_date`,`return_date`,`fines`,`status`) values (37,1,2,29,'2015-01-02','2015-01-03','2015-01-12',0.00,'debt paid 999.99'),(38,1,2,29,'0000-00-00',NULL,NULL,0.00,'request');

/*Table structure for table `member` */

DROP TABLE IF EXISTS `member`;

CREATE TABLE `member` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `account_id` int(10) unsigned NOT NULL COMMENT 'Account ID',
  `first_name` varchar(64) NOT NULL COMMENT 'First Name',
  `last_name` varchar(64) DEFAULT NULL COMMENT 'Last Name',
  `email` varchar(128) DEFAULT NULL COMMENT 'E-mail',
  `address` varchar(128) DEFAULT NULL COMMENT 'Address',
  `date_of_birth` date DEFAULT NULL,
  `sex` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `member_ref_account` (`account_id`),
  CONSTRAINT `member_ref_account` FOREIGN KEY (`account_id`) REFERENCES `account` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `member` */

insert  into `member`(`id`,`account_id`,`first_name`,`last_name`,`email`,`address`,`date_of_birth`,`sex`) values (1,1,'daniel','panjaitan','if313003@students.del.ac.id','del','2014-01-30','male'),(2,2,'desy','christy','christydevega@gmail.com','binjai','1994-12-23','female'),(3,3,'nathanael','panjaitan','if313003@students.del.ac.id','del','1996-01-30','male'),(4,4,'carlos','simatupang','carlos@yahoo.com','dolok sanggul','1994-02-13','male');

/*Table structure for table `publisher` */

DROP TABLE IF EXISTS `publisher`;

CREATE TABLE `publisher` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(64) NOT NULL COMMENT 'Name',
  `address` varchar(64) DEFAULT NULL COMMENT 'Address',
  `email` varchar(128) DEFAULT NULL COMMENT 'E-mail',
  `phone` varchar(16) DEFAULT NULL COMMENT 'Phone',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `publisher` */

insert  into `publisher`(`id`,`name`,`address`,`email`,`phone`) values (1,'Pustaka Jaya','Jln Kusuma jaya , Jakarta Utara','Pustakajaya@gmail.com','082166026701'),(2,'curug pustaka','jakarta','curug_pustaka@fmale.com','009123432323432');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
