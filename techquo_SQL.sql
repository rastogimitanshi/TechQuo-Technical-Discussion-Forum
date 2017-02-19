CREATE DATABASE  IF NOT EXISTS `techquo` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `techquo`;
-- MySQL dump 10.13  Distrib 5.7.9, for Win64 (x86_64)
--
-- Host: localhost    Database: techquo
-- ------------------------------------------------------
-- Server version	5.7.12-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `answer`
--

DROP TABLE IF EXISTS `answer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `answer` (
  `Ans_id` int(11) NOT NULL AUTO_INCREMENT,
  `Ques_id_A` int(11) NOT NULL,
  `Answer` varchar(1000) DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_id_A` int(10) unsigned NOT NULL,
  `upvotes` int(10) unsigned DEFAULT NULL,
  `downvotes` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`Ans_id`),
  KEY `Ques_id_A` (`Ques_id_A`),
  KEY `user_id_A` (`user_id_A`),
  CONSTRAINT `Ques_id_A` FOREIGN KEY (`Ques_id_A`) REFERENCES `question` (`Ques_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `user_id_A` FOREIGN KEY (`user_id_A`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=444 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `answer`
--

LOCK TABLES `answer` WRITE;
/*!40000 ALTER TABLE `answer` DISABLE KEYS */;
INSERT INTO `answer` VALUES (122,2,'Since','2017-02-10 17:12:41',123,5,1),(443,2,'Because','2017-02-10 16:42:24',123,4,5);
/*!40000 ALTER TABLE `answer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `education_user`
--

DROP TABLE IF EXISTS `education_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `education_user` (
  `user_id_E` int(10) unsigned NOT NULL,
  `Education` varchar(100) NOT NULL,
  PRIMARY KEY (`Education`),
  KEY `user_id_E` (`user_id_E`),
  CONSTRAINT `user_id_E` FOREIGN KEY (`user_id_E`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `education_user`
--

LOCK TABLES `education_user` WRITE;
/*!40000 ALTER TABLE `education_user` DISABLE KEYS */;
INSERT INTO `education_user` VALUES (123,'Mtech'),(123,'phd scholar');
/*!40000 ALTER TABLE `education_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `interests_user`
--

DROP TABLE IF EXISTS `interests_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `interests_user` (
  `user_id_I` int(10) unsigned NOT NULL,
  `Interests` varchar(100) NOT NULL,
  PRIMARY KEY (`user_id_I`,`Interests`),
  CONSTRAINT `user_id_I` FOREIGN KEY (`user_id_I`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `interests_user`
--

LOCK TABLES `interests_user` WRITE;
/*!40000 ALTER TABLE `interests_user` DISABLE KEYS */;
INSERT INTO `interests_user` VALUES (123,'Dancing'),(123,'Default'),(123,'val');
/*!40000 ALTER TABLE `interests_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question`
--

DROP TABLE IF EXISTS `question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `question` (
  `Ques_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned DEFAULT NULL,
  `Question` varchar(500) DEFAULT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `count` int(11) DEFAULT NULL,
  PRIMARY KEY (`Ques_id`),
  KEY `user_id_idx` (`user_id`),
  CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1156 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question`
--

LOCK TABLES `question` WRITE;
/*!40000 ALTER TABLE `question` DISABLE KEYS */;
INSERT INTO `question` VALUES (1,123,'What?','2017-02-05 17:22:34',1),(2,123,'WHy?','2017-02-05 17:22:34',2),(3,123,'When','2017-02-05 17:22:34',2),(4,123,'How','2017-02-05 17:22:34',1),(7,123,'So?','2017-02-05 17:22:34',1),(9,123,'Work?','2017-02-05 17:22:34',NULL),(1155,123,'WHo?','2017-02-05 17:22:34',NULL);
/*!40000 ALTER TABLE `question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tags` (
  `Ques_id` int(11) NOT NULL,
  `tag` varchar(45) NOT NULL,
  PRIMARY KEY (`Ques_id`,`tag`),
  CONSTRAINT `Ques_id` FOREIGN KEY (`Ques_id`) REFERENCES `question` (`Ques_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
INSERT INTO `tags` VALUES (1,'jsp'),(2,'css'),(2,'jsp'),(3,'html'),(4,'jsp'),(7,'html'),(9,'jsp'),(1155,'java');
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `user_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Fname` varchar(40) DEFAULT NULL,
  `Lname` varchar(45) DEFAULT NULL,
  `Q1` int(10) unsigned NOT NULL,
  `A1` varchar(45) NOT NULL,
  `Q2` int(10) unsigned NOT NULL,
  `A2` varchar(45) NOT NULL,
  `Role` varchar(45) DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Email` varchar(50) NOT NULL,
  `Password` varchar(45) NOT NULL,
  `DOB` date DEFAULT NULL,
  `url` varchar(60) DEFAULT NULL,
  `expiry` date DEFAULT NULL,
  `activity` tinyint(1) DEFAULT '0',
  `Registered` tinyint(1) DEFAULT '0',
  `Country` varchar(45) DEFAULT NULL,
  `City` varchar(45) DEFAULT NULL,
  `Profile_Picture` longblob,
  `Profile_views` int(10) unsigned NOT NULL DEFAULT '0',
  `JobPosition` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12345 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (123,'Default','Default',1,'abc',2,'xzy',NULL,'2017-02-19 05:57:21','Default@gmail.com','tabloid','1995-10-12',NULL,NULL,0,0,'Default','','',7,'Default'),(12344,'mita','r',1,'orange',3,'ice','User','2017-02-19 09:47:09','abc@yahoo.com','12345678',NULL,NULL,NULL,0,0,NULL,NULL,NULL,0,NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-02-19 15:26:28
