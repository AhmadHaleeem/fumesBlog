# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: localhost (MySQL 5.6.35)
# Database: fumesBlog
# Generation Time: 2018-02-14 11:05:50 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table admin_role
# ------------------------------------------------------------

DROP TABLE IF EXISTS `admin_role`;

CREATE TABLE `admin_role` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `admin_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `admin_role` WRITE;
/*!40000 ALTER TABLE `admin_role` DISABLE KEYS */;

INSERT INTO `admin_role` (`id`, `admin_id`, `role_id`, `created_at`, `updated_at`)
VALUES
	(4,2,1,NULL,NULL),
	(5,1,1,NULL,NULL);

/*!40000 ALTER TABLE `admin_role` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table admins
# ------------------------------------------------------------

DROP TABLE IF EXISTS `admins`;

CREATE TABLE `admins` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `remember_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admins_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `admins` WRITE;
/*!40000 ALTER TABLE `admins` DISABLE KEYS */;

INSERT INTO `admins` (`id`, `name`, `email`, `password`, `phone`, `status`, `remember_token`, `created_at`, `updated_at`)
VALUES
	(1,'Ahmaad','Ahmad@gmail.com','$2y$10$Z3yhFyzERy1OC0lygzBwYO.15zNNLzupOP6Yo3wMH4zsk.xEm3g9m',6416477,1,'SCjqsDWmCP6XvmyktYFnqHHp2hLxslKxsuMZCm8zRfZSWResIqceKTNRlPV0','2017-11-29 15:05:35','2017-12-04 17:21:21'),
	(2,'Haleem','Haleem@gmail.com','$2y$10$Z3yhFyzERy1OC0lygzBwYO.15zNNLzupOP6Yo3wMH4zsk.xEm3g9m',6415366,1,'oOMJc205EoMZSwBeEPzZv8XiRqszKgnfSRCyP6E3yYYRy9y23FXMACb7CaVx','2017-11-29 15:05:35','2017-12-04 17:31:32');

/*!40000 ALTER TABLE `admins` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table categories
# ------------------------------------------------------------

DROP TABLE IF EXISTS `categories`;

CREATE TABLE `categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;

INSERT INTO `categories` (`id`, `name`, `slug`, `created_at`, `updated_at`)
VALUES
	(1,'cat1','cat1','2017-11-21 15:42:01','2017-11-23 10:29:06'),
	(2,'cat2','cat2','2017-11-21 15:42:06','2017-11-21 15:42:06'),
	(3,'cat3','cat3','2017-11-21 15:42:13','2017-11-21 15:42:13');

/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table category_posts
# ------------------------------------------------------------

DROP TABLE IF EXISTS `category_posts`;

CREATE TABLE `category_posts` (
  `post_id` int(10) unsigned NOT NULL,
  `category_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `category_posts_post_id_index` (`post_id`),
  KEY `category_posts_category_id_index` (`category_id`),
  CONSTRAINT `category_posts_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `category_posts` WRITE;
/*!40000 ALTER TABLE `category_posts` DISABLE KEYS */;

INSERT INTO `category_posts` (`post_id`, `category_id`, `created_at`, `updated_at`)
VALUES
	(1,2,'2017-11-21 15:43:49','2017-11-21 15:43:49'),
	(2,1,'2017-11-21 15:45:05','2017-11-21 15:45:05'),
	(2,2,'2017-11-22 15:17:13','2017-11-22 15:17:13'),
	(2,3,'2017-11-22 15:17:13','2017-11-22 15:17:13'),
	(3,1,'2017-11-22 15:34:33','2017-11-22 15:34:33'),
	(4,2,'2017-11-22 15:35:21','2017-11-22 15:35:21'),
	(5,2,'2017-11-22 15:35:52','2017-11-22 15:35:52'),
	(5,3,'2017-11-22 15:35:52','2017-11-22 15:35:52'),
	(6,2,'2017-11-22 15:37:22','2017-11-22 15:37:22'),
	(7,1,'2017-11-22 15:37:45','2017-11-22 15:37:45'),
	(8,1,'2017-11-22 15:38:11','2017-11-22 15:38:11'),
	(8,2,'2017-11-22 15:38:11','2017-11-22 15:38:11'),
	(9,1,'2017-11-22 15:38:55','2017-11-22 15:38:55'),
	(10,1,'2017-11-23 09:04:23','2017-11-23 09:04:23'),
	(10,2,'2017-11-23 09:04:23','2017-11-23 09:04:23'),
	(11,2,'2017-11-23 10:27:06','2017-11-23 10:27:06'),
	(11,3,'2017-11-23 10:27:06','2017-11-23 10:27:06');

