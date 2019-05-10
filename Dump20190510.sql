-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: toyslovedb
-- ------------------------------------------------------
-- Server version	5.7.20-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `firstPage` bit(1) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `priority` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (2,'','Sencillos',5,'YM6JMRTXperson_1.jpg','Descripcion'),(3,'','Dobles',5,'O8ILPCH3person_4.jpg','Categoria de dobles');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cities`
--

DROP TABLE IF EXISTS `cities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cities` (
  `idciudad` int(11) NOT NULL,
  `dsciudad` varchar(255) DEFAULT NULL,
  `dsstate` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idciudad`)
) ENGINE=InnoDB DEFAULT CHARSET=latin7;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cities`
--

LOCK TABLES `cities` WRITE;
/*!40000 ALTER TABLE `cities` DISABLE KEYS */;
/*!40000 ALTER TABLE `cities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clients`
--

DROP TABLE IF EXISTS `clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clients` (
  `document` varchar(20) NOT NULL,
  `dsname` varchar(45) NOT NULL,
  `dslast_name` varchar(45) NOT NULL,
  `dsaddress` varchar(80) NOT NULL,
  `dsaddress_append` varchar(45) DEFAULT NULL,
  `idstate` int(11) NOT NULL,
  `dscity` varchar(60) NOT NULL,
  `dsemail` varchar(80) NOT NULL,
  `dsphone` varchar(12) NOT NULL,
  `dsaddress_comment` varchar(400) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `dspassword` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`document`),
  KEY `FKkpf8fr07738jijqhoh4bjry7i` (`idstate`),
  CONSTRAINT `FK_CLIENTS_STATE` FOREIGN KEY (`idstate`) REFERENCES `states` (`idstate`),
  CONSTRAINT `FKkpf8fr07738jijqhoh4bjry7i` FOREIGN KEY (`idstate`) REFERENCES `states` (`idstate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='	';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clients`
--

LOCK TABLES `clients` WRITE;
/*!40000 ALTER TABLE `clients` DISABLE KEYS */;
INSERT INTO `clients` VALUES ('1037626409','Daniel','Gutierrez','cr46AA #45Csur 12','Apartamento 201',1,'Envigado','danielgm9312@hotmail.com','3016637232','Cerca al polideportivo de primavera','1234','1234567');
/*!40000 ALTER TABLE `clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hibernate_sequence`
--

DROP TABLE IF EXISTS `hibernate_sequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hibernate_sequence` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin7;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hibernate_sequence`
--

