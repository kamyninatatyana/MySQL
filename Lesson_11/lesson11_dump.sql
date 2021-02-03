-- MySQL dump 10.13  Distrib 8.0.23, for Linux (x86_64)
--
-- Host: localhost    Database: shop
-- ------------------------------------------------------
-- Server version	8.0.23-0ubuntu0.20.04.1

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
-- Table structure for table `catalogs`
--

DROP TABLE IF EXISTS `catalogs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalogs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT 'Название раздела',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `unique_name` (`name`(10))
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Разделы интернет-магазина';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogs`
--

LOCK TABLES `catalogs` WRITE;
/*!40000 ALTER TABLE `catalogs` DISABLE KEYS */;
INSERT INTO `catalogs` VALUES (1,'Процессоры'),(2,'Материнские платы'),(3,'Видеокарты'),(4,'Жесткие диски'),(5,'Оперативная память'),(6,'Прочее');
/*!40000 ALTER TABLE `catalogs` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `catalogs_insert` AFTER INSERT ON `catalogs` FOR EACH ROW BEGIN
    INSERT INTO logs VALUES (NULL, "catalogs", NEW.id, NEW.name, DEFAULT);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `cities`
--

DROP TABLE IF EXISTS `cities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cities` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `label` char(15) NOT NULL,
  `name` char(15) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cities`
--

LOCK TABLES `cities` WRITE;
/*!40000 ALTER TABLE `cities` DISABLE KEYS */;
INSERT INTO `cities` VALUES (1,'moscow','Москва'),(2,'irkutsk','Иркутск'),(3,'novgorod','Новгород'),(4,'kazan','Казань'),(5,'omsk','Омск');
/*!40000 ALTER TABLE `cities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discounts`
--

DROP TABLE IF EXISTS `discounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `discounts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned DEFAULT NULL,
  `product_id` int unsigned DEFAULT NULL,
  `discount` float unsigned DEFAULT NULL COMMENT 'Величина скидки от 0.0 до 1.0',
  `started_at` datetime DEFAULT NULL,
  `finished_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `index_of_user_id` (`user_id`),
  KEY `index_of_product_id` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Скидки';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discounts`
--

LOCK TABLES `discounts` WRITE;
/*!40000 ALTER TABLE `discounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `discounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flights`
--

DROP TABLE IF EXISTS `flights`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `flights` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `flight_from` char(15) NOT NULL,
  `flight_to` char(15) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flights`
--

LOCK TABLES `flights` WRITE;
/*!40000 ALTER TABLE `flights` DISABLE KEYS */;
INSERT INTO `flights` VALUES (1,'moscow','omsk'),(2,'novgorod','kazan'),(3,'irkutsk','moscow'),(4,'omsk','irkutsk'),(5,'moscow','kazan');
/*!40000 ALTER TABLE `flights` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `list`
--

DROP TABLE IF EXISTS `list`;
/*!50001 DROP VIEW IF EXISTS `list`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `list` AS SELECT 
 1 AS `product`,
 1 AS `catalogs`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `logs`
--

DROP TABLE IF EXISTS `logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `logs` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `table_name` varchar(30) NOT NULL,
  `pk_id` int unsigned NOT NULL,
  `field_content` varchar(100) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=ARCHIVE AUTO_INCREMENT=104 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logs`
--

LOCK TABLES `logs` WRITE;
/*!40000 ALTER TABLE `logs` DISABLE KEYS */;
INSERT INTO `logs` VALUES (1,'users',7,'Константин','2021-02-03 23:01:52'),(2,'catalogs',6,'Прочее','2021-02-03 23:03:14'),(3,'products',17,'Что-то','2021-02-03 23:04:33'),(4,'users',8,'user 1','2021-02-03 23:31:06'),(5,'users',9,'user 2','2021-02-03 23:31:06'),(6,'users',10,'user 3','2021-02-03 23:31:06'),(7,'users',11,'user 4','2021-02-03 23:31:06'),(8,'users',12,'user 5','2021-02-03 23:31:06'),(9,'users',13,'user 6','2021-02-03 23:31:06'),(10,'users',14,'user 7','2021-02-03 23:31:06'),(11,'users',15,'user 8','2021-02-03 23:31:06'),(12,'users',16,'user 9','2021-02-03 23:31:06'),(13,'users',17,'user 10','2021-02-03 23:31:06'),(14,'users',18,'user 11','2021-02-03 23:31:06'),(15,'users',19,'user 12','2021-02-03 23:31:06'),(16,'users',20,'user 13','2021-02-03 23:31:06'),(17,'users',21,'user 14','2021-02-03 23:31:06'),(18,'users',22,'user 15','2021-02-03 23:31:06'),(19,'users',23,'user 16','2021-02-03 23:31:06'),(20,'users',24,'user 17','2021-02-03 23:31:06'),(21,'users',25,'user 18','2021-02-03 23:31:06'),(22,'users',26,'user 19','2021-02-03 23:31:06'),(23,'users',27,'user 20','2021-02-03 23:31:06'),(24,'users',28,'user 21','2021-02-03 23:31:06'),(25,'users',29,'user 22','2021-02-03 23:31:06'),(26,'users',30,'user 23','2021-02-03 23:31:06'),(27,'users',31,'user 24','2021-02-03 23:31:06'),(28,'users',32,'user 25','2021-02-03 23:31:06'),(29,'users',33,'user 26','2021-02-03 23:31:06'),(30,'users',34,'user 27','2021-02-03 23:31:06'),(31,'users',35,'user 28','2021-02-03 23:31:06'),(32,'users',36,'user 29','2021-02-03 23:31:06'),(33,'users',37,'user 30','2021-02-03 23:31:06'),(34,'users',38,'user 31','2021-02-03 23:31:06'),(35,'users',39,'user 32','2021-02-03 23:31:06'),(36,'users',40,'user 33','2021-02-03 23:31:06'),(37,'users',41,'user 34','2021-02-03 23:31:06'),(38,'users',42,'user 35','2021-02-03 23:31:06'),(39,'users',43,'user 36','2021-02-03 23:31:06'),(40,'users',44,'user 37','2021-02-03 23:31:06'),(41,'users',45,'user 38','2021-02-03 23:31:06'),(42,'users',46,'user 39','2021-02-03 23:31:06'),(43,'users',47,'user 40','2021-02-03 23:31:06'),(44,'users',48,'user 41','2021-02-03 23:31:06'),(45,'users',49,'user 42','2021-02-03 23:31:06'),(46,'users',50,'user 43','2021-02-03 23:31:06'),(47,'users',51,'user 44','2021-02-03 23:31:06'),(48,'users',52,'user 45','2021-02-03 23:31:06'),(49,'users',53,'user 46','2021-02-03 23:31:06'),(50,'users',54,'user 47','2021-02-03 23:31:06'),(51,'users',55,'user 48','2021-02-03 23:31:06'),(52,'users',56,'user 49','2021-02-03 23:31:06'),(53,'users',57,'user 50','2021-02-03 23:31:06'),(54,'users',58,'user 51','2021-02-03 23:31:06'),(55,'users',59,'user 52','2021-02-03 23:31:06'),(56,'users',60,'user 53','2021-02-03 23:31:06'),(57,'users',61,'user 54','2021-02-03 23:31:06'),(58,'users',62,'user 55','2021-02-03 23:31:06'),(59,'users',63,'user 56','2021-02-03 23:31:06'),(60,'users',64,'user 57','2021-02-03 23:31:06'),(61,'users',65,'user 58','2021-02-03 23:31:06'),(62,'users',66,'user 59','2021-02-03 23:31:06'),(63,'users',67,'user 60','2021-02-03 23:31:06'),(64,'users',68,'user 61','2021-02-03 23:31:06'),(65,'users',69,'user 62','2021-02-03 23:31:06'),(66,'users',70,'user 63','2021-02-03 23:31:06'),(67,'users',71,'user 64','2021-02-03 23:31:06'),(68,'users',72,'user 65','2021-02-03 23:31:06'),(69,'users',73,'user 66','2021-02-03 23:31:06'),(70,'users',74,'user 67','2021-02-03 23:31:06'),(71,'users',75,'user 68','2021-02-03 23:31:06'),(72,'users',76,'user 69','2021-02-03 23:31:06'),(73,'users',77,'user 70','2021-02-03 23:31:06'),(74,'users',78,'user 71','2021-02-03 23:31:06'),(75,'users',79,'user 72','2021-02-03 23:31:06'),(76,'users',80,'user 73','2021-02-03 23:31:06'),(77,'users',81,'user 74','2021-02-03 23:31:06'),(78,'users',82,'user 75','2021-02-03 23:31:06'),(79,'users',83,'user 76','2021-02-03 23:31:06'),(80,'users',84,'user 77','2021-02-03 23:31:06'),(81,'users',85,'user 78','2021-02-03 23:31:06'),(82,'users',86,'user 79','2021-02-03 23:31:06'),(83,'users',87,'user 80','2021-02-03 23:31:06'),(84,'users',88,'user 81','2021-02-03 23:31:06'),(85,'users',89,'user 82','2021-02-03 23:31:06'),(86,'users',90,'user 83','2021-02-03 23:31:06'),(87,'users',91,'user 84','2021-02-03 23:31:06'),(88,'users',92,'user 85','2021-02-03 23:31:06'),(89,'users',93,'user 86','2021-02-03 23:31:06'),(90,'users',94,'user 87','2021-02-03 23:31:06'),(91,'users',95,'user 88','2021-02-03 23:31:06'),(92,'users',96,'user 89','2021-02-03 23:31:07'),(93,'users',97,'user 90','2021-02-03 23:31:07'),(94,'users',98,'user 91','2021-02-03 23:31:07'),(95,'users',99,'user 92','2021-02-03 23:31:07'),(96,'users',100,'user 93','2021-02-03 23:31:07'),(97,'users',101,'user 94','2021-02-03 23:31:07'),(98,'users',102,'user 95','2021-02-03 23:31:07'),(99,'users',103,'user 96','2021-02-03 23:31:07'),(100,'users',104,'user 97','2021-02-03 23:31:07'),(101,'users',105,'user 98','2021-02-03 23:31:07'),(102,'users',106,'user 99','2021-02-03 23:31:07'),(103,'users',107,'user 100','2021-02-03 23:31:07');
/*!40000 ALTER TABLE `logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `index_of_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Заказы';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,3,'2021-01-12 15:27:12','2021-01-12 15:27:12'),(2,2,'2021-01-12 15:27:12','2021-01-12 15:27:12'),(3,5,'2021-01-12 15:27:12','2021-01-12 15:27:12'),(4,2,'2021-01-12 15:27:12','2021-01-12 15:27:12'),(5,2,'2021-01-12 15:27:12','2021-01-12 15:27:12'),(6,1,'2021-01-12 15:27:12','2021-01-12 15:27:12'),(7,1,'2021-01-12 15:27:12','2021-01-12 15:27:12'),(8,4,'2021-01-12 15:27:12','2021-01-12 15:27:12'),(9,1,'2021-01-12 15:27:12','2021-01-12 15:27:12'),(10,4,'2021-01-12 15:27:12','2021-01-12 15:27:12'),(11,3,'2021-01-12 15:27:12','2021-01-12 15:27:12'),(12,5,'2021-01-12 15:27:12','2021-01-12 15:27:12'),(13,1,'2021-01-12 15:27:12','2021-01-12 15:27:12'),(14,3,'2021-01-12 15:27:12','2021-01-12 15:27:12'),(15,2,'2021-01-12 15:27:12','2021-01-12 15:27:12'),(16,2,'2021-01-12 15:27:12','2021-01-12 15:27:12'),(17,3,'2021-01-12 15:27:12','2021-01-12 15:27:12'),(18,5,'2021-01-12 15:27:12','2021-01-12 15:27:12'),(19,4,'2021-01-12 15:27:12','2021-01-12 15:27:12'),(20,3,'2021-01-12 15:27:12','2021-01-12 15:27:12');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders_products`
--

DROP TABLE IF EXISTS `orders_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders_products` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int unsigned DEFAULT NULL,
  `product_id` int unsigned DEFAULT NULL,
  `total` int unsigned DEFAULT '1' COMMENT 'Количество заказанных товарных позиций',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Состав заказа';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders_products`
--

LOCK TABLES `orders_products` WRITE;
/*!40000 ALTER TABLE `orders_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT 'Название',
  `description` text COMMENT 'Описание',
  `price` decimal(11,2) DEFAULT NULL COMMENT 'Цена',
  `catalog_id` int unsigned DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `index_of_catalog_id` (`catalog_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Товарные позиции';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Intel Core i3-8100 1',NULL,7890.00,1,'2018-08-01 00:00:00','2021-01-24 14:32:00'),(2,'Intel Core i5-7400','Процессор для настольных персональных компьютеров, основанных на платформе Intel.',12700.00,1,'2020-12-26 22:20:12','2020-12-26 22:20:12'),(3,'AMD FX-8320E','Процессор для настольных персональных компьютеров, основанных на платформе AMD.',4780.00,1,'2020-12-26 22:20:12','2020-12-26 22:20:12'),(4,'AMD FX-8320','Процессор для настольных персональных компьютеров, основанных на платформе AMD.',7120.00,1,'2018-08-04 00:00:00','2021-01-22 17:21:51'),(5,'ASUS ROG MAXIMUS X HERO','Материнская плата ASUS ROG MAXIMUS X HERO, Z370, Socket 1151-V2, DDR4, ATX',19310.00,2,'2020-12-26 22:20:12','2020-12-26 22:20:12'),(6,'Gigabyte H310M S2H','Материнская плата Gigabyte H310M S2H, H310, Socket 1151-V2, DDR4, mATX',4790.00,2,'2020-12-26 22:20:12','2020-12-26 22:20:12'),(7,'MSI B250M GAMING PRO','Материнская плата MSI B250M GAMING PRO, B250, Socket 1151, DDR4, mATX',5060.00,2,'2020-12-26 22:20:12','2020-12-26 22:20:12'),(8,'Intel Core i3-8100','Процессор для настольных персональных компьютеров, основанных на платформе Intel.',7890.00,1,'2020-12-26 23:25:09','2020-12-26 23:25:09'),(9,'Intel Core i5-7400','Процессор для настольных персональных компьютеров, основанных на платформе Intel.',12700.00,1,'2020-12-26 23:25:09','2020-12-26 23:25:09'),(10,'AMD FX-8320E','Процессор для настольных персональных компьютеров, основанных на платформе AMD.',4780.00,1,'2020-12-26 23:25:09','2020-12-26 23:25:09'),(11,'AMD FX-8320','Процессор для настольных персональных компьютеров, основанных на платформе AMD.',7120.00,1,'2020-12-26 23:25:09','2020-12-26 23:25:09'),(12,'ASUS ROG MAXIMUS X HERO','Материнская плата ASUS ROG MAXIMUS X HERO, Z370, Socket 1151-V2, DDR4, ATX',19310.00,2,'2020-12-26 23:25:09','2020-12-26 23:25:09'),(13,'Gigabyte H310M S2H','Материнская плата Gigabyte H310M S2H, H310, Socket 1151-V2, DDR4, mATX',4790.00,2,'2020-12-26 23:25:09','2020-12-26 23:25:09'),(14,'MSI B250M GAMING PRO','Материнская плата MSI B250M GAMING PRO, B250, Socket 1151, DDR4, mATX',5060.00,2,'2020-12-26 23:25:09','2020-12-26 23:25:09'),(15,'EVGA X299 DARK','Материнская плата EVGA X299 DARK',34990.00,2,'2021-01-24 14:37:15','2021-01-24 14:37:15'),(16,NULL,'Материнская плата EVGA X299 DARK',34990.00,2,'2021-01-24 14:38:05','2021-01-24 14:38:05'),(17,'Что-то',NULL,NULL,NULL,'2021-02-03 23:04:33','2021-02-03 23:04:33');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `if_null_on_insert` BEFORE INSERT ON `products` FOR EACH ROW BEGIN 
	IF NEW.name IS NULL AND NEW.description IS NULL THEN 
	SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Поля name и description не могут одновременно иметь значение NULL'; 
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `products_insert` AFTER INSERT ON `products` FOR EACH ROW BEGIN
  INSERT INTO logs VALUES (NULL, "products", NEW.id, NEW.name, DEFAULT);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `if_null_on_update` BEFORE UPDATE ON `products` FOR EACH ROW BEGIN 
	IF NEW.name IS NULL AND NEW.description IS NULL THEN 
	SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Поля name и description не могут одновременно иметь значение NULL'; 
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `storehouses`
--

DROP TABLE IF EXISTS `storehouses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `storehouses` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT 'Название',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Склады';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `storehouses`
--

LOCK TABLES `storehouses` WRITE;
/*!40000 ALTER TABLE `storehouses` DISABLE KEYS */;
INSERT INTO `storehouses` VALUES (1,'Склад 1','2020-12-27 17:53:39','2020-12-27 17:53:39'),(2,'Склад 2','2020-12-27 17:53:39','2020-12-27 17:53:39'),(3,'Склад 3','2020-12-27 17:53:39','2020-12-27 17:53:39');
/*!40000 ALTER TABLE `storehouses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `storehouses_products`
--

DROP TABLE IF EXISTS `storehouses_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `storehouses_products` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `storehouse_id` int unsigned DEFAULT NULL,
  `product_id` int unsigned DEFAULT NULL,
  `value` int unsigned DEFAULT NULL COMMENT 'Запас товарной позиции на складе',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Запасы на складе';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `storehouses_products`
--

LOCK TABLES `storehouses_products` WRITE;
/*!40000 ALTER TABLE `storehouses_products` DISABLE KEYS */;
INSERT INTO `storehouses_products` VALUES (1,1,1,9,'2020-12-27 18:05:51','2020-12-27 18:05:51'),(2,1,2,0,'2020-12-27 18:05:51','2020-12-27 18:05:51'),(3,1,3,9,'2020-12-27 18:05:51','2020-12-27 18:05:51'),(4,1,4,8,'2020-12-27 18:05:51','2020-12-27 18:05:51'),(5,1,5,3,'2020-12-27 18:05:51','2020-12-27 18:05:51'),(6,1,6,2,'2020-12-27 18:05:51','2020-12-27 18:05:51'),(7,1,7,0,'2020-12-27 18:05:51','2020-12-27 18:05:51'),(8,2,1,4,'2020-12-27 18:05:51','2020-12-27 18:05:51'),(9,2,2,0,'2020-12-27 18:05:51','2020-12-27 18:05:51'),(10,2,3,4,'2020-12-27 18:05:51','2020-12-27 18:05:51'),(11,2,4,3,'2020-12-27 18:05:51','2020-12-27 18:05:51'),(12,2,5,2,'2020-12-27 18:05:51','2020-12-27 18:05:51'),(13,2,6,2,'2020-12-27 18:05:51','2020-12-27 18:05:51'),(14,2,7,0,'2020-12-27 18:05:51','2020-12-27 18:05:51'),(15,3,1,5,'2020-12-27 18:05:51','2020-12-27 18:05:51'),(16,3,2,0,'2020-12-27 18:05:51','2020-12-27 18:05:51'),(17,3,3,1,'2020-12-27 18:05:51','2020-12-27 18:05:51'),(18,3,4,7,'2020-12-27 18:05:51','2020-12-27 18:05:51'),(19,3,5,10,'2020-12-27 18:05:51','2020-12-27 18:05:51'),(20,3,6,9,'2020-12-27 18:05:51','2020-12-27 18:05:51'),(21,3,7,0,'2020-12-27 18:05:51','2020-12-27 18:05:51');
/*!40000 ALTER TABLE `storehouses_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test_table`
--

DROP TABLE IF EXISTS `test_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `test_table` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Тестовая таблица для удаления старых записей';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test_table`
--

LOCK TABLES `test_table` WRITE;
/*!40000 ALTER TABLE `test_table` DISABLE KEYS */;
INSERT INTO `test_table` VALUES (38,'2014-08-23 14:12:29'),(39,'2020-09-19 14:12:29'),(40,'2018-08-07 14:12:29'),(41,'2019-10-07 14:12:29'),(42,'2011-12-20 14:12:29');
/*!40000 ALTER TABLE `test_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT 'Имя покупателя',
  `birthday_at` date DEFAULT NULL COMMENT 'Дата рождения',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=108 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Покупатели';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Геннадий','1990-10-05','2020-12-26 22:37:52','2020-12-26 22:37:52'),(2,'Наталья','1984-11-12','2020-12-26 22:37:52','2020-12-26 22:37:52'),(3,'Александр','1985-05-20','2020-12-26 22:37:52','2020-12-26 22:37:52'),(4,'Сергей','1988-02-14','2020-12-26 22:37:52','2020-12-26 22:37:52'),(5,'Иван','1998-01-12','2020-12-26 22:37:52','2020-12-26 22:37:52'),(6,'Мария','1992-08-29','2020-12-26 22:37:52','2020-12-26 22:37:52'),(7,'Константин','2001-01-01','2021-02-03 23:01:52','2021-02-03 23:01:52'),(8,'user 1',NULL,'2021-02-03 23:31:06','2021-02-03 23:31:06'),(9,'user 2',NULL,'2021-02-03 23:31:06','2021-02-03 23:31:06'),(10,'user 3',NULL,'2021-02-03 23:31:06','2021-02-03 23:31:06'),(11,'user 4',NULL,'2021-02-03 23:31:06','2021-02-03 23:31:06'),(12,'user 5',NULL,'2021-02-03 23:31:06','2021-02-03 23:31:06'),(13,'user 6',NULL,'2021-02-03 23:31:06','2021-02-03 23:31:06'),(14,'user 7',NULL,'2021-02-03 23:31:06','2021-02-03 23:31:06'),(15,'user 8',NULL,'2021-02-03 23:31:06','2021-02-03 23:31:06'),(16,'user 9',NULL,'2021-02-03 23:31:06','2021-02-03 23:31:06'),(17,'user 10',NULL,'2021-02-03 23:31:06','2021-02-03 23:31:06'),(18,'user 11',NULL,'2021-02-03 23:31:06','2021-02-03 23:31:06'),(19,'user 12',NULL,'2021-02-03 23:31:06','2021-02-03 23:31:06'),(20,'user 13',NULL,'2021-02-03 23:31:06','2021-02-03 23:31:06'),(21,'user 14',NULL,'2021-02-03 23:31:06','2021-02-03 23:31:06'),(22,'user 15',NULL,'2021-02-03 23:31:06','2021-02-03 23:31:06'),(23,'user 16',NULL,'2021-02-03 23:31:06','2021-02-03 23:31:06'),(24,'user 17',NULL,'2021-02-03 23:31:06','2021-02-03 23:31:06'),(25,'user 18',NULL,'2021-02-03 23:31:06','2021-02-03 23:31:06'),(26,'user 19',NULL,'2021-02-03 23:31:06','2021-02-03 23:31:06'),(27,'user 20',NULL,'2021-02-03 23:31:06','2021-02-03 23:31:06'),(28,'user 21',NULL,'2021-02-03 23:31:06','2021-02-03 23:31:06'),(29,'user 22',NULL,'2021-02-03 23:31:06','2021-02-03 23:31:06'),(30,'user 23',NULL,'2021-02-03 23:31:06','2021-02-03 23:31:06'),(31,'user 24',NULL,'2021-02-03 23:31:06','2021-02-03 23:31:06'),(32,'user 25',NULL,'2021-02-03 23:31:06','2021-02-03 23:31:06'),(33,'user 26',NULL,'2021-02-03 23:31:06','2021-02-03 23:31:06'),(34,'user 27',NULL,'2021-02-03 23:31:06','2021-02-03 23:31:06'),(35,'user 28',NULL,'2021-02-03 23:31:06','2021-02-03 23:31:06'),(36,'user 29',NULL,'2021-02-03 23:31:06','2021-02-03 23:31:06'),(37,'user 30',NULL,'2021-02-03 23:31:06','2021-02-03 23:31:06'),(38,'user 31',NULL,'2021-02-03 23:31:06','2021-02-03 23:31:06'),(39,'user 32',NULL,'2021-02-03 23:31:06','2021-02-03 23:31:06'),(40,'user 33',NULL,'2021-02-03 23:31:06','2021-02-03 23:31:06'),(41,'user 34',NULL,'2021-02-03 23:31:06','2021-02-03 23:31:06'),(42,'user 35',NULL,'2021-02-03 23:31:06','2021-02-03 23:31:06'),(43,'user 36',NULL,'2021-02-03 23:31:06','2021-02-03 23:31:06'),(44,'user 37',NULL,'2021-02-03 23:31:06','2021-02-03 23:31:06'),(45,'user 38',NULL,'2021-02-03 23:31:06','2021-02-03 23:31:06'),(46,'user 39',NULL,'2021-02-03 23:31:06','2021-02-03 23:31:06'),(47,'user 40',NULL,'2021-02-03 23:31:06','2021-02-03 23:31:06'),(48,'user 41',NULL,'2021-02-03 23:31:06','2021-02-03 23:31:06'),(49,'user 42',NULL,'2021-02-03 23:31:06','2021-02-03 23:31:06'),(50,'user 43',NULL,'2021-02-03 23:31:06','2021-02-03 23:31:06'),(51,'user 44',NULL,'2021-02-03 23:31:06','2021-02-03 23:31:06'),(52,'user 45',NULL,'2021-02-03 23:31:06','2021-02-03 23:31:06'),(53,'user 46',NULL,'2021-02-03 23:31:06','2021-02-03 23:31:06'),(54,'user 47',NULL,'2021-02-03 23:31:06','2021-02-03 23:31:06'),(55,'user 48',NULL,'2021-02-03 23:31:06','2021-02-03 23:31:06'),(56,'user 49',NULL,'2021-02-03 23:31:06','2021-02-03 23:31:06'),(57,'user 50',NULL,'2021-02-03 23:31:06','2021-02-03 23:31:06'),(58,'user 51',NULL,'2021-02-03 23:31:06','2021-02-03 23:31:06'),(59,'user 52',NULL,'2021-02-03 23:31:06','2021-02-03 23:31:06'),(60,'user 53',NULL,'2021-02-03 23:31:06','2021-02-03 23:31:06'),(61,'user 54',NULL,'2021-02-03 23:31:06','2021-02-03 23:31:06'),(62,'user 55',NULL,'2021-02-03 23:31:06','2021-02-03 23:31:06'),(63,'user 56',NULL,'2021-02-03 23:31:06','2021-02-03 23:31:06'),(64,'user 57',NULL,'2021-02-03 23:31:06','2021-02-03 23:31:06'),(65,'user 58',NULL,'2021-02-03 23:31:06','2021-02-03 23:31:06'),(66,'user 59',NULL,'2021-02-03 23:31:06','2021-02-03 23:31:06'),(67,'user 60',NULL,'2021-02-03 23:31:06','2021-02-03 23:31:06'),(68,'user 61',NULL,'2021-02-03 23:31:06','2021-02-03 23:31:06'),(69,'user 62',NULL,'2021-02-03 23:31:06','2021-02-03 23:31:06'),(70,'user 63',NULL,'2021-02-03 23:31:06','2021-02-03 23:31:06'),(71,'user 64',NULL,'2021-02-03 23:31:06','2021-02-03 23:31:06'),(72,'user 65',NULL,'2021-02-03 23:31:06','2021-02-03 23:31:06'),(73,'user 66',NULL,'2021-02-03 23:31:06','2021-02-03 23:31:06'),(74,'user 67',NULL,'2021-02-03 23:31:06','2021-02-03 23:31:06'),(75,'user 68',NULL,'2021-02-03 23:31:06','2021-02-03 23:31:06'),(76,'user 69',NULL,'2021-02-03 23:31:06','2021-02-03 23:31:06'),(77,'user 70',NULL,'2021-02-03 23:31:06','2021-02-03 23:31:06'),(78,'user 71',NULL,'2021-02-03 23:31:06','2021-02-03 23:31:06'),(79,'user 72',NULL,'2021-02-03 23:31:06','2021-02-03 23:31:06'),(80,'user 73',NULL,'2021-02-03 23:31:06','2021-02-03 23:31:06'),(81,'user 74',NULL,'2021-02-03 23:31:06','2021-02-03 23:31:06'),(82,'user 75',NULL,'2021-02-03 23:31:06','2021-02-03 23:31:06'),(83,'user 76',NULL,'2021-02-03 23:31:06','2021-02-03 23:31:06'),(84,'user 77',NULL,'2021-02-03 23:31:06','2021-02-03 23:31:06'),(85,'user 78',NULL,'2021-02-03 23:31:06','2021-02-03 23:31:06'),(86,'user 79',NULL,'2021-02-03 23:31:06','2021-02-03 23:31:06'),(87,'user 80',NULL,'2021-02-03 23:31:06','2021-02-03 23:31:06'),(88,'user 81',NULL,'2021-02-03 23:31:06','2021-02-03 23:31:06'),(89,'user 82',NULL,'2021-02-03 23:31:06','2021-02-03 23:31:06'),(90,'user 83',NULL,'2021-02-03 23:31:06','2021-02-03 23:31:06'),(91,'user 84',NULL,'2021-02-03 23:31:06','2021-02-03 23:31:06'),(92,'user 85',NULL,'2021-02-03 23:31:06','2021-02-03 23:31:06'),(93,'user 86',NULL,'2021-02-03 23:31:06','2021-02-03 23:31:06'),(94,'user 87',NULL,'2021-02-03 23:31:06','2021-02-03 23:31:06'),(95,'user 88',NULL,'2021-02-03 23:31:06','2021-02-03 23:31:06'),(96,'user 89',NULL,'2021-02-03 23:31:07','2021-02-03 23:31:07'),(97,'user 90',NULL,'2021-02-03 23:31:07','2021-02-03 23:31:07'),(98,'user 91',NULL,'2021-02-03 23:31:07','2021-02-03 23:31:07'),(99,'user 92',NULL,'2021-02-03 23:31:07','2021-02-03 23:31:07'),(100,'user 93',NULL,'2021-02-03 23:31:07','2021-02-03 23:31:07'),(101,'user 94',NULL,'2021-02-03 23:31:07','2021-02-03 23:31:07'),(102,'user 95',NULL,'2021-02-03 23:31:07','2021-02-03 23:31:07'),(103,'user 96',NULL,'2021-02-03 23:31:07','2021-02-03 23:31:07'),(104,'user 97',NULL,'2021-02-03 23:31:07','2021-02-03 23:31:07'),(105,'user 98',NULL,'2021-02-03 23:31:07','2021-02-03 23:31:07'),(106,'user 99',NULL,'2021-02-03 23:31:07','2021-02-03 23:31:07'),(107,'user 100',NULL,'2021-02-03 23:31:07','2021-02-03 23:31:07');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `users_insert` AFTER INSERT ON `users` FOR EACH ROW BEGIN
    INSERT INTO logs VALUES (NULL, "users", NEW.id, NEW.name, DEFAULT);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `list`
--

/*!50001 DROP VIEW IF EXISTS `list`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `list` AS select `p`.`name` AS `product`,`c`.`name` AS `catalogs` from (`products` `p` left join `catalogs` `c` on((`c`.`id` = `p`.`catalog_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-02-04  0:03:03
