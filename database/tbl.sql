-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: newservlet12month2018
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `createddate` timestamp NULL DEFAULT NULL,
  `modifieddate` timestamp NULL DEFAULT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `modifiedby` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Thể thao','the-thao',NULL,NULL,NULL,NULL),(2,'Thế giới','the-gioi',NULL,NULL,NULL,NULL),(3,'Chính trị','chinh-tri',NULL,NULL,NULL,NULL),(4,'Thời sự','thoi-su',NULL,NULL,NULL,NULL),(5,'Góc nhìn','goc-nhin',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `content` text NOT NULL,
  `user_id` bigint NOT NULL,
  `new_id` bigint NOT NULL,
  `createddate` timestamp NULL DEFAULT NULL,
  `modifieddate` timestamp NULL DEFAULT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `modifiedby` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_comment_user` (`user_id`),
  KEY `fk_comment_news` (`new_id`),
  CONSTRAINT `fk_comment_news` FOREIGN KEY (`new_id`) REFERENCES `news` (`id`),
  CONSTRAINT `fk_comment_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `news`
--

DROP TABLE IF EXISTS `news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `news` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `thumbnail` varchar(255) DEFAULT NULL,
  `shortdescription` text,
  `content` text,
  `categoryid` bigint NOT NULL,
  `createddate` timestamp NULL DEFAULT NULL,
  `modifieddate` timestamp NULL DEFAULT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `modifiedby` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_news_category` (`categoryid`),
  CONSTRAINT `fk_news_category` FOREIGN KEY (`categoryid`) REFERENCES `category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news`
--

