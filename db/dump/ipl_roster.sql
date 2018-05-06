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
-- Table structure for table `roster`
--

DROP TABLE IF EXISTS `roster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roster` (
  `matchID` int(11) NOT NULL AUTO_INCREMENT,
  `team1` varchar(5) NOT NULL,
  `team2` varchar(5) NOT NULL,
  `matchDate` date NOT NULL,
  `matchTime` time(4) DEFAULT '20:00:00.0000',
  `matchDecision` varchar(45) DEFAULT 'Yet to start',
  `bidStatus` varchar(45) DEFAULT 'Yet to be opened',
  `matchPool` int(11) DEFAULT '0',
  PRIMARY KEY (`matchID`),
  KEY `team1_fk_idx` (`team1`,`team2`),
  KEY `team1_key_idx` (`team1`),
  KEY `team2_key_idx` (`team2`),
  KEY `matchDecisions_key_idx` (`matchDecision`),
  KEY `bidStatuses_key_idx` (`bidStatus`),
  CONSTRAINT `team1_key` FOREIGN KEY (`team1`) REFERENCES `teams` (`teamid`) ON UPDATE CASCADE,
  CONSTRAINT `team2_key` FOREIGN KEY (`team2`) REFERENCES `teams` (`teamid`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roster`
--

LOCK TABLES `roster` WRITE;
/*!40000 ALTER TABLE `roster` DISABLE KEYS */;
INSERT INTO `roster` VALUES (1,'MI','CSK','2007-04-18','20:00:00.0000','2','Closed',85),(2,'DD','KXIP','2008-04-18','16:00:00.0000','2','Closed',45),(3,'RCB','KKR','2008-04-18','20:00:00.0000','2','Closed',75),(4,'SRH','RR','2009-04-18','20:00:00.0000','1','Closed',60),(5,'CSK','KKR','2010-04-18','20:00:00.0000','1','Closed',185),(6,'RR','DD','2011-04-18','20:00:00.0000','1','Closed',215),(7,'SRH','MI','2012-04-18','20:00:00.0000','1','Closed',360),(8,'RCB','KXIP','2013-04-18','20:00:00.0000','1','Closed',375),(9,'MI','DD','2014-04-18','16:00:00.0000','2','Closed',320),(10,'KKR','SRH','2014-04-18','20:00:00.0000','2','Closed',320),(11,'RCB','RR','2015-04-18','16:00:00.0000','2','Closed',180),(12,'KXIP','CSK','2015-04-18','20:00:00.0000','1','Closed',305),(13,'KKR','DD','2016-04-18','20:00:00.0000','1','Closed',380),(14,'MI','RCB','2017-04-18','20:00:00.0000','1','Closed',330),(15,'RR','KKR','2018-04-18','20:00:00.0000','2','Closed',450),(16,'KXIP','SRH','2019-04-18','20:00:00.0000','1','Closed',310),(17,'CSK','RR','2020-04-18','20:00:00.0000','1','Closed',400),(18,'KKR','KXIP','2021-04-18','16:00:00.0000','2','Closed',225),(19,'RCB','DD','2021-04-18','20:00:00.0000','1','Closed',335),(20,'SRH','CSK','2022-04-18','16:00:00.0000','2','Closed',265),(21,'RR','MI','2022-04-18','20:00:00.0000','1','Closed',420),(22,'DD','KXIP','2023-04-18','20:00:00.0000','2','Closed',460),(23,'MI','SRH','2024-04-18','20:00:00.0000','2','Closed',390),(24,'RCB','CSK','2025-04-18','20:00:00.0000','2','Closed',415),(25,'SRH','KXIP','2026-04-18','20:00:00.0000','1','Closed',340),(26,'DD','KKR','2027-04-18','20:00:00.0000','1','Closed',205),(27,'CSK','MI','2028-04-18','20:00:00.0000','2','Closed',269),(28,'SRH','RR','2029-04-18','16:00:00.0000','1','Closed',210),(29,'RCB','KKR','2029-04-18','20:00:00.0000','2','Closed',270),(30,'CSK','DD','2030-04-18','20:00:00.0000','1','Closed',225),(31,'RCB','MI','2001-05-18','20:00:00.0000','1','Closed',255),(32,'DD','RR','2002-05-18','20:00:00.0000','1','Closed',255),(33,'KKR','CSK','2003-05-18','20:00:00.0000','1','Closed',210),(34,'KXIP','MI','2004-05-18','20:00:00.0000','2','Closed',301),(35,'CSK','RCB','2018-05-05','16:00:00.0000','1','Closed',210),(36,'SRH','DD','2018-05-05','20:00:00.0000','1','Closed',330),(37,'MI','KKR','2018-05-06','16:00:00.0000','Yet to start','Yet to be opened',0),(38,'KXIP','RR','2018-05-06','20:00:00.0000','Yet to start','Yet to be opened',0),(39,'SRH','RCB','2018-05-07','20:00:00.0000','Yet to start','Yet to be opened',0),(40,'RR','KXIP','2018-05-08','20:00:00.0000','Yet to start','Yet to be opened',0),(41,'KKR','MI','2018-05-09','20:00:00.0000','Yet to start','Yet to be opened',0),(42,'DD','SRH','2018-05-10','20:00:00.0000','Yet to start','Yet to be opened',0),(43,'RR','CSK','2018-05-11','20:00:00.0000','Yet to start','Yet to be opened',0);
/*!40000 ALTER TABLE `roster` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `roster_AFTER_UPDATE` AFTER UPDATE ON `roster` FOR EACH ROW BEGIN


if new.bidStatus='Closed' then begin
set @winningPool = (select sum(bidAmount) from bids where matchID = new.matchID and predictedResult=new.matchDecision);
set @pool = new.matchPool;
update bids set winningAmount=0 where matchID=new.matchID;
update bids set winningAmount=FLOOR(bidAmount/@winningPool*@pool) where matchID=new.matchID and predictedResult=new.matchDecision;
end;
end if;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-05-06 10:55:59