LOCK TABLES `hibernate_sequence` WRITE;
/*!40000 ALTER TABLE `hibernate_sequence` DISABLE KEYS */;
INSERT INTO `hibernate_sequence` VALUES (1);
/*!40000 ALTER TABLE `hibernate_sequence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login`
--

DROP TABLE IF EXISTS `login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `login` (
  `user` varchar(255) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user`)
) ENGINE=InnoDB DEFAULT CHARSET=latin7;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login`
--

LOCK TABLES `login` WRITE;
/*!40000 ALTER TABLE `login` DISABLE KEYS */;
/*!40000 ALTER TABLE `login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` int(11) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `value` decimal(10,0) DEFAULT NULL,
  `image` varchar(200) DEFAULT NULL,
  `stars` int(11) DEFAULT NULL,
  `stock` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `FK_productos_categories_idx` (`category`),
  CONSTRAINT `FK_productos_categories` FOREIGN KEY (`category`) REFERENCES `categories` (`id`),
  CONSTRAINT `FKtng6hvelpjyy7el0f5eq93nq4` FOREIGN KEY (`category`) REFERENCES `categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (3,3,'Producto 1','Una desripcion larga Una desripcion larga Una desripcion larga Una desripcion larga Una desripcion larga Una desripcion larga Una ',10000,'983EQIMMshoe_1.jpg',4,5),(4,2,'Camiseta','',25000,'42I3Z5YOcloth_1.jpg',4,3),(5,3,'Camisetas dobles','Camisetas dobles en oferta',43000,'51PN7P5Qcloth_3.jpg',5,10),(6,2,'Chaqueta bebe','Hermosa chaqueta para bebe',80000,'VPINL9YMproduct.jpg',5,1),(7,2,'Camiseta ','',15000,'5KP11KU5product.jpg',5,5),(17,2,'Producto prueb','',15000,'FRX4210Bproduct.jpg',5,1),(18,2,'Producto con imagen prueba','',20000,'7O8KZZSHproduct.jpg',5,10);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchaseorder`
--

DROP TABLE IF EXISTS `purchaseorder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `purchaseorder` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idClient` varchar(20) DEFAULT NULL,
  `dsaddress` varchar(200) DEFAULT NULL,
  `dsemail` varchar(60) DEFAULT NULL,
  `dsphone` varchar(12) DEFAULT NULL,
  `date_created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `date_modified` timestamp NULL DEFAULT NULL,
  `dstrack_guide` varchar(200) DEFAULT NULL,
  `dsstatus` varchar(30) DEFAULT 'PENDIENTE DE APROBACIÓN',
  `dsshipping_carrier` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_PURCHASEORDER_CLIENTS_idx` (`idClient`),
  CONSTRAINT `FKc4h51dh6wpjd082211v4x1qbw` FOREIGN KEY (`idClient`) REFERENCES `clients` (`document`)
) ENGINE=InnoDB AUTO_INCREMENT=1027 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchaseorder`
--

LOCK TABLES `purchaseorder` WRITE;
/*!40000 ALTER TABLE `purchaseorder` DISABLE KEYS */;
INSERT INTO `purchaseorder` VALUES (5,'1037626409','cr46AA #45Csur 12 - Apartamento 201','danielgm9312@hotmail.com','3016637232','2019-04-29 15:37:55','2019-05-02 17:25:39','','PENDIENTE DE APROBACIÓN','asd'),(1001,'1037626409','cr46AA #45Csur 12 - Apartamento 201','danielgm9312@hotmail.com','3016637232','2019-04-29 15:37:55','2019-05-02 16:45:02',NULL,'PENDIENTE DE APROBACIÓN',NULL),(1002,'1037626409','cr46AA #45Csur 12 - Apartamento 202','danielgm9312@hotmail.com','3016637232','2019-04-29 15:37:55','2019-04-29 21:57:00','Asdas251','PENDIENTE DE APROBACIÓN',NULL),(1003,'1037626409','cr46AA #45Csur 12 - Apartamento 201','danielgm9312@hotmail.com','3016637232','2019-04-29 22:40:27',NULL,NULL,'PENDIENTE DE APROBACIÓN',NULL),(1004,'1037626409','cr46AA #45Csur 12 - Apartamento 201','danielgm9312@hotmail.com','3016637232','2019-05-01 17:13:39','2019-05-02 21:14:54',NULL,'ENVÍO REALIZADO',NULL),(1005,'1037626409','cr46AA #45Csur 12 - Apartamento 201','danielgm9312@hotmail.com','3016637232','2019-05-02 21:42:18',NULL,NULL,'PENDIENTE DE APROBACIÓN',NULL),(1006,'1037626409','cr46AA #45Csur 12 - Apartamento 201','danielgm9312@hotmail.com','3016637232','2019-05-03 14:23:02',NULL,NULL,'PENDIENTE DE APROBACIÓN',NULL),(1007,'1037626409','cr46AA #45Csur 12 - Apartamento 201','danielgm9312@hotmail.com','3016637232','2019-05-03 14:27:20',NULL,NULL,'PENDIENTE DE APROBACIÓN',NULL),(1008,'1037626409','cr46AA #45Csur 12 - Apartamento 201','danielgm9312@hotmail.com','3016637232','2019-05-03 14:32:48',NULL,NULL,'PENDIENTE DE APROBACIÓN',NULL),(1009,'1037626409','cr46AA #45Csur 12 - Apartamento 201','danielgm9312@hotmail.com','3016637232','2019-05-03 14:35:03',NULL,NULL,'PENDIENTE DE APROBACIÓN',NULL),(1010,'1037626409','cr46AA #45Csur 12 - Apartamento 201','danielgm9312@hotmail.com','3016637232','2019-05-03 20:53:48',NULL,NULL,'PENDIENTE DE APROBACIÓN',NULL),(1011,'1037626409','cr46AA #45Csur 12 - Apartamento 201','danielgm9312@hotmail.com','3016637232','2019-05-03 21:10:56',NULL,NULL,'PENDIENTE DE APROBACIÓN',NULL),(1012,'1037626409','cr46AA #45Csur 12 - Apartamento 201','danielgm9312@hotmail.com','3016637232','2019-05-03 21:15:29',NULL,NULL,'PENDIENTE DE APROBACIÓN',NULL),(1013,'1037626409','cr46AA #45Csur 12 - Apartamento 201','danielgm9312@hotmail.com','3016637232','2019-05-06 20:27:10',NULL,NULL,'PENDIENTE DE APROBACIÓN',NULL),(1014,'1037626409','cr46AA #45Csur 12 - Apartamento 201','danielgm9312@hotmail.com','3016637232','2019-05-06 20:27:52',NULL,NULL,'PENDIENTE DE APROBACIÓN',NULL),(1015,'1037626409','cr46AA #45Csur 12 - Apartamento 201','danielgm9312@hotmail.com','3016637232','2019-05-06 20:31:59',NULL,NULL,'PENDIENTE DE APROBACIÓN',NULL),(1016,'1037626409','cr46AA #45Csur 12 - Apartamento 201','danielgm9312@hotmail.com','3016637232','2019-05-07 15:41:15',NULL,NULL,'PENDIENTE DE APROBACIÓN',NULL),(1017,'1037626409','cr46AA #45Csur 12 - Apartamento 201','danielgm9312@hotmail.com','3016637232','2019-05-07 15:45:25',NULL,NULL,'PENDIENTE DE APROBACIÓN',NULL),(1018,'1037626409','cr46AA #45Csur 12 - Apartamento 201','danielgm9312@hotmail.com','3016637232','2019-05-07 15:46:21',NULL,NULL,'PENDIENTE DE APROBACIÓN',NULL),(1019,'1037626409','cr46AA #45Csur 12 - Apartamento 201','danielgm9312@hotmail.com','3016637232','2019-05-07 16:02:21',NULL,NULL,'PENDIENTE DE APROBACIÓN',NULL),(1020,'1037626409','cr46AA #45Csur 12 - Apartamento 201','danielgm9312@hotmail.com','3016637232','2019-05-07 16:11:18',NULL,NULL,'PENDIENTE DE APROBACIÓN',NULL),(1021,'1037626409','cr46AA #45Csur 12 - Apartamento 201','danielgm9312@hotmail.com','3016637232','2019-05-07 16:14:53','2019-05-07 16:32:58',NULL,'ORDEN ENTREGADA',NULL),(1022,'1037626409','cr46AA #45Csur 12 - Apartamento 201','danielgm9312@hotmail.com','3016637232','2019-05-07 16:23:33','2019-05-07 16:32:53',NULL,'ENVÍO REALIZADO',NULL),(1023,'1037626409','cr46AA #45Csur 12 - Apartamento 201','danielgm9312@hotmail.com','3016637232','2019-05-07 16:29:51','2019-05-07 16:32:49',NULL,'ORDEN APROBADA',NULL),(1024,'1037626409','cr46AA #45Csur 12 - Apartamento 201','danielgm9312@hotmail.com','3016637232','2019-05-07 16:49:09',NULL,NULL,'PENDIENTE DE APROBACIÓN',NULL),(1025,'1037626409','cr46AA #45Csur 12 - Apartamento 201','danielgm9312@hotmail.com','3016637232','2019-05-07 16:49:42',NULL,NULL,'PENDIENTE DE APROBACIÓN',NULL),(1026,'1037626409','cr46AA #45Csur 12 - Apartamento 201','danielgm9312@hotmail.com','3016637232','2019-05-07 19:26:03',NULL,NULL,'PENDIENTE DE APROBACIÓN',NULL);
/*!40000 ALTER TABLE `purchaseorder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchaseorderproduct`
--

DROP TABLE IF EXISTS `purchaseorderproduct`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `purchaseorderproduct` (
  `idproduct` int(11) NOT NULL,
  `idpurchase_order` int(11) NOT NULL,
  `dsproduct` varchar(200) DEFAULT NULL,
  `vlqnty` int(11) DEFAULT NULL,
  `vlprice` decimal(10,0) DEFAULT NULL,
  `image` varchar(200) DEFAULT NULL,
  `product_consecutive` int(11) NOT NULL,
  PRIMARY KEY (`idproduct`,`idpurchase_order`),
  KEY `FK_PURCHASEORDERITEM_PURCHASEORDER_idx` (`idpurchase_order`),
  CONSTRAINT `FK7dccdll6ohjqx706fry1kgq5s` FOREIGN KEY (`idpurchase_order`) REFERENCES `purchaseorder` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchaseorderproduct`
--

LOCK TABLES `purchaseorderproduct` WRITE;
/*!40000 ALTER TABLE `purchaseorderproduct` DISABLE KEYS */;
INSERT INTO `purchaseorderproduct` VALUES (1,5,'Camiseta',2,25000,NULL,0),(1,1001,'Producto 1',3,10000,NULL,0),(1,1002,'Producto 1',3,10000,NULL,0),(1,1003,'Producto 1',2,10000,NULL,0),(2,1001,'Camiseta',1,25000,NULL,0),(2,1002,'Camiseta',4,25000,NULL,0),(2,1003,'Camisetas dobles',1,43000,NULL,0),(3,1002,'Camisetas dobles',1,43000,NULL,0),(3,1004,'Producto 1',3,10000,'983EQIMMshoe_1.jpg',1),(3,1009,'Producto 1',2,10000,'983EQIMMshoe_1.jpg',1),(3,1010,'Producto 1',2,10000,'983EQIMMshoe_1.jpg',1),(3,1011,'Producto 1',1,10000,'983EQIMMshoe_1.jpg',1),(3,1012,'Producto 1',2,10000,'983EQIMMshoe_1.jpg',1),(3,1013,'Producto 1',2,10000,'983EQIMMshoe_1.jpg',1),(3,1014,'Producto 1',2,10000,'983EQIMMshoe_1.jpg',1),(3,1015,'Producto 1',2,10000,'983EQIMMshoe_1.jpg',1),(3,1016,'Producto 1',3,10000,'983EQIMMshoe_1.jpg',1),(3,1017,'Producto 1',1,10000,'983EQIMMshoe_1.jpg',1),(3,1018,'Producto 1',3,10000,'983EQIMMshoe_1.jpg',1),(3,1019,'Producto 1',2,10000,'983EQIMMshoe_1.jpg',1),(3,1020,'Producto 1',3,10000,'983EQIMMshoe_1.jpg',1),(3,1023,'Producto 1',1,10000,'983EQIMMshoe_1.jpg',1),(3,1026,'Producto 1',4,10000,'983EQIMMshoe_1.jpg',1),(4,1004,'Camiseta',1,25000,'42I3Z5YOcloth_1.jpg',2),(4,1011,'Camiseta',2,25000,'42I3Z5YOcloth_1.jpg',2),(4,1012,'Camiseta',3,25000,'42I3Z5YOcloth_1.jpg',2),(4,1019,'Camiseta',1,25000,'42I3Z5YOcloth_1.jpg',2),(4,1020,'Camiseta',2,25000,'42I3Z5YOcloth_1.jpg',2),(4,1023,'Camiseta',3,25000,'42I3Z5YOcloth_1.jpg',2),(5,1004,'Camisetas dobles',2,43000,'51PN7P5Qcloth_3.jpg',3),(5,1019,'Camisetas dobles',11,43000,'51PN7P5Qcloth_3.jpg',4),(6,1010,'Chaqueta bebe',3,80000,'LVEH1C2Dchildren.jpg',2),(7,1019,'Camiseta ',3,15000,'WFRRLFT7person_1.jpg',5),(8,1012,'Zapatillas Azules ',1,65000,'RR91VWYEhero_1.png',3),(8,1019,'Zapatillas Azules ',3,65000,'RR91VWYEhero_1.png',3),(8,1024,'Zapatillas Azules ',1,65000,'RR91VWYEhero_1.png',1);
/*!40000 ALTER TABLE `purchaseorderproduct` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `states`
--

DROP TABLE IF EXISTS `states`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `states` (
  `idstate` int(11) NOT NULL,
  `dsstate` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`idstate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `states`
--

LOCK TABLES `states` WRITE;
/*!40000 ALTER TABLE `states` DISABLE KEYS */;
INSERT INTO `states` VALUES (1,'Antioquia');
/*!40000 ALTER TABLE `states` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) NOT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `userName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin7;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
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

-- Dump completed on 2019-05-10  8:36:29
