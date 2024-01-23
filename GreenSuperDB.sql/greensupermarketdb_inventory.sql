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
-- Table structure for table `inventory`
--

DROP TABLE IF EXISTS `inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventory` (
  `prod_id` int NOT NULL AUTO_INCREMENT,
  `prod_name` varchar(255) NOT NULL,
  `prod_price` decimal(10,2) NOT NULL,
  `prod_quantity` int NOT NULL,
  `prod_category` varchar(255) DEFAULT NULL,
  `prod_image` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`prod_id`)
) ENGINE=InnoDB AUTO_INCREMENT=54544 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory`
--

LOCK TABLES `inventory` WRITE;
/*!40000 ALTER TABLE `inventory` DISABLE KEYS */;
INSERT INTO `inventory` VALUES (6,'Cabbage',2300.00,0,'Vegetables','assets/images/Pic915005.jpg'),(7,'Orange',230.00,20800,'Fruits','assets/images/Pic924025.jpg'),(8,'Watermelon',500.00,19200,'Fruits','assets/images/Pic923063.jpg'),(9,'Banana',230.00,10000,'Fruits','assets/images/Pic923005.jpg'),(10,'Potato',230.00,4800,'Vegetables','assets/images/Pic915014.jpg'),(11,'Pork Leg Bone',2300.00,14000,'Meat','assets/images/Pic934010.jpg'),(12,'Pork Chops',2300.00,23000,'Meat','assets/images/Pic934002.jpg'),(13,'Bairaha Chicken',2300.00,21500,'Meat','assets/images/Pic937001.jpg'),(14,'Honey Roasted Pork',5000.00,23000,'Meat','assets/images/Pic939015.jpg'),(15,'Paraw Small',1460.00,10800,'Meat','assets/images/Pic941037.jpg'),(16,'Alagoduwa',2300.00,23000,'Meat','assets/images/Pic941001.jpg'),(17,'Red Cabbage',230.00,229600,'Vegetables','assets/images/Pic913059.jpg'),(18,'White mullet ',2300.00,23000,'Meat','assets/images/Pic941076.jpg'),(19,'Prawn Medium',2340.00,23000,'Meat','assets/images/Pic941043.jpg'),(20,'Prawn Medium',2340.00,22800,'meat','assets/images/Pic941001.jpg'),(60,'Mango',220.00,200000,'Vegetables','assets/images/MANGO-removebg-preview.png');
/*!40000 ALTER TABLE `inventory` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-01-24  1:47:47
