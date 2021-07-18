CREATE DATABASE  IF NOT EXISTS `enrich` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `enrich`;
-- MySQL dump 10.13  Distrib 8.0.25, for Win64 (x86_64)
--
-- Host: localhost    Database: enrich
-- ------------------------------------------------------
-- Server version	8.0.25

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
-- Table structure for table `attribute_expressions`
--

DROP TABLE IF EXISTS `attribute_expressions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attribute_expressions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `attribute` varchar(20) DEFAULT NULL,
  `expression` varchar(70) DEFAULT NULL,
  `key_name` varchar(20) DEFAULT NULL,
  `page` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKhn11ur6fq98qgv1ydnqamdj9a` (`page`),
  CONSTRAINT `FKhn11ur6fq98qgv1ydnqamdj9a` FOREIGN KEY (`page`) REFERENCES `pages` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attribute_expressions`
--

LOCK TABLES `attribute_expressions` WRITE;
/*!40000 ALTER TABLE `attribute_expressions` DISABLE KEYS */;
INSERT INTO `attribute_expressions` VALUES (1,'productLink','div.lt-product-group-info a','productLink',1),(2,'productDetails','div.left div.product-shop','productDetails',1),(3,'name','div.topview h1','name',1),(4,'image','div.product-image-gallery img','image',1),(5,'price','p.special-price span','price',1),(6,'colors','span.opt-name','colors',1),(7,'promotions','ul.el-promotion-pack li a','promotions',1),(8,'rom','div.linked a.active span','rom',1),(9,'ram','td:matches(\\d+(.)*GB)','ram',1),(10,'productLink','div.sdo-item-title h5 a','productLink',2),(11,'productDetails','div.product-single-content','productDetails',2),(12,'name','div.sdo-rowtop h1','name',2),(13,'image','li.img-small a.active img','image',2),(14,'price','div.tfs-new-price p span.tfs-new-gia','price',2),(15,'colors','div.color-single-product ul li','colors',2),(16,'promotions','div.sdo-qua-km-new ul li p','promotions',2),(17,'rom','div.capacity ul li','rom',2),(18,'ram','div.parameter:matches(\\d+(.)*GB)','ram',2),(19,'productLink','section.products-view div div a.product__box-image','productLink',3),(20,'productDetails','section.product div.container','productDetails',3),(21,'name','div.evo-top-product-name h1','name',3),(22,'image','div.swiper-wrapper a.swiper-slide img','image',3),(23,'price','span.special-price span','price',3),(24,'colors','div.swatch div','colors',3),(25,'promotions','div.khuyenmai div p a span','promotions',3),(26,'memories','td p:matches(\\d+(.)*GB)','memories',3);
/*!40000 ALTER TABLE `attribute_expressions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `domains`
--

