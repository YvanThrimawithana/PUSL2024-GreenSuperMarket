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
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `c_email` varchar(255) DEFAULT NULL,
  `prod_name` varchar(255) DEFAULT NULL,
  `prod_quantity` int DEFAULT NULL,
  `prod_price` decimal(10,2) DEFAULT NULL,
  `payment_id` int DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  UNIQUE KEY `unique_order_product` (`order_id`,`prod_name`),
  KEY `c_email` (`c_email`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`c_email`) REFERENCES `customerdetails` (`c_email`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (60,'yvan.thrimawithana@gmail.com','Orange',500,1150.00,NULL),(61,'yvan.thrimawithana@gmail.com','Pork Leg Bone',700,16100.00,NULL),(62,'yvan.thrimawithana@outlook.com','Pork Leg Bone',700,16100.00,NULL),(63,'yvan.thrimawithana@outlook.com','Cabbage',1000,23000.00,NULL),(64,'yvan.thrimawithana@outlook.com','Orange',500,1150.00,NULL),(65,'yvan.thrimawithana@outlook.com','Potato',500,1150.00,NULL),(66,'luke_thrimawithana@yahoo.com','apple',1000,2000.00,NULL),(67,'luke_thrimawithana@yahoo.com','Pork Leg Bone',500,11500.00,NULL),(69,'luke.thrimawithana@yahoo.com','Red Cabbage',200,460.00,NULL),(70,'yvan.thrimawithana@outlook.com','Cabbage',1000,23000.00,NULL),(72,'yvan.thrimawithana@outlook.com','Orange',500,1150.00,NULL);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
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