/*!40000 ALTER TABLE `category_posts` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table migrations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;

INSERT INTO `migrations` (`id`, `migration`, `batch`)
VALUES
	(1,'2014_10_12_000000_create_users_table',1),
	(2,'2014_10_12_100000_create_password_resets_table',1),
	(3,'2017_11_10_094940_create_posts_table',1),
	(4,'2017_11_10_095303_create_tags_table',1),
	(5,'2017_11_10_095427_create_categories_table',1),
	(6,'2017_11_10_095520_create_category_posts_table',1),
	(7,'2017_11_10_095654_create_post_tags_table',1),
	(8,'2017_11_10_095807_create_admins_table',1),
	(9,'2017_11_10_095945_create_roles_table',1),
	(10,'2017_11_10_100035_create_admin_roles_table',1),
	(11,'2017_11_27_125717_create_permissions_table',2);

/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table password_resets
# ------------------------------------------------------------

DROP TABLE IF EXISTS `password_resets`;

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table permission_role
# ------------------------------------------------------------

DROP TABLE IF EXISTS `permission_role`;

CREATE TABLE `permission_role` (
  `role_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `permission_role` WRITE;
/*!40000 ALTER TABLE `permission_role` DISABLE KEYS */;

INSERT INTO `permission_role` (`role_id`, `permission_id`)
VALUES
	(5,7),
	(5,11),
	(5,12),
	(5,13),
	(6,4),
	(6,6),
	(6,12),
	(6,13),
	(8,4),
	(8,6),
	(1,7),
	(1,4),
	(1,6),
	(1,13);

/*!40000 ALTER TABLE `permission_role` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table permissions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `permissions`;

CREATE TABLE `permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `for` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;

INSERT INTO `permissions` (`id`, `name`, `for`, `created_at`, `updated_at`)
VALUES
	(4,'Post-update','post','2017-11-27 13:43:27','2017-11-27 13:43:27'),
	(6,'Post-Create','post','2017-11-27 13:44:14','2017-11-27 13:44:14'),
	(7,'Post-delete','post','2017-11-27 13:44:22','2017-11-27 13:44:22'),
	(8,'User-create','user','2017-11-27 13:45:00','2017-11-27 13:45:00'),
	(9,'User-update','user','2017-11-27 13:45:14','2017-11-27 13:45:14'),
	(10,'User-delete','user','2017-11-27 13:45:21','2017-11-27 13:45:21'),
	(11,'Post-publish','post','2017-11-27 13:45:33','2017-11-27 13:45:33'),
	(12,'tag-CRUD','other','2017-11-27 13:45:43','2017-11-27 13:45:43'),
	(13,'Category-CRUD','other','2017-11-27 13:45:53','2017-11-27 13:45:53');

/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table post_tags
# ------------------------------------------------------------

DROP TABLE IF EXISTS `post_tags`;

CREATE TABLE `post_tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `post_tags` WRITE;
/*!40000 ALTER TABLE `post_tags` DISABLE KEYS */;

INSERT INTO `post_tags` (`id`, `post_id`, `tag_id`, `created_at`, `updated_at`)
VALUES
	(1,1,1,'2017-11-21 15:43:49','2017-11-21 15:43:49'),
	(2,1,2,'2017-11-21 15:43:49','2017-11-21 15:43:49'),
	(3,2,2,'2017-11-21 15:44:48','2017-11-21 15:44:48'),
	(4,2,1,'2017-11-21 15:45:10','2017-11-21 15:45:10'),
	(5,3,1,'2017-11-22 15:34:33','2017-11-22 15:34:33'),
	(6,4,1,'2017-11-22 15:35:21','2017-11-22 15:35:21'),
	(7,4,2,'2017-11-22 15:35:21','2017-11-22 15:35:21'),
	(8,4,3,'2017-11-22 15:35:21','2017-11-22 15:35:21'),
	(9,5,1,'2017-11-22 15:35:52','2017-11-22 15:35:52'),
	(10,6,2,'2017-11-22 15:37:22','2017-11-22 15:37:22'),
	(11,7,1,'2017-11-22 15:37:45','2017-11-22 15:37:45'),
	(12,8,2,'2017-11-22 15:38:11','2017-11-22 15:38:11'),
	(13,9,2,'2017-11-22 15:38:55','2017-11-22 15:38:55'),
	(14,10,2,'2017-11-23 09:04:23','2017-11-23 09:04:23'),
	(15,10,3,'2017-11-23 09:04:23','2017-11-23 09:04:23'),
	(16,11,1,'2017-11-23 10:27:06','2017-11-23 10:27:06'),
	(17,11,4,'2017-11-23 10:27:06','2017-11-23 10:27:06');

