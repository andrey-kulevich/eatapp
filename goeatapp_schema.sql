CREATE DATABASE  IF NOT EXISTS `goeatapp` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `goeatapp`;
-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: goeatapp
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
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `address` (
  `id` int NOT NULL AUTO_INCREMENT,
  `country` varchar(45) NOT NULL,
  `region` varchar(45) NOT NULL,
  `town` varchar(45) NOT NULL,
  `mail_index` varchar(45) DEFAULT NULL,
  `street` varchar(45) NOT NULL,
  `house` varchar(45) NOT NULL,
  `apartment` varchar(45) DEFAULT NULL,
  `place` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `place` (`place`),
  KEY `id_idx` (`place`),
  KEY `idx_country` (`country`),
  KEY `idx_region` (`region`),
  KEY `idx_town` (`town`),
  KEY `idx_street` (`street`),
  KEY `idx_house` (`house`),
  CONSTRAINT `address_ibfk_1` FOREIGN KEY (`place`) REFERENCES `place` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES (1,'Россия','Волгоградская обл.','Волгоград','228666','Ленина','28','В903',2),(2,'Уганда','какой-то регион в Уганде','Угандийск','222222','Красного человечка','1','9',1),(3,'Парагвай','далекий','Парагвайск',NULL,'кого-то','2','8',3),(4,'Германия','Бавария','Берлин',NULL,'Фридриха Ницше','3','7',4),(5,'Сомали','не знаю','Сомалийск',NULL,'а','4','6',5),(6,'Украина','Луганская обл.','Юкрэйн Таун',NULL,'б','5','33',6),(7,'Исландия','..','Исландийск','11001','в','6','24',7),(8,'Гренландия','....','Гренландскбург',NULL,'г','6','5',8),(9,'США','Вашингтон','Вашингтон',NULL,'Джорджа флойда','7','67',10),(10,'Бельгия','эээ','Труляля',NULL,'Эркюля Пуаро','8','1',9),(13,'Россия','Московская обл.','Химки','228666','Ленина','28','В903',12),(14,'Франция','Прованс','Провансальск','123456','Какаято','35b','4',13),(15,'Россия','Волгоградская обл.','Волжский','404100','Оломоуцкая','95','3',14),(16,'Россия','Волгоградская обл.','Котельниково','111222','Не знаю','69','1',15),(17,'Россия','Ленинградская обл.','Санкт-Петербург','123123','Самая главная','12','21',16),(18,'Уганда','Угандонская','Гыэыээ','88005553535','Какая-то','4','34b',20),(19,'Уганда','Угандонск-великий','ааауууф','8800555','Большая и широкая','5','69',21),(20,'Гренландия','Гренландская обл.','Гренландинск','123456','Гренландская','12','34',22),(21,'Россия','Не знаю','Верхнепупинск','123456','Пупковская','12','34',23),(23,'Россия','Курганская','Курган','123456','Ленина','33','33',25),(24,'Германия','Берлинская','Берлинск','111111','Иоганна Баха штрассе','12','34',26),(25,'ф','б','в','г','д','е','ж',27);
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `assortment`
--

DROP TABLE IF EXISTS `assortment`;
/*!50001 DROP VIEW IF EXISTS `assortment`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `assortment` AS SELECT 
 1 AS `place`,
 1 AS `dish`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `best_places`
--

DROP TABLE IF EXISTS `best_places`;
/*!50001 DROP VIEW IF EXISTS `best_places`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `best_places` AS SELECT 
 1 AS `id`,
 1 AS `name`,
 1 AS `photo`,
 1 AS `cuisine_nationality`,
 1 AS `interior`,
 1 AS `tagline`,
 1 AS `other`,
 1 AS `rating`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `cuisine_nationality`
--

DROP TABLE IF EXISTS `cuisine_nationality`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cuisine_nationality` (
  `id` int NOT NULL AUTO_INCREMENT,
  `value` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cuisine_nationality`
--

LOCK TABLES `cuisine_nationality` WRITE;
/*!40000 ALTER TABLE `cuisine_nationality` DISABLE KEYS */;
INSERT INTO `cuisine_nationality` VALUES (1,'русская'),(2,'американская'),(3,'японская'),(4,'китайская'),(5,'французская'),(6,'итальянская'),(7,'грузинская'),(8,'казахская'),(9,'испанская'),(10,'корейская'),(11,'африканская');
/*!40000 ALTER TABLE `cuisine_nationality` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dish`
--

DROP TABLE IF EXISTS `dish`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dish` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `photo` varchar(45) DEFAULT NULL,
  `dish_type` int DEFAULT NULL,
  `recipe` varchar(500) DEFAULT NULL,
  `cuisin_nationality` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_idx` (`dish_type`),
  KEY `id_idx1` (`cuisin_nationality`),
  CONSTRAINT `dish_ibfk_1` FOREIGN KEY (`dish_type`) REFERENCES `dish_type` (`id`),
  CONSTRAINT `dish_ibfk_2` FOREIGN KEY (`cuisin_nationality`) REFERENCES `cuisine_nationality` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dish`
--

LOCK TABLES `dish` WRITE;
/*!40000 ALTER TABLE `dish` DISABLE KEYS */;
INSERT INTO `dish` VALUES (1,'пельмени',NULL,9,'какой-нибудь',1),(2,'водка','../img/vodka.jpg',2,NULL,1),(3,'борщ',NULL,15,'сложный и длинный',2),(4,'баварские колбаски',NULL,7,'',8),(5,'паста с томатным соусом',NULL,10,NULL,6),(6,'торт прага',NULL,5,NULL,1),(7,'чай пуэр','///',1,NULL,NULL),(8,'плов','.',9,'берем пучек укропу...',3),(9,'вино',NULL,2,NULL,7),(10,'пицца',NULL,7,'режем все подряд и сбрасываем на блин из теста, посыпав сыром',6),(11,'каша из топора',NULL,9,'1.Взять топор.\n 2.Сварить!',1),(12,'боярышник',NULL,2,'да никто не знает лол)',1),(13,'котлеты',NULL,9,'я космодесантник Хаоса',2),(14,'привет','аоао',1,'тратрата',2),(15,'аоаоаоа','аоаао',2,'ыправлпвра',8),(16,'авыодрпц','оварр',7,'арплрорл',NULL),(17,'алардпр','арврар',2,'арврарр',NULL),(18,'ыыыыы','ыыыы',9,'ыыыыы',1),(19,'блаблабла','бла',5,'вввввв',1);
/*!40000 ALTER TABLE `dish` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dish_type`
--

DROP TABLE IF EXISTS `dish_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dish_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dish_type`
--

LOCK TABLES `dish_type` WRITE;
/*!40000 ALTER TABLE `dish_type` DISABLE KEYS */;
INSERT INTO `dish_type` VALUES (1,'напиток'),(2,'алкоголь'),(3,'коктейль'),(4,'выпечка'),(5,'десерт'),(6,'завтрак'),(7,'закуска'),(8,'морепродукт'),(9,'основное блюдо'),(10,'паста'),(11,'салат'),(12,'сладкое'),(13,'смузи'),(14,'соус'),(15,'суп'),(16,'макаронное');
/*!40000 ALTER TABLE `dish_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favorite_places`
--

DROP TABLE IF EXISTS `favorite_places`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `favorite_places` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user` int NOT NULL,
  `address` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_idx` (`user`),
  KEY `id_idx1` (`address`),
  CONSTRAINT `favorite_places_ibfk_1` FOREIGN KEY (`user`) REFERENCES `user` (`id`),
  CONSTRAINT `favorite_places_ibfk_2` FOREIGN KEY (`address`) REFERENCES `address` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favorite_places`
--

LOCK TABLES `favorite_places` WRITE;
/*!40000 ALTER TABLE `favorite_places` DISABLE KEYS */;
INSERT INTO `favorite_places` VALUES (1,1,10),(2,4,8),(3,2,9),(4,10,7),(6,11,6),(7,7,5),(8,10,4),(9,2,1),(10,2,2),(11,1,3),(12,1,9),(13,1,7),(14,4,7),(15,10,3),(16,2,10),(17,2,4),(18,2,5),(19,7,7);
/*!40000 ALTER TABLE `favorite_places` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `food_assortment`
--

DROP TABLE IF EXISTS `food_assortment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `food_assortment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `place` int NOT NULL,
  `dish` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_idx` (`dish`),
  KEY `id_idx1` (`place`),
  CONSTRAINT `food_assortment_ibfk_1` FOREIGN KEY (`dish`) REFERENCES `dish` (`id`),
  CONSTRAINT `food_assortment_ibfk_2` FOREIGN KEY (`place`) REFERENCES `place` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `food_assortment`
--

LOCK TABLES `food_assortment` WRITE;
/*!40000 ALTER TABLE `food_assortment` DISABLE KEYS */;
INSERT INTO `food_assortment` VALUES (1,1,4),(2,2,4),(3,1,3),(4,7,7),(5,9,2),(6,6,5),(7,4,9),(8,8,10),(9,5,10),(11,10,4),(12,3,3),(13,3,5),(14,3,2),(15,10,10),(16,9,7),(17,9,4),(18,2,5);
/*!40000 ALTER TABLE `food_assortment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gender`
--

DROP TABLE IF EXISTS `gender`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gender` (
  `id` int NOT NULL,
  `value` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gender`
--

LOCK TABLES `gender` WRITE;
/*!40000 ALTER TABLE `gender` DISABLE KEYS */;
INSERT INTO `gender` VALUES (0,'male'),(1,'female'),(2,'undefined');
/*!40000 ALTER TABLE `gender` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `interior`
--

DROP TABLE IF EXISTS `interior`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `interior` (
  `id` int NOT NULL AUTO_INCREMENT,
  `value` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `interior`
--

LOCK TABLES `interior` WRITE;
/*!40000 ALTER TABLE `interior` DISABLE KEYS */;
INSERT INTO `interior` VALUES (1,'авангард'),(2,'ампир'),(3,'барокко'),(4,'арабский'),(5,'английский'),(6,'брутализм'),(7,'венецианский'),(8,'индустриальный'),(9,'китайский'),(10,'конструктивизм'),(11,'лофт'),(12,'лаундж'),(13,'модерн'),(14,'ренессанс'),(15,'рококо'),(16,'стимпанк'),(17,'техно'),(18,'футуризм'),(19,'хай-тек'),(20,'этнический'),(21,'бабулин стиль');
/*!40000 ALTER TABLE `interior` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invitation`
--

DROP TABLE IF EXISTS `invitation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `invitation` (
  `id` int NOT NULL AUTO_INCREMENT,
  `datetime` datetime NOT NULL,
  `address` int DEFAULT NULL,
  `who_will_pay` tinyint DEFAULT NULL,
  `message` varchar(200) DEFAULT NULL,
  `inviting_person` int NOT NULL,
  `recipient` int DEFAULT NULL,
  `accepted` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_idx` (`inviting_person`,`recipient`),
  KEY `id_idx1` (`address`),
  KEY `pecipient` (`recipient`),
  KEY `idx_datetime` (`datetime`),
  CONSTRAINT `invitation_ibfk_1` FOREIGN KEY (`inviting_person`) REFERENCES `user` (`id`),
  CONSTRAINT `invitation_ibfk_2` FOREIGN KEY (`recipient`) REFERENCES `user` (`id`),
  CONSTRAINT `invitation_ibfk_3` FOREIGN KEY (`address`) REFERENCES `address` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invitation`
--

LOCK TABLES `invitation` WRITE;
/*!40000 ALTER TABLE `invitation` DISABLE KEYS */;
INSERT INTO `invitation` VALUES (1,'2020-01-01 15:15:56',2,0,'привет',1,NULL,1),(2,'2015-01-01 13:12:51',1,0,'пошли',4,NULL,1),(3,'2020-01-01 15:15:20',3,1,'хавать',2,NULL,1),(4,'2020-01-01 15:15:56',4,0,'бро',7,1,1),(5,'2020-01-01 15:15:56',5,0,'хей',8,NULL,0),(6,'2020-09-01 23:15:56',6,1,'любое сообщение',9,NULL,1),(7,'2020-01-01 15:15:56',7,0,'лалала',2,NULL,1),(8,'2020-01-01 15:15:56',8,0,'',4,10,1),(10,'2020-01-01 01:15:56',9,0,'',1,11,1),(11,'2020-01-01 15:15:56',10,1,'',2,NULL,0),(12,'2020-01-01 15:15:56',13,0,'сообщаю',4,NULL,1),(13,'2020-11-10 20:20:21',14,1,'хей детка пошли хавать :З',1,NULL,1),(14,'2020-11-10 20:20:20',2,0,'хей детка пошли хавать :З',1,1,1),(15,'2020-11-10 20:20:20',15,1,'аааа',4,7,1),(17,'2020-11-10 20:20:21',8,0,'воввово',9,9,1),(18,'2020-11-11 20:23:20',5,1,'ывывыв',4,11,1),(19,'2020-10-10 23:23:23',17,1,'asas',1,1,1),(22,'2021-01-09 15:27:00',15,1,'привет',1,NULL,0),(23,'2021-01-14 17:32:00',16,0,'пока',1,NULL,1),(24,'2021-01-10 18:08:00',17,1,'парампампам',1,NULL,1),(27,'2021-01-10 23:26:00',13,1,'123',1,1,0),(28,'2021-01-07 01:00:00',2,0,'123',1,2,0),(29,'2021-01-09 14:24:00',16,1,'it will be a mistake to come here...',1,NULL,0),(30,'2021-01-09 17:36:00',1,1,'teeeesttt',1,2,0),(32,'2021-01-10 16:39:00',15,1,'привет',1,NULL,0),(33,'2021-01-17 14:45:00',6,1,'привет',1,5,0),(34,'2021-01-10 14:49:00',20,1,'ура',1,5,0),(36,'2021-01-08 21:19:00',23,0,'ребяята го все хавать',1,NULL,1),(37,'2021-01-08 23:20:00',24,0,'ребяята я бухой',1,NULL,0),(38,'2021-01-17 00:58:00',1,1,'привет',24,NULL,1),(39,'2021-01-10 02:00:00',25,1,'ураура',4,1,0),(40,'2021-01-10 10:50:00',13,0,'привет',1,NULL,1),(41,'2021-01-17 14:16:00',4,1,'что-то там',1,4,1);
/*!40000 ALTER TABLE `invitation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `message` (
  `id` int NOT NULL AUTO_INCREMENT,
  `datetime` datetime NOT NULL,
  `content` varchar(45) NOT NULL,
  `sender` int NOT NULL,
  `recipient` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_idx` (`sender`,`recipient`),
  KEY `recipient` (`recipient`),
  CONSTRAINT `message_ibfk_1` FOREIGN KEY (`sender`) REFERENCES `user` (`id`),
  CONSTRAINT `message_ibfk_2` FOREIGN KEY (`recipient`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message`
--

LOCK TABLES `message` WRITE;
/*!40000 ALTER TABLE `message` DISABLE KEYS */;
INSERT INTO `message` VALUES (1,'2020-10-10 23:13:13','ыыыы привет',1,4),(2,'2020-10-10 13:13:13','Здарова',2,1),(3,'2020-10-10 23:13:13','Верни сотку',4,7),(4,'2020-10-10 13:13:13','не верну',7,4),(6,'2020-10-10 13:13:59','ты быканул? Все я выехал за тобой, гад!',1,10),(7,'1973-10-10 13:13:13','ты не знаешь, где я живу, петушок',1,9),(8,'2020-10-10 13:13:13','знаю, мы у тебя встречались на ужин...',2,8),(9,'2020-10-10 13:13:13','ах ты',4,8),(10,'2020-12-10 13:13:13','лучше сразу выпрыгивай в окно',7,4),(11,'2020-10-10 13:13:14','я на первом этаже живу, не прокаттит(',1,2),(12,'2020-11-10 06:06:06','What\'s up bro',1,2),(13,'2020-11-10 20:20:20','эээээ',1,2),(14,'2020-11-10 20:20:21','уууу',1,2),(15,'2020-11-10 20:20:22','я космодесантник хаоса',2,1),(16,'2020-11-10 20:20:23','а ты иди гуляй',2,1),(17,'2020-11-10 20:20:23','хавать то будем?',1,2),(18,'2020-11-10 20:20:23','нет!',1,2),(19,'2020-11-10 20:20:24','знаешь кого ответ?',2,1),(20,'2020-11-10 20:20:20','тыы давай поаккуратнее, нашу переписку читают',1,2),(21,'2020-12-31 23:59:59','Haaaappy new yyear!',5,4),(22,'2020-12-31 23:59:59','Haaaappy new yyear!',5,4);
/*!40000 ALTER TABLE `message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `place`
--

DROP TABLE IF EXISTS `place`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `place` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `photo` varchar(45) DEFAULT NULL,
  `cuisine_nationality` int DEFAULT NULL,
  `interior` int DEFAULT NULL,
  `tagline` varchar(100) DEFAULT NULL,
  `other` varchar(700) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_idx` (`interior`),
  KEY `id_idx1` (`cuisine_nationality`),
  CONSTRAINT `place_ibfk_1` FOREIGN KEY (`interior`) REFERENCES `interior` (`id`),
  CONSTRAINT `place_ibfk_2` FOREIGN KEY (`cuisine_nationality`) REFERENCES `cuisine_nationality` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `place`
--

LOCK TABLES `place` WRITE;
/*!40000 ALTER TABLE `place` DISABLE KEYS */;
INSERT INTO `place` VALUES (1,'додо','dodo.jpg',3,2,'вы едите - мы зарабатываем','любое примечание'),(2,'аик бистро',NULL,1,2,NULL,NULL),(3,'бабулин дом','./',3,3,NULL,NULL),(4,'шашлычная у володи',NULL,3,2,'вы травитесь - мы зарабатываем','кошек не используем'),(5,'садко',NULL,3,8,NULL,'.'),(6,'братница',NULL,4,6,NULL,NULL),(7,'old school',NULL,10,2,NULL,NULL),(8,'шаурмичная дяди Рамзана',NULL,3,2,'лучшее место во вселенной','примечание'),(9,'просто пельменная',NULL,3,2,NULL,NULL),(10,'Римини',NULL,7,2,NULL,NULL),(12,'Тратата',NULL,7,2,NULL,NULL),(13,'McDonalds','../img/img.jpg',3,2,'вы едите - мы зарабатываем','любое примечание'),(14,'Крутое заведение','cool.jpg',1,2,'айнанана','привет'),(15,'Жили у бабуси','grandma.jpg',7,7,'два веселых гуся','один серый другой белый'),(16,'Люблю немецкий',NULL,8,8,'красивый язык','всем рекомендую'),(17,'hololo','...',1,1,'sss','dfdfdf'),(18,'Мой дом','...',2,2,'ffjf','heey boy come on'),(19,'Труляля','...',2,2,'ffjf','heey boy come on'),(20,'Интересная забегаловка','...',2,2,'ffjf','heey boy come on'),(21,'Какое-то название',NULL,NULL,NULL,NULL,NULL),(22,'Пати на кровати',NULL,NULL,NULL,NULL,NULL),(23,'Пожалуста работай',NULL,NULL,NULL,NULL,NULL),(25,'место',NULL,NULL,NULL,NULL,NULL),(26,'Eat!',NULL,NULL,NULL,NULL,NULL),(27,'ураа',NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `place` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `place_reviews`
--

DROP TABLE IF EXISTS `place_reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `place_reviews` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user` int NOT NULL,
  `place` int NOT NULL,
  `score` float NOT NULL,
  `review` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user` (`user`),
  KEY `idx_place` (`place`),
  CONSTRAINT `place_reviews_ibfk_1` FOREIGN KEY (`user`) REFERENCES `user` (`id`),
  CONSTRAINT `place_reviews_ibfk_2` FOREIGN KEY (`place`) REFERENCES `place` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `place_reviews`
--

LOCK TABLES `place_reviews` WRITE;
/*!40000 ALTER TABLE `place_reviews` DISABLE KEYS */;
INSERT INTO `place_reviews` VALUES (1,1,1,4,'ну нормас, сойдет забегаловка'),(2,2,2,1,'blabla'),(3,4,3,5,'ahaha'),(4,1,1,4,'ну нормас, сойдет забегаловка'),(5,1,1,4,'ну нормас, сойдет забегаловка'),(6,5,10,4,NULL),(7,5,5,1,'ну такое'),(8,4,7,4,'ыыыуу'),(9,10,10,5,'ввавава'),(10,10,7,5,'бэээээ'),(11,18,9,5,'вовово'),(12,18,4,4,'4'),(13,18,3,2,'ууу'),(14,18,8,5,'лялятруляля'),(15,18,1,4,'аоаоаао'),(16,1,1,4,'omg bro that is amazing!');
/*!40000 ALTER TABLE `place_reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `preferences`
--

DROP TABLE IF EXISTS `preferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `preferences` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cuisine_nationality` int DEFAULT NULL,
  `interior` int DEFAULT NULL,
  `tips_percentage` float DEFAULT NULL,
  `is_vegan` tinyint(1) DEFAULT NULL,
  `is_raw_food` tinyint(1) DEFAULT NULL,
  `best_drink` int DEFAULT NULL,
  `best_first_meal` int DEFAULT NULL,
  `best_second_meal` int DEFAULT NULL,
  `best_dessert` int DEFAULT NULL,
  `other` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_idx` (`best_drink`,`best_first_meal`,`best_dessert`,`best_second_meal`),
  KEY `id_idx1` (`interior`),
  KEY `id_idx2` (`cuisine_nationality`),
  KEY `best_first_meal` (`best_first_meal`),
  KEY `best_second_meal` (`best_second_meal`),
  KEY `best_dessert` (`best_dessert`),
  CONSTRAINT `preferences_ibfk_1` FOREIGN KEY (`best_drink`) REFERENCES `dish` (`id`),
  CONSTRAINT `preferences_ibfk_2` FOREIGN KEY (`best_first_meal`) REFERENCES `dish` (`id`),
  CONSTRAINT `preferences_ibfk_3` FOREIGN KEY (`best_second_meal`) REFERENCES `dish` (`id`),
  CONSTRAINT `preferences_ibfk_4` FOREIGN KEY (`best_dessert`) REFERENCES `dish` (`id`),
  CONSTRAINT `preferences_ibfk_5` FOREIGN KEY (`interior`) REFERENCES `interior` (`id`),
  CONSTRAINT `preferences_ibfk_6` FOREIGN KEY (`cuisine_nationality`) REFERENCES `cuisine_nationality` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `preferences`
--

LOCK TABLES `preferences` WRITE;
/*!40000 ALTER TABLE `preferences` DISABLE KEYS */;
INSERT INTO `preferences` VALUES (1,1,6,10,1,0,2,4,8,6,NULL),(2,1,2,5,0,0,2,4,5,NULL,'тут может быть любой текст'),(3,10,3,0,0,0,7,4,2,NULL,NULL),(4,4,4,1,1,1,2,NULL,8,6,NULL),(5,5,3,100,0,0,2,4,5,NULL,NULL),(6,6,1,2,0,0,7,NULL,NULL,NULL,NULL),(7,2,7,2,1,0,2,NULL,5,NULL,'тут тоже может быть любой текст любого размера'),(8,1,8,NULL,0,0,7,4,8,6,NULL),(9,9,9,50,0,0,2,NULL,8,NULL,'aaaalalalla'),(10,3,13,5,0,0,NULL,NULL,NULL,6,NULL),(11,1,6,10,1,0,2,4,8,6,NULL),(12,2,3,1,1,1,1,1,1,1,NULL),(13,2,1,1,1,1,1,1,1,1,'бла'),(14,5,1,1,1,1,1,1,1,1,NULL),(15,5,1,1,1,1,1,1,1,1,NULL),(16,9,1,1,1,1,1,1,1,1,NULL),(18,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(19,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(21,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(22,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(23,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(24,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(25,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(26,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `preferences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `id` int NOT NULL,
  `value` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (0,'admin'),(1,'moderator'),(2,'guest');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `age` int DEFAULT NULL,
  `gender` int NOT NULL,
  `avatar` varchar(100) DEFAULT NULL,
  `preferences` int DEFAULT NULL,
  `status` text,
  `role` int NOT NULL,
  `login` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `login` (`login`),
  UNIQUE KEY `preferences` (`preferences`),
  KEY `id_idx` (`preferences`),
  KEY `id_idx1` (`gender`),
  KEY `id_idx2` (`role`),
  KEY `idx_name` (`name`),
  KEY `idx_login` (`login`),
  KEY `idx_gender` (`gender`),
  KEY `idx_age` (`age`),
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`preferences`) REFERENCES `preferences` (`id`),
  CONSTRAINT `user_ibfk_2` FOREIGN KEY (`gender`) REFERENCES `gender` (`id`),
  CONSTRAINT `user_ibfk_3` FOREIGN KEY (`role`) REFERENCES `role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Вася Пупкин',7,0,'1.jpg',9,'олеоле',2,'demo','123'),(2,'Андрюха',20,0,'...',8,'все просто',2,'god','321'),(4,'Серый',1,0,NULL,3,'статус ляля',2,'bear666','dfv'),(5,'Оля',2,1,NULL,10,NULL,2,'solomon','srgb3'),(6,'Ксюша Петровна',3,2,NULL,7,NULL,2,'tankist228','bhd'),(7,'Владос',20,0,NULL,6,'ходит с Андреем хавать между пар',0,'Abricos','4bdh_'),(8,'Соломон Олегович',5,0,'?',5,NULL,1,'Salam','hnbvc345'),(9,'Жора',6,0,NULL,2,NULL,2,'greg','vvdgj32'),(10,'Витя',7,0,NULL,1,NULL,2,'leon','3456'),(11,'Саша',70,0,NULL,4,NULL,2,'serafim34','2345324'),(13,'Андрюша Пикапер 228',15,0,NULL,11,'все сложно',2,'demo1','123'),(14,'Леночка Пупкина',99,1,NULL,12,'лалал',2,'ввв','ввв'),(15,'Олечка Ланнистер',22,1,NULL,13,'ааа',2,'ыы','ыы'),(16,'Настя Здрасте',20,2,NULL,14,NULL,2,'billy','ыыы'),(17,'Виктория Полоус',22,1,NULL,15,NULL,2,'van228','ыы'),(18,'Жасмин Из Диснея',12,2,NULL,16,NULL,2,'lets_selebrate','ыыы'),(19,'Красавчик',55,0,'...',19,'Хееей братухи',0,'batka666','132'),(23,'Батька Андрюха',22,2,NULL,23,NULL,2,'abc','123'),(24,'Tihomir',1,0,NULL,24,'london is the capital of great britain',2,'aaaa','123'),(26,'Саня',1,0,NULL,26,NULL,2,'dull','123');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'goeatapp'
--

--
-- Dumping routines for database 'goeatapp'
--
/*!50003 DROP FUNCTION IF EXISTS `getCountOfVisits` */;
ALTER DATABASE `goeatapp` CHARACTER SET utf8 COLLATE utf8_general_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getCountOfVisits`(_id INT) RETURNS int
    DETERMINISTIC
RETURN (SELECT COUNT(*) FROM `invitation` WHERE address = _id) ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `goeatapp` CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci ;
/*!50003 DROP FUNCTION IF EXISTS `getFavoriteCuisineForGender` */;
ALTER DATABASE `goeatapp` CHARACTER SET utf8 COLLATE utf8_general_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getFavoriteCuisineForGender`(_gender_id INT) RETURNS varchar(50) CHARSET utf8
    DETERMINISTIC
BEGIN
	declare _cuisine varchar(50) default '';
	
    SELECT cuisine_nationality.value AS cuisine_nationality 
    INTO _cuisine
	FROM
	(SELECT gender, cuisine_nationality, COUNT(cuisine_nationality) AS repeat_count
		FROM `user` 
		LEFT JOIN `preferences` ON user.preferences = preferences.id
		GROUP BY gender, cuisine_nationality
		ORDER BY repeat_count DESC) AS A
	LEFT JOIN `cuisine_nationality` ON A.cuisine_nationality = cuisine_nationality.id
	WHERE A.gender = _gender_id
	GROUP BY gender;
    
    set _cuisine = CASE WHEN _cuisine = "русская" THEN "УРААА РУССКИЕ ПОБЕДИЛИ"
												  ELSE "УРАА РУССКИЕ ПРОИГРАЛИ" END;
RETURN (_cuisine);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `goeatapp` CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci ;
/*!50003 DROP FUNCTION IF EXISTS `getRatingOfPlace` */;
ALTER DATABASE `goeatapp` CHARACTER SET utf8 COLLATE utf8_general_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getRatingOfPlace`(_id INT) RETURNS varchar(50) CHARSET utf8
    DETERMINISTIC
BEGIN
	declare rating float;
    declare result varchar(50) default "У этого заведения еще не было оценок";
	SELECT ROUND(AVG(score), 2) INTO rating FROM `place_reviews` WHERE place = _id; 
    if rating > 0 then
		set result = concat("Рейтинг заведения: ", rating);
	end if;
RETURN (result);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `goeatapp` CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci ;
/*!50003 DROP PROCEDURE IF EXISTS `getAllDishes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getAllDishes`()
BEGIN
	SELECT dish.id, name, photo, dish_type.type, recipe, cuisine_nationality.value
	FROM `dish`
    LEFT JOIN `dish_type` ON dish.dish_type = dish_type.id
    LEFT JOIN `cuisine_nationality` ON dish.cuisin_nationality = cuisine_nationality.id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getDialogsList` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getDialogsList`(IN _id INT)
BEGIN
	SELECT A.id, name, avatar
	FROM `user` A
	RIGHT JOIN (SELECT DISTINCT recipient FROM `message` WHERE sender = _id) B
	ON A.id = B.recipient;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getDishById` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getDishById`(IN _id INT)
BEGIN
	SELECT dish.id, name, photo, dish_type.type, recipe, cuisine_nationality.value
	FROM `dish`
    LEFT JOIN `dish_type` ON dish.dish_type = dish_type.id
    LEFT JOIN `cuisine_nationality` ON dish.cuisin_nationality = cuisine_nationality.id
	WHERE dish.id = _id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getDishesByPlaceId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getDishesByPlaceId`(IN _id INT)
BEGIN
	SELECT food_assortment.id, name, photo, dish_type.type, recipe, cuisine_nationality.value
	FROM `food_assortment`
	LEFT JOIN `dish` ON food_assortment.dish = dish.id
    LEFT JOIN `dish_type` ON dish.dish_type = dish_type.id
    LEFT JOIN `cuisine_nationality` ON dish.cuisin_nationality = cuisine_nationality.id
	WHERE food_assortment.place = _id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getFavoritePlaces` */;
ALTER DATABASE `goeatapp` CHARACTER SET ascii COLLATE ascii_general_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getFavoritePlaces`(IN _id INT)
BEGIN
	SELECT B.id, name, photo, country, region, town, mail_index, street, 
    house, apartment, cuisine_nationality, interior, tagline, other
	FROM `favorite_places` A
    LEFT JOIN `address` B ON A.address = B.id
    LEFT JOIN 
		(SELECT B.id, name, photo, C.value AS cuisine_nationality, D.value AS interior, tagline, other 
         FROM `place` B 
		 LEFT JOIN `cuisine_nationality` C ON B.cuisine_nationality = C.id
	     LEFT JOIN `interior`    	    D ON B.interior = D.id) E
    ON B.place = E.id
    WHERE user = 1; -- _id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `goeatapp` CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci ;
/*!50003 DROP PROCEDURE IF EXISTS `getInvitationById` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getInvitationById`(IN _id INT)
BEGIN
	SELECT A.id, datetime, B.id as address_id, E.name, photo, country, region, town, mail_index, street, 
		   house, apartment, cuisine_nationality, interior, tagline, other, who_will_pay, message, 
		   C.id AS inviting_person_id, C.name AS inviting_person, D.id AS recipient_id, D.name AS recipient, accepted
	FROM `invitation` A	
	LEFT JOIN `address` B ON A.address = B.id
    LEFT JOIN 
		(SELECT B.id, name, photo, C.value AS cuisine_nationality, D.value AS interior, tagline, other 
         FROM `place` B 
		 LEFT JOIN `cuisine_nationality` C ON B.cuisine_nationality = C.id
	     LEFT JOIN `interior`    	    D ON B.interior = D.id) E
    ON B.place = E.id
	LEFT JOIN `user`    C ON A.inviting_person = C.id
    LEFT JOIN `user`    D ON A.recipient = D.id
	WHERE A.id = _id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getInvitationsListByLocation` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getInvitationsListByLocation`(IN _requestArea VARCHAR(10), IN _userLocation VARCHAR(30))
BEGIN
	SELECT A.id, datetime, B.id as address_id, E.name, photo, country, region, town, mail_index, street, 
		   house, apartment, cuisine_nationality, interior, tagline, other, who_will_pay, message, 
		   C.id AS inviting_person_id, C.name AS inviting_person, D.id AS recipient_id, D.name AS recipient, accepted
	FROM `invitation` A	
	LEFT JOIN `address` B ON A.address = B.id
    LEFT JOIN 
		(SELECT B.id, name, photo, C.value AS cuisine_nationality, D.value AS interior, tagline, other 
         FROM `place` B 
		 LEFT JOIN `cuisine_nationality` C ON B.cuisine_nationality = C.id
	     LEFT JOIN `interior`    	    D ON B.interior = D.id) E
    ON B.place = E.id
	LEFT JOIN `user`    C ON A.inviting_person = C.id
    LEFT JOIN `user`    D ON A.recipient = D.id
	WHERE ((_requestArea = "country" AND country = _userLocation) OR 
		  (_requestArea = "region"  AND region  = _userLocation) OR
		  (_requestArea = "town"    AND town    = _userLocation) OR 
		  (_requestArea = "street"  AND street  = _userLocation) OR 
		  (_requestArea = "house"   AND house   = _userLocation));
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getInvitationsListMadeByPerson` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getInvitationsListMadeByPerson`(IN _id INT)
BEGIN
	SELECT A.id, datetime, B.id as address_id, E.name, photo, country, region, town, mail_index, street, 
		   house, apartment, cuisine_nationality, interior, tagline, other, who_will_pay, message, 
		   C.id AS inviting_person_id, C.name AS inviting_person, D.id AS recipient_id, D.name AS recipient, accepted
	FROM `invitation` A 
	LEFT JOIN `address` B ON A.address = B.id
    LEFT JOIN 
		(SELECT B.id, name, photo, C.value AS cuisine_nationality, D.value AS interior, tagline, other 
         FROM `place` B 
		 LEFT JOIN `cuisine_nationality` C ON B.cuisine_nationality = C.id
	     LEFT JOIN `interior`    	    D ON B.interior = D.id) E
    ON B.place = E.id
	LEFT JOIN `user`    C ON A.inviting_person = C.id
    LEFT JOIN `user`    D ON A.recipient = D.id
	WHERE inviting_person = _id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getPersonalInvitationsList` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getPersonalInvitationsList`(IN _id INT)
BEGIN
	SELECT A.id, datetime, B.id as address_id, E.name, photo, country, region, town, mail_index, street, 
		   house, apartment, cuisine_nationality, interior, tagline, other, who_will_pay, message, 
		   C.id AS inviting_person_id, C.name AS inviting_person, D.id AS recipient_id, D.name AS recipient, accepted
	FROM `invitation` A	
	LEFT JOIN `address` B ON A.address = B.id
    LEFT JOIN 
		(SELECT B.id, name, photo, C.value AS cuisine_nationality, D.value AS interior, tagline, other 
         FROM `place` B 
		 LEFT JOIN `cuisine_nationality` C ON B.cuisine_nationality = C.id
	     LEFT JOIN `interior`    	    D ON B.interior = D.id) E
    ON B.place = E.id
	LEFT JOIN `user`    C ON A.inviting_person = C.id
    LEFT JOIN `user`    D ON A.recipient = D.id
	WHERE recipient = _id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getPlaceByAddressId` */;
ALTER DATABASE `goeatapp` CHARACTER SET utf8 COLLATE utf8_general_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getPlaceByAddressId`(IN _id INT)
BEGIN
	SELECT A.id, name, photo, country, region, town, mail_index, street, 
		   house, apartment, cuisine_nationality, interior, tagline, other
	FROM `address` A	
	LEFT JOIN 
		(SELECT B.id, name, photo, C.value AS cuisine_nationality, D.value AS interior, tagline, other 
         FROM `place` B 
		 LEFT JOIN `cuisine_nationality` C ON B.cuisine_nationality = C.id
	     LEFT JOIN `interior`    	    D ON B.interior = D.id) E
    ON A.place = E.id
    WHERE A.id = _id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `goeatapp` CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci ;
/*!50003 DROP PROCEDURE IF EXISTS `getPlacesListByLocationAndPreferences` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getPlacesListByLocationAndPreferences`(IN _requestArea VARCHAR(10), 
														IN _userLocation VARCHAR(30), 
														IN _cuisine_nationality VARCHAR(30),
														IN _interior VARCHAR(30))
BEGIN
	SELECT A.id, name, photo, country, region, town, mail_index, street, 
		   house, apartment, cuisine_nationality, interior, tagline, other
	FROM `address` A	
	LEFT JOIN 
		(SELECT B.id, name, photo, C.value AS cuisine_nationality, D.value AS interior, tagline, other 
         FROM `place` B 
		 LEFT JOIN `cuisine_nationality` C ON B.cuisine_nationality = C.id
	     LEFT JOIN `interior`    	    D ON B.interior = D.id) E
    ON A.place = E.id
	WHERE ((cuisine_nationality = _cuisine_nationality AND interior = _interior OR
			cuisine_nationality = _cuisine_nationality AND _interior = 'null' OR 
            _cuisine_nationality = 'null' AND interior = _interior OR 
            _cuisine_nationality = 'null' AND _interior = 'null') AND
		   ((_requestArea = "country" AND country = _userLocation) OR 
		    (_requestArea = "region"  AND region  = _userLocation) OR
		    (_requestArea = "town"    AND town    = _userLocation) OR 
		    (_requestArea = "street"  AND street  = _userLocation) OR 
		    (_requestArea = "house"   AND house   = _userLocation)));
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getPreferencesByUserId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getPreferencesByUserId`(IN _id INT)
BEGIN
	SELECT preferences.id, cuisine_nationality.value, interior.value, tips_percentage, 
			is_vegan, is_raw_food, best_drink, best_first_meal, best_second_meal, best_dessert, other
	FROM `user`
    LEFT JOIN `preferences` ON user.preferences = preferences.id
    LEFT JOIN `cuisine_nationality` ON preferences.cuisine_nationality = cuisine_nationality.id
    LEFT JOIN `interior` ON preferences.interior = interior.id 
	WHERE user.id = _id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getRating` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getRating`(IN _addressId INT)
BEGIN
	SELECT ROUND(AVG(score), 2) AS rating 
    FROM `place_reviews` 
    WHERE place = (select place from address where id = _addressId);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getReviewsByPlaceId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getReviewsByPlaceId`(IN _id INT)
BEGIN
	SELECT place_reviews.id, user, user.name, place, score, review  
	FROM `place_reviews`
	LEFT JOIN `user` ON place_reviews.user = user.id
	WHERE place_reviews.place = _id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getUserById` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getUserById`(IN _id INT)
BEGIN
	SELECT user.id, name, age, gender.value, avatar, preferences, status, role.value
	FROM `user`
    LEFT JOIN `gender` ON user.gender = gender.id
    LEFT JOIN `role` ON user.role = role.id
    WHERE user.id = _id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getUserByLogin` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getUserByLogin`(IN _login VARCHAR(45))
BEGIN
SELECT user.id, name, age, gender.value, avatar, preferences, status, role.value
	FROM `user`
    LEFT JOIN `gender` ON user.gender = gender.id
    LEFT JOIN `role` ON user.role = role.id
    WHERE user.login = _login;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getUserByLoginAndPassword` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getUserByLoginAndPassword`(IN _login VARCHAR(45), IN _password VARCHAR(45))
BEGIN
	SELECT user.id, name, age, gender.value, avatar, preferences, status, role.value
	FROM `user`
    LEFT JOIN `gender` ON user.gender = gender.id
    LEFT JOIN `role` ON user.role = role.id
    WHERE login = _login AND password = _password;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `assortment`
--

/*!50001 DROP VIEW IF EXISTS `assortment`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `assortment` AS select `b`.`name` AS `place`,`c`.`name` AS `dish` from ((`food_assortment` `a` left join `place` `b` on((`a`.`place` = `b`.`id`))) left join `dish` `c` on((`a`.`dish` = `c`.`id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `best_places`
--

/*!50001 DROP VIEW IF EXISTS `best_places`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `best_places` AS select `place`.`id` AS `id`,`place`.`name` AS `name`,`place`.`photo` AS `photo`,`place`.`cuisine_nationality` AS `cuisine_nationality`,`place`.`interior` AS `interior`,`place`.`tagline` AS `tagline`,`place`.`other` AS `other`,`getRatingOfPlace`(`place`.`id`) AS `rating` from `place` */;
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

-- Dump completed on 2021-01-11  0:06:50
