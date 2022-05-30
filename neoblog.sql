-- MySQL dump 10.14  Distrib 5.5.68-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: neo_blog
-- ------------------------------------------------------
-- Server version	5.5.68-MariaDB

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
-- Table structure for table `app01_advert`
--

DROP TABLE IF EXISTS `app01_advert`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app01_advert` (
  `nid` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(32) DEFAULT NULL,
  `href` varchar(200) NOT NULL,
  `img` varchar(100) DEFAULT NULL,
  `img_list` longtext,
  `is_show` tinyint(1) NOT NULL,
  `author` varchar(32) DEFAULT NULL,
  `abstract` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`nid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app01_advert`
--

LOCK TABLES `app01_advert` WRITE;
/*!40000 ALTER TABLE `app01_advert` DISABLE KEYS */;
/*!40000 ALTER TABLE `app01_advert` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app01_articles`
--

DROP TABLE IF EXISTS `app01_articles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app01_articles` (
  `nid` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(32) DEFAULT NULL,
  `abstract` varchar(128) DEFAULT NULL,
  `content` longtext,
  `create_date` datetime(6) DEFAULT NULL,
  `change_date` datetime(6) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `recommend` tinyint(1) NOT NULL,
  `look_count` int(11) NOT NULL,
  `comment_count` int(11) NOT NULL,
  `digg_count` int(11) NOT NULL,
  `collects_count` int(11) NOT NULL,
  `category` int(11) DEFAULT NULL,
  `author` varchar(16) DEFAULT NULL,
  `source` varchar(32) DEFAULT NULL,
  `cover_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`nid`),
  KEY `app01_articles_cover_id_02b692b0_fk_app01_cover_nid` (`cover_id`),
  CONSTRAINT `app01_articles_cover_id_02b692b0_fk_app01_cover_nid` FOREIGN KEY (`cover_id`) REFERENCES `app01_cover` (`nid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app01_articles`
--

LOCK TABLES `app01_articles` WRITE;
/*!40000 ALTER TABLE `app01_articles` DISABLE KEYS */;
/*!40000 ALTER TABLE `app01_articles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app01_articles_tag`
--

DROP TABLE IF EXISTS `app01_articles_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app01_articles_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `articles_id` int(11) NOT NULL,
  `tags_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app01_articles_tag_articles_id_tags_id_f201463d_uniq` (`articles_id`,`tags_id`),
  KEY `app01_articles_tag_tags_id_e0760570_fk_app01_tags_nid` (`tags_id`),
  CONSTRAINT `app01_articles_tag_articles_id_c377df22_fk_app01_articles_nid` FOREIGN KEY (`articles_id`) REFERENCES `app01_articles` (`nid`),
  CONSTRAINT `app01_articles_tag_tags_id_e0760570_fk_app01_tags_nid` FOREIGN KEY (`tags_id`) REFERENCES `app01_tags` (`nid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app01_articles_tag`
--

LOCK TABLES `app01_articles_tag` WRITE;
/*!40000 ALTER TABLE `app01_articles_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `app01_articles_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app01_avatars`
--

DROP TABLE IF EXISTS `app01_avatars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app01_avatars` (
  `nid` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(100) NOT NULL,
  PRIMARY KEY (`nid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app01_avatars`
--

LOCK TABLES `app01_avatars` WRITE;
/*!40000 ALTER TABLE `app01_avatars` DISABLE KEYS */;
/*!40000 ALTER TABLE `app01_avatars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app01_comment`
--

DROP TABLE IF EXISTS `app01_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app01_comment` (
  `nid` int(11) NOT NULL AUTO_INCREMENT,
  `digg_count` int(11) NOT NULL,
  `content` longtext NOT NULL,
  `comment_count` int(11) NOT NULL,
  `drawing` longtext,
  `create_time` datetime(6) NOT NULL,
  `article_id` int(11) NOT NULL,
  `parent_comment_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`nid`),
  KEY `app01_comment_article_id_2bf4f73b_fk_app01_articles_nid` (`article_id`),
  KEY `app01_comment_parent_comment_id_6a8024a5_fk_app01_comment_nid` (`parent_comment_id`),
  KEY `app01_comment_user_id_7f913f03_fk_app01_userinfo_nid` (`user_id`),
  CONSTRAINT `app01_comment_article_id_2bf4f73b_fk_app01_articles_nid` FOREIGN KEY (`article_id`) REFERENCES `app01_articles` (`nid`),
  CONSTRAINT `app01_comment_parent_comment_id_6a8024a5_fk_app01_comment_nid` FOREIGN KEY (`parent_comment_id`) REFERENCES `app01_comment` (`nid`),
  CONSTRAINT `app01_comment_user_id_7f913f03_fk_app01_userinfo_nid` FOREIGN KEY (`user_id`) REFERENCES `app01_userinfo` (`nid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app01_comment`
--

LOCK TABLES `app01_comment` WRITE;
/*!40000 ALTER TABLE `app01_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `app01_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app01_cover`
--

DROP TABLE IF EXISTS `app01_cover`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app01_cover` (
  `nid` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(100) NOT NULL,
  PRIMARY KEY (`nid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app01_cover`
--

LOCK TABLES `app01_cover` WRITE;
/*!40000 ALTER TABLE `app01_cover` DISABLE KEYS */;
/*!40000 ALTER TABLE `app01_cover` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app01_feedback`
--

DROP TABLE IF EXISTS `app01_feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app01_feedback` (
  `nid` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(254) NOT NULL,
  `content` longtext NOT NULL,
  `status` tinyint(1) NOT NULL,
  `processing_content` longtext,
  PRIMARY KEY (`nid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app01_feedback`
--

LOCK TABLES `app01_feedback` WRITE;
/*!40000 ALTER TABLE `app01_feedback` DISABLE KEYS */;
/*!40000 ALTER TABLE `app01_feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app01_history`
--

DROP TABLE IF EXISTS `app01_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app01_history` (
  `nid` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(32) NOT NULL,
  `content` longtext NOT NULL,
  `create_date` date DEFAULT NULL,
  `drawing` longtext,
  PRIMARY KEY (`nid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app01_history`
--

LOCK TABLES `app01_history` WRITE;
/*!40000 ALTER TABLE `app01_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `app01_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app01_menu`
--

DROP TABLE IF EXISTS `app01_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app01_menu` (
  `nid` int(11) NOT NULL AUTO_INCREMENT,
  `menu_title` varchar(16) DEFAULT NULL,
  `menu_title_en` varchar(32) DEFAULT NULL,
  `title` varchar(32) DEFAULT NULL,
  `abstract` longtext,
  `abstract_time` int(11) NOT NULL,
  `rotation` tinyint(1) NOT NULL,
  `menu_rotation` tinyint(1) NOT NULL,
  `menu_time` int(11) NOT NULL,
  PRIMARY KEY (`nid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app01_menu`
--

LOCK TABLES `app01_menu` WRITE;
/*!40000 ALTER TABLE `app01_menu` DISABLE KEYS */;
/*!40000 ALTER TABLE `app01_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app01_menu_menu_url`
--

DROP TABLE IF EXISTS `app01_menu_menu_url`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app01_menu_menu_url` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_id` int(11) NOT NULL,
  `menuimg_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app01_menu_menu_url_menu_id_menuimg_id_9b80b024_uniq` (`menu_id`,`menuimg_id`),
  KEY `app01_menu_menu_url_menuimg_id_c89e39bd_fk_app01_menuimg_nid` (`menuimg_id`),
  CONSTRAINT `app01_menu_menu_url_menuimg_id_c89e39bd_fk_app01_menuimg_nid` FOREIGN KEY (`menuimg_id`) REFERENCES `app01_menuimg` (`nid`),
  CONSTRAINT `app01_menu_menu_url_menu_id_fe74c303_fk_app01_menu_nid` FOREIGN KEY (`menu_id`) REFERENCES `app01_menu` (`nid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app01_menu_menu_url`
--

LOCK TABLES `app01_menu_menu_url` WRITE;
/*!40000 ALTER TABLE `app01_menu_menu_url` DISABLE KEYS */;
/*!40000 ALTER TABLE `app01_menu_menu_url` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app01_menuimg`
--

DROP TABLE IF EXISTS `app01_menuimg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app01_menuimg` (
  `nid` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(100) NOT NULL,
  PRIMARY KEY (`nid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app01_menuimg`
--

LOCK TABLES `app01_menuimg` WRITE;
/*!40000 ALTER TABLE `app01_menuimg` DISABLE KEYS */;
/*!40000 ALTER TABLE `app01_menuimg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app01_moodcomment`
--

DROP TABLE IF EXISTS `app01_moodcomment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app01_moodcomment` (
  `nid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(16) DEFAULT NULL,
  `content` longtext NOT NULL,
  `digg_count` int(11) NOT NULL,
  `create_date` datetime(6) NOT NULL,
  `avatar_id` int(11) DEFAULT NULL,
  `mood_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`nid`),
  KEY `app01_moodcomment_avatar_id_20ee4ce3_fk_app01_avatars_nid` (`avatar_id`),
  KEY `app01_moodcomment_mood_id_f0b5317e_fk_app01_moods_nid` (`mood_id`),
  CONSTRAINT `app01_moodcomment_avatar_id_20ee4ce3_fk_app01_avatars_nid` FOREIGN KEY (`avatar_id`) REFERENCES `app01_avatars` (`nid`),
  CONSTRAINT `app01_moodcomment_mood_id_f0b5317e_fk_app01_moods_nid` FOREIGN KEY (`mood_id`) REFERENCES `app01_moods` (`nid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app01_moodcomment`
--

LOCK TABLES `app01_moodcomment` WRITE;
/*!40000 ALTER TABLE `app01_moodcomment` DISABLE KEYS */;
/*!40000 ALTER TABLE `app01_moodcomment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app01_moods`
--

DROP TABLE IF EXISTS `app01_moods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app01_moods` (
  `nid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(16) NOT NULL,
  `create_date` datetime(6) NOT NULL,
  `content` longtext NOT NULL,
  `drawing` longtext,
  `comment_count` int(11) NOT NULL,
  `digg_count` int(11) NOT NULL,
  `avatar_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`nid`),
  KEY `app01_moods_avatar_id_f891277b_fk_app01_avatars_nid` (`avatar_id`),
  CONSTRAINT `app01_moods_avatar_id_f891277b_fk_app01_avatars_nid` FOREIGN KEY (`avatar_id`) REFERENCES `app01_avatars` (`nid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app01_moods`
--

LOCK TABLES `app01_moods` WRITE;
/*!40000 ALTER TABLE `app01_moods` DISABLE KEYS */;
/*!40000 ALTER TABLE `app01_moods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app01_myinfo`
--

DROP TABLE IF EXISTS `app01_myinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app01_myinfo` (
  `nid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `job` varchar(128) NOT NULL,
  `email` varchar(64) NOT NULL,
  `site_url` varchar(32) NOT NULL,
  `addr` varchar(16) NOT NULL,
  `bilibili_url` varchar(200) NOT NULL,
  `github_url` varchar(200) NOT NULL,
  `wechat_img` varchar(100) NOT NULL,
  `qq_img` varchar(100) NOT NULL,
  PRIMARY KEY (`nid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app01_myinfo`
--

LOCK TABLES `app01_myinfo` WRITE;
/*!40000 ALTER TABLE `app01_myinfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `app01_myinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app01_navcategory`
--

DROP TABLE IF EXISTS `app01_navcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app01_navcategory` (
  `nid` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(16) NOT NULL,
  `icon` varchar(32) NOT NULL,
  PRIMARY KEY (`nid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app01_navcategory`
--

LOCK TABLES `app01_navcategory` WRITE;
/*!40000 ALTER TABLE `app01_navcategory` DISABLE KEYS */;
/*!40000 ALTER TABLE `app01_navcategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app01_navs`
--

DROP TABLE IF EXISTS `app01_navs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app01_navs` (
  `nid` int(11) NOT NULL AUTO_INCREMENT,
  `icon_href` varchar(200) DEFAULT NULL,
  `icon` varchar(100) DEFAULT NULL,
  `title` varchar(32) NOT NULL,
  `abstract` varchar(128) DEFAULT NULL,
  `create_date` datetime(6) NOT NULL,
  `href` varchar(200) NOT NULL,
  `status` int(11) NOT NULL,
  `nav_category_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`nid`),
  KEY `app01_navs_nav_category_id_bc952192_fk_app01_navcategory_nid` (`nav_category_id`),
  CONSTRAINT `app01_navs_nav_category_id_bc952192_fk_app01_navcategory_nid` FOREIGN KEY (`nav_category_id`) REFERENCES `app01_navcategory` (`nid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app01_navs`
--

LOCK TABLES `app01_navs` WRITE;
/*!40000 ALTER TABLE `app01_navs` DISABLE KEYS */;
/*!40000 ALTER TABLE `app01_navs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app01_new`
--

DROP TABLE IF EXISTS `app01_new`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app01_new` (
  `nid` int(11) NOT NULL AUTO_INCREMENT,
  `create_date` datetime(6) NOT NULL,
  PRIMARY KEY (`nid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app01_new`
--

LOCK TABLES `app01_new` WRITE;
/*!40000 ALTER TABLE `app01_new` DISABLE KEYS */;
/*!40000 ALTER TABLE `app01_new` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app01_site`
--

DROP TABLE IF EXISTS `app01_site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app01_site` (
  `nid` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(32) NOT NULL,
  `abstract` varchar(128) NOT NULL,
  `key_words` varchar(128) NOT NULL,
  `record` varchar(32) NOT NULL,
  `create_date` datetime(6) NOT NULL,
  `version` varchar(16) NOT NULL,
  `icon` varchar(100) NOT NULL,
  PRIMARY KEY (`nid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app01_site`
--

LOCK TABLES `app01_site` WRITE;
/*!40000 ALTER TABLE `app01_site` DISABLE KEYS */;
/*!40000 ALTER TABLE `app01_site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app01_tags`
--

DROP TABLE IF EXISTS `app01_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app01_tags` (
  `nid` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(16) NOT NULL,
  PRIMARY KEY (`nid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app01_tags`
--

LOCK TABLES `app01_tags` WRITE;
/*!40000 ALTER TABLE `app01_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `app01_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app01_userinfo`
--

DROP TABLE IF EXISTS `app01_userinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app01_userinfo` (
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `nid` int(11) NOT NULL AUTO_INCREMENT,
  `nick_name` varchar(16) NOT NULL,
  `sign_status` int(11) NOT NULL,
  `tel` varchar(12) DEFAULT NULL,
  `integral` int(11) NOT NULL,
  `token` varchar(64) DEFAULT NULL,
  `avatar_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`nid`),
  UNIQUE KEY `username` (`username`),
  KEY `app01_userinfo_avatar_id_4d8395aa_fk_app01_avatars_nid` (`avatar_id`),
  CONSTRAINT `app01_userinfo_avatar_id_4d8395aa_fk_app01_avatars_nid` FOREIGN KEY (`avatar_id`) REFERENCES `app01_avatars` (`nid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app01_userinfo`
--

LOCK TABLES `app01_userinfo` WRITE;
/*!40000 ALTER TABLE `app01_userinfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `app01_userinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app01_userinfo_collects`
--

DROP TABLE IF EXISTS `app01_userinfo_collects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app01_userinfo_collects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userinfo_id` int(11) NOT NULL,
  `articles_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app01_userinfo_collects_userinfo_id_articles_id_73774dcd_uniq` (`userinfo_id`,`articles_id`),
  KEY `app01_userinfo_colle_articles_id_c3773049_fk_app01_art` (`articles_id`),
  CONSTRAINT `app01_userinfo_colle_articles_id_c3773049_fk_app01_art` FOREIGN KEY (`articles_id`) REFERENCES `app01_articles` (`nid`),
  CONSTRAINT `app01_userinfo_colle_userinfo_id_eab70bce_fk_app01_use` FOREIGN KEY (`userinfo_id`) REFERENCES `app01_userinfo` (`nid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app01_userinfo_collects`
--

LOCK TABLES `app01_userinfo_collects` WRITE;
/*!40000 ALTER TABLE `app01_userinfo_collects` DISABLE KEYS */;
/*!40000 ALTER TABLE `app01_userinfo_collects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app01_userinfo_groups`
--

DROP TABLE IF EXISTS `app01_userinfo_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app01_userinfo_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userinfo_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app01_userinfo_groups_userinfo_id_group_id_48ba2aa6_uniq` (`userinfo_id`,`group_id`),
  KEY `app01_userinfo_groups_group_id_30b9b2c4_fk_auth_group_id` (`group_id`),
  CONSTRAINT `app01_userinfo_groups_group_id_30b9b2c4_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `app01_userinfo_groups_userinfo_id_04be482a_fk_app01_userinfo_nid` FOREIGN KEY (`userinfo_id`) REFERENCES `app01_userinfo` (`nid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app01_userinfo_groups`
--

LOCK TABLES `app01_userinfo_groups` WRITE;
/*!40000 ALTER TABLE `app01_userinfo_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `app01_userinfo_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app01_userinfo_user_permissions`
--

DROP TABLE IF EXISTS `app01_userinfo_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app01_userinfo_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userinfo_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app01_userinfo_user_perm_userinfo_id_permission_i_8bd06903_uniq` (`userinfo_id`,`permission_id`),
  KEY `app01_userinfo_user__permission_id_826033c9_fk_auth_perm` (`permission_id`),
  CONSTRAINT `app01_userinfo_user__permission_id_826033c9_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `app01_userinfo_user__userinfo_id_3a67a872_fk_app01_use` FOREIGN KEY (`userinfo_id`) REFERENCES `app01_userinfo` (`nid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app01_userinfo_user_permissions`
--

LOCK TABLES `app01_userinfo_user_permissions` WRITE;
/*!40000 ALTER TABLE `app01_userinfo_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `app01_userinfo_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add content type',4,'add_contenttype'),(14,'Can change content type',4,'change_contenttype'),(15,'Can delete content type',4,'delete_contenttype'),(16,'Can view content type',4,'view_contenttype'),(17,'Can add session',5,'add_session'),(18,'Can change session',5,'change_session'),(19,'Can delete session',5,'delete_session'),(20,'Can view session',5,'view_session'),(21,'Can add user info',6,'add_userinfo'),(22,'Can change user info',6,'change_userinfo'),(23,'Can delete user info',6,'delete_userinfo'),(24,'Can view user info',6,'view_userinfo'),(25,'Can add advert',7,'add_advert'),(26,'Can change advert',7,'change_advert'),(27,'Can delete advert',7,'delete_advert'),(28,'Can view advert',7,'view_advert'),(29,'Can add articles',8,'add_articles'),(30,'Can change articles',8,'change_articles'),(31,'Can delete articles',8,'delete_articles'),(32,'Can view articles',8,'view_articles'),(33,'Can add avatars',9,'add_avatars'),(34,'Can change avatars',9,'change_avatars'),(35,'Can delete avatars',9,'delete_avatars'),(36,'Can view avatars',9,'view_avatars'),(37,'Can add cover',10,'add_cover'),(38,'Can change cover',10,'change_cover'),(39,'Can delete cover',10,'delete_cover'),(40,'Can view cover',10,'view_cover'),(41,'Can add feedback',11,'add_feedback'),(42,'Can change feedback',11,'change_feedback'),(43,'Can delete feedback',11,'delete_feedback'),(44,'Can view feedback',11,'view_feedback'),(45,'Can add history',12,'add_history'),(46,'Can change history',12,'change_history'),(47,'Can delete history',12,'delete_history'),(48,'Can view history',12,'view_history'),(49,'Can add menu img',13,'add_menuimg'),(50,'Can change menu img',13,'change_menuimg'),(51,'Can delete menu img',13,'delete_menuimg'),(52,'Can view menu img',13,'view_menuimg'),(53,'Can add my info',14,'add_myinfo'),(54,'Can change my info',14,'change_myinfo'),(55,'Can delete my info',14,'delete_myinfo'),(56,'Can view my info',14,'view_myinfo'),(57,'Can add nav category',15,'add_navcategory'),(58,'Can change nav category',15,'change_navcategory'),(59,'Can delete nav category',15,'delete_navcategory'),(60,'Can view nav category',15,'view_navcategory'),(61,'Can add new',16,'add_new'),(62,'Can change new',16,'change_new'),(63,'Can delete new',16,'delete_new'),(64,'Can view new',16,'view_new'),(65,'Can add site',17,'add_site'),(66,'Can change site',17,'change_site'),(67,'Can delete site',17,'delete_site'),(68,'Can view site',17,'view_site'),(69,'Can add tags',18,'add_tags'),(70,'Can change tags',18,'change_tags'),(71,'Can delete tags',18,'delete_tags'),(72,'Can view tags',18,'view_tags'),(73,'Can add navs',19,'add_navs'),(74,'Can change navs',19,'change_navs'),(75,'Can delete navs',19,'delete_navs'),(76,'Can view navs',19,'view_navs'),(77,'Can add moods',20,'add_moods'),(78,'Can change moods',20,'change_moods'),(79,'Can delete moods',20,'delete_moods'),(80,'Can view moods',20,'view_moods'),(81,'Can add mood comment',21,'add_moodcomment'),(82,'Can change mood comment',21,'change_moodcomment'),(83,'Can delete mood comment',21,'delete_moodcomment'),(84,'Can view mood comment',21,'view_moodcomment'),(85,'Can add menu',22,'add_menu'),(86,'Can change menu',22,'change_menu'),(87,'Can delete menu',22,'delete_menu'),(88,'Can view menu',22,'view_menu'),(89,'Can add comment',23,'add_comment'),(90,'Can change comment',23,'change_comment'),(91,'Can delete comment',23,'delete_comment'),(92,'Can view comment',23,'view_comment');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_app01_userinfo_nid` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_app01_userinfo_nid` FOREIGN KEY (`user_id`) REFERENCES `app01_userinfo` (`nid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(7,'app01','advert'),(8,'app01','articles'),(9,'app01','avatars'),(23,'app01','comment'),(10,'app01','cover'),(11,'app01','feedback'),(12,'app01','history'),(22,'app01','menu'),(13,'app01','menuimg'),(21,'app01','moodcomment'),(20,'app01','moods'),(14,'app01','myinfo'),(15,'app01','navcategory'),(19,'app01','navs'),(16,'app01','new'),(17,'app01','site'),(18,'app01','tags'),(6,'app01','userinfo'),(3,'auth','group'),(2,'auth','permission'),(4,'contenttypes','contenttype'),(5,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2022-01-24 14:34:22.613529'),(2,'contenttypes','0002_remove_content_type_name','2022-01-24 14:34:22.657715'),(3,'auth','0001_initial','2022-01-24 14:34:22.824144'),(4,'auth','0002_alter_permission_name_max_length','2022-01-24 14:34:22.877837'),(5,'auth','0003_alter_user_email_max_length','2022-01-24 14:34:22.926136'),(6,'auth','0004_alter_user_username_opts','2022-01-24 14:34:22.969936'),(7,'auth','0005_alter_user_last_login_null','2022-01-24 14:34:23.024338'),(8,'auth','0006_require_contenttypes_0002','2022-01-24 14:34:23.041963'),(9,'auth','0007_alter_validators_add_error_messages','2022-01-24 14:34:23.085291'),(10,'auth','0008_alter_user_username_max_length','2022-01-24 14:34:23.145761'),(11,'auth','0009_alter_user_last_name_max_length','2022-01-24 14:34:23.194094'),(12,'auth','0010_alter_group_name_max_length','2022-01-24 14:34:23.257829'),(13,'auth','0011_update_proxy_permissions','2022-01-24 14:34:23.305469'),(14,'auth','0012_alter_user_first_name_max_length','2022-01-24 14:34:23.357593'),(15,'app01','0001_initial','2022-01-24 14:34:24.743657'),(16,'admin','0001_initial','2022-01-24 14:34:24.802788'),(17,'admin','0002_logentry_remove_auto_add','2022-01-24 14:34:24.827817'),(18,'admin','0003_logentry_add_action_flag_choices','2022-01-24 14:34:24.861224'),(19,'sessions','0001_initial','2022-01-24 14:34:24.889418');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-05-01 17:26:36