/*!40000 ALTER TABLE `post_tags` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table posts
# ------------------------------------------------------------

DROP TABLE IF EXISTS `posts`;

CREATE TABLE `posts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subtitle` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `posted_by` int(11) DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `like` int(11) DEFAULT NULL,
  `dislike` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;

INSERT INTO `posts` (`id`, `title`, `subtitle`, `slug`, `body`, `status`, `posted_by`, `image`, `like`, `dislike`, `created_at`, `updated_at`)
VALUES
	(1,'abood hafez','subtitle','blog-series','<p><em><strong>this is a big body </strong></em></p>\r\n\r\n<pre>\r\n<em><strong><code>p{color:red;}</code></strong></em></pre>\r\n\r\n<p>&nbsp;</p>',1,NULL,NULL,NULL,NULL,'2017-11-21 15:43:49','2017-11-22 16:47:01'),
	(2,'hello the post is new','subtitle 2','this is a slug 2','<p>Never in all their history have men been able truly to conceive of the world as one: a single sphere, a globe, having the qualities of a globe, a round earth in which all the directions eventually meet, in which there is no center because every point, or none, is center &mdash; an equal earth which all men occupy as equals. The airman&#39;s earth, if free men make it, will be truly round: a globe in practice, not in theory. Science cuts two ways, of course; its products can be used for both good and evil. But there&#39;s no turning back from science. The early warnings about technological dangers also come from science. What was most significant about the lunar voyage was not that man set foot on the Moon but that they set eye on the earth. A Chinese tale tells of some men sent to harm a young girl who, upon seeing her beauty, become her protectors rather than her violators. That&#39;s how I felt seeing the Earth for the first time. I could not help but love and cherish her. For those who have seen the Earth from space, and for the hundreds and perhaps thousands more who will, the experience most certainly changes your perspective. The things that we share in our world are far more valuable than those which divide us. The Final Frontier There can be no thought of finishing for &lsquo;aiming for the stars.&rsquo; Both figuratively and literally, it is a task to occupy the generations. And no matter how much progress one makes, there is always the thrill of just beginning. There can be no thought of finishing for &lsquo;aiming for the stars.&rsquo; Both figuratively and literally, it is a task to occupy the generations. And no matter how much progress one makes, there is always the thrill of just beginning. The dreams of yesterday are the hopes of today and the reality of tomorrow. Science has not yet mastered prophecy. We predict too much for the next year and yet far too little for the next ten. Spaceflights cannot be stopped. This is not the work of any one man or even a group of men. It is a historical process which mankind is carrying out in accordance with the natural laws of human development. Reaching for the Stars As we got further and further away, it [the Earth] diminished in size. Finally it shrank to the size of a marble, the most beautiful you can imagine. That beautiful, warm, living object looked so fragile, so delicate, that if you touched it with a finger it would crumble and fall apart. Seeing this has to change a man. To go places and do things that have never been done before &ndash; that&rsquo;s what living is all about. Space, the final frontier. These are the voyages of the Starship Enterprise. Its five-year mission: to explore strange new worlds, to seek out new life and new civilizations, to boldly go where no man has gone before. As I stand out here in the wonders of the unknown at Hadley, I sort of realize there&rsquo;s a fundamental truth to our nature, Man must explore, and this is exploration at its greatest. Placeholder text by Space Ipsum. Photographs by NASA on The Commons.</p>',1,NULL,'public/hQNlLkyn3tnm0wVTwHCVG6DhW6QdLKpWG2XAEILr.png',NULL,NULL,'2017-11-21 15:44:48','2017-11-23 10:21:52'),
	(3,'the first post','first post','first-post','this is a body for first post',1,NULL,NULL,NULL,NULL,'2017-11-22 15:34:33','2017-11-22 15:34:33'),
	(4,'this is second post','second post','this is a slug post 2','<h1><strong><em><span style=\"color:#e74c3c\"><span style=\"font-family:Lucida Sans Unicode,Lucida Grande,sans-serif\">this is a body for second post</span></span></em></strong></h1>',1,NULL,'public/VLFGLzsCOOTxFGcAcqkDtqDUc9nX3nIYkEM0ofYm.jpeg',NULL,NULL,'2017-11-22 15:35:21','2017-11-23 11:41:28'),
	(5,'this is third post','third post','this is a slug 3','this is a body for third post',1,NULL,NULL,NULL,NULL,'2017-11-22 15:35:52','2017-11-22 15:35:52'),
	(6,'this is fourth post','fourth post','this is a slug 4','<h1><span style=\"color:#16a085\"><span style=\"font-size:72px\">this is a body for fourth post</span></span></h1>',1,NULL,'public/VWewUYqg0vmUn8sm8wffAZF6BOb9Uny3xC2DIxOh.png',NULL,NULL,'2017-11-22 15:37:22','2017-11-23 12:30:05'),
	(7,'this is fifth post','fifth post','this is a slug 5','<p><strong><em><span style=\"font-size:72px\"><span style=\"color:#e74c3c\">this is a body for fifth post</span></span></em></strong></p>',1,NULL,'public/OjbfQLUJFHs0slvAxLJbHTugmYgeAthvxO4tGbzG.jpeg',NULL,NULL,'2017-11-22 15:37:45','2017-11-23 11:19:14'),
	(8,'this is sixth post','sixth post','this is a slug 6','this is a body for sixth post',1,NULL,NULL,NULL,NULL,'2017-11-22 15:38:11','2017-11-22 15:38:11'),
	(9,'this is ningeth post','nigneth post','this is a slug 9','<p>this is a body for ninge post</p>',1,NULL,'public/7VVVykdZhpiSncgFKBg9jHxfdK3hLqze5EA7ajID.png',NULL,NULL,'2017-11-22 15:38:55','2017-11-23 11:10:55'),
	(10,'the last post','last post','this is a slug 10','<h1 style=\"text-align:center\"><span style=\"font-family:Comic Sans MS,cursive\"><span style=\"color:#f1c40f\"><em><span style=\"background-color:#000000\">Here is the last post which i want to write&nbsp;</span></em></span></span></h1>\r\n\r\n<p><span style=\"color:#2ecc71\"><em><strong>sorry for everything&nbsp;</strong></em></span></p>',1,NULL,'public/65ZqDxCpPI4ZVc7OQ7KR6Tf0gvbcnzukIrGyKFKi.png',NULL,NULL,'2017-11-23 09:04:23','2017-11-23 10:23:04'),
	(11,'this is the eleventh post','eleventh post','this is a slug11','<h1><u><span style=\"font-size:24px\"><span style=\"font-family:Georgia,serif\">this is a body to mange everything you want to do itt..</span></span></u></h1>',1,NULL,'public/UmBDjIhlTx5ekOEWtf9bcVO5uZGxm32B46YIbq5Z.jpeg',NULL,NULL,'2017-11-23 10:27:06','2017-11-23 10:28:03');

/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table roles
# ------------------------------------------------------------

DROP TABLE IF EXISTS `roles`;

CREATE TABLE `roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;

INSERT INTO `roles` (`id`, `name`, `created_at`, `updated_at`)
VALUES
	(1,'Editor','2017-11-23 14:59:13','2017-11-23 15:11:35'),
	(2,'Publisher','2017-11-23 15:12:23','2017-11-23 15:12:23'),
	(3,'Writer','2017-11-23 15:12:27','2017-11-23 15:20:18');

/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table tags
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tags`;

CREATE TABLE `tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;

INSERT INTO `tags` (`id`, `name`, `slug`, `created_at`, `updated_at`)
VALUES
	(2,'tag2','tag2','2017-11-21 15:41:40','2017-11-21 15:41:40'),
	(3,'tag3','tag3','2017-11-21 15:41:46','2017-11-21 15:41:46'),
	(4,'tag4','tag4','2017-11-21 15:41:52','2017-11-21 15:41:52');

/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;

INSERT INTO `users` (`id`, `name`, `email`, `password`, `remember_token`, `created_at`, `updated_at`)
VALUES
	(1,'Ahmad','Ahmad@gmail.com','$2y$10$Z3yhFyzERy1OC0lygzBwYO.15zNNLzupOP6Yo3wMH4zsk.xEm3g9m','7EEm9RtMJJ4leoDcuZmb2snVWsQzowYr3IVKTkFWXgQeNNnsPQ1UPlCHsP9q','2017-11-23 10:44:59','2017-11-23 10:44:59'),
	(2,'Hadeel','hadeel@gmail.com','$2y$10$eL16rdKqyQj5KBVFR42oN.6GVjHFxfcIAJYUjj3m/5vilOrwnnHkq','cYzrSHvGPpqfVTXf9wIdwMYkh4DL0lq5upWPSQHlgEOdEYkJRsWGq832rVdo','2017-11-23 10:49:01','2017-11-23 10:49:01'),
	(3,'Azzam','azzam@gmail.com','$2y$10$KFeihB9G6QbSVumk/0dV4uIxiir7PKMnyp0Okvm6rv9stGK/Xh/nq','vKkAsrc1ACep0o3g1qrzOwJpfH01OoA30BxtKsiMz46ZeCw1YKpSspAowMsH','2017-11-23 11:09:02','2017-11-23 11:09:02');

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
