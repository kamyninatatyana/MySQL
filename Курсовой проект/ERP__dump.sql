-- MySQL dump 10.13  Distrib 8.0.23, for Linux (x86_64)
--
-- Host: localhost    Database: ERP
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
-- Table structure for table `articles`
--

DROP TABLE IF EXISTS `articles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `articles` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `alpha_code` char(1) NOT NULL COMMENT 'Буквенная кодировка для товарной позиции',
  `num_code` char(10) NOT NULL COMMENT 'Цифровая кодировка для товарной позиции',
  `article_name` varchar(50) DEFAULT NULL COMMENT 'Наименование товарной позиции',
  `unit` char(3) NOT NULL COMMENT 'Единицы измерения товарной позиции',
  `analyt_group1` varchar(50) DEFAULT NULL COMMENT 'Необязательное поле для аналитической группировки',
  `analyt_group2` varchar(50) DEFAULT NULL COMMENT 'Необязательное поле для создания аналитической группировки',
  PRIMARY KEY (`alpha_code`,`num_code`),
  UNIQUE KEY `id` (`id`),
  KEY `articles_unit_fk` (`unit`),
  CONSTRAINT `articles_unit_fk` FOREIGN KEY (`unit`) REFERENCES `units` (`short_name`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Справочник товарных позиций (СиМ и ГП)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articles`
--