DROP TABLE IF EXISTS `domains`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `domains` (
  `id` int NOT NULL,
  `base_url` varchar(100) DEFAULT NULL,
  `logo` varchar(100) DEFAULT NULL,
  `marker` varchar(255) DEFAULT NULL,
  `name` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `domains`
--

LOCK TABLES `domains` WRITE;
/*!40000 ALTER TABLE `domains` DISABLE KEYS */;
INSERT INTO `domains` VALUES (1,'https://cellphones.com.vn',NULL,'CPS','CellPhoneS'),(2,'https://shopdunk.com',NULL,'SD','Shop Dunk'),(3,'https://didongthongminh.vn',NULL,'DDTM','Di Động Thông Minh');
/*!40000 ALTER TABLE `domains` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pages`
--

DROP TABLE IF EXISTS `pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pages` (
  `id` int NOT NULL,
  `pagination_link` varchar(100) DEFAULT NULL,
  `domain` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKbn080nlem66bqjfucldhkweil` (`domain`),
  CONSTRAINT `FKbn080nlem66bqjfucldhkweil` FOREIGN KEY (`domain`) REFERENCES `domains` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages`
--

LOCK TABLES `pages` WRITE;
/*!40000 ALTER TABLE `pages` DISABLE KEYS */;
INSERT INTO `pages` VALUES (1,'https://cellphones.com.vn/mobile/apple.html?p=1',1),(2,'https://shopdunk.com/iphone',2),(3,'https://didongthongminh.vn/iphone?page=',3);
/*!40000 ALTER TABLE `pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_colors`
--

DROP TABLE IF EXISTS `product_colors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_colors` (
  `product_product_id` int NOT NULL,
  `colors` varchar(255) DEFAULT NULL,
  KEY `FKtj2st2v778aiqmj2hpdktscjp` (`product_product_id`),
  CONSTRAINT `FKtj2st2v778aiqmj2hpdktscjp` FOREIGN KEY (`product_product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_colors`
--

LOCK TABLES `product_colors` WRITE;
/*!40000 ALTER TABLE `product_colors` DISABLE KEYS */;
INSERT INTO `product_colors` VALUES (1,'Bạc'),(1,'Vàng'),(1,'Xám'),(1,'Xanh dương'),(2,'Tím'),(2,'Trắng'),(2,'Xanh dương'),(2,'Xanh lá'),(2,'Đen'),(2,'Đỏ'),(3,'Tím'),(3,'Trắng'),(3,'Vàng'),(3,'Xanh lá'),(3,'Đen'),(3,'Đỏ'),(4,'Cam'),(4,'Trắng'),(4,'Vàng'),(4,'Xanh dương'),(4,'Đen'),(4,'Đỏ'),(5,'Bạc'),(5,'Vàng'),(5,'Xám'),(5,'Xanh dương'),(6,'Tím'),(6,'Trắng'),(6,'Xanh'),(6,'Xanh dương'),(6,'Đen'),(6,'Đỏ'),(9,'Bạc'),(9,'Vàng'),(9,'Xám'),(9,'Xanh dương'),(10,'Bạc'),(10,'Vàng'),(10,'Xám'),(10,'Xanh dương'),(11,'Tím'),(11,'Trắng'),(11,'Xanh'),(11,'Xanh dương'),(11,'Đen'),(11,'Đỏ'),(12,'Bạc'),(12,'Vàng'),(12,'Xám'),(12,'Xanh dương'),(15,' #4f7c97;'),(15,' #8B8989;'),(15,' #C0C0C0;'),(15,' #FED96E;'),(16,' #FED96E;'),(16,' #8B8989;'),(16,' #C0C0C0;'),(16,' #4f7c97;'),(17,' #FED96E;'),(17,' #8B8989;'),(17,' #C0C0C0;'),(17,' #4f7c97;'),(18,' #4f7c97;'),(18,' #8B8989;'),(18,' #C0C0C0;'),(18,' #FED96E;'),(19,' #0033ff;'),(19,' #F3F2F0;'),(19,' #b0e1c4;'),(19,' #000;'),(19,' #dd2122;'),(19,' #bb32ff;'),(20,' #000;'),(20,' #F3F2F0;'),(20,' #b0e1c4;'),(20,' #0033ff;'),(20,' #dd2122;'),(20,' #bb32ff;'),(21,' #b0e1c4;'),(21,' #000;'),(21,' #F3F2F0;'),(21,' #0033ff;'),(21,' #dd2122;'),(21,' #bb32ff;'),(22,' #0033ff;'),(22,' #000;'),(22,' #F3F2F0;'),(22,' #b0e1c4;'),(22,' #dd2122;'),(22,' #bb32ff;'),(23,' #dd2122;'),(23,' #000;'),(23,' #F3F2F0;'),(24,' #000;'),(24,' #F3F2F0;'),(24,' #dd2122;'),(25,' #000;'),(25,' #F3F2F0;'),(25,' #FED96E;'),(25,' #dd2122;'),(25,' #b0e1c4;'),(25,' #c7bfd6;'),(26,' #dd2122;'),(26,' #c7bfd6;'),(26,' #000;'),(26,' #F3F2F0;'),(26,' #FED96E;'),(26,' #b0e1c4;'),(27,' #0033ff;'),(27,' #000;'),(27,' #F3F2F0;'),(27,' #b0e1c4;'),(27,' #dd2122;'),(27,' #bb32ff;'),(28,' #000;'),(28,' #F3F2F0;'),(28,' #dd2122;'),(29,' #8B8989;'),(29,' #4f7c97;'),(29,' #C0C0C0;'),(29,' #FED96E;'),(30,' #8B8989;'),(30,' #C0C0C0;'),(30,' #FED96E;'),(30,' #4f7c97;'),(31,' #000;'),(31,' #F3F2F0;'),(31,' #b0e1c4;'),(31,' #0033ff;'),(31,' #dd2122;'),(31,' #bb32ff;'),(32,' #F3F2F0;'),(32,' #ff6600;'),(32,' #8B8989;'),(32,' #FED96E;'),(32,' #dd2122;'),(32,' #0033ff;'),(33,' #F3F2F0;'),(33,' #0033ff;'),(33,' #ff6600;'),(33,' #8B8989;'),(33,' #FED96E;'),(33,' #dd2122;'),(34,'Đỏ'),(34,'Đen'),(34,'Tím'),(34,'Trắng'),(34,'Vàng'),(34,'Xanh lá'),(35,'Vàng'),(35,'Tím'),(35,'Đen'),(35,'Đỏ'),(35,'Trắng'),(35,'Xanh lá'),(36,'Đỏ'),(36,'Đen'),(36,'Xanh Mint'),(36,'Xanh Navy'),(36,'Trắng'),(36,'Tím'),(37,'Đỏ'),(37,'Đen'),(37,'Xanh Mint'),(37,'Xanh Navy'),(37,'Trắng'),(37,'Tím'),(38,'Đen'),(38,'Trắng'),(38,'Xanh Navy'),(38,'Vàng'),(39,'Đen'),(39,'Xanh Navy'),(39,'Trắng'),(39,'Vàng'),(40,'Đỏ'),(40,'Vàng'),(40,'Xanh Dương'),(40,'Cam'),(40,'Đen'),(40,'Trắng'),(41,'Xanh Navy'),(41,'Đen'),(41,'Trắng'),(41,'Vàng'),(42,'Đen'),(42,'Trắng'),(42,'Xanh Navy'),(42,'Vàng'),(43,'Bạc'),(43,'Vàng'),(43,'Xám'),(44,'Xanh Mint'),(44,'Xanh Navy'),(44,'Đen'),(44,'Đỏ'),(44,'Trắng'),(45,'Xanh Mint'),(45,'Xanh Navy'),(45,'Đen'),(45,'Đỏ'),(45,'Trắng'),(46,'Cam'),(46,'Đen'),(46,'Đỏ'),(46,'Trắng'),(46,'Vàng'),(46,'Xanh Dương'),(47,'Đen'),(47,'Đỏ'),(47,'Tím'),(47,'Trắng'),(47,'Vàng'),(47,'Xanh lá'),(48,'Đỏ'),(48,'Xanh Mint'),(48,'Xanh Navy'),(48,'Đen'),(48,'Trắng'),(49,'Đỏ'),(49,'Xanh Mint'),(49,'Xanh Navy'),(49,'Đen'),(49,'Trắng'),(50,'Xanh Navy'),(50,'Đen'),(50,'Trắng'),(50,'Vàng'),(51,'Bạc'),(51,'Đen'),(51,'Đỏ'),(52,'Bạc'),(52,'Đen'),(52,'Đỏ'),(53,'Bạc'),(53,'Đen'),(53,'Đỏ'),(54,'Xám'),(54,'Bạc'),(54,'Vàng'),(55,'Bạc'),(55,'Đen'),(55,'Đỏ'),(55,'Vàng'),(55,'Cấp A'),(55,'Cấp B'),(56,'Bạc'),(56,'Đen'),(56,'Đỏ'),(56,'Vàng'),(56,'Cấp A'),(56,'Cấp B'),(57,'Bạc'),(57,'Đen'),(57,'Đỏ'),(57,'Jet Black'),(57,'Rose Gold'),(57,'Vàng');
/*!40000 ALTER TABLE `product_colors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_promotions`
--

DROP TABLE IF EXISTS `product_promotions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_promotions` (
  `product_product_id` int NOT NULL,
  `promotions` varchar(255) DEFAULT NULL,
  KEY `FKkai82ss2nw92v98svdjnpkw8x` (`product_product_id`),
  CONSTRAINT `FKkai82ss2nw92v98svdjnpkw8x` FOREIGN KEY (`product_product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_promotions`
--

LOCK TABLES `product_promotions` WRITE;
/*!40000 ALTER TABLE `product_promotions` DISABLE KEYS */;
INSERT INTO `product_promotions` VALUES (15,'Trả góp 0% lãi suất thẻ tín dụng'),(15,'Giảm 5% khi mua 1 phụ kiện, 10% khi mua 2 phụ kiện, 15% khi mua từ 3 phụ kiện (không áp dụng cho phụ kiện chính hãng Apple)'),(15,'Tặng Voucher 100.000đ khi mua phụ kiện: Pencil, Keyboard, Magic Mouse, Sạc / Cáp, Ốp lưng / Ví da chính hãng Apple (không áp dụng với củ sạc 20W)'),(15,'(Lưu ý: Chương trình KM tính trên giá niêm yết, không áp dụng chung với KM khác)'),(16,'Trả góp 0% lãi suất thẻ tín dụng'),(16,'Giảm 5% khi mua 1 phụ kiện, 10% khi mua 2 phụ kiện, 15% khi mua từ 3 phụ kiện (không áp dụng cho phụ kiện chính hãng Apple)'),(16,'Tặng Voucher 100.000đ khi mua phụ kiện: Pencil, Keyboard, Magic Mouse, Sạc / Cáp, Ốp lưng / Ví da chính hãng Apple (không áp dụng với củ sạc 20W)'),(16,'(Lưu ý: Chương trình KM tính trên giá niêm yết, không áp dụng chung với KM khác)'),(17,'Trả góp 0% lãi suất thẻ tín dụng'),(17,'Giảm 5% khi mua 1 phụ kiện, 10% khi mua 2 phụ kiện, 15% khi mua từ 3 phụ kiện (không áp dụng cho phụ kiện chính hãng Apple)'),(17,'Tặng Voucher 100.000đ khi mua phụ kiện: Pencil, Keyboard, Magic Mouse, Sạc / Cáp, Ốp lưng / Ví da chính hãng Apple (không áp dụng với củ sạc 20W)'),(17,'(Lưu ý: Chương trình KM tính trên giá niêm yết, không áp dụng chung với KM khác)'),(18,'Trả góp 0% lãi suất thẻ tín dụng'),(18,'Giảm 5% khi mua 1 phụ kiện, 10% khi mua 2 phụ kiện, 15% khi mua từ 3 phụ kiện (không áp dụng cho phụ kiện chính hãng Apple)'),(18,'Tặng Voucher 100.000đ khi mua phụ kiện: Pencil, Keyboard, Magic Mouse, Sạc / Cáp, Ốp lưng / Ví da chính hãng Apple (không áp dụng với củ sạc 20W)'),(18,'(Lưu ý: Chương trình KM tính trên giá niêm yết, không áp dụng chung với KM khác)'),(19,'Trả góp 0% lãi suất thẻ tín dụng'),(19,'Giảm 5% khi mua 1 phụ kiện, 10% khi mua 2 phụ kiện, 15% khi mua từ 3 phụ kiện (không áp dụng cho phụ kiện chính hãng Apple)'),(19,'Tặng Voucher 100.000đ khi mua phụ kiện: Pencil, Keyboard, Magic Mouse, Sạc / Cáp, Ốp lưng / Ví da chính hãng Apple (không áp dụng với củ sạc 20W)'),(19,'(Lưu ý: Chương trình KM tính trên giá niêm yết, không áp dụng chung với KM khác)'),(20,'Trả góp 0% lãi suất thẻ tín dụng'),(20,'Giảm 5% khi mua 1 phụ kiện, 10% khi mua 2 phụ kiện, 15% khi mua từ 3 phụ kiện (không áp dụng cho phụ kiện chính hãng Apple)'),(20,'Tặng Voucher 100.000đ khi mua phụ kiện: Pencil, Keyboard, Magic Mouse, Sạc / Cáp, Ốp lưng / Ví da chính hãng Apple (không áp dụng với củ sạc 20W)'),(20,'(Lưu ý: Chương trình KM tính trên giá niêm yết, không áp dụng chung với KM khác)'),(21,'Trả góp 0% lãi suất thẻ tín dụng'),(21,'Giảm 5% khi mua 1 phụ kiện, 10% khi mua 2 phụ kiện, 15% khi mua từ 3 phụ kiện (không áp dụng cho phụ kiện chính hãng Apple)'),(21,'Tặng Voucher 100.000đ khi mua phụ kiện: Pencil, Keyboard, Magic Mouse, Sạc / Cáp, Ốp lưng / Ví da chính hãng Apple (không áp dụng với củ sạc 20W)'),(21,'(Lưu ý: Chương trình KM tính trên giá niêm yết, không áp dụng chung với KM khác)'),(22,'Trả góp 0% lãi suất thẻ tín dụng'),(22,'Giảm 5% khi mua 1 phụ kiện, 10% khi mua 2 phụ kiện, 15% khi mua từ 3 phụ kiện (không áp dụng cho phụ kiện chính hãng Apple)'),(22,'Tặng Voucher 100.000đ khi mua phụ kiện: Pencil, Keyboard, Magic Mouse, Sạc / Cáp, Ốp lưng / Ví da chính hãng Apple (không áp dụng với củ sạc 20W)'),(22,'(Lưu ý: Chương trình KM tính trên giá niêm yết, không áp dụng chung với KM khác)'),(23,'Tặng thêm 500.000đ thu cũ đổi mới'),(23,'Trả góp 0% lãi suất thẻ tín dụng'),(24,'Tặng thêm 500.000đ thu cũ đổi mới'),(24,'Trả góp 0% lãi suất thẻ tín dụng'),(25,'Trả góp 0% lãi suất thẻ tín dụng'),(25,'Giảm 5% khi mua 1 phụ kiện, 10% khi mua 2 phụ kiện, 15% khi mua từ 3 phụ kiện (không áp dụng cho phụ kiện chính hãng Apple)'),(25,'Tặng Voucher 100.000đ khi mua phụ kiện: Pencil, Keyboard, Magic Mouse, Sạc / Cáp, Ốp lưng / Ví da chính hãng Apple (không áp dụng với củ sạc 20W)'),(25,'(Lưu ý: Chương trình KM tính trên giá niêm yết, không áp dụng chung với KM khác)'),(26,'Trả góp 0% lãi suất thẻ tín dụng'),(26,'Giảm 5% khi mua 1 phụ kiện, 10% khi mua 2 phụ kiện, 15% khi mua từ 3 phụ kiện (không áp dụng cho phụ kiện chính hãng Apple)'),(26,'Tặng Voucher 100.000đ khi mua phụ kiện: Pencil, Keyboard, Magic Mouse, Sạc / Cáp, Ốp lưng / Ví da chính hãng Apple (không áp dụng với củ sạc 20W)'),(26,'(Lưu ý: Chương trình KM tính trên giá niêm yết, không áp dụng chung với KM khác)'),(27,'Trả góp 0% lãi suất thẻ tín dụng'),(27,'Giảm 5% khi mua 1 phụ kiện, 10% khi mua 2 phụ kiện, 15% khi mua từ 3 phụ kiện (không áp dụng cho phụ kiện chính hãng Apple)'),(27,'Tặng Voucher 100.000đ khi mua phụ kiện: Pencil, Keyboard, Magic Mouse, Sạc / Cáp, Ốp lưng / Ví da chính hãng Apple (không áp dụng với củ sạc 20W)'),(27,'(Lưu ý: Chương trình KM tính trên giá niêm yết, không áp dụng chung với KM khác)'),(28,'Tặng thêm 500.000đ thu cũ đổi mới'),(28,'Trả góp 0% lãi suất thẻ tín dụng'),(29,'Trả góp 0% lãi suất thẻ tín dụng'),(29,'Giảm 5% khi mua 1 phụ kiện, 10% khi mua 2 phụ kiện, 15% khi mua từ 3 phụ kiện (không áp dụng cho phụ kiện chính hãng Apple)'),(29,'Tặng Voucher 100.000đ khi mua phụ kiện: Pencil, Keyboard, Magic Mouse, Sạc / Cáp, Ốp lưng / Ví da chính hãng Apple (không áp dụng với củ sạc 20W)'),(29,'(Lưu ý: Chương trình KM tính trên giá niêm yết, không áp dụng chung với KM khác)'),(30,'Trả góp 0% lãi suất thẻ tín dụng'),(30,'Giảm 5% khi mua 1 phụ kiện, 10% khi mua 2 phụ kiện, 15% khi mua từ 3 phụ kiện (không áp dụng cho phụ kiện chính hãng Apple)'),(30,'Tặng Voucher 100.000đ khi mua phụ kiện: Pencil, Keyboard, Magic Mouse, Sạc / Cáp, Ốp lưng / Ví da chính hãng Apple (không áp dụng với củ sạc 20W)'),(30,'(Lưu ý: Chương trình KM tính trên giá niêm yết, không áp dụng chung với KM khác)'),(31,'Trả góp 0% lãi suất thẻ tín dụng'),(31,'Giảm 5% khi mua 1 phụ kiện, 10% khi mua 2 phụ kiện, 15% khi mua từ 3 phụ kiện (không áp dụng cho phụ kiện chính hãng Apple)'),(31,'Tặng Voucher 100.000đ khi mua phụ kiện: Pencil, Keyboard, Magic Mouse, Sạc / Cáp, Ốp lưng / Ví da chính hãng Apple (không áp dụng với củ sạc 20W)'),(31,'(Lưu ý: Chương trình KM tính trên giá niêm yết, không áp dụng chung với KM khác)'),(32,'Trả góp 0% lãi suất thẻ tín dụng'),(32,'Giảm 5% khi mua 1 phụ kiện, 10% khi mua 2 phụ kiện, 15% khi mua từ 3 phụ kiện (không áp dụng cho phụ kiện chính hãng Apple)'),(32,'Tặng Voucher 100.000đ khi mua phụ kiện: Pencil, Keyboard, Magic Mouse, Sạc / Cáp, Ốp lưng / Ví da chính hãng Apple (không áp dụng với củ sạc 20W)'),(32,'(Lưu ý: Chương trình KM tính trên giá niêm yết, không áp dụng chung với KM khác)'),(33,'Trả góp 0% lãi suất thẻ tín dụng'),(33,'Giảm 5% khi mua 1 phụ kiện, 10% khi mua 2 phụ kiện, 15% khi mua từ 3 phụ kiện (không áp dụng cho phụ kiện chính hãng Apple)'),(33,'Tặng Voucher 100.000đ khi mua phụ kiện: Pencil, Keyboard, Magic Mouse, Sạc / Cáp, Ốp lưng / Ví da chính hãng Apple (không áp dụng với củ sạc 20W)'),(33,'(Lưu ý: Chương trình KM tính trên giá niêm yết, không áp dụng chung với KM khác)'),(34,'Đặt ngay suất mua iPhone 11 VN/a Giá Sốc chỉ 12.990.000đ'),(35,'Đặt ngay suất mua iPhone 11 VN/a Giá Sốc chỉ 12.990.000đ'),(36,'Đặt ngay suất mua iPhone 11 VN/a Giá Sốc chỉ 12.990.000đ'),(37,'Đặt ngay suất mua iPhone 11 VN/a Giá Sốc chỉ 12.990.000đ'),(38,'Đặt ngay suất mua iPhone 11 VN/a Giá Sốc chỉ 12.990.000đ'),(39,'Đặt ngay suất mua iPhone 11 VN/a Giá Sốc chỉ 12.990.000đ'),(40,'Đặt ngay suất mua iPhone 11 VN/a Giá Sốc chỉ 12.990.000đ'),(41,'Đặt ngay suất mua iPhone 11 VN/a Giá Sốc chỉ 12.990.000đ'),(42,'Đặt ngay suất mua iPhone 11 VN/a Giá Sốc chỉ 12.990.000đ'),(44,'Đặt ngay suất mua iPhone 11 VN/a Giá Sốc chỉ 12.990.000đ'),(45,'Đặt ngay suất mua iPhone 11 VN/a Giá Sốc chỉ 12.990.000đ'),(46,'Đặt ngay suất mua iPhone 11 VN/a Giá Sốc chỉ 12.990.000đ'),(47,'Đặt ngay suất mua iPhone 11 VN/a Giá Sốc chỉ 12.990.000đ'),(48,'Đặt ngay suất mua iPhone 11 VN/a Giá Sốc chỉ 12.990.000đ'),(50,'Đặt ngay suất mua iPhone 11 VN/a Giá Sốc chỉ 12.990.000đ');
/*!40000 ALTER TABLE `product_promotions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `product_id` int NOT NULL,
  `image_url` varchar(250) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `price` int DEFAULT NULL,
  `product_link` varchar(100) DEFAULT NULL,
  `ram` smallint DEFAULT NULL,
  `rom` smallint DEFAULT NULL,
  `domain` int DEFAULT NULL,
  PRIMARY KEY (`product_id`),
  KEY `FKep2jhhk3d2uwksjra0k6tj1v3` (`domain`),
  CONSTRAINT `FKep2jhhk3d2uwksjra0k6tj1v3` FOREIGN KEY (`domain`) REFERENCES `domains` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'https://cdn.cellphones.com.vn/media/catalog/product/cache/7/image/9df78eab33525d08d6e5fb8d27136e95/i/p/iphone-12-pro-max_1__7_1.jpg','iPhone 12 Pro Max I Chính hãng VN/A',28950000,'https://cellphones.com.vn/iphone-12-pro-max.html',6,128,1),(2,'https://cdn.cellphones.com.vn/media/catalog/product/cache/7/image/9df78eab33525d08d6e5fb8d27136e95/i/p/iphone-12_2__3.jpg','iPhone 12 I Chính hãng VN/A',18800000,'https://cellphones.com.vn/iphone-12.html',4,64,1),(3,'https://cdn.cellphones.com.vn/media/catalog/product/cache/7/image/9df78eab33525d08d6e5fb8d27136e95/l/a/layer_20_1.jpg','iPhone 11 128GB I Chính hãng VN/A',16000000,'https://cellphones.com.vn/iphone-11-128gb.html',4,128,1),(4,'https://cdn.cellphones.com.vn/media/catalog/product/cache/7/image/9df78eab33525d08d6e5fb8d27136e95/a/p/apple-iphone-xr-64-gb-chinh-hang-vn_3_.jpg','iPhone XR 64GB I Chính hãng VN/A',11500000,'https://cellphones.com.vn/apple-iphone-xr-64-gb-chinh-hang-vn.html',3,64,1),(5,'https://cdn.cellphones.com.vn/media/catalog/product/cache/7/image/9df78eab33525d08d6e5fb8d27136e95/i/p/iphone-12-pro-max_3__9.jpg','iPhone 12 Pro I Chính hãng VN/A',26550000,'https://cellphones.com.vn/iphone-12-pro.html',6,128,1),(6,'https://cdn.cellphones.com.vn/media/catalog/product/cache/7/image/9df78eab33525d08d6e5fb8d27136e95/i/p/iphone-12_7__6_3.jpg','iPhone 12 128GB I Chính hãng VN/A',20400000,'https://cellphones.com.vn/iphone-12-128gb.html',4,128,1),(7,'https://cdn.cellphones.com.vn/media/catalog/product/cache/7/image/9df78eab33525d08d6e5fb8d27136e95/l/a/layer_23.jpg','iPhone 11 Pro I Chính hãng VN/A',24530000,'https://cellphones.com.vn/iphone-11-pro.html',4,64,1),(8,'https://cdn.cellphones.com.vn/media/catalog/product/cache/7/image/9df78eab33525d08d6e5fb8d27136e95/l/a/layer_20_2.jpg','iPhone 11 256GB I Chính hãng VN/A',18500000,'https://cellphones.com.vn/iphone-11-256gb.html',4,256,1),(9,'https://cdn.cellphones.com.vn/media/catalog/product/cache/7/image/9df78eab33525d08d6e5fb8d27136e95/i/p/iphone-12-pro-max_3__6.jpg','iPhone 12 Pro Max 512GB I Chính hãng VN/A',38000000,'https://cellphones.com.vn/iphone-12-pro-max-512gb.html',6,512,1),(10,'https://cdn.cellphones.com.vn/media/catalog/product/cache/7/image/9df78eab33525d08d6e5fb8d27136e95/i/p/iphone-12-pro-max_3__8.jpg','iPhone 12 Pro 256GB I Chính hãng VN/A',28200000,'https://cellphones.com.vn/iphone-12-pro-256gb.html',6,256,1),(11,'https://cdn.cellphones.com.vn/media/catalog/product/cache/7/image/9df78eab33525d08d6e5fb8d27136e95/i/p/iphone-12_7__7.jpg','iPhone 12 256GB I Chính hãng VN/A',24000000,'https://cellphones.com.vn/iphone-12-256gb.html',4,256,1),(12,'https://cdn.cellphones.com.vn/media/catalog/product/cache/7/image/9df78eab33525d08d6e5fb8d27136e95/i/p/iphone-12-pro-max_3__10.jpg','iPhone 12 Pro 512GB I Chính hãng VN/A',31500000,'https://cellphones.com.vn/iphone-12-pro-512gb.html',6,512,1),(13,'https://cdn.cellphones.com.vn/media/catalog/product/cache/7/image/9df78eab33525d08d6e5fb8d27136e95/i/p/iphone-12_7__6.jpg','iPhone 12 mini 256GB I Chính hãng VN/A',20000000,'https://cellphones.com.vn/iphone-12-mini-256gb.html',4,256,1),(14,'https://cdn.cellphones.com.vn/media/catalog/product/cache/7/image/9df78eab33525d08d6e5fb8d27136e95/i/p/iphone-se-2020_1__4.jpg','iPhone SE 2020 256GB I Chính hãng VN/A',13010000,'https://cellphones.com.vn/iphone-se-2020-256gb.html',3,256,1),(15,'https://shopdunk.com/wp-content/uploads/2021/01/VN_iPhone_12_Pro_Max_Pacific_Blue_PDP_Image_Position-01.jpg','iPhone 12 Pro Max chính hãng VN/A (Full VAT) (512GB - Xanh)',36650000,'https://shopdunk.com/san-pham/iphone-12-pro-max-chinh-hang-vn-a-full-vat-512gb/',6,512,2),(16,'https://shopdunk.com/wp-content/uploads/2021/05/iphone-12-pro-max.jpg','iPhone 12 Pro Max chính hãng VN/A (Full VAT) (256GB - Xám)',31350000,'https://shopdunk.com/san-pham/iphone-12-pro-max-chinh-hang-vn-a-full-vat-256gb/',6,256,2),(17,'https://shopdunk.com/wp-content/uploads/2021/01/VN_iPhone_12_Pro_Gold_PDP_Image_Position-01.jpg','iPhone 12 Pro chính hãng VN/A (Full VAT) (512GB - Vàng)',33750000,'https://shopdunk.com/san-pham/iphone-12-pro-chinh-hang-vn-a-full-vat-512gb/',6,512,2),(18,'https://shopdunk.com/wp-content/uploads/2021/01/VN_iPhone_12_Pro_Max_Pacific_Blue_PDP_Image_Position-01.jpg','iPhone 12 Pro chính hãng VN/A (Full VAT) (256GB - Xanh)',27950000,'https://shopdunk.com/san-pham/iphone-12-pro-chinh-hang-vn-a-full-vat-256gb/',6,256,2),(19,'https://shopdunk.com/wp-content/uploads/2021/05/iphone-12-blue-1.jpg','iPhone 12 Mini chính hãng VN/A (Full VAT) (256GB - Xanh dương)',19950000,'https://shopdunk.com/san-pham/iphone-12-mini-chinh-hang-apple-full-vat-256gb/',4,256,2),(20,'https://shopdunk.com/wp-content/uploads/2021/01/VN-iPhone_12_Black_PDP_Image_Position-01.jpg','iPhone 12 Mini chính hãng VN/A (Full VAT) (128GB - Đen)',16950000,'https://shopdunk.com/san-pham/iphone-12-mini-chinh-hang-apple-full-vat-128gb/',4,128,2),(21,'https://shopdunk.com/wp-content/uploads/2021/04/VN-iPhone_12_Green_PDP_Image_Position-01.jpg','iPhone 12 chính hãng VN/A (Full VAT) (256GB - Xanh)',22850000,'https://shopdunk.com/san-pham/iphone-12-chinh-hang-apple-full-vat-256gb/',4,256,2),(22,'https://shopdunk.com/wp-content/uploads/2021/04/VN-iPhone_12_PRED_PDP_Image_Position-01.jpg','iPhone 12 chính hãng VN/A (Full VAT) (128GB - Đỏ)',19850000,'https://shopdunk.com/san-pham/iphone-12-chinh-hang-apple-full-vat-128gb/',4,128,2),(23,'https://shopdunk.com/wp-content/uploads/2021/04/VN_iPhoneSE_COL_PDP_Image_Red_1A_FA.jpg','iPhone SE 2020 Chính hãng VN/A (Full VAT) (256GB - Đỏ)',14490000,'https://shopdunk.com/san-pham/iphone-se-2020-256gb-chinh-hang-vn-a-full-vat/',3,256,2),(24,'https://shopdunk.com/wp-content/uploads/2021/04/VN_iPhoneSE_COL_PDP_Image_Red_1A_FA.jpg','iPhone SE 2020 Chính hãng VN/A (Full VAT) (128GB - Đỏ)',11490000,'https://shopdunk.com/san-pham/iphone-se-2020-128gb-chinh-hang-vn-a-full-vat/',3,128,2),(25,'https://shopdunk.com/wp-content/uploads/2021/02/SEA_iPhone_11_B_2.jpg','iPhone 11 Chính hãng VN/A (Full VAT) (128GB - Đen)',14990000,'https://shopdunk.com/san-pham/iphone-11-128gb-chinh-hang-vn-a-full-vat/',4,128,2),(26,'https://shopdunk.com/wp-content/uploads/2021/02/SEA_iPhone_11_R_2.jpg','iPhone 11 Chính hãng VN/A (Full VAT) (256GB - Đỏ)',17790000,'https://shopdunk.com/san-pham/iphone-11-256gb-chinh-hang-vn-a-full-vat/',4,256,2),(27,'https://shopdunk.com/wp-content/uploads/2021/05/iphone-12-blue.jpg','iPhone 12 Mini chính hãng VN/A (Full VAT) (64GB - Xanh dương)',15550000,'https://shopdunk.com/san-pham/iphone-12-mini-chinh-hang-vna-full-vat-64gb/',4,64,2),(28,'https://shopdunk.com/wp-content/uploads/2021/04/VN_iPhoneSE_COL_PDP_Image_Red_1A_FA.jpg','iPhone SE 2020 Chính hãng VN/A (Full VAT) (64GB - Đỏ)',10490000,'https://shopdunk.com/san-pham/iphone-se-2020-vn-a-moi-chinh-hang-full-vat/',3,64,2),(29,'https://shopdunk.com/wp-content/uploads/2021/05/iphone-12-pro-max.jpg','iPhone 12 Pro Max chính hãng VN/A (Full VAT) (128GB - Xám)',28460000,'https://shopdunk.com/san-pham/iphone-12-pro-max-moi-chinh-hang-full-vat-128gb/',6,128,2),(30,'https://shopdunk.com/wp-content/uploads/2021/05/iphone-12-pro-max.jpg','iPhone 12 Pro chính hãng VN/A (Full VAT) (128GB - Xám)',25950000,'https://shopdunk.com/san-pham/iphone-12-pro-moi-chinh-hang-full-vat-128gb/',6,128,2),(31,'https://shopdunk.com/wp-content/uploads/2021/04/VN-iPhone_12_PRED_PDP_Image_Position-01.jpg','iPhone 12 chính hãng VN/A (Full VAT) (64GB - Đỏ)',18450000,'https://shopdunk.com/san-pham/iphone-12-moi-chinh-hang-full-vat-64gb/',4,64,2),(32,'https://shopdunk.com/wp-content/uploads/2021/04/large_1606352475_MH6N3ZP_A-001.jpg','iPhone XR chính hãng VN/A (Full VAT) (128GB - Trắng)',12990000,'https://shopdunk.com/san-pham/iphone-xr-chinh-hang-full-vat/',3,128,2),(33,'https://shopdunk.com/wp-content/uploads/2021/04/large_1606352475_MH6N3ZP_A-001.jpg','iPhone XR chính hãng VN/A (Full VAT) (64GB - Trắng)',11490000,'https://shopdunk.com/san-pham/iphone-xr-1-sim-moi/',3,64,2),(34,'https://bizweb.dktcdn.net/100/420/160/products/iphone-11-red-1-15c0074d-2235-4dbb-8f45-574e8b080fee.png?v=1624852809803','iPhone 11 64GB Chính Hãng VN/A (Phiên Bản Hộp Mới)',13990000,'https://didongthongminh.vn/iphone-11-64gb-chinh-hang-vn-a-phien-ban-hop-moi',4,64,3),(35,'https://bizweb.dktcdn.net/100/420/160/products/iphone-11-64gb-vang.gif?v=1625279357243','iPhone 11 128GB Chính Hãng VN/A (Phiên Bản Hộp Mới)',14890000,'https://didongthongminh.vn/iphone-11-128gb-chinh-hang-vn-a-phien-ban-hop-moi',4,128,3),(36,'https://bizweb.dktcdn.net/100/420/160/products/iphone12-pro-2-5ba48e2d-008f-4592-b31a-0949d7b9f40f.png?v=1624334083853','iPhone 12 64GB Chính Hãng VN/A',18390000,'https://didongthongminh.vn/iphone-12-64gb-chinh-hang-vn-a',4,64,3),(37,'https://bizweb.dktcdn.net/100/420/160/products/iphone12-pro-17181048-82d2-4fed-bcf5-7c6b66e0d9bc.png?v=1624334084707','iPhone 12 128GB Chính Hãng VN/A',19790000,'https://didongthongminh.vn/iphone-12-128gb-chinh-hang-vn-a',4,128,3),(38,'https://bizweb.dktcdn.net/100/420/160/products/iphone-12-pro-max-2-c4c4d627-26fc-46b6-8e73-29d7ae5f62b8-3c987ee3-2a99-41b2-bee1-828e778fe68d.png?v=1624334083933','iPhone 12 Pro Max 128GB Chính Hãng VN/A',28490000,'https://didongthongminh.vn/iphone-12-pro-max-128gb-chinh-hang-vn-a',6,128,3),(39,'https://bizweb.dktcdn.net/100/420/160/products/iphone-12-pro-max-2-8e039a66-0bb0-4b87-bebe-dd9719a820c0.png?v=1624334084373','iPhone 12 Pro Max 256GB Chính Hãng VN/A',30990000,'https://didongthongminh.vn/iphone-12-pro-max-256gb-chinh-hang-vn-a',6,256,3),(40,'https://bizweb.dktcdn.net/100/420/160/products/iphone-xr-vang-e3d8ca3e-3145-46b1-a48c-656f912a2ca7.png?v=1622773947817','iPhone XR 64Gb Chính Hãng VN/A (Phiên Bản Hộp Mới)',10990000,'https://didongthongminh.vn/iphone-xr-64gb-chinh-hang-vn-a-phien-ban-hop-moi',3,64,3),(41,'https://bizweb.dktcdn.net/100/420/160/products/iphone-12-pro2-0f18df38-8fb9-4b5e-bdb0-2bb3df12e36e-0719ec85-2c63-4260-b9bb-58e984967327.png?v=1624334083577','iPhone 12 Pro 128GB Chính Hãng VN/A',25990000,'https://didongthongminh.vn/iphone-12-pro-128gb-chinh-hang-vn-a',6,128,3),(42,'https://bizweb.dktcdn.net/100/420/160/products/iphone-12-pro2-c191c02a-841c-4744-8426-cec0a8503497.png?v=1624334084287','iPhone 12 Pro 256GB Chính Hãng VN/A',27890000,'https://didongthongminh.vn/iphone-12-pro-256gb-chinh-hang-vn-a',6,256,3),(43,'https://bizweb.dktcdn.net/100/420/160/products/xsmax-percentage-c4-percentage-91en-f2f8442c-cff0-4d2d-84d8-76c3764cb43c-e9ebb07a-ef35-40d9-addb-c12c290da497.png?v=1622773918370','iPhone Xs Max Cũ 256GB Nguyên Bản Đẹp Như Mới',13490000,'https://didongthongminh.vn/iphone-xs-max-cu-256gb-nguyen-ban-dep-nhu-moi',4,256,3),(44,'https://bizweb.dktcdn.net/100/420/160/products/iphone-12-mini-128gb-chinh-hang.png?v=1625046072510','iPhone 12 Mini 64GB Chính Hãng VN/A',15490000,'https://didongthongminh.vn/iphone-12-mini-64gb-chinh-hang-vn-a',4,64,3),(45,'https://bizweb.dktcdn.net/100/420/160/products/iphone-12-mini2-28c54b6c-0057-4a23-86aa-a3f1609f7405-cd551cdb-dfef-4d8a-a0c2-70387e58d9ae.png?v=1624334083760','iPhone 12 Mini 128GB Chính Hãng VN/A',16690000,'https://didongthongminh.vn/iphone-12-mini-128gb-chinh-hang-vn-a',4,128,3),(46,'https://bizweb.dktcdn.net/100/420/160/products/iphone-xr-den-373c13ae-b9fd-4be6-bc13-e46b20e1f261.png?v=1622773962570','iPhone XR 128Gb Chính Hãng VN/A (Phiên Bản Hộp Mới)',13350000,'https://didongthongminh.vn/iphone-xr-128gb-chinh-hang-vn-a-phien-ban-hop-moi',3,128,3),(47,'https://bizweb.dktcdn.net/100/420/160/products/iphone11-red-select-2019-b2cafcf9-136e-40ee-89d6-3b6f4d610e43.png?v=1624412156667','iPhone 11 256GB Chính Hãng VN/A (Phiên Bản Mới)',19690000,'https://didongthongminh.vn/iphone-11-256gb-chinh-hang-vn-a-phien-ban-moi',4,256,3),(48,'https://bizweb.dktcdn.net/100/420/160/products/202010141134321940-iphone-12-35e17cd9-d8f3-4cd0-87a8-4ccf297471eb-1d361e2f-2857-4025-81f0-a2d4d45b89f3.jpg?v=1625042825420','iPhone 12 Mini 256GB Chính Hãng VN/A',19790000,'https://didongthongminh.vn/iphone-12-mini-256gb-chinh-hang-vn-a',4,256,3),(49,'https://bizweb.dktcdn.net/100/420/160/products/iphone12-pro-e61a3519-752b-4061-9f39-bb05d15f87fa-b8fcc1d6-58b4-4d51-9db0-4eaf65d73d0f.png?v=1624334084620','iPhone 12 256GB Chính Hãng VN/A',22490000,'https://didongthongminh.vn/iphone-12-256gb-chinh-hang-vn-a',4,256,3),(50,'https://bizweb.dktcdn.net/100/420/160/products/iphone-12-pro-max-2-f3079c0a-c1da-489c-b9a2-ebd913c51b4d-7b65f689-df46-4d79-9ecd-eefd06a140c5.png?v=1624334084187','iPhone 12 Pro Max 512GB Chính Hãng VN/A',36990000,'https://didongthongminh.vn/iphone-12-pro-max-512gb-chinh-hang-vn-a',6,512,3),(51,'https://bizweb.dktcdn.net/100/420/160/products/iphone-se-2020-black-c0cb125d-9c1e-45df-8938-de8567c784ba-3f676212-9496-4103-8362-4721acc69fa7.png?v=1622783190283','iPhone SE 128GB 2020 Chính Hãng VN/A',12490000,'https://didongthongminh.vn/iphone-se-128gb-2020-chinh-hang-vn-a',128,3,3),(52,'https://bizweb.dktcdn.net/100/420/160/products/iphone-se-2020-black-f9f7d9d7-eefd-4486-8283-fa6eec708c2e.png?v=1622783177910','iPhone SE 64GB 2020 Chính Hãng VN/A',10990000,'https://didongthongminh.vn/iphone-se-64gb-2020-chinh-hang-vn-a',64,3,3),(53,'https://bizweb.dktcdn.net/100/420/160/products/iphone-se-2020-black-8dcc8e4d-fcda-4897-9146-09dbb28df9c1-80f53847-5dc6-4858-afc5-d7184abde7ac.png?v=1622783184000','iPhone SE 256GB 2020 Chính Hãng VN/A',15490000,'https://didongthongminh.vn/iphone-se-256gb-2020-chinh-hang-vn-a',256,3,3),(54,'https://bizweb.dktcdn.net/100/420/160/products/600x600-apple-iphone-xs-gold-7-3a406e4ef90c4b848e81bc7758d6162a-grande.png?v=1625305672717','iPhone Xs Max Cũ 64GB Nguyên Bản Đẹp như mới',11990000,'https://didongthongminh.vn/iphone-xs-max-cu-64gb-nguyen-ban-dep-nhu-moi',4,64,3),(55,'https://bizweb.dktcdn.net/100/420/160/products/iphone8-sliver-1-74e815a3-1873-4677-9501-52000b16f922.png?v=1622782762400','iPhone 8 Cũ 64Gb Nguyên Bản Đẹp Như Mới',4790000,'https://didongthongminh.vn/iphone-8-cu-64gb-nguyen-ban-dep-nhu-moi',64,2,3),(56,'https://bizweb.dktcdn.net/100/420/160/products/7280cbbd-312f-4a3e-927c-3c45ddcfc58e-e26945a9-7dcb-4d38-a3b1-8c97a283133e.png?v=1624412157430','iPhone 8 Plus Cũ 64Gb Nguyên Bản Đẹp Như Mới',6990000,'https://didongthongminh.vn/iphone-8-plus-cu-64gb-nguyen-ban-dep-nhu-moi',64,3,3),(57,'https://bizweb.dktcdn.net/100/420/160/products/iphone-7-plus-jet-lack-deecce2b-31a5-46e2-b107-2682ebdbfcd4.png?v=1622783319630','iPhone 7 Plus Cũ 32Gb Nguyên Bản Đẹp Như Mới',5790000,'https://didongthongminh.vn/iphone-7-plus-cu-32gb-nguyen-ban-dep-nhu-moi',32,3,3);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `code` varchar(15) NOT NULL,
  `role_name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL,
  `display_name` varchar(50) DEFAULT NULL,
  `password` varchar(256) DEFAULT NULL,
  `username` varchar(30) DEFAULT NULL,
  `role_code` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_r43af9ap4edm43mmtq01oddj6` (`username`),
  KEY `FKqitn4yl3nrjxv4lj3r6i23evc` (`role_code`),
  CONSTRAINT `FKqitn4yl3nrjxv4lj3r6i23evc` FOREIGN KEY (`role_code`) REFERENCES `roles` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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

-- Dump completed on 2021-07-18 19:00:32
