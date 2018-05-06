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
-- Table structure for table `userCreds`
--

DROP TABLE IF EXISTS `userCreds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userCreds` (
  `userID` varchar(45) NOT NULL,
  `password` varchar(128) NOT NULL,
  `apiKey` varchar(128) NOT NULL,
  PRIMARY KEY (`userID`),
  UNIQUE KEY `apiKey_UNIQUE` (`apiKey`),
  CONSTRAINT `userID_fk` FOREIGN KEY (`userID`) REFERENCES `users` (`userid`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userCreds`
--

LOCK TABLES `userCreds` WRITE;
/*!40000 ALTER TABLE `userCreds` DISABLE KEYS */;
INSERT INTO `userCreds` VALUES ('abhishek.chaturvedi','12345678','U2FsdGVkX19scWp3tRM1VEJSmfYGZA9NB1/3uiLFjZ/n5TARgumPu4SPYgdMAro7'),('arjun.swami','12345678','U2FsdGVkX1+nAOfIWNwwTXOFjdnscNDHPzrlnIJJ/lF7GF0DkaLneABQWTFhyOGk'),('ashutosh.tiwari','12345678','U2FsdGVkX19uy5lUt6n6nDjS4oF0BalDSQC1xOWtE8I9Ew2Wu+HH4loMuPLp7y65'),('avneesh.sharma','12345678','U2FsdGVkX182kyWOZxAbztYfsZnFcuKbtE1593cGx/U0SWWEhghMBRcd9UQdOLXM'),('chinnadurai.v','12345678','U2FsdGVkX19C7d8SaE9GxnsB1O9e5Co0OOJeATFH/Ik9mGuyI77vuZjYU9CB+GM/'),('gaurav.rathi','12345678','U2FsdGVkX19s8cR0mHCQCfD2t2iCEAu4ELGKSlUQlHav0BOC184GIeEeLVaOvMdX'),('gurudayal.khosla','12345678','U2FsdGVkX1+VcUnyLbzHCrcgwrSkOyeceqWKLFishclibSFVfycn2xcpPsEbquYD'),('kiran.kulkarni','12345678','U2FsdGVkX1+rxBuRZ1+ZgaXJwLS8Ti3Nqor5Z88zefZBWo3tZBKwyySJh+yWAJQX'),('mayank.kamboj','12345678','U2FsdGVkX1+l+voUY/Nu+0H3taxDz4LM/7aHqkeGwHaPKF8F4c8fn31oWwljdezM'),('naveen.kumar','12345678','U2FsdGVkX1+gGs5k0pVMlnTr53lc/LHEPzMoWvqzBVXnaq1ZUQDen0SB5S925AGn'),('prasad.karni','12345678','U2FsdGVkX19QVSNiaB2qB6aX4dye4SkJYAu9FmcC8KsJVoh14WpRFRyrJUlvmsMb'),('rahul.srivatsa','12345678','U2FsdGVkX186YTqXYFqKgncfprpr8NXCgx3lPaouadLcopEc7hS2O+Z+Cp/TsuyK'),('ranjan.jha','12345678','U2FsdGVkX19XgeduXCgHYOF0YK3w/XVR9YVgv+2AnymilejijQ3GADDFNqrk58On'),('ranjith','12345678','U2FsdGVkX1+fI3k0UA+yjHCWYp31anArrdBtMbDX7vTRVtEs3CMjtsIb+vxx7hji'),('saket.agrahari','12345678','U2FsdGVkX1/VB4pMbRQbPrvIsH3YUnnVibyoJMnsf71x2E90uAh04W4bKrQAbhdV'),('santhosh.krishnamurthy','12345678','U2FsdGVkX1+1A+BQNVIoPNGI/4QFS7IKWKmmPEmRkf7HJduFJsarWSpqhWMATpPpwoyHI65b5TVQoonEQbDZUA=='),('shashiraj.itagi','12345678','U2FsdGVkX1+gZ77qOfWYy4tCRdwyKGRfuZdkxot798zLts6UdmewfT8SYbTzYxDR'),('snigdhaman.chatterjee','12345678','U2FsdGVkX19cZS8vj3j7L+s3au0va7dKQ8X2FLywN+AGYmHRA00Fula0dcyITGFp'),('sunil.gornale','12345678','U2FsdGVkX1+7o3lyO02ZjTg/cHn98IYViNZrFfRB08QJuipXI+VQoLemt2tA2tLQ'),('sunny','12345678','U2FsdGVkX19aawOdNDykmOj1Jv01u+7hV6OmFi7rSwOYFqUlfm55joGZANR0y6O5'),('thevivekdwivedi','core2608A-','U2FsdGVkX19ri7F1OCcfuuIgt7cE5vuXQE8xUJgSWBtJ2bpG7wbntdwAM9dEm2UK');
/*!40000 ALTER TABLE `userCreds` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-05-06 10:56:00
