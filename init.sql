-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: localhost    Database: ecommerce_v2
-- ------------------------------------------------------
-- Server version	8.0.21
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cart`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `id` int NOT NULL AUTO_INCREMENT,
  `created_date` datetime(6) DEFAULT NULL,
  `quantity` int NOT NULL,
  `product_id` bigint DEFAULT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKg5uhi8vpsuy0lgloxk2h4w5o6` (`user_id`),
  KEY `FKpu4bcbluhsxagirmbdn7dilm5` (`product_id`),
  CONSTRAINT `FKg5uhi8vpsuy0lgloxk2h4w5o6` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `FKpu4bcbluhsxagirmbdn7dilm5` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--


--
-- Table structure for table `categories`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `category_name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` VALUES (1,'Electronics','Test description for electronics','https://media.istockphoto.com/id/166103292/photo/electronic-technician-holding-tweezers-and-assemblin-a-circuit-board.jpg?s=612x612&w=is&k=20&c=LwQmByjxk4Dl1Kp7x-CbRqaD9OoNIPpg-t2awopSlmk=');
INSERT INTO `categories` VALUES (2,'Kites','These are Kites','https://images.unsplash.com/photo-1600387822941-a6ac49b2f0a3?ixid=MXwxMjA3fDB8MHxzZWFyY2h8OHx8a2l0ZXN8ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60');
INSERT INTO `categories` VALUES (3,'Television','Television','https://images.unsplash.com/photo-1593359677879-a4bb92f829d1?ixid=MXwxMjA3fDB8MHxzZWFyY2h8NXx8dGVsZXZpc2lvbnxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60');
INSERT INTO `categories` VALUES (4,'Shoes','Shoes','https://images.unsplash.com/photo-1460353581641-37baddab0fa2?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MXx8c2hvZXN8ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60');
INSERT INTO `categories` VALUES (5,'Clothes','Clothes','https://as1.ftcdn.net/v2/jpg/02/10/85/26/1000_F_210852662_KWN4O1tjxIQt8axc2r82afdSwRSLVy7g.jpg');
INSERT INTO `categories` VALUES (6,'Kids','Kids space','https://as2.ftcdn.net/v2/jpg/02/00/06/97/1000_F_200069796_1AQBWuHrJGSuH8jjg2a0wrbc3z3hJxRA.jpg');
INSERT INTO `categories` VALUES (7,'Toys','Space for kids','https://as2.ftcdn.net/v2/jpg/03/24/42/21/1000_F_324422176_Lgn7NTeFyNaUKIDu0Ppls1u8zb8wsKS4.jpg');
INSERT INTO `categories` VALUES (8,'Games','Gamers rise up','https://images.unsplash.com/photo-1560529178-855fa2041193?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTd8fHRveXN8ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60');
INSERT INTO `categories` VALUES (9,'Awesome','This is awesome category','https://images.unsplash.com/photo-1545997281-2cfe4d4b740f?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTB8fHRveXN8ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60');
INSERT INTO `categories` VALUES (13,'Smartphones','This contains all smartphones','https://images.unsplash.com/photo-1510878933023-e2e2e3942fb0?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1051&q=80');
INSERT INTO `categories` VALUES (14,'Clocks','Collection of clocks','https://images.unsplash.com/photo-1585586463948-9e40851ed193?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80');
INSERT INTO `categories` VALUES (15,'Kites','This is a collection of kites','https://images.unsplash.com/photo-1534640881905-039ca1e21a81?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MXx8a2l0ZXN8ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60');
INSERT INTO `categories` VALUES (16,'Books','This section contains Books','https://images.unsplash.com/photo-1524578271613-d550eacf6090?ixid=MXwxMjA3fDB8MHxzZWFyY2h8M3x8Ym9va3N8ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60');
INSERT INTO `categories` VALUES (17,'Automobiles','Find all vehicles','https://images.unsplash.com/photo-1552519507-da3b142c6e3d?ixid=MXwxMjA3fDB8MHxzZWFyY2h8Mnx8Y2Fyc3xlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60');
INSERT INTO `categories` VALUES (18,'Bags','High Quality Bags','https://images.pexels.com/photos/1152077/pexels-photo-1152077.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1');
INSERT INTO `categories` VALUES (19,'Groceries','Find all your groceries here','https://images.unsplash.com/photo-1543168256-418811576931?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MXx8Z3JvY2VyaWVzfGVufDB8fDB8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60');
INSERT INTO `categories` VALUES (20,'Biscuits','Tasty Biscuits','https://images.unsplash.com/photo-1531685932387-e60fae5f6163?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTN8fGJpc2N1aXRzfGVufDB8fDB8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60');
INSERT INTO `categories` VALUES (21,'Cute Sweaters','Sweaters are great','https://media.istockphoto.com/id/1278802435/photo/sweater-yellow-color-isolated-on-white-trendy-womens-clothing-knitted-apparel.jpg?s=612x612&w=is&k=20&c=bEcSoE-AGWM16qIJikUrzQHLLaI69VLlM9y7a-WpyHE=');
INSERT INTO `categories` VALUES (22,'Camping','Camping gear','https://images.pexels.com/photos/2422265/pexels-photo-2422265.jpeg');

--
-- Table structure for table `orderitems`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orderitems` (
  `id` int NOT NULL AUTO_INCREMENT,
  `created_date` datetime(6) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `order_id` int DEFAULT NULL,
  `product_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKm3mp87f5ygbbfuqfdhc09y9a` (`order_id`),
  KEY `FKqu7dfdpbhltsgxfq2ahkdnyv5` (`product_id`),
  CONSTRAINT `FKm3mp87f5ygbbfuqfdhc09y9a` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  CONSTRAINT `FKqu7dfdpbhltsgxfq2ahkdnyv5` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderitems`
