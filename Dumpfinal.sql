-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: localhost    Database: sellstrem
-- ------------------------------------------------------
-- Server version	8.0.22

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
-- Table structure for table `cart_items`
--

DROP TABLE IF EXISTS `cart_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart_items` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL DEFAULT '1',
  `product_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`),
  KEY `cart_items_ibfk_1` (`user_id`),
  CONSTRAINT `cart_items_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `cart_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_items`
--

LOCK TABLES `cart_items` WRITE;
/*!40000 ALTER TABLE `cart_items` DISABLE KEYS */;
INSERT INTO `cart_items` VALUES (6,5,2);
/*!40000 ALTER TABLE `cart_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `category_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `Description` varchar(45) NOT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
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
INSERT INTO `contactus` VALUES (1,'dalia','dalia@gmail.com','daliaklj','hello dalia'),(2,'ali','aliigj@gmail.com','error','hello');
/*!40000 ALTER TABLE `contactus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_item`
--

DROP TABLE IF EXISTS `order_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_item` (
  `order_item_id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `product_id` int NOT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`order_item_id`),
  KEY `order_id` (`order_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `order_item1_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  CONSTRAINT `order_item1_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_item`
--

LOCK TABLES `order_item` WRITE;
/*!40000 ALTER TABLE `order_item` DISABLE KEYS */;
INSERT INTO `order_item` VALUES (2,5,5,NULL);
/*!40000 ALTER TABLE `order_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `total_price` decimal(10,2) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `city` varchar(100) DEFAULT NULL,
  `street_address` varchar(255) DEFAULT NULL,
  `company_name` varchar(100) DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `fk_user_id` (`user_id`),
  CONSTRAINT `fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,NULL,NULL,'555','ffff','CCCCc','ccc','ss','dd','ee'),(2,NULL,NULL,'555','ffff','CCCCc','ccc','ss','dd','ee'),(3,NULL,NULL,'555','ffff','CCCCc','ccc','ss','dd','ee'),(4,NULL,NULL,'555','ffff','CCCCc','ccc','ss','dd','ee'),(5,NULL,NULL,'555','ffff','CCCCc','ccc','ss','dd','ee'),(6,NULL,NULL,'555','ffff','CCCCc','ccc','ss','dd','ee'),(7,NULL,NULL,'555','ffff','CCCCc','ccc','ss','dd','ee'),(8,NULL,NULL,'555','ffff','CCCCc','ccc','ss','dd','ee'),(9,NULL,NULL,'555','ffff','CCCCc','ccc','ss','dd','ee'),(10,NULL,NULL,'555','ffff','CCCCc','ccc','ss','dd','ee'),(11,NULL,NULL,'555','ffff','CCCCc','ccc','ss','dd','el'),(12,NULL,NULL,'555','ffff','CCCCc','ccc','ss','dd','ee'),(13,NULL,NULL,'555','ffff','CCCCc','ccc','ss','dd','ee'),(14,NULL,NULL,'555','ffff','CCCCc','ccc','ss','dd','ee'),(15,NULL,NULL,'555','ffff','CCCCc','ccc','ss','dd','ee'),(16,NULL,NULL,'555','ffff','CCCCc','ccc','ss','dd','ee'),(17,NULL,NULL,'555','ffff','CCCCc','ccc','ss','dd','ee'),(21,NULL,NULL,'555','ffff','CCCCc','ccc','ss','dd','ee'),(24,NULL,NULL,'555','ffff','CCCCc','ccc','ss','dd','ee'),(25,NULL,NULL,'555','ffff','CCCCc','ccc','ss','dd','ee'),(26,NULL,NULL,'555','ffff','CCCCc','ccc','ss','dd','ee'),(27,NULL,NULL,'555','ffff','CCCCc','ccc','ss','dd','ee'),(28,NULL,NULL,'555','ffff','CCCCc','ccc','ss','dd','ee'),(29,NULL,NULL,'555','ffff','CCCCc','ccc','ss','dd','ee'),(30,NULL,NULL,'555','ffff','CCCCc','ccc','ss','dd','ee'),(31,NULL,NULL,'555','ffff','CCCCc','ccc','ss','dd','el');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_images`
--

DROP TABLE IF EXISTS `product_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_images` (
  `image_id` int NOT NULL AUTO_INCREMENT,
  `product_id` int NOT NULL,
  `image1_url` varchar(255) NOT NULL,
  `image2_url` varchar(255) NOT NULL,
  `image3_url` varchar(255) NOT NULL,
  `image4_url` varchar(255) DEFAULT NULL,
  `image5_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`image_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `product_images_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_images`
--

LOCK TABLES `product_images` WRITE;
/*!40000 ALTER TABLE `product_images` DISABLE KEYS */;
INSERT INTO `product_images` VALUES (1,1,'https://www.semrush.com/blog/what-is-a-url/#what-are-some-url-examples','https://www.example.com/blog/first-post','https://www.example.com/blog/first-post','https://www.example.com/blog/first-post','https://www.example.com/blog/first-post'),(2,2,'https://www.example.com/blog/first-post','https://www.example.com/blog/first-post','lk;kkkkkkk',NULL,NULL);
/*!40000 ALTER TABLE `product_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `product_id` int NOT NULL AUTO_INCREMENT,
  `product_name` varchar(45) NOT NULL,
  `category_id` int DEFAULT NULL,
  `description` varchar(45) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `seller_id` int DEFAULT NULL,
  `images` varchar(2048) DEFAULT NULL,
  `approval_status` enum('pending','approved','rejected') DEFAULT 'pending',
  `IsWishlistItem` tinyint(1) DEFAULT '0',
  `contact` int DEFAULT NULL,
  PRIMARY KEY (`product_id`),
  KEY `seller_id` (`seller_id`),
  KEY `category_id` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'h',NULL,NULL,NULL,NULL,NULL,'pending',0,NULL),(2,'kkk',NULL,NULL,NULL,NULL,NULL,'pending',0,NULL),(3,'lhd',NULL,NULL,NULL,NULL,NULL,'pending',0,NULL),(4,'jhj',NULL,NULL,NULL,NULL,NULL,'rejected',0,NULL),(5,'kgd',NULL,NULL,NULL,NULL,NULL,'rejected',0,NULL),(6,'ddd',NULL,NULL,NULL,NULL,NULL,'approved',0,NULL),(7,'book',NULL,'jffffb',55.00,5,'mmmmm','pending',0,555555),(8,'book',NULL,'jffffb',55.00,5,'mmmmm','pending',0,555555),(9,'book',NULL,'jfffb',55.00,5,'mmmmm','pending',0,555555),(10,'bo;;ok',NULL,'jfffb',55.00,5,'mmmmm','pending',0,555555),(11,'bo;;ok',NULL,'jfffb',55.00,5,'mmmmm','pending',0,555555),(12,'Sample Product',NULL,'This is a sample product.',100.00,1,'http://example.com/image.jpg','pending',0,1364),(13,'Sample Product',NULL,'This is a sample product.',100.00,7,'http://example.com/image.jpg','pending',0,1364),(14,'Sample Product',NULL,'This is a sample product.',100.00,7,'http://example.com/image.jpg','pending',0,1364),(15,'Sample Product',NULL,'This is a sample product.',100.00,1,'http://example.com/image.jpg','pending',0,1364),(16,'Sample Product',NULL,'This is a sample product.',100.00,4,'http://example.com/image.jpg','pending',0,1364),(17,'Sample Product',NULL,'This is a sample product.',100.00,4,'http://example.com/image.jpg','pending',0,1364),(18,'Sample Product',NULL,'This is a sample product.',100.00,1,'http://example.com/image.jpg','pending',0,555515),(19,'Sample Product',NULL,'This is a sample product.',100.00,1,'http://example.com/image.jpg','pending',0,555515),(20,'Sample Product',NULL,'This is a sample product.',100.00,1,'http://example.com/image.jpg','pending',0,555515);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
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
INSERT INTO `sessions` VALUES ('X8VWc0ivBty0GyEYM6qJF2VaiGFbxrVa',1716401363,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}');
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
  CONSTRAINT `users1_chk_1` CHECK ((`user_type` in (_utf8mb4'seller',_utf8mb4'buyer',_utf8mb4'admin'))),
  CONSTRAINT `users_chk` CHECK ((`user_type` in (_utf8mb4'seller',_utf8mb4'buyer',_utf8mb4'admin'))),
  CONSTRAINT `users_chk1` CHECK ((`user_type` in (_utf8mb4'seller',_utf8mb4'buyer',_utf8mb4'admin')))
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'dalia','dalia@gmail.com','$2b$10$CRQZ5KUMAAw1yN2zMG/U..rDzAG4oSMcdJ6ZWJsgDV9dSryPxU412','seller'),(2,'osama','d;kkk@gmail.com','$2b$10$/xAH3/mI4zB/123456789jj','seller'),(4,'dalia','daliay@gmail.com','555566','admin'),(5,'ahlam','ahlamhi@gmail.com','445568jjlk','seller'),(6,'aa','aai@gmail.com','1122334455aa1','seller'),(7,'aahlam','ah@gmail.com','$2b$10$8yVjXH.jbgw1w0JT5A6fRe4YP9qdzVMbcAitl.087xZfh60kawhh6','seller'),(9,'ola','olajj@gmail.com','ola12345','admin'),(12,'ola','olajllj@gmail.com','$2b$10$flsw2y/5B95KYf87YeGhx.zjGlfPALLJb0jbJdGVwVqaursZ4YAQK','admin'),(13,'tala','tala@gmail.com','$2b$10$7loaO.IhtYlwkrpVRgPp8.7yEizhulWDbaNayZsT1/eO6TAdFgnvC','seller'),(14,'talena','talena@gmail.com','$2b$10$dnh86iii.Ejfj95h4tnwOuJW3Ks83qH/xkubh8nY7ddFqbJ0Jn9y2','admin');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wishlist`
--

DROP TABLE IF EXISTS `wishlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wishlist` (
  `id` int NOT NULL AUTO_INCREMENT,
  `wish` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wishlist`
--

LOCK TABLES `wishlist` WRITE;
/*!40000 ALTER TABLE `wishlist` DISABLE KEYS */;
/*!40000 ALTER TABLE `wishlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wishlist_items`
--

DROP TABLE IF EXISTS `wishlist_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wishlist_items` (
  `wishlist_id` int NOT NULL,
  `product_id` int NOT NULL,
  PRIMARY KEY (`wishlist_id`,`product_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `wishlist_items_ibfk_1` FOREIGN KEY (`wishlist_id`) REFERENCES `wishlist` (`id`),
  CONSTRAINT `wishlist_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wishlist_items`
--

LOCK TABLES `wishlist_items` WRITE;
/*!40000 ALTER TABLE `wishlist_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `wishlist_items` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-21 22:44:22
