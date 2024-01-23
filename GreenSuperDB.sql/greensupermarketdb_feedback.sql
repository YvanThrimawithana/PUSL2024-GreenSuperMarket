-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: greensupermarketdb
-- ------------------------------------------------------
-- Server version	8.0.35

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
-- Table structure for table `feedback`
--

DROP TABLE IF EXISTS `feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `feedback` (
  `f_id` int NOT NULL AUTO_INCREMENT,
  `c_email` varchar(255) DEFAULT NULL,
  `f_status` varchar(255) DEFAULT NULL,
  `f_text` text,
  PRIMARY KEY (`f_id`),
  KEY `c_email` (`c_email`),
  KEY `idx_f_id_desc` (`f_id` DESC),
  CONSTRAINT `feedback_ibfk_1` FOREIGN KEY (`c_email`) REFERENCES `customerdetails` (`c_email`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedback`
--

LOCK TABLES `feedback` WRITE;
/*!40000 ALTER TABLE `feedback` DISABLE KEYS */;
INSERT INTO `feedback` VALUES (11,'yvan.thrimawithana@outlook.com','Satisfied','This website is a work of art, i love the fluidity and the exceptionalism in cooperated in this fascinating website, i wish them good luck and i hope they can make the payment available '),(12,'yvan.thrimawithana@outlook.com','Satisfied','Well done '),(13,'yvan.thrimawithana@outlook.com','Unsatisfied','Could do better '),(14,'yvan.thrimawithana@outlook.com','Unsatisfied','Could do better '),(15,'yvan.thrimawithana@outlook.com','Satisfied','Well done'),(16,'yvan.thrimawithana@outlook.com','Neutral','How long does delivery take ?'),(17,'yvan.thrimawithana@outlook.com','Satisfied','job well done'),(18,'luke_thrimawithana@yahoo.com','Satisfied','Good web ');
/*!40000 ALTER TABLE `feedback` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-01-24  1:47:48
