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
  `upvotes` int(10) unsigned DEFAULT '0',
  `downvotes` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`Ans_id`),
  KEY `Ques_id_A` (`Ques_id_A`),
  KEY `user_id_A` (`user_id_A`),
  CONSTRAINT `Ques_id_A` FOREIGN KEY (`Ques_id_A`) REFERENCES `question` (`Ques_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `user_id_A` FOREIGN KEY (`user_id_A`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=455 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `answer`
--

LOCK TABLES `answer` WRITE;
/*!40000 ALTER TABLE `answer` DISABLE KEYS */;
INSERT INTO `answer` VALUES (122,2,'Since','2017-03-31 17:12:17',123,13,1),(443,2,'Because','2017-02-10 16:42:24',123,4,5),(444,2,'  bla','2017-03-08 14:23:15',123,NULL,NULL),(445,2,'  okayy','2017-03-17 13:16:14',12350,NULL,NULL),(446,2,'welll...','2017-03-17 13:18:02',12350,NULL,NULL),(447,2,'  Work Is Work','2017-03-18 12:54:09',12350,NULL,NULL),(448,4,'  This is a default answer. I hope you find it useful','2017-03-19 10:21:25',12350,NULL,NULL),(449,1157,'  Use jsp:include. Read Documentation for further details.','2017-03-20 07:05:24',12350,NULL,NULL),(450,1160,'  ans about something','2017-03-22 13:28:26',12350,NULL,NULL),(451,1160,'  dummy test answer                  ','2017-03-25 16:14:04',12350,NULL,NULL),(452,1,'                    Dummy answer for testing','2017-03-25 18:45:52',12350,NULL,NULL),(453,1162,'                    Django is convenient and fast enough','2017-03-27 14:24:22',12350,NULL,NULL),(454,1162,'                    Ruby on rails is a better choice!','2017-03-27 14:24:54',12350,NULL,NULL);
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
INSERT INTO `education_user` VALUES (123,'Defa'),(123,'Mtech'),(123,'phd scholar'),(12350,''),(12350,'val2'),(12350,'valc');
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
  PRIMARY KEY (`Interests`,`user_id_I`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `interests_user`
--

LOCK TABLES `interests_user` WRITE;
/*!40000 ALTER TABLE `interests_user` DISABLE KEYS */;
INSERT INTO `interests_user` VALUES (12350,''),(12350,'val'),(12350,'val2'),(12350,'vald');
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
  `count` int(11) DEFAULT '0',
  PRIMARY KEY (`Ques_id`),
  KEY `user_id_idx` (`user_id`),
  CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1164 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question`
--

LOCK TABLES `question` WRITE;
/*!40000 ALTER TABLE `question` DISABLE KEYS */;
INSERT INTO `question` VALUES (1,123,'What?','2017-02-05 17:22:34',13),(2,123,'WHy?','2017-02-05 17:22:34',30),(3,123,'When','2017-02-05 17:22:34',3),(4,123,'How','2017-02-05 17:22:34',4),(7,123,'So?','2017-02-05 17:22:34',4),(9,123,'Work?','2017-02-05 17:22:34',1),(1155,123,'WHo?','2017-02-05 17:22:34',1),(1156,12350,'How to include servlet in a jsp ?','2017-03-20 06:42:44',0),(1157,12350,'  What is the default session time in a servlet?','2017-03-20 06:50:30',1),(1158,12350,'Are scriptlets a good practice to use?','2017-03-20 07:07:42',1),(1159,12350,'  Question about html and css','2017-03-20 07:10:29',0),(1160,12350,'  dummy question about html and css','2017-03-20 07:13:24',8),(1161,12350,'  Dummy question to test fucntionality','2017-03-25 10:23:17',4),(1162,12350,'Which framework is best for web development?                  ','2017-03-25 18:50:33',22),(1163,NULL,NULL,'2017-03-25 18:54:39',0);
/*!40000 ALTER TABLE `question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tagmasterlist`
--

DROP TABLE IF EXISTS `tagmasterlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tagmasterlist` (
  `tagid` int(11) NOT NULL,
  `tag` varchar(45) NOT NULL,
  PRIMARY KEY (`tagid`,`tag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tagmasterlist`
--

LOCK TABLES `tagmasterlist` WRITE;
/*!40000 ALTER TABLE `tagmasterlist` DISABLE KEYS */;
/*!40000 ALTER TABLE `tagmasterlist` ENABLE KEYS */;
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
INSERT INTO `tags` VALUES (1,'jsp'),(2,'css'),(2,'jsp'),(3,'html'),(4,'jsp'),(7,'html'),(9,'jsp'),(1155,'java'),(1160,'css'),(1160,'html'),(1161,'html'),(1161,'servlet'),(1162,'framework'),(1162,'web');
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
  `Flag` varchar(50) DEFAULT 'Activate',
  `Registered` tinyint(1) DEFAULT '0',
  `Country` varchar(45) DEFAULT NULL,
  `City` varchar(45) DEFAULT NULL,
  `Profile_Picture` longblob,
  `Profile_views` int(10) unsigned NOT NULL DEFAULT '0',
  `JobPosition` varchar(45) DEFAULT NULL,
  `QuestionsPosted` int(10) unsigned DEFAULT '0',
  `AnswersAnswered` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12353 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (123,'Default','Default',1,'abc',2,'xzy','User','2017-04-01 07:59:01','Default@gmail.com','tabloid','1995-10-12',NULL,NULL,'Activate',0,'Default','','',51,'Default',0,0),(12350,'Mitanshi','Rastogi',1,'Red',4,'Staring Cat','User','2017-04-01 08:06:43','mitanshi1995.mr@gmail.com','qwert','0016-05-17',NULL,NULL,'Activate',0,'India','Delhi','',38,'Student',2,4),(12351,'abc','def',1,'gef',4,'fre','User','2017-04-01 07:54:13','mitanshi_1995@gmail.com','qwerty',NULL,NULL,NULL,'Activate',0,NULL,NULL,NULL,0,NULL,0,0),(12352,'Dummy','User',1,'Orange',4,'Bad ppl','Admin','2017-04-01 07:45:37','mitanshi_1995@yahoo.com','asdfgh',NULL,NULL,NULL,'Activate',0,NULL,NULL,NULL,0,NULL,0,0);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_ans_likes`
--

DROP TABLE IF EXISTS `user_ans_likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_ans_likes` (
  `user_id` int(11) NOT NULL,
  `ans_id` varchar(45) NOT NULL,
  PRIMARY KEY (`user_id`,`ans_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_ans_likes`
--

LOCK TABLES `user_ans_likes` WRITE;
/*!40000 ALTER TABLE `user_ans_likes` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_ans_likes` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-04-01 13:42:44
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
  `upvotes` int(10) unsigned DEFAULT '0',
  `downvotes` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`Ans_id`),
  KEY `Ques_id_A` (`Ques_id_A`),
  KEY `user_id_A` (`user_id_A`),
  CONSTRAINT `Ques_id_A` FOREIGN KEY (`Ques_id_A`) REFERENCES `question` (`Ques_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `user_id_A` FOREIGN KEY (`user_id_A`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=455 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `answer`
--

LOCK TABLES `answer` WRITE;
/*!40000 ALTER TABLE `answer` DISABLE KEYS */;
INSERT INTO `answer` VALUES (122,2,'Since','2017-03-31 17:12:17',123,13,1),(443,2,'Because','2017-02-10 16:42:24',123,4,5),(444,2,'  bla','2017-03-08 14:23:15',123,NULL,NULL),(445,2,'  okayy','2017-03-17 13:16:14',12350,NULL,NULL),(446,2,'welll...','2017-03-17 13:18:02',12350,NULL,NULL),(447,2,'  Work Is Work','2017-03-18 12:54:09',12350,NULL,NULL),(448,4,'  This is a default answer. I hope you find it useful','2017-03-19 10:21:25',12350,NULL,NULL),(449,1157,'  Use jsp:include. Read Documentation for further details.','2017-03-20 07:05:24',12350,NULL,NULL),(450,1160,'  ans about something','2017-03-22 13:28:26',12350,NULL,NULL),(451,1160,'  dummy test answer                  ','2017-03-25 16:14:04',12350,NULL,NULL),(452,1,'                    Dummy answer for testing','2017-03-25 18:45:52',12350,NULL,NULL),(453,1162,'                    Django is convenient and fast enough','2017-03-27 14:24:22',12350,NULL,NULL),(454,1162,'                    Ruby on rails is a better choice!','2017-03-27 14:24:54',12350,NULL,NULL);
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
INSERT INTO `education_user` VALUES (123,'Defa'),(123,'Mtech'),(123,'phd scholar'),(12350,''),(12350,'val2'),(12350,'valc');
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
  PRIMARY KEY (`Interests`,`user_id_I`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `interests_user`
--

LOCK TABLES `interests_user` WRITE;
/*!40000 ALTER TABLE `interests_user` DISABLE KEYS */;
INSERT INTO `interests_user` VALUES (12350,''),(12350,'val'),(12350,'val2'),(12350,'vald');
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
  `count` int(11) DEFAULT '0',
  PRIMARY KEY (`Ques_id`),
  KEY `user_id_idx` (`user_id`),
  CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1164 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question`
--

LOCK TABLES `question` WRITE;
/*!40000 ALTER TABLE `question` DISABLE KEYS */;
INSERT INTO `question` VALUES (1,123,'What?','2017-02-05 17:22:34',13),(2,123,'WHy?','2017-02-05 17:22:34',30),(3,123,'When','2017-02-05 17:22:34',3),(4,123,'How','2017-02-05 17:22:34',4),(7,123,'So?','2017-02-05 17:22:34',4),(9,123,'Work?','2017-02-05 17:22:34',1),(1155,123,'WHo?','2017-02-05 17:22:34',1),(1156,12350,'How to include servlet in a jsp ?','2017-03-20 06:42:44',0),(1157,12350,'  What is the default session time in a servlet?','2017-03-20 06:50:30',1),(1158,12350,'Are scriptlets a good practice to use?','2017-03-20 07:07:42',1),(1159,12350,'  Question about html and css','2017-03-20 07:10:29',0),(1160,12350,'  dummy question about html and css','2017-03-20 07:13:24',8),(1161,12350,'  Dummy question to test fucntionality','2017-03-25 10:23:17',4),(1162,12350,'Which framework is best for web development?                  ','2017-03-25 18:50:33',22),(1163,NULL,NULL,'2017-03-25 18:54:39',0);
/*!40000 ALTER TABLE `question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tagmasterlist`
--

DROP TABLE IF EXISTS `tagmasterlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tagmasterlist` (
  `tagid` int(11) NOT NULL,
  `tag` varchar(45) NOT NULL,
  PRIMARY KEY (`tagid`,`tag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tagmasterlist`
--

LOCK TABLES `tagmasterlist` WRITE;
/*!40000 ALTER TABLE `tagmasterlist` DISABLE KEYS */;
/*!40000 ALTER TABLE `tagmasterlist` ENABLE KEYS */;
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
INSERT INTO `tags` VALUES (1,'jsp'),(2,'css'),(2,'jsp'),(3,'html'),(4,'jsp'),(7,'html'),(9,'jsp'),(1155,'java'),(1160,'css'),(1160,'html'),(1161,'html'),(1161,'servlet'),(1162,'framework'),(1162,'web');
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
  `Flag` varchar(50) DEFAULT 'Activate',
  `Registered` tinyint(1) DEFAULT '0',
  `Country` varchar(45) DEFAULT NULL,
  `City` varchar(45) DEFAULT NULL,
  `Profile_Picture` longblob,
  `Profile_views` int(10) unsigned NOT NULL DEFAULT '0',
  `JobPosition` varchar(45) DEFAULT NULL,
  `QuestionsPosted` int(10) unsigned DEFAULT '0',
  `AnswersAnswered` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12353 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (123,'Default','Default',1,'abc',2,'xzy','User','2017-04-01 07:59:01','Default@gmail.com','tabloid','1995-10-12',NULL,NULL,'Activate',0,'Default','','',51,'Default',0,0),(12350,'Mitanshi','Rastogi',1,'Red',4,'Staring Cat','User','2017-04-01 08:06:43','mitanshi1995.mr@gmail.com','qwert','0016-05-17',NULL,NULL,'Activate',0,'India','Delhi','',38,'Student',2,4),(12351,'abc','def',1,'gef',4,'fre','User','2017-04-01 07:54:13','mitanshi_1995@gmail.com','qwerty',NULL,NULL,NULL,'Activate',0,NULL,NULL,NULL,0,NULL,0,0),(12352,'Dummy','User',1,'Orange',4,'Bad ppl','Admin','2017-04-01 07:45:37','mitanshi_1995@yahoo.com','asdfgh',NULL,NULL,NULL,'Activate',0,NULL,NULL,NULL,0,NULL,0,0);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_ans_likes`
--

DROP TABLE IF EXISTS `user_ans_likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_ans_likes` (
  `user_id` int(11) NOT NULL,
  `ans_id` varchar(45) NOT NULL,
  PRIMARY KEY (`user_id`,`ans_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_ans_likes`
--

LOCK TABLES `user_ans_likes` WRITE;
/*!40000 ALTER TABLE `user_ans_likes` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_ans_likes` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-04-01 13:42:44
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
  `upvotes` int(10) unsigned DEFAULT '0',
  `downvotes` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`Ans_id`),
  KEY `Ques_id_A` (`Ques_id_A`),
  KEY `user_id_A` (`user_id_A`),
  CONSTRAINT `Ques_id_A` FOREIGN KEY (`Ques_id_A`) REFERENCES `question` (`Ques_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `user_id_A` FOREIGN KEY (`user_id_A`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=455 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `answer`
--

LOCK TABLES `answer` WRITE;
/*!40000 ALTER TABLE `answer` DISABLE KEYS */;
INSERT INTO `answer` VALUES (122,2,'Since','2017-03-31 17:12:17',123,13,1),(443,2,'Because','2017-02-10 16:42:24',123,4,5),(444,2,'  bla','2017-03-08 14:23:15',123,NULL,NULL),(445,2,'  okayy','2017-03-17 13:16:14',12350,NULL,NULL),(446,2,'welll...','2017-03-17 13:18:02',12350,NULL,NULL),(447,2,'  Work Is Work','2017-03-18 12:54:09',12350,NULL,NULL),(448,4,'  This is a default answer. I hope you find it useful','2017-03-19 10:21:25',12350,NULL,NULL),(449,1157,'  Use jsp:include. Read Documentation for further details.','2017-03-20 07:05:24',12350,NULL,NULL),(450,1160,'  ans about something','2017-03-22 13:28:26',12350,NULL,NULL),(451,1160,'  dummy test answer                  ','2017-03-25 16:14:04',12350,NULL,NULL),(452,1,'                    Dummy answer for testing','2017-03-25 18:45:52',12350,NULL,NULL),(453,1162,'                    Django is convenient and fast enough','2017-03-27 14:24:22',12350,NULL,NULL),(454,1162,'                    Ruby on rails is a better choice!','2017-03-27 14:24:54',12350,NULL,NULL);
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
INSERT INTO `education_user` VALUES (123,'Defa'),(123,'Mtech'),(123,'phd scholar'),(12350,''),(12350,'val2'),(12350,'valc');
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
  PRIMARY KEY (`Interests`,`user_id_I`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `interests_user`
--

LOCK TABLES `interests_user` WRITE;
/*!40000 ALTER TABLE `interests_user` DISABLE KEYS */;
INSERT INTO `interests_user` VALUES (12350,''),(12350,'val'),(12350,'val2'),(12350,'vald');
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
  `count` int(11) DEFAULT '0',
  PRIMARY KEY (`Ques_id`),
  KEY `user_id_idx` (`user_id`),
  CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1164 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question`
--

LOCK TABLES `question` WRITE;
/*!40000 ALTER TABLE `question` DISABLE KEYS */;
INSERT INTO `question` VALUES (1,123,'What?','2017-02-05 17:22:34',13),(2,123,'WHy?','2017-02-05 17:22:34',30),(3,123,'When','2017-02-05 17:22:34',3),(4,123,'How','2017-02-05 17:22:34',4),(7,123,'So?','2017-02-05 17:22:34',4),(9,123,'Work?','2017-02-05 17:22:34',1),(1155,123,'WHo?','2017-02-05 17:22:34',1),(1156,12350,'How to include servlet in a jsp ?','2017-03-20 06:42:44',0),(1157,12350,'  What is the default session time in a servlet?','2017-03-20 06:50:30',1),(1158,12350,'Are scriptlets a good practice to use?','2017-03-20 07:07:42',1),(1159,12350,'  Question about html and css','2017-03-20 07:10:29',0),(1160,12350,'  dummy question about html and css','2017-03-20 07:13:24',8),(1161,12350,'  Dummy question to test fucntionality','2017-03-25 10:23:17',4),(1162,12350,'Which framework is best for web development?                  ','2017-03-25 18:50:33',22),(1163,NULL,NULL,'2017-03-25 18:54:39',0);
/*!40000 ALTER TABLE `question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tagmasterlist`
--

DROP TABLE IF EXISTS `tagmasterlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tagmasterlist` (
  `tagid` int(11) NOT NULL,
  `tag` varchar(45) NOT NULL,
  PRIMARY KEY (`tagid`,`tag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tagmasterlist`
--

LOCK TABLES `tagmasterlist` WRITE;
/*!40000 ALTER TABLE `tagmasterlist` DISABLE KEYS */;
/*!40000 ALTER TABLE `tagmasterlist` ENABLE KEYS */;
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
INSERT INTO `tags` VALUES (1,'jsp'),(2,'css'),(2,'jsp'),(3,'html'),(4,'jsp'),(7,'html'),(9,'jsp'),(1155,'java'),(1160,'css'),(1160,'html'),(1161,'html'),(1161,'servlet'),(1162,'framework'),(1162,'web');
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
  `Flag` varchar(50) DEFAULT 'Activate',
  `Registered` tinyint(1) DEFAULT '0',
  `Country` varchar(45) DEFAULT NULL,
  `City` varchar(45) DEFAULT NULL,
  `Profile_Picture` longblob,
  `Profile_views` int(10) unsigned NOT NULL DEFAULT '0',
  `JobPosition` varchar(45) DEFAULT NULL,
  `QuestionsPosted` int(10) unsigned DEFAULT '0',
  `AnswersAnswered` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12353 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (123,'Default','Default',1,'abc',2,'xzy','User','2017-04-01 07:59:01','Default@gmail.com','tabloid','1995-10-12',NULL,NULL,'Activate',0,'Default','','',51,'Default',0,0),(12350,'Mitanshi','Rastogi',1,'Red',4,'Staring Cat','User','2017-04-01 08:06:43','mitanshi1995.mr@gmail.com','qwert','0016-05-17',NULL,NULL,'Activate',0,'India','Delhi','',38,'Student',2,4),(12351,'abc','def',1,'gef',4,'fre','User','2017-04-01 07:54:13','mitanshi_1995@gmail.com','qwerty',NULL,NULL,NULL,'Activate',0,NULL,NULL,NULL,0,NULL,0,0),(12352,'Dummy','User',1,'Orange',4,'Bad ppl','Admin','2017-04-01 07:45:37','mitanshi_1995@yahoo.com','asdfgh',NULL,NULL,NULL,'Activate',0,NULL,NULL,NULL,0,NULL,0,0);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_ans_likes`
--

DROP TABLE IF EXISTS `user_ans_likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_ans_likes` (
  `user_id` int(11) NOT NULL,
  `ans_id` varchar(45) NOT NULL,
  PRIMARY KEY (`user_id`,`ans_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_ans_likes`
--

LOCK TABLES `user_ans_likes` WRITE;
/*!40000 ALTER TABLE `user_ans_likes` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_ans_likes` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-04-01 13:42:44