LOCK TABLES `news` WRITE;
/*!40000 ALTER TABLE `news` DISABLE KEYS */;
INSERT INTO `news` VALUES (17,'bài viết 1','','bài viết 1','bài viết 1',1,'2023-03-29 13:25:03',NULL,'',NULL),(18,'bài viết 2','','bài viết 2','bài viết 2',1,'2023-03-29 13:25:27',NULL,'',NULL),(19,'bài viết 3','','bài viết 3','bài viết 3',2,'2023-03-29 13:26:05',NULL,'',NULL),(20,'bài viết 4','','bài viết 4','bài viết 4',2,'2023-03-29 13:26:23',NULL,'',NULL),(21,'bài viết 5','','bài viết 5','bài viết 5',2,'2023-03-29 13:40:03',NULL,'',NULL),(22,'bài viết 6','','bài viết 6','bài viết 6',3,'2023-03-29 16:11:25','2023-03-30 02:19:56','',''),(23,'bài viết 7','','bài viết 7','bài viết 7',4,'2023-03-29 16:11:26','2023-03-30 02:20:34','',''),(24,'bài viết 8','','bài viết 8','bài viết 8',1,'2023-03-29 16:11:27','2023-03-30 02:20:52','',''),(30,'Java Servlet JSP','','abcxyz','<h1><strong>Jsp Servlet l&agrave; g&igrave;, kh&oacute;a&nbsp;học jsp servlet lập tr&igrave;nh java web jsp servlet lập tr&igrave;nh web với java jsp servlet cơ bản miễn ph&iacute; d&agrave;nh cho người mới học java web chưa biết g&igrave; mới bắt đầu</strong></h1>\n\n<p><iframe class=\"w-100\" frameborder=\"0\" height=\"533\" sandbox=\"\" scrolling=\"no\" src=\"https://drive.google.com/file/d/1RGan2kWvzEqRYvDFZFTvJTG0AqcylDAH/preview\" width=\"1600\"></iframe></p>\n\n<h1><strong>1. Jsp l&agrave; g&igrave;</strong></h1>\n\n<p>Hiểu đơn giản thế n&agrave;y th&ocirc;i b&agrave; con, v&iacute; dụ c&aacute;c bạn đang đọc b&agrave;i viết học java web jsp servlet của m&igrave;nh</p>\n\n<p>Vậy c&aacute;i c&aacute;c bạn nh&igrave;n thấy, c&oacute; thể thao t&aacute;c như b&ocirc;i đen, copy nội dung, xem video ngay tại website ... Để c&oacute; được những thứ đ&oacute; cần c&oacute; c&ocirc;ng cụ thực hiện v&agrave; c&ocirc;ng cụ ở đ&acirc;y ch&iacute;nh l&agrave; JSP</p>\n\n<h3><strong>2. Servlet l&agrave; g&igrave;</strong></h3>\n\n<p>Jsp l&agrave; view để cho c&aacute;c bạn c&oacute; thể thấy được, nhưng bạn c&oacute; thắc mắc l&agrave; nội dung hiển thị ra n&oacute; nằm ở đ&acirc;u kh&ocirc;ng, v&agrave; n&oacute; hiển thị l&ecirc;n như thế n&agrave;o khi c&aacute;c bạn truy cập b&agrave;i viết kh&ocirc;ng</p>\n\n<p>Tất cả c&aacute;c c&acirc;u hỏi đ&oacute; giải đ&aacute;p như sau, data n&oacute; sẽ nằm trong database (c&oacute; thể l&agrave; mysql hoặc sql server hoặc oracle ... t&ugrave;y theo người ph&aacute;t triển web họ chọn l&agrave; g&igrave;)</p>\n\n<p>Sau khi lấy data từ database l&ecirc;n, để c&oacute; thể truyền nội dung data đ&oacute; ra ngo&agrave;i jsp ch&uacute;ng ta cũng cần 1 c&ocirc;ng cụ để l&agrave;m v&agrave; cụ thể c&ocirc;ng cụ đ&oacute; ch&iacute;nh l&agrave; Servlet</p>\n\n<p>Qua c&aacute;ch giải th&iacute;ch 2 kh&aacute;i niệm ph&iacute;a&nbsp;tr&ecirc;n th&igrave; ch&uacute;ng ta hiểu n&ocirc;m na thế n&agrave;y</p>\n\n<p>Jsp ch&iacute;nh l&agrave; view c&ograve;n servlet ch&iacute;nh l&agrave; server để nhận data từ view cũng như truyền data ra view từ database. Tuy nhi&ecirc;n 1 m&igrave;nh servlet kh&ocirc;ng thể n&agrave;o l&agrave;m việc được, n&oacute; cần rất nhiều thứ kh&aacute;c bổ trợ như: jdbc, jpa, hibernate ... để truy vấn giữ liệu</p>\n\n<p>Vậy để hiểu r&otilde; hơn th&igrave; ch&uacute;ng ta c&ugrave;ng đi v&agrave;o kh&oacute;a học jsp servlet m&agrave; m&igrave;nh bi&ecirc;n soạn cho c&aacute;c bạn ph&iacute;a b&ecirc;n dưới nh&eacute;&nbsp;</p>\n\n<h2><strong>Th&ocirc;ng tin li&ecirc;n quan của series học java web lập tr&igrave;nh web với java jsp servlet cơ bản</strong></h2>\n\n<p>- Anh em n&agrave;o chưa c&oacute; kiến thức java cơ bản th&igrave; xem tại đ&acirc;y:&nbsp;<a href=\"https://laptrinhjavaweb.com/java-co-ban-63\" target=\"_blank\"><u>HỌC JAVA CORE CƠ BẢN MIỄN PH&Iacute;</u></a></p>\n\n<p>- &Ocirc;n tập java core, sử dụng java core build phần&nbsp;<strong>JDBC, Restful API Web Service</strong>&nbsp;...</p>\n\n<p>- Th&ocirc;ng qua kh&oacute;a học java web jsp servlet n&agrave;y bạn sẽ hiểu c&aacute;ch sử dụng c&aacute;c c&ocirc;ng nghệ:&nbsp;<strong>JSP, Servlet, JDBC, Restful API Web Service, Jquery, Bootstrap</strong></p>\n\n<p>- Sau khi tham gia kh&oacute;a học bạn sẽ c&oacute; nền tảng để học l&ecirc;n c&aacute;c&nbsp;<strong>framework&nbsp;</strong>v&agrave; c&ocirc;ng nghệ:&nbsp;<strong>Spring MVC, Spring Boot, Hibernate, JPA, Spring Data JPA, Restful API Web Service, Spring Security, JWT(Json Web Token)</strong></p>\n\n<p>- Tham gia nh&oacute;m facebook để đươc giải đ&aacute;p c&aacute;c thắc mắc:&nbsp;<u><a href=\"https://www.facebook.com/groups/laptrinhjavaweb\" target=\"_blank\">JOIN NH&Oacute;M TẠI Đ&Acirc;Y</a></u></p>\n\n<p>- Link hướng dẫn c&agrave;i đặt:&nbsp;<u><a href=\"https://laptrinhjavaweb.com/huong-dan-cai-dat-phan-mem-4\" target=\"_blank\">XEM TẠI Đ&Acirc;Y</a></u></p>\n\n<p>- Kh&oacute;a học spring mvc cơ bản miễn ph&iacute; kh&ocirc;ng sử dụng spring boot:<strong>&nbsp;</strong><u><a href=\"https://laptrinhjavaweb.com/springmvc\" target=\"_blank\">LINK KH&Oacute;A HỌC</a></u></p>\n\n<p>- Kh&oacute;a học spring boot cơ bản miễn ph&iacute;:<strong>&nbsp;</strong><u><a href=\"https://laptrinhjavaweb.com/springboot\" target=\"_blank\">LINK KH&Oacute;A HỌC</a></u><br />\n&nbsp;</p>\n\n<p><u><iframe class=\"w-100\" frameborder=\"0\" sandbox=\"\" scrolling=\"no\" src=\"https://drive.google.com/file/d/1B_OR-VHhQWRftnAmsQW14RWmhiMnqTQ9/preview\"></iframe></u></p>\n\n<p><u><iframe class=\"w-100\" frameborder=\"0\" height=\"500\" sandbox=\"\" scrolling=\"no\" src=\"https://www.youtube.com/embed/UUeMuz5gLW8\" width=\"1000\"></iframe></u></p>\n',1,'2023-04-02 06:38:06','2023-04-02 09:05:30','admin','admin'),(31,'bài viết 9','bài viết 9','bài viết 9','<p>b&agrave;i viết 9</p>\n',1,'2023-04-02 10:28:15','2023-04-02 10:30:26','admin','admin'),(32,'bài viết 111','bài viết 111','bài viết 111','<p>b&agrave;i viết 10</p>\n',1,'2023-04-02 10:38:07','2023-04-02 10:38:40','admin','admin');
/*!40000 ALTER TABLE `news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `createddate` timestamp NULL DEFAULT NULL,
  `modifieddate` timestamp NULL DEFAULT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `modifiedby` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'Quản Trị','ADMIN',NULL,NULL,NULL,NULL),(2,'Người dùng','USER',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `username` varchar(150) NOT NULL,
  `password` varchar(150) NOT NULL,
  `fullname` varchar(150) DEFAULT NULL,
  `status` int NOT NULL,
  `roleid` bigint NOT NULL,
  `createddate` timestamp NULL DEFAULT NULL,
  `modifieddate` timestamp NULL DEFAULT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `modifiedby` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_user_role` (`roleid`),
  CONSTRAINT `fk_user_role` FOREIGN KEY (`roleid`) REFERENCES `role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'admin','123456','admin',1,1,NULL,NULL,NULL,NULL),(2,'nguyenvana','123456','Nguyễn Văn A',1,2,NULL,NULL,NULL,NULL),(3,'nguyenvanb','123456','Nguyễn Văn B',1,2,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-04-02 20:20:44