--


--
-- Table structure for table `orders`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `created_date` datetime(6) DEFAULT NULL,
  `session_id` varchar(255) DEFAULT NULL,
  `total_price` double DEFAULT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK32ql8ubntj5uh44ph9659tiih` (`user_id`),
  CONSTRAINT `FK32ql8ubntj5uh44ph9659tiih` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--


--
-- Table structure for table `products`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `imageurl` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `price` double NOT NULL,
  `category_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_category_id` (`category_id`),
  CONSTRAINT `fk_category_id` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

INSERT INTO `products` VALUES (1,'Microcontroller board for starters.','https://images.unsplash.com/photo-1608564697071-ddf911d81370?ixid=MXwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwzOHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60','Arduino UNO',500,9);
INSERT INTO `products` VALUES (2,'Highly accurate','https://images.unsplash.com/photo-1497997457905-3f85463eb0bc?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MXx8c2Vuc29yfGVufDB8fDB8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60','Ultrasonic sensor',200,2);
INSERT INTO `products` VALUES (3,'hello World','https://images.unsplash.com/photo-1609584862854-57387c661076?ixid=MXwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxNHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60','Hello World',100,1);
INSERT INTO `products` VALUES (4,'This is a Car','https://images.unsplash.com/photo-1600661653561-629509216228?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTl8fGV2fGVufDB8fDB8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60','Tesla Car',10000,17);
INSERT INTO `products` VALUES (5,'This is demo200','https://images.unsplash.com/photo-1602526211905-6adc54adb8d2?ixid=MXwxMjA3fDF8MHxlZGl0b3JpYWwtZmVlZHw5fHx8ZW58MHx8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60','demo200',50000,1);
INSERT INTO `products` VALUES (6,'This is a toy','https://images.unsplash.com/photo-1563396983906-b3795482a59a?ixid=MXwxMjA3fDB8MHxzZWFyY2h8OXx8dG95c3xlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60','Toy',200,3);
INSERT INTO `products` VALUES (7,'Demo','https://images.unsplash.com/photo-1469037784699-75dcff1cbf75?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MjZ8fHRveXN8ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60','Demo',89,5);
INSERT INTO `products` VALUES (8,'This is a great Toy','https://images.unsplash.com/photo-1517348159000-002b80abf80f?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MzV8fHRveXN8ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60','Toy',500,1);
INSERT INTO `products` VALUES (9,'This is a car','https://images.unsplash.com/photo-1502877338535-766e1452684a?ixid=MXwxMjA3fDB8MHxzZWFyY2h8Nnx8Y2FyfGVufDB8fDB8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60','Car',5000,1);
INSERT INTO `products` VALUES (10,'This is a Iphone','https://images.unsplash.com/photo-1556656793-08538906a9f8?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80','Iphone',1000,1);
INSERT INTO `products` VALUES (11,'This is a watch','https://images.unsplash.com/photo-1542496658-e33a6d0d50f6?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80','Watch',2000,1);
INSERT INTO `products` VALUES (12,'This is a clock','https://images.unsplash.com/photo-1563861826100-9cb868fdbe1c?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxzZWFyY2h8MXx8Y2xvY2t8ZW58MHx8MHw%3D&auto=format&fit=crop&w=500&q=60','Wall Clock',2000,14);
INSERT INTO `products` VALUES (13,'This is a TV','https://images.unsplash.com/photo-1571415060716-baff5f717c37?ixid=MXwxMjA3fDB8MHxzZWFyY2h8M3x8dHZ8ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60','LG TV',5000,3);
INSERT INTO `products` VALUES (14,'This is a Samsung Smartphone','https://images.unsplash.com/photo-1553179459-4514c0f52f41?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTR8fHNhbXN1bmclMjBzbWFydHBob25lfGVufDB8fDB8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60','Samsung Galaxy ',5000,13);
INSERT INTO `products` VALUES (15,'Fruits','https://images.unsplash.com/photo-1609257574707-a3114f91cefe?ixid=MXwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxNnx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60','Fruits',1500,2);
INSERT INTO `products` VALUES (16,'A great historical tamil novel by Amarar Kalki!','https://dwtr67e3ikfml.cloudfront.net/bookCovers/8d0aebe488c9389b799f9c153bc05717ce2fa45f','Ponniyin Selvan',2500,2);
INSERT INTO `products` VALUES (17,'This is a Historical clock','https://images.unsplash.com/photo-1415604934674-561df9abf539?ixid=MXwxMjA3fDB8MHxzZWFyY2h8OHx8Y2xvY2tzfGVufDB8fDB8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60','Ancient Clock',1000,14);
INSERT INTO `products` VALUES (18,'It\'s really big','https://image.shutterstock.com/image-photo/red-kite-flying-against-blue-600w-1087069373.jpg','Big Kite 2',450,2);

--
-- Table structure for table `tokens`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tokens` (
  `id` int NOT NULL AUTO_INCREMENT,
  `token` varchar(255) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `user_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `tokens_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tokens`
--


--
-- Table structure for table `users`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(50) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--


--
-- Table structure for table `wishlist`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wishlist` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned DEFAULT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `product_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`),
  KEY `FKtrd6335blsefl2gxpb8lr0gr7` (`user_id`),
  CONSTRAINT `FKtrd6335blsefl2gxpb8lr0gr7` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `wishlist_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wishlist`
--


--
-- Dumping routines for database 'ecommerce_v2'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-17 13:52:24
