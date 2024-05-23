-- MySQL dump 10.13  Distrib 8.3.0, for macos14.2 (x86_64)
--
-- Host: localhost    Database: sell
-- ------------------------------------------------------
-- Server version	8.3.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (4,'accessories'),(8,'beachwear'),(11,'cars'),(1,'fashion'),(9,'furniture'),(7,'gadgets'),(2,'men'),(6,'outdoors'),(10,'perfumes'),(5,'shoes'),(3,'women');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contactus`
--

DROP TABLE IF EXISTS `contactus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contactus` (
  `contactus_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `message` text NOT NULL,
  PRIMARY KEY (`contactus_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contactus`
--

LOCK TABLES `contactus` WRITE;
/*!40000 ALTER TABLE `contactus` DISABLE KEYS */;
INSERT INTO `contactus` VALUES (1,'dfg','fgff@fkfk.com','feedback','zdhvszdhvszjvdshvzsdhvsdvsdvsdvvvzdv'),(2,'vvcv','dsf@fjk.com','feedback','sdfjksjdfhsd sd');
/*!40000 ALTER TABLE `contactus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `image`
--

DROP TABLE IF EXISTS `image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `image` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_id` int DEFAULT NULL,
  `url` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `image_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `image`
--

LOCK TABLES `image` WRITE;
/*!40000 ALTER TABLE `image` DISABLE KEYS */;
INSERT INTO `image` VALUES (1,1,'https://i.ibb.co/v4Xy9Zg/pexels-garvin-st-villier-719266-3972755.jpg'),(2,1,'https://i.ibb.co/v4Xy9Zg/pexels-garvin-st-villier-719266-3972755.jpg'),(3,1,'https://i.ibb.co/v4Xy9Zg/pexels-garvin-st-villier-719266-3972755.jpg'),(4,2,'https://i.ibb.co/v4Xy9Zg/pexels-garvin-st-villier-719266-3972755.jpg'),(5,2,'https://i.ibb.co/v4Xy9Zg/pexels-garvin-st-villier-719266-3972755.jpg'),(6,2,'https://i.ibb.co/v4Xy9Zg/pexels-garvin-st-villier-719266-3972755.jpg'),(7,3,'https://i.ibb.co/v4Xy9Zg/pexels-garvin-st-villier-719266-3972755.jpg'),(8,3,'https://i.ibb.co/v4Xy9Zg/pexels-garvin-st-villier-719266-3972755.jpg'),(9,3,'https://i.ibb.co/v4Xy9Zg/pexels-garvin-st-villier-719266-3972755.jpg'),(10,4,'https://i.ibb.co/v4Xy9Zg/pexels-garvin-st-villier-719266-3972755.jpg'),(11,4,'https://i.ibb.co/v4Xy9Zg/pexels-garvin-st-villier-719266-3972755.jpg'),(12,4,'https://i.ibb.co/v4Xy9Zg/pexels-garvin-st-villier-719266-3972755.jpg'),(13,5,'https://i.ibb.co/v4Xy9Zg/pexels-garvin-st-villier-719266-3972755.jpg'),(14,5,'https://i.ibb.co/v4Xy9Zg/pexels-garvin-st-villier-719266-3972755.jpg'),(15,5,'https://i.ibb.co/v4Xy9Zg/pexels-garvin-st-villier-719266-3972755.jpg'),(16,6,'https://i.ibb.co/v4Xy9Zg/pexels-garvin-st-villier-719266-3972755.jpg'),(17,6,'https://i.ibb.co/v4Xy9Zg/pexels-garvin-st-villier-719266-3972755.jpg'),(18,6,'https://i.ibb.co/v4Xy9Zg/pexels-garvin-st-villier-719266-3972755.jpg'),(19,7,'https://i.ibb.co/v4Xy9Zg/pexels-garvin-st-villier-719266-3972755.jpg'),(20,7,'https://i.ibb.co/v4Xy9Zg/pexels-garvin-st-villier-719266-3972755.jpg'),(21,7,'https://i.ibb.co/v4Xy9Zg/pexels-garvin-st-villier-719266-3972755.jpg'),(22,8,'https://i.ibb.co/v4Xy9Zg/pexels-garvin-st-villier-719266-3972755.jpg'),(23,8,'https://i.ibb.co/v4Xy9Zg/pexels-garvin-st-villier-719266-3972755.jpg'),(24,8,'https://i.ibb.co/v4Xy9Zg/pexels-garvin-st-villier-719266-3972755.jpg'),(25,9,'https://i.ibb.co/v4Xy9Zg/pexels-garvin-st-villier-719266-3972755.jpg'),(26,9,'https://i.ibb.co/v4Xy9Zg/pexels-garvin-st-villier-719266-3972755.jpg'),(27,9,'https://i.ibb.co/v4Xy9Zg/pexels-garvin-st-villier-719266-3972755.jpg'),(28,10,'https://i.ibb.co/v4Xy9Zg/pexels-garvin-st-villier-719266-3972755.jpg'),(29,10,'https://i.ibb.co/v4Xy9Zg/pexels-garvin-st-villier-719266-3972755.jpg'),(30,10,'https://i.ibb.co/v4Xy9Zg/pexels-garvin-st-villier-719266-3972755.jpg'),(31,11,'https://i.ibb.co/v4Xy9Zg/pexels-garvin-st-villier-719266-3972755.jpg'),(32,11,'https://i.ibb.co/v4Xy9Zg/pexels-garvin-st-villier-719266-3972755.jpg'),(33,11,'https://i.ibb.co/v4Xy9Zg/pexels-garvin-st-villier-719266-3972755.jpg'),(34,12,'https://i.ibb.co/v4Xy9Zg/pexels-garvin-st-villier-719266-3972755.jpg'),(35,12,'https://i.ibb.co/v4Xy9Zg/pexels-garvin-st-villier-719266-3972755.jpg'),(36,12,'https://i.ibb.co/v4Xy9Zg/pexels-garvin-st-villier-719266-3972755.jpg'),(37,13,'https://i.ibb.co/v4Xy9Zg/pexels-garvin-st-villier-719266-3972755.jpg'),(38,13,'https://i.ibb.co/v4Xy9Zg/pexels-garvin-st-villier-719266-3972755.jpg'),(39,13,'https://i.ibb.co/v4Xy9Zg/pexels-garvin-st-villier-719266-3972755.jpg'),(40,14,'https://i.ibb.co/v4Xy9Zg/pexels-garvin-st-villier-719266-3972755.jpg'),(41,14,'https://i.ibb.co/v4Xy9Zg/pexels-garvin-st-villier-719266-3972755.jpg'),(42,14,'https://i.ibb.co/v4Xy9Zg/pexels-garvin-st-villier-719266-3972755.jpg'),(43,21,'https://i.ibb.co/v4Xy9Zg/pexels-garvin-st-villier-719266-3972755.jpg'),(44,21,'https://i.ibb.co/v4Xy9Zg/pexels-garvin-st-villier-719266-3972755.jpg'),(45,21,'https://i.ibb.co/v4Xy9Zg/pexels-garvin-st-villier-719266-3972755.jpg'),(46,22,'https://i.ibb.co/v4Xy9Zg/pexels-garvin-st-villier-719266-3972755.jpg'),(47,22,'https://i.ibb.co/v4Xy9Zg/pexels-garvin-st-villier-719266-3972755.jpg'),(48,22,'https://i.ibb.co/v4Xy9Zg/pexels-garvin-st-villier-719266-3972755.jpg'),(49,23,'https://i.ibb.co/v4Xy9Zg/pexels-garvin-st-villier-719266-3972755.jpg'),(50,23,'https://i.ibb.co/v4Xy9Zg/pexels-garvin-st-villier-719266-3972755.jpg'),(51,23,'https://i.ibb.co/v4Xy9Zg/pexels-garvin-st-villier-719266-3972755.jpg'),(52,24,'https://i.ibb.co/v4Xy9Zg/pexels-garvin-st-villier-719266-3972755.jpg'),(53,24,'https://i.ibb.co/v4Xy9Zg/pexels-garvin-st-villier-719266-3972755.jpg'),(54,24,'https://i.ibb.co/v4Xy9Zg/pexels-garvin-st-villier-719266-3972755.jpg'),(55,25,'https://i.ibb.co/v4Xy9Zg/pexels-garvin-st-villier-719266-3972755.jpg'),(56,25,'https://i.ibb.co/v4Xy9Zg/pexels-garvin-st-villier-719266-3972755.jpg'),(57,25,'https://i.ibb.co/v4Xy9Zg/pexels-garvin-st-villier-719266-3972755.jpg'),(58,26,'https://i.ibb.co/v4Xy9Zg/pexels-garvin-st-villier-719266-3972755.jpg'),(59,26,'https://i.ibb.co/v4Xy9Zg/pexels-garvin-st-villier-719266-3972755.jpg'),(60,26,'https://i.ibb.co/v4Xy9Zg/pexels-garvin-st-villier-719266-3972755.jpg'),(61,15,'https://i.ibb.co/v4Xy9Zg/pexels-garvin-st-villier-719266-3972755.jpg'),(62,16,'https://i.ibb.co/v4Xy9Zg/pexels-garvin-st-villier-719266-3972755.jpg'),(63,17,'https://i.ibb.co/v4Xy9Zg/pexels-garvin-st-villier-719266-3972755.jpg'),(64,18,'https://i.ibb.co/v4Xy9Zg/pexels-garvin-st-villier-719266-3972755.jpg'),(65,19,'https://i.ibb.co/v4Xy9Zg/pexels-garvin-st-villier-719266-3972755.jpg'),(66,20,'https://i.ibb.co/v4Xy9Zg/pexels-garvin-st-villier-719266-3972755.jpg');
/*!40000 ALTER TABLE `image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `order_date` datetime DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL,
  `status` varchar(45) DEFAULT 'pending',
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `orders_fk_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (3,'2023-04-18 19:28:19',NULL,'pending',NULL),(4,'2023-04-18 19:32:14',NULL,'pending',NULL);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `sku` varchar(255) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `discount` int DEFAULT '0',
  `fullDescription` text,
  `shortDescription` text,
  `rating` decimal(2,1) DEFAULT '0.0',
  `saleCount` int DEFAULT '0',
  `isNew` tinyint(1) DEFAULT '0',
  `offerEnd` datetime DEFAULT NULL,
  `createdAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `approval_status` enum('pending','approved','rejected') DEFAULT 'pending',
  PRIMARY KEY (`id`),
  UNIQUE KEY `sku` (`sku`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'Lorem ipsum jacket','asdf123',12.45,10,'Sed ut perspiciatis unde omnis iste natus...','Ut enim ad minima veniam...',4.0,54,0,'2024-10-05 12:11:00','2024-05-22 22:59:17','pending'),(2,'Elegant Dress','elegant123',45.99,15,'An elegant dress suitable for all occasions...','Perfect for a night out...',4.5,120,1,'2024-09-15 14:30:00','2024-05-22 22:59:17','pending'),(3,'Casual T-Shirt','casual123',15.99,5,'A comfortable and casual t-shirt...','Great for everyday wear...',3.8,80,0,NULL,'2024-05-22 22:59:17','pending'),(4,'Running Shoes','shoes123',60.00,20,'High-performance running shoes...','Run faster and farther...',4.7,200,1,'2024-11-01 10:00:00','2024-05-22 22:59:17','pending'),(5,'Leather Wallet','wallet123',25.00,0,'A durable leather wallet...','Keep your money and cards safe...',4.2,150,0,NULL,'2024-05-22 22:59:17','pending'),(6,'Winter Coat','coat123',120.00,30,'A warm winter coat...','Stay warm during cold weather...',4.9,60,1,'2024-12-31 23:59:59','2024-05-22 22:59:17','pending'),(7,'Smart Watch','watch123',150.00,25,'A smart watch with multiple features...','Track your fitness and stay connected...',4.4,250,1,'2024-08-20 15:00:00','2024-05-22 22:59:17','pending'),(8,'Designer Handbag','bag123',200.00,40,'A stylish designer handbag...','Carry your essentials in style...',4.6,90,0,NULL,'2024-05-22 22:59:17','pending'),(9,'Sports Cap','cap123',10.00,10,'A cool sports cap...','Perfect for outdoor activities...',4.1,140,0,'2024-10-30 12:00:00','2024-05-22 22:59:17','pending'),(10,'Sunglasses','sunglass123',30.00,15,'Fashionable sunglasses...','Protect your eyes from the sun...',4.3,110,0,NULL,'2024-05-22 22:59:17','pending'),(11,'Formal Shirt','shirt123',35.00,5,'A formal shirt for office wear...','Look professional and stylish...',3.9,85,0,NULL,'2024-05-22 22:59:17','pending'),(12,'Jeans','jeans123',50.00,20,'Comfortable and stylish jeans...','Perfect for casual wear...',4.5,130,1,'2024-09-01 09:00:00','2024-05-22 22:59:17','pending'),(13,'Hiking Boots','boots123',80.00,25,'Durable hiking boots...','Perfect for outdoor adventures...',4.8,75,1,'2024-11-10 16:00:00','2024-05-22 22:59:17','pending'),(14,'Beachwear','beachwear123',20.00,10,'Comfortable beachwear...','Perfect for a day at the beach...',4.0,60,0,NULL,'2024-05-22 22:59:17','pending'),(15,'Leather Belt','belt123',18.00,0,'A stylish leather belt...','Complete your outfit...',3.7,95,0,NULL,'2024-05-22 22:59:17','pending'),(16,'Casual Sneakers','sneakers123',55.00,15,'Casual sneakers for everyday wear...','Comfortable and stylish...',4.2,110,0,NULL,'2024-05-22 22:59:17','pending'),(17,'Travel Backpack','backpack123',75.00,20,'A durable travel backpack...','Perfect for all your travels...',4.6,80,1,'2024-10-05 12:00:00','2024-05-22 22:59:17','pending'),(18,'Fitness Tracker','tracker123',65.00,10,'A fitness tracker to monitor your activities...','Stay fit and healthy...',4.4,150,1,'2024-08-25 14:00:00','2024-05-22 22:59:17','pending'),(19,'Luxury Watch','luxwatch123',300.00,50,'A luxury watch for special occasions...','Elegant and sophisticated...',4.9,30,0,NULL,'2024-05-22 22:59:17','pending'),(20,'Casual Shorts','shorts123',20.00,5,'Comfortable casual shorts...','Perfect for summer...',4.0,90,0,NULL,'2024-05-22 22:59:17','pending'),(21,'Luxury Sofa','sofa123',500.00,20,'A luxurious sofa for your living room...','Comfortable and stylish...',4.8,20,1,'2024-12-31 23:59:59','2024-05-22 23:00:26','pending'),(22,'Dining Table Set','table123',300.00,15,'A complete dining table set...','Perfect for family dinners...',4.7,25,1,'2024-11-15 12:00:00','2024-05-22 23:00:26','pending'),(23,'Queen Size Bed','bed123',450.00,25,'A comfortable queen size bed...','Sleep in luxury...',4.9,15,1,'2024-10-10 10:00:00','2024-05-22 23:00:26','pending'),(24,'Luxury Perfume','perfume123',80.00,10,'A luxurious perfume...','Smell great all day...',4.5,50,1,'2024-09-05 14:00:00','2024-05-22 23:00:26','pending'),(25,'Car Model X','car123',25000.00,5,'A high-performance car...','Drive in style...',4.9,5,1,'2024-08-20 09:00:00','2024-05-22 23:00:26','pending'),(26,'Convertible Car','car456',35000.00,10,'A stylish convertible car...','Feel the wind in your hair...',4.8,3,1,'2024-12-31 23:59:59','2024-05-22 23:00:26','pending');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_category`
--

DROP TABLE IF EXISTS `product_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_category` (
  `product_id` int NOT NULL,
  `category_id` int NOT NULL,
  PRIMARY KEY (`product_id`,`category_id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `product_category_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_category_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_category`
--

LOCK TABLES `product_category` WRITE;
/*!40000 ALTER TABLE `product_category` DISABLE KEYS */;
INSERT INTO `product_category` VALUES (1,1),(2,1),(3,1),(5,1),(6,1),(8,1),(10,1),(11,1),(12,1),(14,1),(15,1),(16,1),(17,1),(19,1),(20,1),(1,2),(3,2),(11,2),(12,2),(20,2),(2,3),(8,3),(5,4),(7,4),(8,4),(9,4),(10,4),(15,4),(18,4),(19,4),(4,5),(9,5),(13,5),(16,5),(4,6),(6,6),(13,6),(17,6),(7,7),(18,7),(14,8),(21,9),(22,9),(23,9),(24,10),(25,11),(26,11);
/*!40000 ALTER TABLE `product_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `session_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `expires` int unsigned NOT NULL,
  `data` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  PRIMARY KEY (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES ('-4gXGabLbRb2RflJaqaZNXJz1Be5cpkS',1716505805,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('-5U5iNBN-_Urr476hPPE3_qY7GMW97xP',1716494829,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('-TUg8-SkZ1SsjbaruzTU_Q6PmLr0Yv04',1716503510,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('-gc_pQ_cpQCU5-C1OuCBczrsMQtZZjsO',1716503647,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('-iiGG64_uiorOfFlxR-OMDvJy58TI-4o',1716509001,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('0CDVG1yp4LInyDK7nfJv3gAAqU9rWZ8H',1716499895,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('0Dls-rQprQqACVhAEORViCl5w3B9RHNG',1716500320,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('0kQj_PX0ukWQPcs2J0tpOIqMHV-TnBde',1716504140,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('1kMIKf3P_a5Wd2JEdz3rendcWjlnE745',1716498425,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('2SwvuRCCPo5yftT4ttm9tEZb5q5bI4JW',1716507961,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('2X6u2ZVlvZfT2QimFHJz0FIor3e0WCNb',1716503734,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('2pXe9tvz4IgqMhoAmzfnXFM1sTpIp-lh',1716494611,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('2up58eVLTpZXaUXWRUMVUnKTuY4Q4BUv',1716504459,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('3j7eL_xSFcNYIu5K_LzSC8i1aUyZ1sBh',1716508985,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('3lqIGA6wsVo3DYIL8Yb3E-KPLdol0hol',1716507790,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('3mQOjw1nDUIL4t_NnSLZCPvFv7xWiBGC',1716504380,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('44emkqJdPNCEEqebfDAagBaS0YeKbx5C',1716506573,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('48hrbvDGGFbyIYbBNX28QpFFpz_0i6bb',1716504219,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('4UjFle5gBePqDKRhP_vHPT8gICQ725Yh',1716503510,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('4W7y5a6bNkPC6OreGC2BocF-WMUnD7Dc',1716495585,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('5LSjFTwUyqrgdsdOShhQIhWVbtmKKH06',1716504219,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('5aYFn9RJs6tnxBPPjcniTCbQ-2zGVGMB',1716505949,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('5onqtLasF_jtsS0EBUDtkvlrSAVjnKnx',1716504113,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('67ZpJ8AcW9tAREc587Y1oii-UnpO-wDF',1716507854,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('6M86BminRJhSTt8LD1IPd3CGYAnQhI4B',1716505804,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('6Yy8IoZHJP-FRiWdFmvYvQt4BA8DdJby',1716506573,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('6dgy7RrVvO3_y7QCVlvSqfPCPMYtemxn',1716507375,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('6ffWwYU97l4-4CY7_XQL5cE0hiXSVsjQ',1716506257,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('7uzyAF7mLAYh69Zfi_0osLtDnCyDUqu-',1716501212,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('8081DmupaiBMKwEDzUZpH9uSBPVa3rg0',1716498967,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('8MBo0vyaGJQCb1IbrS4WKwJrd5US3SS0',1716494829,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('8jq6wC9ebdu384OfWdiMrmxKK2a2236Y',1716499539,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('8znQEMqeM-sAR7dfS8Zb8-IFTcUbm9Ao',1716503620,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('92cwvZs7pXF0MqXVQeaFY7SCcCGue-OM',1716500875,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('9H6FJORvvdyBWJ96Y7YM8Rq1-_2ohfT4',1716500875,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('9v01r8ZpZ4J4yjNBgW33gnXmpAjA8hD6',1716511148,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('9y8DkLUo10tlzyohAclSf_om3AfZ7syQ',1716510268,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('AITgw2fcVKfvXqLrWUCdfCv0nd7aBR2T',1716506871,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('ApSaDjj3p3uBsUODPuhWMnIQma8XP2xD',1716507158,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('Aqx8Q3DWNbYot9mH040hv3QiP8707X5m',1716506257,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('B0oMCzY1PPF7dTzgshHJR1hVAz22p4qx',1716507103,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('BG_0clHxIIghmgSX_Wh42p8TqKu9KVf_',1716504138,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('BJ7eBWnQFnOiWdLF9TMA8rXI-fEFVOfW',1716507273,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('BKWIGsKoIFWx34H93OOUhltu3_82Fb5Q',1716504138,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('C3hogcKfvLOXRd4phdtg48quIr3rWVEM',1716500933,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('CaVLJuuH88iERlkd1fNXVMYDk5HQ_Y-D',1716511176,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('CdguK6npxEPvjJpRszAqKx54RBQfhOyx',1716510287,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('D9Y4MwCdhMCJNcqyh5zCazsM_vlyqLZa',1716501255,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('DPEJDGu7P_RJV_4CC60oiVHUVmLVp9j7',1716499551,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('D_1jzW7wprMzeeY135gy3O-bYQ3tBY6y',1716507095,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('E5Dg98kh7F598-mShFW91TcFiVkSx-oS',1716499884,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('E9KnyFeYhAVgm7TTS2cMBz9ViKko0gly',1716503437,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('EEeRF01-uNlNgxoID2bxm5aSDy0fzHl5',1716506216,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('EIQeuDe6ycQCpSG5sgIDMvA3LuSTbQ08',1716499551,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('EaL49Kt0J7-NTtNJr_tr8CIXQLZabKpM',1716504380,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('EcZbAds6MnKgsSqaOzBDSdp1uF-NhXh7',1716504290,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('EdQSng2BFpl3Zk8ltT-TYe4l4N-PXOzv',1716507383,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('EobojE4ZmMQqZ6b1sjb1LcX57hICnNcI',1716494730,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('F24DUX4Q1H0DZv47yPCOLcAebs5bOspy',1716498967,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('F7Fh3Wh83kEezM1EmeKIRsfFpUZ9Iecu',1716504296,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('FpmZ4uv0VpdpMWQvrsowugm541WLADQ-',1716507807,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('G37Z0sBV-dqbkEMDNfybEEDYndHChi6J',1716494708,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('GIm95bIKvqIirBFTrbIz6I2Zay2vgbke',1716510323,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('GJd1RTnsrbsRJnqACRe_O_2QBSu2eXzp',1716505883,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('GjgnU9lex0KywPcw-L-2BDYAa2zWxbZW',1716504368,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('GlAOG44lqHxWL6x81b0xgWJZsKBF821u',1716503813,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('GzvcbBHWfcNivm0Kk8OVLUNF5rkx5wco',1716500913,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('H5FVyrnttFGF-Z6NjSZy7TuEmWLDDQ5-',1716499879,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('H5Kz24xD039OPIGWQ43AwG5h-dWpf13I',1716501030,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('HZdMSSnjtbhHvZBwrVOuVuubTsf0K3Ka',1716494713,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('Hox0u-zKkApiQ2K4lmYZXzNIZjRz7qel',1716501071,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('ILwi-FG3x-7hFoPADBB-npV8sEDiYlI8',1716499071,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('IWuzUPi_K2TT_t2kbHXUWYXYZYikOJgT',1716506119,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('I_dWjHM_gM5jLqskd3LquetNk6QBPE_S',1716500913,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('IfVau9AW-WijllP8afs9gl928EAwj4HL',1716510287,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('Jr043lh3Ced1csU5jua0gBfrB4LG5xwF',1716499013,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('KWp8T790OZqv_8VEPHTs5qn52hjdGsvF',1716506119,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('KcA8wPOZVytSBc4ma5OPqtPBakGj46LI',1716508799,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('Kqz4Ck8w4ZoWtPdfgLmPurqxzMXXL6Nt',1716504296,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('KtnNCTPTyqU9gus1PsmLQYZ5T2awTL1I',1716500911,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('LGw_S_KNEXeizceZp4gda7z8xX5xFLdT',1716500889,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('LNA3gTx-SzE5y70KkDPX1OITeNK-WRiR',1716503647,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('M9DdXPPg61pEHp5IBHSs8aRKnElBkfQY',1716501122,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('M9cAs3YiNBx9cIFgQRIJXlo4kUXfkiLQ',1716501319,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('MZllSehuTXcU3vonFTKgQm1xP3MCwep8',1716507144,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('Mv-rGYri23kQa-u7ciE1MKxYbqArYAHU',1716504478,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('NpmTKWaetvhgx_JFNurc-bKZPJrNfvJM',1716490700,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('NywuKMyZ3V2awtxDejvFDxpvtMeoCXKP',1716507158,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('ODawNzWaej8G1xHq8pL1hzfIKjc_pCg-',1716499884,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('Osgbi9DBxzQJdCXY36Sl919htAobZsAt',1716508619,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('Ot53IdIBVU1yINieY8bJC0fnXX9VD9HU',1716503437,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('P5t0-U3NClwcoTIa0NIiMLxetUn6nIr-',1716507146,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('PRf6HyAe77J6nYtkt-DBah-YDIxvHa92',1716503563,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('Q2IT6M81nFTE91WjUSmmdRV0pT6Ihw1w',1716509851,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('QMBD1ie9iiUf-DvH_nx4PR_sXX6lyyRi',1716507790,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('R26hgO6gxbnjujeo8SHwBpU96KZJ24cT',1716494611,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('Rzu5QzxiC1SPZnMT_nSvu2hEbOH7PNjf',1716507983,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('SN5YlvLijy_D9zYEOsFXenrb09kOFCRP',1716510268,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('SOAYhbkoyQRt3kgWqcyPoN165pj7kTeT',1716498341,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('STs5NMwPV-130GFb4TwTZVzwXATYiqfN',1716505948,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('Sr1Cu2jXtlptTjMv9jlWf7RXb9XTCp3F',1716503656,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('TGvSLuuyzXfWf2NCgF0c1ZhAGMppN7K-',1716511159,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('TzU9YCb3V7jqGdZjOd2nGprDdLydRifH',1716501319,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('UCN0pPJ7YZilHS1yPM1XjyNfvtRcY29d',1716505998,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('UZukBXOdTuJo7YDu9VX5GojC1OpAg8uJ',1716510323,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('VHUQQ8TFnO4T5Syfjpg-MXFcgyg7pPIH',1716510417,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('VVpWC_H6pbDaNDIIsFTCbPu3C5fWtqr1',1716499113,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('VXBWKhRxx59RbAQbI-KnQAduoe07BN7U',1716503813,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('Veqp_5aHH7i9GuCnS-SXBi9-kJc15jKU',1716501071,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('WGLS3rg00Mm2GYoYFs39HYH1FyPw8KPt',1716507144,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('WLOhq-AtnWvVp2Gd2kUK3I-Y4HE89sEr',1716507363,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('WZ7jeTFQeqH_7BXRJA2AM-rclf8J2fah',1716503778,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('Wo1DbvDPjlZN3tQjUv7B7fm2OhiOAX0Q',1716511159,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('XOVkI9ktFmEVMZth4fXwPAXF7hOHTj5T',1716501264,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('XSEdKoCbq2u9EL77Xjg_Zt1qyefcmNKE',1716494708,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('Xj3XhQZkKAfjcpYdtwVGPji0437c3yIA',1716501220,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('XmAubl4iXBklGQkHa5irkz6P8vn8BTv4',1716500320,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('XwzxhG8ox9R6POL0rGqdYlnzgX-YfR6n',1716507370,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('Z3V51Uq3J53AN3A-_oKI1BSLn7dSBbDf',1716500912,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('Z8qyC3HvYfoK_u9VEq5JBlNIS-KRUO8e',1716500896,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('ZZtwaPUdPH5KaluKkOLeMRgHACxn0zkp',1716500897,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('ZniP0NvH0yCtDW-iXCmuPWygbeh2gNBU',1716503563,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('_2bOYauL7ViDt17wJ31i_1wvA47h4Mj0',1716503734,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('_6K2PZjX-YINwTgALd1Mpub4s-JLh16F',1716506506,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('_6TP9VPmJTztmgZIwMAtGbGu0pgS3j5n',1716507960,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('_oNvc68bECR3-2dGHor8_eqbpOvLD2pZ',1716501212,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('a56tIMk01mh6Nxjn4fNnxXaXXtG--qcG',1716501255,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('aGpr30DC4M3XN6iMB6kjOCpR6vlQIiD_',1716504455,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('aXEt3A9czvkFwc63eQfLhHyAHj-ej0df',1716503671,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('ahhLf6u8_TuFzBC3d3IV7RuFf5codL8m',1716507343,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('azjJk6PyRX0ipOK8lXRfpMQeDnbabM_i',1716504298,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('b8Jkr2Mi2MmH-N0Twie0G9Zm3_Wh_vFK',1716504290,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('bcsRWsR-UjQ2KaT-EeG6ao-XeFFR5I9l',1716494467,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('bjtSTQIswFlabliYenCMNCAYZQ4fqqMg',1716505952,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('bl0Gmtob6l2mQkbnVvMqkX1034G4k8JW',1716495649,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('bmzpLfcPEtH85Y5-HqU2u9lmIpDUB9m2',1716501232,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('bpySjgRmf3RgosS1EqQXUDWMfhdVBOEM',1716499895,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('bzWvmDBbmmXcewvpB2HwVfHzF-QRpGcb',1716507239,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('cQAyqFEbKtGsZYV_ZJSpR-RmwWpX43IF',1716508619,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('d0S97GAZI-ctqLYrA640GOaXdrgmzKvm',1716494714,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('d3b3TU2ajs4GPjVnVU40u6b3aD88RAcH',1716508245,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('dPpG_P-EBOplDU3RJPJj_cVFzvOSMBK4',1716495649,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('dbCOrQDSqwBuZeJ0iI8z6iyD3Hbdwtoa',1716507807,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('dcROLMFo5z5-4HX7uR4BJhq-VRY8WnfL',1716501264,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('e4QE-DMqLPEP8RxET05JmHdWcL4s8Wq-',1716503521,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('eHb8Q-Ct2_Ef4490r77pRaBXhxUI0FhD',1716508246,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('eZjgIstu_SLlLhqfot1BsLlKOJ-bFtAz',1716500889,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('e_Zws8JOmo7EvN4Y2d7-Tfwqwmxb1_tR',1716503778,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('eaYHXx99AzKVIiCD9q0whQtS6yuq6jA8',1716500009,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('ey4UxD4ftSft4syOg_BmlDKzaGu4so9Q',1716507384,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('f2aikwYZeQAoSKY4r8tYHZpkFogw_NJK',1716499113,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('f6Qs5pP2XLMDi306m2hqtsoeeNy1aYwA',1716501030,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('fiFVLaQgIaQUP66VjiH1uJUXL8U5z3pY',1716504455,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('fj6moDUZ1iKqo9X9_vvd9xYC8LOeRE6N',1716498425,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('g7agJRz42CNgPecX8vpOKgVssX2PcTa8',1716507273,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('g9rEc1dF4swqNutK7LtR-H6q_Gw6XDJm',1716499013,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('gXIZJG3lYXw0Vxxg4CethDtsft3vDL64',1716504478,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('hfan4YEOMeJdW4JSZvdRMIWCkqZ2YCGY',1716506216,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('hzVzsjp6bkXJaamFghBD_P5Bm4r3z9MS',1716508985,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('iZnmDMciZE6I2nI22gxHu1FYQCyfEgxv',1716504368,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('inHlFd99kNR4mesON1rERDDcyQVefaBf',1716494839,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('jOf2vIOXbZqK8jq4W3QnlqtnJcTK92dj',1716501122,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('jW3lJKLPOPK0bIeolctgqWBpbU1ktfqn',1716501232,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('jd7RZ-zBDNhs9-0xiUdnm1W1fJAke_nF',1716503624,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('kawN3jKV636VGB4WsmSm7ab5dR5C1C3A',1716507854,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('mPQMi0lVhYazyd5miQC9Jx4TEGDT3C3C',1716504361,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('mxi6v4rEuN_D14k-1ZRi_L5XoCFuNthc',1716505749,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('n5NTClbC1eM3nXd0NeTnyXMQMDnTTlxU',1716503521,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('nPtgs9SssdFBRdQecJXlEZL7Lj1GrpvG',1716507239,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('nSpJokz45GQRJ4RA9f-4nESrxSfzCRGA',1716504361,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('nTlJR7Nxn-ccagAXHDXWiRNRsCCHGTXe',1716499879,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('nfaKVGeAD7QfNuDDnCnDP3jrw_hw2CIH',1716510458,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('nyYkqpdaiMwrnTmOiyTfhEL9eBXduWaD',1716499070,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('oHF4uz0paMWXM0XIhKvsTLvhlAKwmyYe',1716500009,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('oHY79N2jwjEqQERWBReEo6UvjUrQ0YmQ',1716507370,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('oQaq_usm9FmLDK9sjWaksM4A5LGQTl-N',1716510597,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('oawTIsklVmkCSe21_HEAt9fy3ZAH3S9E',1716505883,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('oiquRkFWd1EuI-ROzvHqdAf7U26XIwVY',1716511176,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('p7eIwKxXHjbfhPBVlr0g6UrpVrHq-Loa',1716505997,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('rV3K8QI4P2geShb82OLSv-KvHzCMYI-X',1716503656,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('roDm53yn_NTl3OJkNUlYVbE6XK541_sp',1716498341,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('sSznYTSwXx_WQHhMd8GbpSpCxiYw7QHO',1716507363,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('sXGgGLpU3I7LI24jT1QAoPViN8lj6CBN',1716500913,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('sgtLv8vNytUrjBA-PvrIxBzOZoLAaO8q',1716510597,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('tAcqQRdKVRh2MmfAILe1CfoSuRwZJTH7',1716501220,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('tBXKGgTc4_qMIVgnSD6-HM-eJ3qYeKjI',1716511148,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('tRh-u4ebkbMdyIZRtbbRBKpFkEgkjmN4',1716503620,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('u-I7cu42Z-xvhhQsaNCub_RhRX1wutdv',1716499539,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('u3i_1WmM9EzoMBFb-yvZK9n0l_RHpxQW',1716504113,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('uCOIE1_Klx8QPpDsA8EJi9_Tw-WvH4Wh',1716510417,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('uRN5wp1-PK3RFjSmRSfh6dacLIWrvRzW',1716500913,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('v70RKwlesjsiJEuSY1x7Lcsl7s6VzZPo',1716507095,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('vdZ0o2ReR4P_OS__PX5f9I0N52YBCZBn',1716500932,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('vkgnmIhPHMh56Lq1zKnP1TJUZwM93neN',1716500912,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('vyV4RkvClRAjbdDN4PUrWSwuHfyhvgCO',1716506506,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('wNK4K8UG0n0tzvUPCTHyIsPCpu7j3zUB',1716500911,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('wUrm-rrp4KQJAS8kieBbPFiYbeC9X8YS',1716505488,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('x72Clq7YzI0YwKPL6LuTP-3EHO9GbLRu',1716509851,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('xTBAsCUmfhbpeDxdWnfQHHkeKIrdQDIc',1716506871,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('y3jzbNukdiPXOl6m5LDdEQ7FQqdaKYCd',1716510458,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('yHjEWZLONpTIn3YsNRacpZLfjKNmZw-h',1716503671,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('yjps4fsSFBVVHpDo4EMT7381l4-6xk4k',1716507103,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('z1HdR2v7BMZ0zggp6tJTWtnUrfW8e3XL',1716507343,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('z2ve9h0UCJXn43MnvWKZHtCXlVp6hSOj',1716494730,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('z54LVqZ_OsIp4DOJX94a0aZ-mezpivCu',1716508799,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('zSbSxhsh2dJc8MANlR5zv3sOL6m6eZdI',1716509001,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),('zaGRfG5Xod8AYUWpwcaFw0hsPzO8jvv7',1716507983,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}');
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `password` varchar(500) NOT NULL,
  `user_type` varchar(45) NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  CONSTRAINT `users_chk_1` CHECK ((`user_type` in (_utf8mb4'seller',_utf8mb4'buyer',_utf8mb4'admin')))
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'dalia','dalia@gmail.com','$2b$10$CRQZ5KUMAAw1yN2zMG/U..rDzAG4oSMcdJ6ZWJsgDV9dSryPxU412','seller'),(2,'osama','d;kkk@gmail.com','$2b$10$/xAH3/mI4zB/1eKeqe6tz.MV9cxjR4MVIUU6zValeWUuqCE6u8Q06','seller'),(4,'dalia','daliay@gmail.com','$2b$10$FOEHcVCPeg/7y3x/TuTwBu4V9xVkp4nQMtFNkOJZ7Ph0UMSLhKcGO','admin'),(5,'ahlam','ahlamhi@gmail.com','$2b$10$/Fj0C9iTC9/lrPv5U4Cj/eb.K2gQF41zdZmyxQeS6azeblNh5FmZS','seller'),(6,'mutaz','mutaz@gmail.com','$2b$10$oOe0xlxsfzSD7B7vfaLuTu5QsVqCn2W8nX2Ci0tLfNOXbADIQlLti','buyer'),(8,'mutaz','mutazmutaz@gmail.com','$2b$10$MzwoXa4jHHtY1IOkK8syIOrvn57lUvi2KL.91kZaPFlZpszjajnxC','buyer'),(9,'mutaz1','mmmmmm@gmail.com','$2b$10$Og9tIW.ZxrpHmWMUsi.FB.Ud5OaXIBAPuK5GednMOnh.4CLepvzPW','admin'),(17,'test','test@test.com','$2b$10$wZs4wbtS.CLVLZD07GRMIOQLw1I1QtaMHLkpJqrk3JUhXjvk8l05y','seller'),(18,'m','m@gmail.com','$2b$10$.fkBBoL5a.F/Jkn0c5aPkuCIKvulv/xiif25LlO1kdJPvUvQRb8yy','seller');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'sell'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-23  4:05:30
