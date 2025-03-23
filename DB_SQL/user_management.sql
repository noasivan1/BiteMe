-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: user_management
-- ------------------------------------------------------
-- Server version	8.0.39

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `ID` int NOT NULL,
  `UserName` varchar(45) DEFAULT NULL,
  `Password` varchar(45) DEFAULT NULL,
  `FirstName` varchar(45) DEFAULT NULL,
  `LastName` varchar(45) DEFAULT NULL,
  `Email` varchar(45) DEFAULT NULL,
  `Phone` varchar(45) DEFAULT NULL,
  `Type` varchar(45) DEFAULT NULL,
  `District` varchar(45) DEFAULT NULL,
  `IsLoggedIn` tinyint DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UserName` (`UserName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (0,'c','c','Alice','Smith','asmith@gmail.com','0509638527','CEO','all',0),(1,'br1','br1','Emily','Johnson','ejohnson@gmail.com','0565123741','Branch Manager','north',0),(2,'br2','br2','Grace','Thompson','gthompson@yahoo.com','0531649524','Branch Manager','center',0),(3,'br3','br3','Ian','Johnson','ijohnson@yahoo.com','0546321954','Branch Manager','south',0),(10,'e1','e1','Bob','White','bwhite@gmail.com','0547894562','Employee','all',0),(11,'user1','u1','Eva','Davis','edavis@yahoo.com','0597418634','Customer','north',0),(20,'e2','e2','Carol','Jones','cjones@yahoo.com','05295175342','Employee','all',0),(22,'user2','u2','Carol','Williams','cwilliams@gmail.com','0521463287','Customer','north',0),(30,'e3','e3','David','Black','dblack@hotmail.com','0539513546','Employee','all',0),(33,'user3','u3','Lily','Smith','lsmith@hotmail.com','0543198741','Customer','center',0),(40,'e4','e4','Alice','Green','agreen@gmail.com','0541234567','Employee','all',0),(44,'user4','u4','Nina','Taylor','ntaylor@gmail.com','0507894561','Customer','center',0),(50,'e5','e5','Eve','Smith','esmith@yahoo.com','0521234567','Employee','all',0),(55,'user5','u5','Rita','Roberts','rroberts@yahoo.com','0503456789','Customer','south',0),(66,'user6','u6','Sam','Hughes','shughes@hotmail.com','0502345678','Customer','south',0),(100,'ce1','ce1','Frank','Garcia','fgarcia@brd.ac.il','0596543217','Certified Employee','all',0),(200,'ce2','ce2','Hannah','Klark','hklark@hotmail.ac.il','0507516927','Certified Employee','all',0),(300,'ce3','ce3','Jasmine','Lee','jlee@hotmail.com','0507516924','Certified Employee','all',0),(400,'ce4','ce4','Kara','Miller','kmiller@gmail.com','0509876543','Certified Employee','all',0),(500,'ce5','ce5','Leo','Nelson','lnelson@yahoo.com','0508765432','Certified Employee','all',0);
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

-- Dump completed on 2024-08-13 16:23:42
