CREATE DATABASE  IF NOT EXISTS `ipl` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */;
USE `ipl`;
-- MySQL dump 10.13  Distrib 5.7.17, for macos10.12 (x86_64)
--
-- Host: localhost    Database: ipl
-- ------------------------------------------------------
-- Server version	8.0.11

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
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `userID` varchar(45) NOT NULL,
  `firstName` varchar(45) NOT NULL,
  `lastName` varchar(45) DEFAULT NULL,
  `role` varchar(45) NOT NULL,
  `emailID` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`userID`),
  UNIQUE KEY `emailID_UNIQUE` (`emailID`),
  KEY `roles_fk_idx` (`role`),
  CONSTRAINT `roles_fk` FOREIGN KEY (`role`) REFERENCES `roles` (`rolenames`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('abhishek.chaturvedi','Abhishek','Chaturvedi','Player',NULL),('arjun.swami','Arjun','Swami','Player',NULL),('ashutosh.tiwari','Ashutosh','Tiwari','Player',NULL),('avneesh.sharma','Avneesh','Sharma','Player',NULL),('chinnadurai.v','Chinnadurai','V','Player',NULL),('gaurav.rathi','Gaurav','Rathi','Player',NULL),('gurudayal.khosla','Gurudayal','Khosla','Player',NULL),('kiran.kulkarni','Kiran','Kulkarni','Player',NULL),('mayank.kamboj','Mayank','Kamboj','Player',NULL),('naveen.kumar','Naveen','Kumar','Player',NULL),('prasad.karni','Prasad','Karni','Player',NULL),('rahul.srivatsa','Rahul','Srivatsa','Player',NULL),('ranjan.jha','Ranjan','Jha','Player',NULL),('ranjith','Ranjith',NULL,'Player',NULL),('saket.agrahari','Saket','Agrahari','Player',NULL),('santhosh.krishnamurthy','Santhosh','Krishnamurthy','Player',NULL),('shashiraj.itagi','Shashiraj','Itagi','Player',NULL),('snigdhaman.chaterjee','Snigdhaman','Chaterjee','Player',NULL),('sunil.gornale','Sunil','Gornale','Player',NULL),('sunny','Sunny',NULL,'Player',NULL),('thevivekdwivedi','Vivek','Dwivedi','Admin','thevivekdwivedi@gmail.com');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-05-01 22:37:43
