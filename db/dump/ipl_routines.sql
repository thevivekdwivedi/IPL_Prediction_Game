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
-- Temporary view structure for view `spread`
--

DROP TABLE IF EXISTS `spread`;
/*!50001 DROP VIEW IF EXISTS `spread`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `spread` AS SELECT 
 1 AS `matchID`,
 1 AS `Result1`,
 1 AS `Result2`,
 1 AS `Result3`,
 1 AS `Result4`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `leaderboard`
--

DROP TABLE IF EXISTS `leaderboard`;
/*!50001 DROP VIEW IF EXISTS `leaderboard`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `leaderboard` AS SELECT 
 1 AS `first_name`,
 1 AS `total_bid_amount`,
 1 AS `total_winning_amount`,
 1 AS `net_profit_loss`,
 1 AS `efficiency`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `bidaudit`
--

DROP TABLE IF EXISTS `bidaudit`;
/*!50001 DROP VIEW IF EXISTS `bidaudit`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `bidaudit` AS SELECT 
 1 AS `BidID`,
 1 AS `MatchID`,
 1 AS `Team1`,
 1 AS `Team2`,
 1 AS `FirstName`,
 1 AS `BidTeamNumber`,
 1 AS `BidValue`,
 1 AS `MatchResult`,
 1 AS `winningAmount`,
 1 AS `matchPool`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `spread`
--

/*!50001 DROP VIEW IF EXISTS `spread`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `spread` AS select `b1`.`matchID` AS `matchID`,(select sum(`b2`.`bidAmount`) from `bids` `b2` where ((`b2`.`matchID` = `b1`.`matchID`) and (`b2`.`predictedResult` = '1'))) AS `Result1`,(select sum(`b3`.`bidAmount`) from `bids` `b3` where ((`b3`.`matchID` = `b1`.`matchID`) and (`b3`.`predictedResult` = '2'))) AS `Result2`,(select sum(`b3`.`bidAmount`) from `bids` `b3` where ((`b3`.`matchID` = `b1`.`matchID`) and (`b3`.`predictedResult` = 'Tie'))) AS `Result3`,(select sum(`b4`.`bidAmount`) from `bids` `b4` where ((`b4`.`matchID` = `b1`.`matchID`) and (`b4`.`predictedResult` = 'Abandon'))) AS `Result4` from `bids` `b1` group by `b1`.`matchID` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `leaderboard`
--

/*!50001 DROP VIEW IF EXISTS `leaderboard`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `leaderboard` AS select `u`.`firstName` AS `first_name`,sum(`b`.`bidAmount`) AS `total_bid_amount`,sum(`b`.`winningAmount`) AS `total_winning_amount`,(sum(`b`.`winningAmount`) - sum(`b`.`bidAmount`)) AS `net_profit_loss`,(((sum(`b`.`winningAmount`) - sum(`b`.`bidAmount`)) / sum(`b`.`bidAmount`)) * 100) AS `efficiency` from (`users` `u` join `bids` `b`) where (`u`.`userID` = `b`.`userID`) group by `u`.`userID` order by `efficiency` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `bidaudit`
--

/*!50001 DROP VIEW IF EXISTS `bidaudit`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `bidaudit` AS select `b`.`bidID` AS `BidID`,`r`.`matchID` AS `MatchID`,`r`.`team1` AS `Team1`,`r`.`team2` AS `Team2`,`u`.`firstName` AS `FirstName`,`b`.`predictedResult` AS `BidTeamNumber`,`b`.`bidAmount` AS `BidValue`,`r`.`matchDecision` AS `MatchResult`,`b`.`winningAmount` AS `winningAmount`,`r`.`matchPool` AS `matchPool` from ((`bids` `b` join `roster` `r`) join `users` `u`) where ((`b`.`matchID` = `r`.`matchID`) and (`b`.`userID` = `u`.`userID`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Dumping events for database 'ipl'
--

--
-- Dumping routines for database 'ipl'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-05-03 22:37:00