LOCK TABLES `articles` WRITE;
/*!40000 ALTER TABLE `articles` DISABLE KEYS */;
INSERT INTO `articles` VALUES (1,'A','1','Печенье овсяное Овсянкин класс 230гр','КГ','Бренд Овсянкин','Печенье овсяное'),(10,'A','10','Печенье творожное Сырник с изюмом 180гр','КГ','Бренд Сырник','Печенье творожное'),(11,'A','11','Печенье творожное весовое','КГ','Весовое','Печенье творожное'),(2,'A','2','Печенье овсяное Овсянкин с клюквой 230гр','КГ','Бренд Овсянкин','Печенье овсяное'),(3,'A','3','Печенье овсяное Овсянкин с изюмом 230гр','КГ','Бренд Овсянкин','Печенье овсяное'),(4,'A','4','Печенье сдобное Добрянкин класс 210гр','КГ','Бренд Добрянкин','Печенье сдобное'),(5,'A','5','Печенье сдобное Добрянкин с шокол 210гр','КГ','Бренд Добрянкин','Печенье сдобное'),(6,'A','6','Печенье сдобное Добрянкин с карам 210гр','КГ','Бренд Добрянкин','Печенье сдобное'),(7,'A','7','Печенье овсяное весовое','КГ','Весовое','Печенье овсяное'),(8,'A','8','Печенье сдобное весовое','КГ','Весовое','Печенье сдобное'),(9,'A','9','Печенье творожное Сырник класс 180гр','КГ','Бренд Сырник','Печенье творожное'),(12,'R','1','Мука пшеничная','КГ','Мука и крупы','Мука'),(13,'R','2','Сахар','КГ','Сахар и сахаристые вещества','Сахар'),(14,'R','3','Жир кондитерский','КГ','Масла и жиры','Жиры животные'),(15,'R','4','Масло сливочное','КГ','Масла и жиры','Жиры животные'),(16,'R','5','Творог','КГ','Молочные и кисломолочные продукты','Кисломолочные продукты'),(17,'R','6','Клюква','КГ','Добавки','Ягоды'),(18,'R','7','Изюм','КГ','Добавки','Сухофрукты'),(19,'R','8','Шоколад','КГ','Добавки','Шоколад и какао'),(20,'R','9','Карамель','КГ','Добавки','Карамель');
/*!40000 ALTER TABLE `articles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `material_usage`
--

DROP TABLE IF EXISTS `material_usage`;
/*!50001 DROP VIEW IF EXISTS `material_usage`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `material_usage` AS SELECT 
 1 AS `material`,
 1 AS `material_usage`,
 1 AS `unicode`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `prices`
--

DROP TABLE IF EXISTS `prices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prices` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `alpha_code` char(1) NOT NULL COMMENT 'Буквенный код ТП',
  `num_code` char(10) NOT NULL COMMENT 'Цифровой код ТП',
  `article_unit_id` int unsigned NOT NULL COMMENT 'ID ЕИ для наименования',
  `price` float DEFAULT NULL COMMENT 'Цена за единицу измерения',
  `price_unit_id` int unsigned NOT NULL COMMENT 'ID ЕИ для цены',
  PRIMARY KEY (`id`),
  KEY `prices_article_code_fk` (`alpha_code`,`num_code`),
  KEY `prices_article_unit_id_fk` (`article_unit_id`),
  KEY `prices_price_unit_id_fk` (`price_unit_id`),
  CONSTRAINT `prices_article_code_fk` FOREIGN KEY (`alpha_code`, `num_code`) REFERENCES `articles` (`alpha_code`, `num_code`) ON DELETE CASCADE,
  CONSTRAINT `prices_article_unit_id_fk` FOREIGN KEY (`article_unit_id`) REFERENCES `units` (`id`) ON DELETE CASCADE,
  CONSTRAINT `prices_price_unit_id_fk` FOREIGN KEY (`price_unit_id`) REFERENCES `units` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Цены';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prices`
--

LOCK TABLES `prices` WRITE;
/*!40000 ALTER TABLE `prices` DISABLE KEYS */;
INSERT INTO `prices` VALUES (1,'A','1',1,23,2),(2,'A','2',1,24.5,2),(3,'A','3',1,25.25,2),(4,'A','4',1,28,2),(5,'A','5',1,30,2),(6,'A','6',1,30,2),(7,'A','7',1,18,2),(8,'A','8',1,20,2),(9,'A','9',1,27.15,2),(10,'A','10',1,28.45,2),(11,'A','11',1,24.5,2),(12,'R','1',1,15,2),(13,'R','2',1,20,2),(14,'R','3',1,40,2),(15,'R','4',1,80,2),(16,'R','5',1,25,2),(17,'R','6',1,1500,2),(18,'R','7',1,800,2),(19,'R','8',1,150,2),(20,'R','9',1,80,2);
/*!40000 ALTER TABLE `prices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `production`
--

DROP TABLE IF EXISTS `production`;
/*!50001 DROP VIEW IF EXISTS `production`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `production` AS SELECT 
 1 AS `transaction_date`,
 1 AS `product`,
 1 AS `production`,
 1 AS `unicode`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `production_lines`
--

DROP TABLE IF EXISTS `production_lines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `production_lines` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `location_code` char(4) NOT NULL COMMENT 'Код производственной линии (из справочника Места хранения)',
  `output_per_hour` int DEFAULT NULL COMMENT 'Производительность линии в час',
  `units` char(4) DEFAULT NULL COMMENT 'ЕИ',
  `employees_num` int DEFAULT NULL COMMENT 'Количество персонала на линии',
  `hours_in_shift` int DEFAULT NULL COMMENT 'Продолжительность смены',
  PRIMARY KEY (`id`),
  KEY `pr_lines_location_code_fk` (`location_code`),
  KEY `pr_lines_unit_fk` (`units`),
  CONSTRAINT `pr_lines_location_code_fk` FOREIGN KEY (`location_code`) REFERENCES `stock_location` (`location_code`) ON DELETE CASCADE,
  CONSTRAINT `pr_lines_unit_fk` FOREIGN KEY (`units`) REFERENCES `units` (`short_name`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Справочник производственных линий с нормативными значениями производительности';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `production_lines`
--

LOCK TABLES `production_lines` WRITE;
/*!40000 ALTER TABLE `production_lines` DISABLE KEYS */;
INSERT INTO `production_lines` VALUES (1,'2101',2000,'КГ',5,11),(2,'2102',1500,'КГ',7,11);
/*!40000 ALTER TABLE `production_lines` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recipies`
--

DROP TABLE IF EXISTS `recipies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recipies` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `fp_alpha_code` char(1) NOT NULL COMMENT 'Буквенная кодировка ГП из справочника ТП',
  `fp_num_code` char(10) NOT NULL COMMENT 'Цифровая кодировка для ГП из справочника ТП',
  `rp_alpha_code` char(1) NOT NULL COMMENT 'Буквенная кодировка СиМ из справочника ТП',
  `rp_num_code` char(10) NOT NULL COMMENT 'Цифровая кодировка СиМ из справочника ТП',
  `quantity_per_tn` int NOT NULL COMMENT 'Количество СиМ для производства 1 тн ГП в базовых ЕИ СиМ',
  PRIMARY KEY (`id`),
  KEY `recipies_articles_idx` (`fp_alpha_code`,`fp_num_code`,`rp_alpha_code`,`rp_num_code`),
  CONSTRAINT `recipies_fp_code_fk` FOREIGN KEY (`fp_alpha_code`, `fp_num_code`) REFERENCES `articles` (`alpha_code`, `num_code`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Справочник рецептур';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipies`
--

LOCK TABLES `recipies` WRITE;
/*!40000 ALTER TABLE `recipies` DISABLE KEYS */;
INSERT INTO `recipies` VALUES (1,'A','4','R','1',400),(2,'A','4','R','2',200),(3,'A','4','R','4',200),(4,'A','10','R','1',300),(5,'A','10','R','2',150),(6,'A','10','R','4',150),(7,'A','10','R','5',150),(8,'A','10','R','7',50);
/*!40000 ALTER TABLE `recipies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `shift_analytics`
--

DROP TABLE IF EXISTS `shift_analytics`;
/*!50001 DROP VIEW IF EXISTS `shift_analytics`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `shift_analytics` AS SELECT 
 1 AS `pr_date`,
 1 AS `week_num`,
 1 AS `line`,
 1 AS `article`,
 1 AS `output_plan`,
 1 AS `output_act`,
 1 AS `empl_plan`,
 1 AS `empl_act`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `shift_report`
--

DROP TABLE IF EXISTS `shift_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shift_report` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `transaction_date` date NOT NULL COMMENT 'Дата транзакции',
  `transaction_code` char(4) NOT NULL COMMENT 'Код транзакции',
  `location_code` char(4) NOT NULL COMMENT 'Код производственной линии (из справочника Места хранения)',
  `alpha_code` char(1) NOT NULL COMMENT 'Буквенный код ТП',
  `num_code` char(10) NOT NULL COMMENT 'Цифровой код ТП',
  `unicode` varchar(250) NOT NULL COMMENT 'Уникальный (уникален для каждого факта производства, но не для \r\n  таблицы в целом) код, который присваивается каждой операции по производству ГП (это позволит затем \r\n  привязать операции списания сырья в расход к конкретной операции по производству ГП).',
  `production` int DEFAULT NULL COMMENT 'Произведено продукции в смену в ЕИ линии',
  `employees_act` int DEFAULT NULL COMMENT 'Фактическое количество людей на линиии',
  `hours_act` int DEFAULT NULL COMMENT 'Фактическая продолжительность смены',
  PRIMARY KEY (`id`),
  KEY `shr_transaction_code_fk` (`transaction_code`),
  KEY `shr_location_code_fk` (`location_code`),
  KEY `shr_article_code_fk` (`alpha_code`,`num_code`),
  CONSTRAINT `shr_article_code_fk` FOREIGN KEY (`alpha_code`, `num_code`) REFERENCES `articles` (`alpha_code`, `num_code`) ON DELETE CASCADE,
  CONSTRAINT `shr_location_code_fk` FOREIGN KEY (`location_code`) REFERENCES `stock_location` (`location_code`) ON DELETE CASCADE,
  CONSTRAINT `shr_transaction_code_fk` FOREIGN KEY (`transaction_code`) REFERENCES `transaction_directory` (`transaction_code`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Отчет за смену (смена сообщает когда, какую продукцию, в каком объеме, на каких линиях, за какое время \r\nи каким количеством людей произвели, а также какое количество какого сырья и в каком объеме потратили)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shift_report`
--

LOCK TABLES `shift_report` WRITE;
/*!40000 ALTER TABLE `shift_report` DISABLE KEYS */;
INSERT INTO `shift_report` VALUES (1,'2021-01-12','2021','2101','A','4','21012021-01-12A4',20000,5,11),(2,'2021-01-12','2020','2101','R','1','21012021-01-12A4',8900,NULL,NULL),(3,'2021-01-12','2020','2101','R','2','21012021-01-12A4',6000,NULL,NULL),(4,'2021-01-12','2020','2101','R','4','21012021-01-12A4',4140,NULL,NULL),(5,'2021-01-13','2021','2102','A','10','21022021-01-13A10',15000,8,11),(6,'2021-01-13','2020','2102','R','1','21022021-01-13A10',3975,NULL,NULL),(7,'2021-01-13','2020','2102','R','2','21022021-01-13A10',3960,NULL,NULL),(8,'2021-01-13','2020','2102','R','4','21022021-01-13A10',4110,NULL,NULL),(9,'2021-01-13','2020','2102','R','5','21022021-01-13A10',4140,NULL,NULL),(10,'2021-01-13','2020','2102','R','7','21022021-01-13A10',1320,NULL,NULL),(11,'2021-01-18','2021','2101','A','4','21012021-01-18A4',21000,5,11),(12,'2021-01-18','2020','2101','R','1','21012021-01-18A4',10290,NULL,NULL),(13,'2021-01-18','2020','2101','R','2','21012021-01-18A4',4662,NULL,NULL),(14,'2021-01-18','2020','2101','R','4','21012021-01-18A4',4242,NULL,NULL),(15,'2021-01-19','2021','2102','A','10','21022021-01-19A10',16000,8,11),(16,'2021-01-19','2020','2102','R','1','21022021-01-19A10',9488,NULL,NULL),(17,'2021-01-19','2020','2102','R','2','21022021-01-19A10',3504,NULL,NULL),(18,'2021-01-19','2020','2102','R','4','21022021-01-19A10',4112,NULL,NULL),(19,'2021-01-19','2020','2102','R','5','21022021-01-19A10',2432,NULL,NULL),(20,'2021-01-19','2020','2102','R','7','21022021-01-19A10',1168,NULL,NULL),(21,'2021-01-25','2021','2101','A','4','21012021-01-25A4',22000,6,11),(22,'2021-01-25','2020','2101','R','1','21012021-01-25A4',8756,NULL,NULL),(23,'2021-01-25','2020','2101','R','2','21012021-01-25A4',8778,NULL,NULL),(24,'2021-01-25','2020','2101','R','4','21012021-01-25A4',7084,NULL,NULL),(25,'2021-01-26','2021','2102','A','10','21022021-01-26A10',16500,7,11),(26,'2021-01-26','2020','2102','R','1','21022021-01-26A10',5775,NULL,NULL),(27,'2021-01-26','2020','2102','R','2','21022021-01-26A10',3416,NULL,NULL),(28,'2021-01-26','2020','2102','R','4','21022021-01-26A10',3465,NULL,NULL),(29,'2021-01-26','2020','2102','R','5','21022021-01-26A10',2145,NULL,NULL),(30,'2021-01-26','2020','2102','R','7','21022021-01-26A10',1370,NULL,NULL),(31,'2021-02-01','2021','2101','A','4','21012021-02-01A4',19000,5,11),(32,'2021-02-01','2020','2101','R','1','21012021-02-01A4',9899,NULL,NULL),(33,'2021-02-01','2020','2101','R','2','21012021-02-01A4',6840,NULL,NULL),(34,'2021-02-01','2020','2101','R','4','21012021-02-01A4',7448,NULL,NULL),(35,'2021-02-02','2021','2102','A','10','21022021-02-02A10',14000,7,11),(36,'2021-02-02','2020','2102','R','1','21022021-02-02A10',5278,NULL,NULL),(37,'2021-02-02','2020','2102','R','2','21022021-02-02A10',4004,NULL,NULL),(38,'2021-02-02','2020','2102','R','4','21022021-02-02A10',3010,NULL,NULL),(39,'2021-02-02','2020','2102','R','5','21022021-02-02A10',3752,NULL,NULL),(40,'2021-02-02','2020','2102','R','7','21022021-02-02A10',1036,NULL,NULL),(45,'2021-01-29','2021','2101','A','4','21012021-01-29A4',20000,5,11),(46,'2021-01-29','2020','2101','R','1','21012021-01-29A4',12980,NULL,NULL),(47,'2021-01-29','2020','2101','R','2','21012021-01-29A4',6800,NULL,NULL),(48,'2021-01-29','2020','2101','R','4','21012021-01-29A4',6580,NULL,NULL);
/*!40000 ALTER TABLE `shift_report` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `add_transfer` AFTER INSERT ON `shift_report` FOR EACH ROW BEGIN 
IF (NEW.alpha_code = 'R') THEN
  	INSERT INTO transactions (transaction_code, transaction_date, location_from, loсation_to, alpha_code, num_code,
  		quantity)
  	VALUES
  	('2020', NEW.transaction_date, '2100', NEW.location_code, NEW.alpha_code, NEW.num_code, NEW.production);
END IF;
IF (NEW.alpha_code = 'A') THEN
  	INSERT INTO transactions (transaction_code, transaction_date, location_from, loсation_to, alpha_code, num_code,
  		quantity)
  	VALUES
  	('2021', NEW.transaction_date, NEW.location_code, '2100', NEW.alpha_code, NEW.num_code, NEW.production);
END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `stock_calculation`
--

DROP TABLE IF EXISTS `stock_calculation`;
/*!50001 DROP VIEW IF EXISTS `stock_calculation`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `stock_calculation` AS SELECT 
 1 AS `op_date`,
 1 AS `operation_code`,
 1 AS `operation`,
 1 AS `location_from`,
 1 AS `location_to`,
 1 AS `article`,
 1 AS `article_name`,
 1 AS `quantity`,
 1 AS `stock_movement`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `stock_location`
--

DROP TABLE IF EXISTS `stock_location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stock_location` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `location_code` char(4) NOT NULL COMMENT 'Код места хранения/производственной линии',
  `location_name` varchar(50) NOT NULL COMMENT 'Наименование места хранения/производственной линии',
  `if_production_line` tinyint(1) NOT NULL COMMENT 'Производственная линия - 1, место хранения - 0',
  PRIMARY KEY (`location_code`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Справочник мест хранения и производственных линий';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock_location`
--

LOCK TABLES `stock_location` WRITE;
/*!40000 ALTER TABLE `stock_location` DISABLE KEYS */;
INSERT INTO `stock_location` VALUES (1,'1100','Склад сырья и материалов',0),(2,'1200','Склад упаковочных материалов',0),(3,'2100','Производственый склад',0),(4,'2101','Производственная линия 1',1),(5,'2102','Производственная линия 2',1),(6,'5100','Склад готовой продукции',0),(7,'8001','Внешний поставщик',0),(8,'8002','Внешний поставщик',0),(9,'8003','Внешний поставщик',0),(10,'8004','Внешний поставщик',0),(11,'8005','Внешний поставщик',0),(12,'9001','Внешний клиент 1',0),(13,'9002','Внешний клиент 1',0),(14,'9003','Внешний клиент 1',0);
/*!40000 ALTER TABLE `stock_location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaction_directory`
--

DROP TABLE IF EXISTS `transaction_directory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transaction_directory` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `transaction_code` char(4) NOT NULL COMMENT 'Код транзакции',
  `transaction_name` varchar(50) NOT NULL COMMENT 'Наименование транзакции',
  PRIMARY KEY (`id`),
  UNIQUE KEY `transaction_code` (`transaction_code`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Справочник хозяйственных операций';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaction_directory`
--

LOCK TABLES `transaction_directory` WRITE;
/*!40000 ALTER TABLE `transaction_directory` DISABLE KEYS */;
INSERT INTO `transaction_directory` VALUES (1,'1000','Приход на склад'),(2,'1020','Передача на производство'),(3,'2020','Расход'),(4,'2021','Производство ГП'),(5,'2050','Передача ГП на склад'),(6,'5000','Отгрузка клиенту');
/*!40000 ALTER TABLE `transaction_directory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transactions`
--

DROP TABLE IF EXISTS `transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transactions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `transaction_date` date NOT NULL COMMENT 'Дата транзакции',
  `transaction_code` char(4) NOT NULL COMMENT 'Код транзакции',
  `location_from` char(4) NOT NULL COMMENT 'Откуда',
  `loсation_to` char(4) NOT NULL COMMENT 'Куда',
  `alpha_code` char(1) NOT NULL COMMENT 'Буквенная кодировка Товарной позиции',
  `num_code` char(10) NOT NULL COMMENT 'Цифровая кодировка Товарной позиции',
  `quantity` int NOT NULL COMMENT 'Количество ТП',
  PRIMARY KEY (`id`),
  KEY `transactions_transaction_code_fk` (`transaction_code`),
  KEY `transactions_location_from_fk` (`location_from`),
  KEY `transactions_location_to_fk` (`loсation_to`),
  KEY `transactions_article_code_fk` (`alpha_code`,`num_code`),
  CONSTRAINT `transactions_article_code_fk` FOREIGN KEY (`alpha_code`, `num_code`) REFERENCES `articles` (`alpha_code`, `num_code`) ON DELETE CASCADE,
  CONSTRAINT `transactions_location_from_fk` FOREIGN KEY (`location_from`) REFERENCES `stock_location` (`location_code`) ON DELETE CASCADE,
  CONSTRAINT `transactions_location_to_fk` FOREIGN KEY (`loсation_to`) REFERENCES `stock_location` (`location_code`) ON DELETE CASCADE,
  CONSTRAINT `transactions_transaction_code_fk` FOREIGN KEY (`transaction_code`) REFERENCES `transaction_directory` (`transaction_code`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Журнал транзакций';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactions`
--

LOCK TABLES `transactions` WRITE;
/*!40000 ALTER TABLE `transactions` DISABLE KEYS */;
INSERT INTO `transactions` VALUES (1,'2021-01-12','2021','2101','2100','A','4',20000),(2,'2021-01-12','2020','2100','2101','R','1',8900),(3,'2021-01-12','2020','2100','2101','R','2',6000),(4,'2021-01-12','2020','2100','2101','R','4',4140),(5,'2021-01-13','2021','2102','2100','A','10',15000),(6,'2021-01-13','2020','2100','2102','R','1',3975),(7,'2021-01-13','2020','2100','2102','R','2',3960),(8,'2021-01-13','2020','2100','2102','R','4',4110),(9,'2021-01-13','2020','2100','2102','R','5',4140),(10,'2021-01-13','2020','2100','2102','R','7',1320),(11,'2021-01-18','2021','2101','2100','A','4',21000),(12,'2021-01-18','2020','2100','2101','R','1',10290),(13,'2021-01-18','2020','2100','2101','R','2',4662),(14,'2021-01-18','2020','2100','2101','R','4',4242),(15,'2021-01-19','2021','2102','2100','A','10',16000),(16,'2021-01-19','2020','2100','2102','R','1',9488),(17,'2021-01-19','2020','2100','2102','R','2',3504),(18,'2021-01-19','2020','2100','2102','R','4',4112),(19,'2021-01-19','2020','2100','2102','R','5',2432),(20,'2021-01-19','2020','2100','2102','R','7',1168),(21,'2021-01-25','2021','2101','2100','A','4',22000),(22,'2021-01-25','2020','2100','2101','R','1',8756),(23,'2021-01-25','2020','2100','2101','R','2',8778),(24,'2021-01-25','2020','2100','2101','R','4',7084),(25,'2021-01-26','2021','2102','2100','A','10',16500),(26,'2021-01-26','2020','2100','2102','R','1',5775),(27,'2021-01-26','2020','2100','2102','R','2',3416),(28,'2021-01-26','2020','2100','2102','R','4',3465),(29,'2021-01-26','2020','2100','2102','R','5',2145),(30,'2021-01-26','2020','2100','2102','R','7',1370),(31,'2021-02-01','2021','2101','2100','A','4',19000),(32,'2021-02-01','2020','2100','2101','R','1',9899),(33,'2021-02-01','2020','2100','2101','R','2',6840),(34,'2021-02-01','2020','2100','2101','R','4',7448),(35,'2021-02-02','2021','2102','2100','A','10',14000),(36,'2021-02-02','2020','2100','2102','R','1',5278),(37,'2021-02-02','2020','2100','2102','R','2',4004),(38,'2021-02-02','2020','2100','2102','R','4',3010),(39,'2021-02-02','2020','2100','2102','R','5',3752),(40,'2021-02-02','2020','2100','2102','R','7',1036),(41,'2021-01-11','1000','8001','1100','R','1',100000),(42,'2021-01-11','1000','8002','1100','R','2',50000),(43,'2021-01-11','1000','8004','1100','R','4',50000),(44,'2021-01-11','1000','8005','1100','R','5',25000),(45,'2021-01-11','1000','8003','1100','R','7',10000),(46,'2021-01-12','1020','1100','2100','R','1',25000),(47,'2021-01-12','1020','1100','2100','R','2',15000),(48,'2021-01-12','1020','1100','2100','R','4',15000),(49,'2021-01-12','1020','1100','2100','R','5',7000),(50,'2021-01-12','1020','1100','2100','R','7',4000),(51,'2021-01-13','2050','2100','5100','A','4',20000),(52,'2021-01-14','2050','2100','5100','A','10',15000),(53,'2021-01-19','2050','2100','5100','A','4',21000),(54,'2021-01-20','2050','2100','5100','A','10',16000),(55,'2021-01-26','2050','2100','5100','A','4',22000),(56,'2021-01-27','2050','2100','5100','A','10',16500),(57,'2021-01-15','5000','5100','9001','A','4',5000),(58,'2021-01-15','5000','5100','9001','A','10',13000),(59,'2021-01-21','5000','5100','9002','A','4',20000),(60,'2021-01-21','5000','5100','9002','A','10',16000),(61,'2021-01-28','5000','5100','9003','A','4',18500),(62,'2021-01-28','5000','5100','9003','A','10',8000),(67,'2021-01-29','2021','2101','2100','A','4',20000),(68,'2021-01-29','2020','2100','2101','R','1',12980),(69,'2021-01-29','2020','2100','2101','R','2',6800),(70,'2021-01-29','2020','2100','2101','R','4',6580);
/*!40000 ALTER TABLE `transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `units`
--

DROP TABLE IF EXISTS `units`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `units` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `short_name` char(3) NOT NULL COMMENT 'Краткое обозначение ЕИ',
  `full_name` char(50) NOT NULL COMMENT 'Полное обозначение ЕИ',
  PRIMARY KEY (`short_name`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Справочник единиц измерения';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `units`
--

LOCK TABLES `units` WRITE;
/*!40000 ALTER TABLE `units` DISABLE KEYS */;
INSERT INTO `units` VALUES (1,'КГ','Килограммы'),(2,'РУБ','Рубли');
/*!40000 ALTER TABLE `units` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `material_usage`
--

/*!50001 DROP VIEW IF EXISTS `material_usage`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `material_usage` AS select concat(`shift_report`.`alpha_code`,`shift_report`.`num_code`) AS `material`,`shift_report`.`production` AS `material_usage`,`shift_report`.`unicode` AS `unicode` from `shift_report` where (`shift_report`.`alpha_code` = 'R') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `production`
--

/*!50001 DROP VIEW IF EXISTS `production`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `production` AS select `shift_report`.`transaction_date` AS `transaction_date`,concat(`shift_report`.`alpha_code`,`shift_report`.`num_code`) AS `product`,`shift_report`.`production` AS `production`,`shift_report`.`unicode` AS `unicode` from `shift_report` where (`shift_report`.`alpha_code` = 'A') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `shift_analytics`
--

/*!50001 DROP VIEW IF EXISTS `shift_analytics`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `shift_analytics` AS select `shr`.`transaction_date` AS `pr_date`,week(`shr`.`transaction_date`,0) AS `week_num`,`shr`.`location_code` AS `line`,concat(`shr`.`alpha_code`,`shr`.`num_code`) AS `article`,(`pl`.`output_per_hour` * `shr`.`hours_act`) AS `output_plan`,`shr`.`production` AS `output_act`,`pl`.`employees_num` AS `empl_plan`,`shr`.`employees_act` AS `empl_act` from (`shift_report` `shr` join `production_lines` `pl` on((`shr`.`location_code` = `pl`.`location_code`))) where (`shr`.`alpha_code` = 'A') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `stock_calculation`
--

/*!50001 DROP VIEW IF EXISTS `stock_calculation`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `stock_calculation` AS select `tr`.`transaction_date` AS `op_date`,`tr`.`transaction_code` AS `operation_code`,`td`.`transaction_name` AS `operation`,`tr`.`location_from` AS `location_from`,`tr`.`loсation_to` AS `location_to`,concat(`tr`.`alpha_code`,`tr`.`num_code`) AS `article`,`ar`.`article_name` AS `article_name`,`tr`.`quantity` AS `quantity`,(case when ((`tr`.`transaction_code` = '1000') or (`tr`.`transaction_code` = '2021')) then `tr`.`quantity` else (case when ((`tr`.`transaction_code` = '2020') or (`tr`.`transaction_code` = '5000')) then (`tr`.`quantity` * -(1)) else 0 end) end) AS `stock_movement` from ((`transactions` `tr` join `transaction_directory` `td` on((`td`.`transaction_code` = `tr`.`transaction_code`))) join `articles` `ar` on((concat(`ar`.`alpha_code`,`ar`.`num_code`) = concat(`tr`.`alpha_code`,`tr`.`num_code`)))) order by `tr`.`transaction_date` */;
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

-- Dump completed on 2021-02-10 20:39:30
