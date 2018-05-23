/*
SQLyog Ultimate v12.09 (64 bit)
MySQL - 5.7.20-log : Database - movie_portal
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`movie_portal` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `movie_portal`;

/*Table structure for table `actor` */

DROP TABLE IF EXISTS `actor`;

CREATE TABLE `actor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `surname` varchar(255) NOT NULL,
  `age` int(11) NOT NULL,
  `all_movie_count` int(11) DEFAULT NULL,
  `nationality` varchar(255) NOT NULL,
  `pic` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `actor` */

insert  into `actor`(`id`,`name`,`surname`,`age`,`all_movie_count`,`nationality`,`pic`) values (2,'Tom ','Cruise',55,0,'American','1519554386396_tom.jpg'),(3,'Emma','Watson',27,0,'American','1519563526718_220px-Emma_Watson_2013.jpg');

/*Table structure for table `actor_movie` */

DROP TABLE IF EXISTS `actor_movie`;

CREATE TABLE `actor_movie` (
  `actor_id` int(11) NOT NULL,
  `movie_id` int(11) NOT NULL,
  PRIMARY KEY (`actor_id`,`movie_id`),
  KEY `movie_id` (`movie_id`),
  CONSTRAINT `actor_movie_ibfk_1` FOREIGN KEY (`actor_id`) REFERENCES `actor` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `actor_movie_ibfk_2` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `actor_movie` */

insert  into `actor_movie`(`actor_id`,`movie_id`) values (2,3),(3,3),(3,4),(2,6),(3,6);

/*Table structure for table `company` */

DROP TABLE IF EXISTS `company`;

CREATE TABLE `company` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `picture` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `company` */

insert  into `company`(`id`,`name`,`picture`) values (1,'Warner brosers','1519291560533_slider3.jpg');

/*Table structure for table `director` */

DROP TABLE IF EXISTS `director`;

CREATE TABLE `director` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `surname` varchar(255) NOT NULL,
  `nationality` varchar(255) NOT NULL,
  `age` int(11) NOT NULL,
  `all_movie_count` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `director` */

insert  into `director`(`id`,`name`,`surname`,`nationality`,`age`,`all_movie_count`) values (1,'Artash','Haroyan','Armenian',23,0);

/*Table structure for table `director_movie` */

DROP TABLE IF EXISTS `director_movie`;

CREATE TABLE `director_movie` (
  `director_id` int(11) NOT NULL,
  `movie_id` int(11) NOT NULL,
  PRIMARY KEY (`director_id`,`movie_id`),
  KEY `movie_id` (`movie_id`),
  CONSTRAINT `director_movie_ibfk_1` FOREIGN KEY (`director_id`) REFERENCES `director` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `director_movie_ibfk_2` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `director_movie` */

insert  into `director_movie`(`director_id`,`movie_id`) values (1,1),(1,2),(1,3),(1,4),(1,6);

/*Table structure for table `genre` */

DROP TABLE IF EXISTS `genre`;

CREATE TABLE `genre` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `genre` */

insert  into `genre`(`id`,`name`) values (1,'Action');

/*Table structure for table `movie` */

DROP TABLE IF EXISTS `movie`;

CREATE TABLE `movie` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `year` varchar(255) NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `country` varchar(255) NOT NULL,
  `budget` varchar(255) NOT NULL,
  `movie_time` varchar(255) NOT NULL,
  `picture` varchar(255) NOT NULL,
  `company_id` int(11) NOT NULL,
  `movie_trailer` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `company_id` (`company_id`),
  CONSTRAINT `movie_ibfk_1` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

/*Data for the table `movie` */

insert  into `movie`(`id`,`title`,`description`,`year`,`create_date`,`country`,`budget`,`movie_time`,`picture`,`company_id`,`movie_trailer`) values (1,'Blade Runner 2049','gdfgdg','2017','2018-02-22 12:26:37','dgdg','1260000','126','1519291597785_slider3.jpg',1,'https://www.youtube.com/watch?v=2Wroofd1bB0'),(2,'Oblivion (2013 film)','Oblivion is a 2013 American','2013','2018-02-22 15:08:50','American','16000000','124','1519301330143_slider1.jpg',1,'https://www.youtube.com/watch?v=XmIIgE7eSak'),(3,'Die Hard','Die Hard is a 1988 American action film directed by John McTiernan and written by Steven E. de Souza and Jeb Stuart. It was produced by the Gordon Company and Silver Pictures, and distributed by 20th Century Fox.','1988','2018-02-25 14:46:16','American','28000000','132','1519559176290_mv-item3.jpg',1,'https://www.youtube.com/watch?v=2TQ-pOvI6Xo'),(4,'Harry Potter','Harry Potter is a British-American film series based on the Harry Potter novels by author J. K. Rowling. The series is distributed by Warner Bros. and consists of eight fantasy films, beginning with Harry Potter and the Philosopher\'s Stone (2001) and culminating with Harry Potter','1997','2018-02-25 16:05:41','American','200000','160','1519563941728_mv-it10.jpg',1,'https://www.youtube.com/watch?v=ZAf3U0J8Se8'),(6,'Skyfall','Skyfall (2012) is the twenty-third spy film in the James Bond series produced by Eon Productions. It features Daniel Craig in his third performance as James Bond,','2012','2018-02-25 23:02:15','Great Britian','150000000','124','1519588919308_movie-single.jpg',1,'https://www.youtube.com/watch?v=6kw1UVovByw');

/*Table structure for table `movie_genre` */

DROP TABLE IF EXISTS `movie_genre`;

CREATE TABLE `movie_genre` (
  `movie_id` int(11) NOT NULL,
  `genre_id` int(11) NOT NULL,
  PRIMARY KEY (`movie_id`,`genre_id`),
  KEY `movie_genre_ibfk_2` (`genre_id`),
  CONSTRAINT `movie_genre_ibfk_1` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `movie_genre_ibfk_2` FOREIGN KEY (`genre_id`) REFERENCES `genre` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `movie_genre` */

insert  into `movie_genre`(`movie_id`,`genre_id`) values (1,1),(2,1),(4,1),(6,1);

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `surname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_type` enum('USER','ADMIN') NOT NULL,
  `pic_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

/*Data for the table `user` */

insert  into `user`(`id`,`name`,`surname`,`email`,`password`,`created_date`,`user_type`,`pic_url`) values (6,'Minas','Avetisyan','m@mail.ru','$2a$10$DWMRSZhscs/EC10O6Zi74Oo1IfGFGOUfzlLumKlYqV0NAGEwwekG.','2018-02-25 12:13:41','USER','1519550021701_profile-pic.jpg'),(7,'Artash','Haroyan','art.aro@mail.ru','$2a$10$hOYktJ967G3voaLuCuu.C.DzPXXyEpV6Ue/fPJXlhNQmDXUiDAcs6','2018-02-26 15:26:47','ADMIN','1519648000009_26113787_330025047479047_2972921443318359356_n.jpg');

/*Table structure for table `wish` */

DROP TABLE IF EXISTS `wish`;

CREATE TABLE `wish` (
  `user_id` int(11) NOT NULL,
  `movie_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`movie_id`),
  KEY `movie_id` (`movie_id`),
  CONSTRAINT `wish_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `wish_ibfk_2` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `wish` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
