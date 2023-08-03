-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.1.52-community


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema examportaldb
--

CREATE DATABASE IF NOT EXISTS examportaldb;
USE examportaldb;

--
-- Definition of table `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories` (
  `cat_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`cat_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` (`cat_id`,`description`,`title`) VALUES 
 (1,'Java Programming - Mcq\'s, Output Based questions.','Java Programming'),
 (2,'Test designed to determine a person\'s ability in a particular skill or field of knowledge.','Aptitude'),
 (3,'Python programming basic mcsq.','Python Programming');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;


--
-- Definition of table `questions`
--

DROP TABLE IF EXISTS `questions`;
CREATE TABLE `questions` (
  `ques_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `answer` varchar(255) DEFAULT NULL,
  `question` longtext,
  `image` varchar(255) DEFAULT NULL,
  `option1` varchar(255) DEFAULT NULL,
  `option2` varchar(255) DEFAULT NULL,
  `option3` varchar(255) DEFAULT NULL,
  `option4` varchar(255) DEFAULT NULL,
  `quiz_quiz_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ques_id`),
  KEY `FK6vkbvy5b7cqsbtccf6n77ljhw` (`quiz_quiz_id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `questions`
--

/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
INSERT INTO `questions` (`ques_id`,`answer`,`question`,`image`,`option1`,`option2`,`option3`,`option4`,`quiz_quiz_id`) VALUES 
 (1,'option2','Automatic type conversion is possible in which of the possible cases?\n','','Byte to int','Int to long','Long to int','Short to int',1),
 (2,'option4','\n\nFind the output of the following code.\n\nint Integer = 24;\nchar String  = ‘I’;\nSystem.out.print(Integer);\nSystem.out.print(String);','','Compile Error','Throws Exception','I','24 I',1),
 (3,'option2','Which configuration file is used to configure Hibernate settings?','','web.xml ','hibernate.cfg.xml ','persistence.xml ','application.properties ',2),
 (4,'option2','Which annotation is used to specify the primary key in a Hibernate entity class?','','@PrimaryKey','@Id ','@GeneratedValue ','@Key ',2),
 (5,'option4','What is the purpose of Hibernate\'s HQL (Hibernate Query Language)?','','To define database schemas ','To create Java objects from database tables','To perform database CRUD operations ','It allows developers to write database queries using entity and property names ',2),
 (6,'option4','What is the purpose of Hibernate\'s Dialect class? ','','To define database schemas ','To create database connections ','To handle database transactions ','To provide database-specific SQL dialects ',2),
 (10,'option2','Automatic type conversion is possible in which of the possible cases?','','Byte to int','int to long','Long to int','short to int',4),
 (9,'option3','Number of primitive data types in Java are?','','6','7','8','9',4);
/*!40000 ALTER TABLE `questions` ENABLE KEYS */;


--
-- Definition of table `quiz_results`
--

DROP TABLE IF EXISTS `quiz_results`;
CREATE TABLE `quiz_results` (
  `quiz_res_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `attempt_datetime` varchar(255) DEFAULT NULL,
  `total_obtained_marks` float DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `quiz_quiz_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`quiz_res_id`),
  KEY `FKa8n68igflai1ha9249uvpbcyx` (`quiz_quiz_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `quiz_results`
--

/*!40000 ALTER TABLE `quiz_results` DISABLE KEYS */;
INSERT INTO `quiz_results` (`quiz_res_id`,`attempt_datetime`,`total_obtained_marks`,`user_id`,`quiz_quiz_id`) VALUES 
 (1,'2023-07-30 16:28:56',10,2,1),
 (2,'2023-07-31 17:38:30',20,7,2),
 (3,'2023-07-31 18:06:28',5,7,4);
/*!40000 ALTER TABLE `quiz_results` ENABLE KEYS */;


--
-- Definition of table `quizzes`
--

DROP TABLE IF EXISTS `quizzes`;
CREATE TABLE `quizzes` (
  `quiz_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `description` longtext,
  `is_active` bit(1) DEFAULT NULL,
  `num_of_questions` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `category_cat_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`quiz_id`),
  KEY `FKi0mytbs01dvkmvgqsuamy2692` (`category_cat_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `quizzes`
--

/*!40000 ALTER TABLE `quizzes` DISABLE KEYS */;
INSERT INTO `quizzes` (`quiz_id`,`description`,`is_active`,`num_of_questions`,`title`,`category_cat_id`) VALUES 
 (1,'Java Basics & OOPS  ',0x00,2,'Java Fundamentals - Test1',1),
 (2,'An open-source object-relational mapping (ORM) framework for Java. ',0x00,4,'Hibernate',1),
 (4,'Java quiz based on basics, OOPS',0x00,0,'Java Fundamentals - Test2',1);
/*!40000 ALTER TABLE `quizzes` ENABLE KEYS */;


--
-- Definition of table `roles`
--

DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `role_name` varchar(255) NOT NULL,
  `role_description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`role_name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `roles`
--

/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` (`role_name`,`role_description`) VALUES 
 ('USER','Default Role provided to each user'),
 ('ADMIN','Superuser, who has access for all functionality');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;


--
-- Definition of table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role` (
  `user_id` bigint(20) NOT NULL,
  `role_id` varchar(255) NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `FKt7e7djp752sqn6w22i6ocqy6q` (`role_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_role`
--

/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
INSERT INTO `user_role` (`user_id`,`role_id`) VALUES 
 (2,'USER'),
 (6,'ADMIN'),
 (7,'USER');
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;


--
-- Definition of table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) DEFAULT NULL,
  `is_active` bit(1) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `UK_r43af9ap4edm43mmtq01oddj6` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`user_id`,`first_name`,`is_active`,`last_name`,`password`,`phone_number`,`username`) VALUES 
 (1,'Rajesh',0x00,'Choudhary','$2a$10$GRKLGmn7Tu6qRr6DOWyr0Ow12oqK0j23dIZACMQS6p6.TATXR0ICK','9910178466','admin@gmail.com'),
 (2,'Roopam',0x01,'Mishra','$2a$10$GRKLGmn7Tu6qRr6DOWyr0Ow12oqK0j23dIZACMQS6p6.TATXR0ICK','8962418051','roopam@gmail.com'),
 (7,'Radhika',0x01,'Mallikati','$2a$10$T4J1QuZwYQ6xiCF8KDn9r.Cim2CgioS4cQaMsDWeO0CTnbV0JjWxG','9805646593','radhika@gmail.com'),
 (6,'Rajesh',0x01,'Kumar','$2a$10$LUoaQ6k46I7Acn.Dt31Xqe6ACQjjoQp01e3R3/k1UFKDa4AUYx8ka','9910178466','rajesh@gmail.com');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
