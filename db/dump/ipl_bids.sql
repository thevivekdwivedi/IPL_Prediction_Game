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
-- Table structure for table `bids`
--

DROP TABLE IF EXISTS `bids`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bids` (
  `bidID` int(11) NOT NULL,
  `matchID` int(11) NOT NULL,
  `userID` varchar(45) NOT NULL,
  `predictedResult` enum('1','2','Tie','Abandon') DEFAULT NULL,
  `bidAmount` int(11) DEFAULT NULL,
  `revisedBid` tinyint(1) NOT NULL DEFAULT '0',
  `timestamp` timestamp(4) NULL DEFAULT CURRENT_TIMESTAMP(4),
  `winningAmount` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`bidID`),
  KEY `bid_userID_fk_idx` (`userID`),
  KEY `bid_matchID_fk_idx` (`matchID`),
  CONSTRAINT `bid_matchID_fk` FOREIGN KEY (`matchID`) REFERENCES `roster` (`matchid`),
  CONSTRAINT `bid_userID_fk` FOREIGN KEY (`userID`) REFERENCES `users` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bids`
--

LOCK TABLES `bids` WRITE;
/*!40000 ALTER TABLE `bids` DISABLE KEYS */;
INSERT INTO `bids` VALUES (1,1,'chinnadurai.v','2',5,0,'2018-05-01 16:31:11.9553',17),(2,1,'gaurav.rathi','2',5,0,'2018-05-01 16:31:12.0152',17),(3,1,'naveen.kumar','1',25,0,'2018-05-01 16:31:12.0188',0),(4,1,'saket.agrahari','1',20,0,'2018-05-01 16:31:12.0218',0),(5,1,'avneesh.sharma','2',5,0,'2018-05-01 16:31:12.0251',17),(6,1,'shashiraj.itagi','1',10,0,'2018-05-01 16:31:12.0282',0),(7,1,'sunny','2',5,0,'2018-05-01 16:31:12.0309',17),(8,1,'snigdhaman.chaterjee','2',5,0,'2018-05-01 16:31:12.0339',17),(9,1,'thevivekdwivedi','1',5,0,'2018-05-01 16:31:12.0372',0),(10,2,'saket.agrahari','1',5,0,'2018-05-01 16:31:12.0401',0),(11,2,'shashiraj.itagi','2',10,0,'2018-05-01 16:31:12.0430',18),(12,2,'snigdhaman.chaterjee','1',5,0,'2018-05-01 16:31:12.0459',0),(13,2,'chinnadurai.v','1',5,0,'2018-05-01 16:31:12.0541',0),(14,2,'gaurav.rathi','2',10,0,'2018-05-01 16:31:12.0575',18),(15,2,'avneesh.sharma','2',5,0,'2018-05-01 16:31:12.0606',9),(16,2,'thevivekdwivedi','1',5,0,'2018-05-01 16:31:12.0637',0),(17,3,'gaurav.rathi','1',25,0,'2018-05-01 16:31:12.0667',0),(18,3,'thevivekdwivedi','1',5,0,'2018-05-01 16:31:12.0702',0),(19,3,'snigdhaman.chaterjee','1',5,0,'2018-05-01 16:31:12.0756',0),(20,3,'avneesh.sharma','1',5,0,'2018-05-01 16:31:12.0788',0),(21,3,'saket.agrahari','2',5,0,'2018-05-01 16:31:12.0817',75),(22,3,'chinnadurai.v','1',5,0,'2018-05-01 16:31:12.0849',0),(23,3,'naveen.kumar','1',25,0,'2018-05-01 16:31:12.0878',0),(24,4,'gaurav.rathi','1',10,0,'2018-05-01 16:31:12.0908',13),(25,4,'avneesh.sharma','1',10,0,'2018-05-01 16:31:12.0941',13),(26,4,'thevivekdwivedi','2',5,0,'2018-05-01 16:31:12.0972',0),(27,4,'snigdhaman.chaterjee','2',5,0,'2018-05-01 16:31:12.1001',0),(28,4,'shashiraj.itagi','1',10,0,'2018-05-01 16:31:12.1031',13),(29,4,'chinnadurai.v','2',5,0,'2018-05-01 16:31:12.1060',0),(30,4,'sunny','1',5,0,'2018-05-01 16:31:12.1088',7),(31,4,'ranjan.jha','1',10,0,'2018-05-01 16:31:12.1118',13),(32,5,'snigdhaman.chaterjee','1',5,0,'2018-05-01 16:31:12.1146',11),(33,5,'naveen.kumar','1',25,0,'2018-05-01 16:31:12.1174',54),(34,5,'avneesh.sharma','1',10,0,'2018-05-01 16:31:12.1201',22),(35,5,'kiran.kulkarni','1',20,0,'2018-05-01 16:31:12.1231',44),(36,5,'rahul.srivatsa','1',5,0,'2018-05-01 16:31:12.1259',11),(37,5,'chinnadurai.v','1',5,0,'2018-05-01 16:31:12.1287',11),(38,5,'gaurav.rathi','1',5,0,'2018-05-01 16:31:12.1315',11),(39,5,'shashiraj.itagi','1',5,0,'2018-05-01 16:31:12.1343',11),(40,5,'sunny','1',5,0,'2018-05-01 16:31:12.1372',11),(41,5,'ranjan.jha','2',10,0,'2018-05-01 16:31:12.1399',0),(42,5,'thevivekdwivedi','2',5,0,'2018-05-01 16:31:12.1428',0),(43,5,'abhishek.chaturvedi','2',50,0,'2018-05-01 16:31:12.1455',0),(44,5,'saket.agrahari','2',30,0,'2018-05-01 16:31:12.1599',0),(45,5,'sunil.gornale','2',5,0,'2018-05-01 16:31:12.1645',0),(46,6,'avneesh.sharma','2',20,0,'2018-05-01 16:31:12.1676',0),(47,6,'snigdhaman.chaterjee','2',5,0,'2018-05-01 16:31:12.1713',0),(48,6,'gaurav.rathi','2',25,0,'2018-05-01 16:31:12.1748',0),(49,6,'saket.agrahari','2',20,0,'2018-05-01 16:31:12.1778',0),(50,6,'naveen.kumar','2',25,0,'2018-05-01 16:31:12.1809',0),(51,6,'ranjith','2',10,0,'2018-05-01 16:31:12.1837',0),(52,6,'arjun.swami','2',10,0,'2018-05-01 16:31:12.1865',0),(53,6,'shashiraj.itagi','2',20,0,'2018-05-01 16:31:12.1894',0),(54,6,'kiran.kulkarni','2',10,0,'2018-05-01 16:31:12.1922',0),(55,6,'rahul.srivatsa','1',5,0,'2018-05-01 16:31:12.1951',15),(56,6,'abhishek.chaturvedi','1',50,0,'2018-05-01 16:31:12.1978',154),(57,6,'thevivekdwivedi','1',5,0,'2018-05-01 16:31:12.2006',15),(58,6,'chinnadurai.v','1',5,0,'2018-05-01 16:31:12.2035',15),(59,6,'sunil.gornale','1',5,0,'2018-05-01 16:31:12.2063',15),(60,7,'gaurav.rathi','1',20,0,'2018-05-01 16:31:12.2092',38),(61,7,'thevivekdwivedi','1',5,0,'2018-05-01 16:31:12.2120',9),(62,7,'naveen.kumar','1',50,0,'2018-05-01 16:31:12.2149',95),(63,7,'abhishek.chaturvedi','1',50,0,'2018-05-01 16:31:12.2178',95),(64,7,'gurudayal.khosla','1',50,0,'2018-05-01 16:31:12.2204',95),(65,7,'rahul.srivatsa','1',5,0,'2018-05-01 16:31:12.2234',9),(66,7,'snigdhaman.chaterjee','1',5,0,'2018-05-01 16:31:12.2263',9),(67,7,'kiran.kulkarni','1',5,0,'2018-05-01 16:31:12.2290',9),(68,7,'chinnadurai.v','2',5,0,'2018-05-01 16:31:12.2318',0),(69,7,'ranjith','2',10,0,'2018-05-01 16:31:12.2346',0),(70,7,'arjun.swami','2',20,0,'2018-05-01 16:31:12.2380',0),(71,7,'saket.agrahari','2',50,0,'2018-05-01 16:31:12.2410',0),(72,7,'sunil.gornale','2',10,0,'2018-05-01 16:31:12.2439',0),(73,7,'mayank.kamboj','2',25,0,'2018-05-01 16:31:12.2466',0),(74,7,'avneesh.sharma','2',50,0,'2018-05-01 16:31:12.2627',0),(75,8,'abhishek.chaturvedi','2',50,0,'2018-05-01 16:31:12.2696',0),(76,8,'arjun.swami','2',15,0,'2018-05-01 16:31:12.2739',0),(77,8,'gaurav.rathi','2',50,0,'2018-05-01 16:31:12.2770',0),(78,8,'saket.agrahari','2',40,0,'2018-05-01 16:31:12.2799',0),(79,8,'chinnadurai.v','2',5,0,'2018-05-01 16:31:12.2830',0),(80,8,'gurudayal.khosla','2',10,0,'2018-05-01 16:31:12.2861',0),(81,8,'kiran.kulkarni','1',20,0,'2018-05-01 16:31:12.2891',37),(82,8,'rahul.srivatsa','1',5,0,'2018-05-01 16:31:12.2921',9),(83,8,'ranjan.jha','1',10,0,'2018-05-01 16:31:12.2951',18),(84,8,'thevivekdwivedi','1',5,0,'2018-05-01 16:31:12.2982',9),(85,8,'naveen.kumar','1',50,0,'2018-05-01 16:31:12.3012',91),(86,8,'ranjith','1',10,0,'2018-05-01 16:31:12.3044',18),(87,8,'snigdhaman.chaterjee','1',5,0,'2018-05-01 16:31:12.3075',9),(88,8,'sunil.gornale','1',50,0,'2018-05-01 16:31:12.3108',91),(89,8,'shashiraj.itagi','1',50,0,'2018-05-01 16:31:12.3139',91),(90,9,'saket.agrahari','1',50,0,'2018-05-01 16:31:12.3169',0),(91,9,'rahul.srivatsa','2',5,0,'2018-05-01 16:31:12.3199',29),(92,9,'shashiraj.itagi','1',20,0,'2018-05-01 16:31:12.3230',0),(93,9,'abhishek.chaturvedi','2',50,0,'2018-05-01 16:31:12.3269',291),(94,9,'gaurav.rathi','1',20,0,'2018-05-01 16:31:12.3311',0),(95,9,'sunil.gornale','1',50,0,'2018-05-01 16:31:12.3353',0),(96,9,'santhosh.krishnamurthy','1',20,0,'2018-05-01 16:31:12.3393',0),(97,9,'mayank.kamboj','1',25,0,'2018-05-01 16:31:12.3429',0),(98,9,'naveen.kumar','1',30,0,'2018-05-01 16:31:12.3471',0),(99,9,'gaurav.rathi','1',20,0,'2018-05-01 16:31:12.3509',0),(100,9,'avneesh.sharma','1',25,0,'2018-05-01 16:31:12.3548',0),(101,9,'snigdhaman.chaterjee','1',5,0,'2018-05-01 16:31:12.3587',0),(102,10,'rahul.srivatsa','1',5,0,'2018-05-01 16:31:12.3628',0),(103,10,'saket.agrahari','1',50,0,'2018-05-01 16:31:12.3667',0),(104,10,'abhishek.chaturvedi','Abandon',5,0,'2018-05-01 16:31:12.3708',0),(105,10,'naveen.kumar','2',30,0,'2018-05-01 16:31:12.3749',87),(106,10,'gaurav.rathi','1',40,0,'2018-05-01 16:31:12.3786',0),(107,10,'avneesh.sharma','2',40,0,'2018-05-01 16:31:12.3825',116),(108,10,'snigdhaman.chaterjee','1',5,0,'2018-05-01 16:31:12.3863',0),(109,10,'ranjith','1',10,0,'2018-05-01 16:31:12.3901',0),(110,10,'shashiraj.itagi','1',40,0,'2018-05-01 16:31:12.3940',0),(111,10,'kiran.kulkarni','1',50,0,'2018-05-01 16:31:12.4180',0),(112,10,'arjun.swami','2',40,0,'2018-05-01 16:31:12.4225',116),(113,10,'chinnadurai.v','1',5,0,'2018-05-01 16:31:12.4262',0),(114,11,'gaurav.rathi','1',50,0,'2018-05-01 16:31:12.4295',0),(115,11,'saket.agrahari','1',50,0,'2018-05-01 16:31:12.4324',0),(116,11,'abhishek.chaturvedi','Tie',5,0,'2018-05-01 16:31:12.4356',0),(117,11,'ranjith','1',10,0,'2018-05-01 16:31:12.4395',0),(118,11,'santhosh.krishnamurthy','1',10,0,'2018-05-01 16:31:12.4425',0),(119,11,'snigdhaman.chaterjee','1',5,0,'2018-05-01 16:31:12.4456',0),(120,11,'sunil.gornale','1',50,0,'2018-05-01 16:31:12.4530',0),(121,12,'saket.agrahari','2',50,0,'2018-05-01 16:31:12.4573',0),(122,12,'abhishek.chaturvedi','1',50,0,'2018-05-01 16:31:12.4603',203),(123,12,'snigdhaman.chaterjee','2',5,0,'2018-05-01 16:31:12.4635',0),(124,12,'sunil.gornale','2',50,0,'2018-05-01 16:31:12.4666',0),(125,12,'ranjith','2',10,0,'2018-05-01 16:31:12.4698',0),(126,12,'shashiraj.itagi','2',50,0,'2018-05-01 16:31:12.4731',0),(127,12,'avneesh.sharma','1',25,0,'2018-05-01 16:31:12.4760',102),(128,12,'santhosh.krishnamurthy','2',10,0,'2018-05-01 16:31:12.4789',0),(129,12,'chinnadurai.v','2',5,0,'2018-05-01 16:31:12.4821',0),(130,12,'naveen.kumar','2',30,0,'2018-05-01 16:31:12.4852',0),(131,12,'gaurav.rathi','2',20,0,'2018-05-01 16:31:12.4883',0),(132,13,'abhishek.chaturvedi','2',50,0,'2018-05-01 16:31:12.4911',0),(133,13,'saket.agrahari','1',50,0,'2018-05-01 16:31:12.4943',88),(134,13,'naveen.kumar','1',50,0,'2018-05-01 16:31:12.4973',88),(135,13,'snigdhaman.chaterjee','2',5,0,'2018-05-01 16:31:12.5003',0),(136,13,'avneesh.sharma','1',25,0,'2018-05-01 16:31:12.5031',44),(137,13,'kiran.kulkarni','1',5,0,'2018-05-01 16:31:12.5059',9),(138,13,'ashutosh.tiwari','2',50,0,'2018-05-01 16:31:12.5086',0),(139,13,'ranjith','2',10,0,'2018-05-01 16:31:12.5114',0),(140,13,'rahul.srivatsa','1',5,0,'2018-05-01 16:31:12.5142',9),(141,13,'gaurav.rathi','2',50,0,'2018-05-01 16:31:12.5170',0),(142,13,'gurudayal.khosla','1',5,0,'2018-05-01 16:31:12.5200',9),(143,13,'santhosh.krishnamurthy','1',10,0,'2018-05-01 16:31:12.5227',18),(144,13,'ranjan.jha','1',10,0,'2018-05-01 16:31:12.5258',18),(145,13,'chinnadurai.v','1',5,0,'2018-05-01 16:31:12.5286',9),(146,13,'shashiraj.itagi','1',50,0,'2018-05-01 16:31:12.5312',88),(147,14,'naveen.kumar','2',40,0,'2018-05-01 16:31:12.5341',0),(148,14,'saket.agrahari','1',40,0,'2018-05-01 16:31:12.5369',83),(149,14,'gurudayal.khosla','1',10,0,'2018-05-01 16:31:12.5397',21),(150,14,'abhishek.chaturvedi','1',50,0,'2018-05-01 16:31:12.5424',103),(151,14,'avneesh.sharma','1',10,0,'2018-05-01 16:31:12.5452',21),(152,14,'snigdhaman.chaterjee','2',5,0,'2018-05-01 16:31:12.5617',0),(153,14,'chinnadurai.v','2',5,0,'2018-05-01 16:31:12.5676',0),(154,14,'ashutosh.tiwari','2',50,0,'2018-05-01 16:31:12.5715',0),(155,14,'ranjith','2',10,0,'2018-05-01 16:31:12.5746',0),(156,14,'santhosh.krishnamurthy','2',5,0,'2018-05-01 16:31:12.5779',0),(157,14,'rahul.srivatsa','2',5,0,'2018-05-01 16:31:12.5808',0),(158,14,'sunil.gornale','2',20,0,'2018-05-01 16:31:12.5838',0),(159,14,'arjun.swami','1',10,0,'2018-05-01 16:31:12.5867',21),(160,14,'gaurav.rathi','1',40,0,'2018-05-01 16:31:12.5899',83),(161,14,'shashiraj.itagi','2',30,0,'2018-05-01 16:31:12.5931',0),(162,15,'snigdhaman.chaterjee','1',5,0,'2018-05-01 16:31:12.5961',0),(163,15,'abhishek.chaturvedi','1',50,0,'2018-05-01 16:31:12.5991',0),(164,15,'rahul.srivatsa','1',5,0,'2018-05-01 16:31:12.6023',0),(165,15,'gurudayal.khosla','2',20,0,'2018-05-01 16:31:12.6055',36),(166,15,'ashutosh.tiwari','2',50,0,'2018-05-01 16:31:12.6088',90),(167,15,'saket.agrahari','2',50,0,'2018-05-01 16:31:12.6120',90),(168,15,'naveen.kumar','2',50,0,'2018-05-01 16:31:12.6151',90),(169,15,'ranjith','2',20,0,'2018-05-01 16:31:12.6184',36),(170,15,'avneesh.sharma','1',50,0,'2018-05-01 16:31:12.6216',0),(171,15,'ranjan.jha','2',5,0,'2018-05-01 16:31:12.6247',9),(172,15,'prasad.karni','1',10,0,'2018-05-01 16:31:12.6275',0),(173,15,'chinnadurai.v','1',5,0,'2018-05-01 16:31:12.6303',0),(174,15,'sunil.gornale','1',30,0,'2018-05-01 16:31:12.6334',0),(175,15,'mayank.kamboj','2',25,0,'2018-05-01 16:31:12.6365',45),(176,15,'gaurav.rathi','1',30,0,'2018-05-01 16:31:12.6395',0),(177,15,'shashiraj.itagi','2',30,0,'2018-05-01 16:31:12.6425',54),(178,15,'thevivekdwivedi','1',5,0,'2018-05-01 16:31:12.6456',0),(179,15,'arjun.swami','1',10,0,'2018-05-01 16:31:12.6601',0),(180,16,'snigdhaman.chaterjee','1',5,0,'2018-05-01 16:31:12.6648',9),(181,16,'kiran.kulkarni','1',5,0,'2018-05-01 16:31:12.6678',9),(182,16,'rahul.srivatsa','1',5,0,'2018-05-01 16:31:12.6716',9),(183,16,'chinnadurai.v','2',20,0,'2018-05-01 16:31:12.6746',0),(184,16,'santhosh.krishnamurthy','2',5,0,'2018-05-01 16:31:12.6777',0),(185,16,'gurudayal.khosla','1',10,0,'2018-05-01 16:31:12.6805',18),(186,16,'ashutosh.tiwari','1',50,0,'2018-05-01 16:31:12.6834',89),(187,16,'mayank.kamboj','1',30,0,'2018-05-01 16:31:12.6865',53),(188,16,'gaurav.rathi','2',40,0,'2018-05-01 16:31:12.6895',0),(189,16,'avneesh.sharma','1',10,0,'2018-05-01 16:31:12.6924',18),(190,16,'saket.agrahari','2',40,0,'2018-05-01 16:31:12.6954',0),(191,16,'prasad.karni','2',10,0,'2018-05-01 16:31:12.6987',0),(192,16,'abhishek.chaturvedi','1',50,0,'2018-05-01 16:31:12.7016',89),(193,16,'sunil.gornale','2',20,0,'2018-05-01 16:31:12.7045',0),(194,16,'ranjith','1',10,0,'2018-05-01 16:31:12.7074',18),(195,17,'naveen.kumar','1',50,0,'2018-05-01 16:31:12.7104',91),(196,17,'gaurav.rathi','1',50,0,'2018-05-01 16:31:12.7133',91),(197,17,'saket.agrahari','1',40,0,'2018-05-01 16:31:12.7164',73),(198,17,'ashutosh.tiwari','2',50,0,'2018-05-01 16:31:12.7194',0),(199,17,'mayank.kamboj','1',30,0,'2018-05-01 16:31:12.7222',55),(200,17,'abhishek.chaturvedi','2',50,0,'2018-05-01 16:31:12.7253',0),(201,17,'avneesh.sharma','2',50,0,'2018-05-01 16:31:12.7284',0),(202,17,'gurudayal.khosla','2',25,0,'2018-05-01 16:31:12.7315',0),(203,17,'chinnadurai.v','1',10,0,'2018-05-01 16:31:12.7347',18),(204,17,'sunil.gornale','1',10,0,'2018-05-01 16:31:12.7391',18),(205,17,'ranjith','1',10,0,'2018-05-01 16:31:12.7425',18),(206,17,'kiran.kulkarni','2',5,0,'2018-05-01 16:31:12.7455',0),(207,17,'santhosh.krishnamurthy','1',5,0,'2018-05-01 16:31:12.7589',9),(208,17,'rahul.srivatsa','1',5,0,'2018-05-01 16:31:12.7648',9),(209,17,'snigdhaman.chaterjee','1',5,0,'2018-05-01 16:31:12.7679',9),(210,17,'arjun.swami','1',5,0,'2018-05-01 16:31:12.7718',9),(211,18,'naveen.kumar','1',40,0,'2018-05-01 16:31:12.7748',0),(212,18,'gaurav.rathi','1',30,0,'2018-05-01 16:31:12.7779',0),(213,18,'rahul.srivatsa','2',5,0,'2018-05-01 16:31:12.7809',32),(214,18,'chinnadurai.v','2',10,0,'2018-05-01 16:31:12.7842',64),(215,18,'avneesh.sharma','1',50,0,'2018-05-01 16:31:12.7872',0),(216,18,'sunil.gornale','1',10,0,'2018-05-01 16:31:12.7902',0),(217,18,'snigdhaman.chaterjee','2',5,0,'2018-05-01 16:31:12.7937',32),(218,18,'ranjith','1',10,0,'2018-05-01 16:31:12.7966',0),(219,18,'saket.agrahari','1',50,0,'2018-05-01 16:31:12.7997',0),(220,18,'kiran.kulkarni','2',10,0,'2018-05-01 16:31:12.8026',64),(221,18,'arjun.swami','2',5,0,'2018-05-01 16:31:12.8056',32),(222,19,'shashiraj.itagi','1',50,0,'2018-05-01 16:31:12.8086',63),(223,19,'santhosh.krishnamurthy','1',5,0,'2018-05-01 16:31:12.8117',6),(224,19,'arjun.swami','1',5,0,'2018-05-01 16:31:12.8146',6),(225,19,'snigdhaman.chaterjee','1',5,0,'2018-05-01 16:31:12.8175',6),(226,19,'kiran.kulkarni','2',20,0,'2018-05-01 16:31:12.8204',0),(227,19,'saket.agrahari','1',20,0,'2018-05-01 16:31:12.8233',25),(228,19,'ranjith','1',10,0,'2018-05-01 16:31:12.8264',13),(229,19,'sunil.gornale','1',30,0,'2018-05-01 16:31:12.8292',38),(230,19,'avneesh.sharma','2',50,0,'2018-05-01 16:31:12.8322',0),(231,19,'chinnadurai.v','1',10,0,'2018-05-01 16:31:12.8350',13),(232,19,'gaurav.rathi','1',40,0,'2018-05-01 16:31:12.8380',51),(233,19,'naveen.kumar','1',40,0,'2018-05-01 16:31:12.8408',51),(234,19,'abhishek.chaturvedi','1',50,0,'2018-05-01 16:31:12.8438',63),(235,20,'ashutosh.tiwari','2',50,0,'2018-05-01 16:31:12.8569',53),(236,20,'avneesh.sharma','2',25,0,'2018-05-01 16:31:12.8607',27),(237,20,'chinnadurai.v','1',10,0,'2018-05-01 16:31:12.8641',0),(238,20,'gaurav.rathi','2',30,0,'2018-05-01 16:31:12.8671',32),(239,20,'gurudayal.khosla','2',10,0,'2018-05-01 16:31:12.8702',11),(240,20,'kiran.kulkarni','1',5,0,'2018-05-01 16:31:12.8736',0),(241,20,'mayank.kamboj','2',30,0,'2018-05-01 16:31:12.8765',32),(242,20,'rahul.srivatsa','2',5,0,'2018-05-01 16:31:12.8797',5),(243,20,'ranjith','2',20,0,'2018-05-01 16:31:12.8827',21),(244,20,'santhosh.krishnamurthy','2',5,0,'2018-05-01 16:31:12.8860',5),(245,20,'shashiraj.itagi','2',50,0,'2018-05-01 16:31:12.8891',53),(246,20,'snigdhaman.chaterjee','2',5,0,'2018-05-01 16:31:12.8924',5),(247,20,'sunil.gornale','2',20,0,'2018-05-01 16:31:12.8952',21),(248,21,'abhishek.chaturvedi','1',50,0,'2018-05-01 16:31:12.8979',200),(249,21,'arjun.swami','2',5,0,'2018-05-01 16:31:12.9009',0),(250,21,'ashutosh.tiwari','2',50,0,'2018-05-01 16:31:12.9039',0),(251,21,'avneesh.sharma','1',20,0,'2018-05-01 16:31:12.9071',80),(252,21,'chinnadurai.v','2',10,0,'2018-05-01 16:31:12.9103',0),(253,21,'gaurav.rathi','2',50,0,'2018-05-01 16:31:12.9132',0),(254,21,'kiran.kulkarni','1',5,0,'2018-05-01 16:31:12.9163',20),(255,21,'mayank.kamboj','2',35,0,'2018-05-01 16:31:12.9194',0),(256,21,'naveen.kumar','1',30,0,'2018-05-01 16:31:12.9224',120),(257,21,'rahul.srivatsa','2',5,0,'2018-05-01 16:31:12.9253',0),(258,21,'ranjith','2',25,0,'2018-05-01 16:31:12.9286',0),(259,21,'saket.agrahari','2',50,0,'2018-05-01 16:31:12.9315',0),(260,21,'shashiraj.itagi','2',50,0,'2018-05-01 16:31:12.9346',0),(261,21,'snigdhaman.chaterjee','2',5,0,'2018-05-01 16:31:12.9374',0),(262,21,'sunil.gornale','2',30,0,'2018-05-01 16:31:12.9419',0),(263,22,'saket.agrahari','2',50,0,'2018-05-01 16:31:12.9448',70),(264,22,'sunny','1',5,0,'2018-05-01 16:31:12.9585',0),(265,22,'abhishek.chaturvedi','1',50,0,'2018-05-01 16:31:12.9642',0),(266,22,'avneesh.sharma','2',50,0,'2018-05-01 16:31:12.9675',70),(267,22,'ashutosh.tiwari','2',50,0,'2018-05-01 16:31:12.9709',70),(268,22,'gurudayal.khosla','1',50,0,'2018-05-01 16:31:12.9746',0),(269,22,'kiran.kulkarni','1',10,0,'2018-05-01 16:31:12.9778',0),(270,22,'shashiraj.itagi','2',50,0,'2018-05-01 16:31:12.9809',70),(271,22,'naveen.kumar','2',40,0,'2018-05-01 16:31:12.9841',56),(272,22,'mayank.kamboj','2',30,0,'2018-05-01 16:31:12.9870',42),(273,22,'ranjith','2',20,0,'2018-05-01 16:31:12.9902',28),(274,22,'prasad.karni','2',20,0,'2018-05-01 16:31:12.9932',28),(275,22,'rahul.srivatsa','2',5,0,'2018-05-01 16:31:12.9963',7),(276,22,'gaurav.rathi','1',15,0,'2018-05-01 16:31:12.9992',0),(277,22,'santhosh.krishnamurthy','2',5,0,'2018-05-01 16:31:13.0028',7),(278,22,'chinnadurai.v','2',5,0,'2018-05-01 16:31:13.0058',7),(279,22,'snigdhaman.chaterjee','2',5,0,'2018-05-01 16:31:13.0088',7),(280,23,'ashutosh.tiwari','1',50,0,'2018-05-01 16:31:13.0119',0),(281,23,'avneesh.sharma','2',50,0,'2018-05-01 16:31:13.0148',108),(282,23,'prasad.karni','2',50,0,'2018-05-01 16:31:13.0178',108),(283,23,'saket.agrahari','1',50,0,'2018-05-01 16:31:13.0208',0),(284,23,'shashiraj.itagi','1',50,0,'2018-05-01 16:31:13.0236',0),(285,23,'naveen.kumar','2',40,0,'2018-05-01 16:31:13.0268',87),(286,23,'gaurav.rathi','1',30,0,'2018-05-01 16:31:13.0296',0),(287,23,'kiran.kulkarni','2',20,0,'2018-05-01 16:31:13.0325',43),(288,23,'chinnadurai.v','2',10,0,'2018-05-01 16:31:13.0354',22),(289,23,'sunil.gornale','1',10,0,'2018-05-01 16:31:13.0383',0),(290,23,'abhishek.chaturvedi','Tie',5,0,'2018-05-01 16:31:13.0413',0),(291,23,'gurudayal.khosla','1',5,0,'2018-05-01 16:31:13.0443',0),(292,23,'rahul.srivatsa','1',5,0,'2018-05-01 16:31:13.0574',0),(293,23,'ranjan.jha','1',5,0,'2018-05-01 16:31:13.0608',0),(294,23,'santhosh.krishnamurthy','2',5,0,'2018-05-01 16:31:13.0643',11),(295,23,'snigdhaman.chaterjee','2',5,0,'2018-05-01 16:31:13.0672',11),(296,24,'mayank.kamboj','2',45,0,'2018-05-01 16:31:13.0700',197),(297,24,'gaurav.rathi','2',30,0,'2018-05-01 16:31:13.0732',131),(298,24,'chinnadurai.v','2',10,0,'2018-05-01 16:31:13.0765',44),(299,24,'sunny','2',5,0,'2018-05-01 16:31:13.0795',22),(300,24,'arjun.swami','2',5,0,'2018-05-01 16:31:13.0827',22),(301,24,'prasad.karni','Abandon',50,0,'2018-05-01 16:31:13.0858',0),(302,24,'abhishek.chaturvedi','1',50,0,'2018-05-01 16:31:13.0891',0),(303,24,'ashutosh.tiwari','1',50,0,'2018-05-01 16:31:13.0923',0),(304,24,'shashiraj.itagi','1',50,0,'2018-05-01 16:31:13.0954',0),(305,24,'saket.agrahari','1',30,0,'2018-05-01 16:31:13.0988',0),(306,24,'naveen.kumar','1',30,0,'2018-05-01 16:31:13.1021',0),(307,24,'avneesh.sharma','1',20,0,'2018-05-01 16:31:13.1053',0),(308,24,'ranjith','1',10,0,'2018-05-01 16:31:13.1085',0),(309,24,'sunil.gornale','1',10,0,'2018-05-01 16:31:13.1117',0),(310,24,'kiran.kulkarni','1',10,0,'2018-05-01 16:31:13.1150',0),(311,24,'rahul.srivatsa','1',5,0,'2018-05-01 16:31:13.1183',0),(312,24,'snigdhaman.chaterjee','1',5,0,'2018-05-01 16:31:13.1216',0),(313,25,'abhishek.chaturvedi','1',50,0,'2018-05-01 16:31:13.1247',142),(314,25,'prasad.karni','1',50,0,'2018-05-01 16:31:13.1281',142),(315,25,'saket.agrahari','2',50,0,'2018-05-01 16:31:13.1310',0),(316,25,'gaurav.rathi','2',30,0,'2018-05-01 16:31:13.1343',0),(317,25,'shashiraj.itagi','2',30,0,'2018-05-01 16:31:13.1373',0),(318,25,'naveen.kumar','2',30,0,'2018-05-01 16:31:13.1406',0),(319,25,'mayank.kamboj','2',25,0,'2018-05-01 16:31:13.1437',0),(320,25,'avneesh.sharma','2',20,0,'2018-05-01 16:31:13.1573',0),(321,25,'ranjith','1',20,0,'2018-05-01 16:31:13.1634',57),(322,25,'chinnadurai.v','2',10,0,'2018-05-01 16:31:13.1672',0),(323,25,'ranjan.jha','2',5,0,'2018-05-01 16:31:13.1712',0),(324,25,'snigdhaman.chaterjee','2',5,0,'2018-05-01 16:31:13.1751',0),(325,25,'rahul.srivatsa','2',5,0,'2018-05-01 16:31:13.1786',0),(326,25,'sunny','2',5,0,'2018-05-01 16:31:13.1816',0),(327,25,'kiran.kulkarni','2',5,0,'2018-05-01 16:31:13.1850',0),(328,26,'avneesh.sharma','1',50,0,'2018-05-01 16:31:13.1883',186),(329,26,'ashutosh.tiwari','2',50,0,'2018-05-01 16:31:13.1917',0),(330,26,'saket.agrahari','2',50,0,'2018-05-01 16:31:13.1948',0),(331,26,'prasad.karni','2',20,0,'2018-05-01 16:31:13.1979',0),(332,26,'chinnadurai.v','2',10,0,'2018-05-01 16:31:13.2012',0),(333,26,'gaurav.rathi','2',10,0,'2018-05-01 16:31:13.2049',0),(334,26,'rahul.srivatsa','2',5,0,'2018-05-01 16:31:13.2083',0),(335,26,'snigdhaman.chaterjee','2',5,0,'2018-05-01 16:31:13.2115',0),(336,26,'abhishek.chaturvedi','1',5,0,'2018-05-01 16:31:13.2150',19),(337,27,'gaurav.rathi','1',30,0,'2018-05-01 16:31:13.2184',0),(338,27,'naveen.kumar','1',50,0,'2018-05-01 16:31:13.2229',0),(339,27,'kiran.kulkarni','2',5,0,'2018-05-01 16:31:13.2266',11),(340,27,'abhishek.chaturvedi','2',50,0,'2018-05-01 16:31:13.2301',108),(341,27,'snigdhaman.chaterjee','1',10,0,'2018-05-01 16:31:13.2336',0),(342,27,'chinnadurai.v','1',10,0,'2018-05-01 16:31:13.2370',0),(343,27,'saket.agrahari','2',50,0,'2018-05-01 16:31:13.2406',108),(344,27,'rahul.srivatsa','1',5,0,'2018-05-01 16:31:13.2443',0),(345,27,'arjun.swami','1',5,0,'2018-05-01 16:31:13.2567',0),(346,27,'santhosh.krishnamurthy','1',5,0,'2018-05-01 16:31:13.2605',0),(347,27,'mayank.kamboj','1',29,0,'2018-05-01 16:31:13.2642',0),(348,27,'avneesh.sharma','2',20,0,'2018-05-01 16:31:13.2681',43),(349,28,'rahul.srivatsa','1',5,0,'2018-05-01 16:31:13.2723',19),(350,28,'kiran.kulkarni','2',5,0,'2018-05-01 16:31:13.2764',0),(351,28,'snigdhaman.chaterjee','1',5,0,'2018-05-01 16:31:13.2802',19),(352,28,'saket.agrahari','1',5,0,'2018-05-01 16:31:13.2836',19),(353,28,'ashutosh.tiwari','2',50,0,'2018-05-01 16:31:13.2869',0),(354,28,'naveen.kumar','1',40,0,'2018-05-01 16:31:13.2901',153),(355,28,'avneesh.sharma','2',50,0,'2018-05-01 16:31:13.2941',0),(356,28,'gaurav.rathi','2',50,1,'2018-05-01 16:31:13.2975',0),(357,29,'kiran.kulkarni','1',5,0,'2018-05-01 16:31:13.3007',0),(358,29,'snigdhaman.chaterjee','1',10,0,'2018-05-01 16:31:13.3038',0),(359,29,'abhishek.chaturvedi','2',50,1,'2018-05-01 16:31:13.3070',135),(360,29,'saket.agrahari','2',50,0,'2018-05-01 16:31:13.3103',135),(361,29,'ranjan.jha','1',5,0,'2018-05-01 16:31:13.3137',0),(362,29,'ashutosh.tiwari','1',50,0,'2018-05-01 16:31:13.3173',0),(363,29,'naveen.kumar','1',50,0,'2018-05-01 16:31:13.3208',0),(364,29,'avneesh.sharma','1',50,0,'2018-05-01 16:31:13.3241',0),(365,30,'abhishek.chaturvedi','2',50,1,'2018-05-01 16:31:13.3275',0),(366,30,'avneesh.sharma','1',50,0,'2018-05-01 16:31:13.3308',98),(367,30,'prasad.karni','1',50,0,'2018-05-01 16:31:13.3340',98),(368,30,'rahul.srivatsa','1',5,0,'2018-05-01 16:31:13.3371',10),(369,30,'gaurav.rathi','2',30,1,'2018-05-01 16:31:13.3404',0),(370,30,'shashiraj.itagi','2',30,0,'2018-05-01 16:31:13.3434',0),(371,30,'snigdhaman.chaterjee','1',5,0,'2018-05-01 16:31:13.3466',10),(372,30,'saket.agrahari','1',5,0,'2018-05-01 16:31:13.3589',10),(373,31,'gaurav.rathi','2',20,1,'2018-05-01 16:31:13.3634',0),(374,31,'ranjith','1',20,0,'2018-05-01 16:31:13.3667',0),(375,31,'snigdhaman.chaterjee','1',5,0,'2018-05-01 16:31:13.3701',0),(376,31,'prasad.karni','2',20,0,'2018-05-01 16:31:13.3739',0),(377,31,'chinnadurai.v','1',10,0,'2018-05-01 16:31:13.3772',0),(378,31,'saket.agrahari','2',25,1,'2018-05-01 16:31:13.3805',0),(379,31,'sunil.gornale','1',10,0,'2018-05-01 16:31:13.3840',0),(380,31,'rahul.srivatsa','2',5,0,'2018-05-01 16:31:13.3872',0),(381,31,'kiran.kulkarni','1',5,0,'2018-05-01 16:31:13.3906',0),(382,31,'avneesh.sharma','2',30,0,'2018-05-01 16:31:13.3938',0),(383,31,'abhishek.chaturvedi','2',50,0,'2018-05-01 16:31:13.3969',0),(384,31,'naveen.kumar','1',50,0,'2018-05-01 16:31:13.4001',0),(385,31,'santhosh.krishnamurthy','1',5,0,'2018-05-01 16:31:13.4033',0);
/*!40000 ALTER TABLE `bids` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-05-01 22:37:45
