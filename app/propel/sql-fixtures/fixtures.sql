# ************************************************************
# Sequel Pro SQL dump
# Версия 4096
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Адрес: localhost (MySQL 5.5.29)
# Схема: lms42-test
# Время создания: 2013-08-05 11:36:23 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Дамп таблицы answers
# ------------------------------------------------------------

DROP TABLE IF EXISTS `answers`;

CREATE TABLE `answers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question_id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `file` varchar(255) DEFAULT NULL,
  `is_right` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `answers_I_1` (`question_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `answers` WRITE;
/*!40000 ALTER TABLE `answers` DISABLE KEYS */;

INSERT INTO `answers` (`id`, `question_id`, `title`, `file`, `is_right`)
VALUES
	(1,1,'while',NULL,'1'),
	(2,1,'for',NULL,'0'),
	(3,1,'if',NULL,'0'),
	(4,1,'unless',NULL,'0'),
	(5,2,'&&',NULL,'0'),
	(6,2,'!',NULL,'0'),
	(7,2,'||',NULL,'1'),
	(8,2,'!!',NULL,'0'),
	(9,3,'&&',NULL,'1'),
	(10,3,'!',NULL,'0'),
	(11,3,'||',NULL,'0'),
	(12,3,'!!',NULL,'0'),
	(13,4,'&&',NULL,'0'),
	(14,4,'!',NULL,'1'),
	(15,4,'||',NULL,'0'),
	(16,4,'!!',NULL,'0'),
	(17,5,'integer',NULL,'0'),
	(18,5,'float',NULL,'0'),
	(19,5,'string',NULL,'0'),
	(20,5,'boolean',NULL,'1'),
	(21,6,'integer',NULL,'1'),
	(22,6,'float',NULL,'0'),
	(23,6,'string',NULL,'0'),
	(24,6,'boolean',NULL,'0'),
	(25,7,'integer',NULL,'0'),
	(26,7,'float',NULL,'1'),
	(27,7,'string',NULL,'0'),
	(28,7,'boolean',NULL,'0'),
	(29,8,'integer',NULL,'1'),
	(30,8,'float',NULL,'0'),
	(31,8,'string',NULL,'0'),
	(32,8,'boolean',NULL,'0'),
	(33,9,'integer',NULL,'0'),
	(34,9,'float',NULL,'0'),
	(35,9,'string',NULL,'0'),
	(36,9,'boolean',NULL,'1'),
	(37,10,'integer',NULL,'0'),
	(38,10,'float',NULL,'0'),
	(39,10,'string',NULL,'1'),
	(40,10,'boolean',NULL,'0'),
	(41,11,NULL,NULL,'57'),
	(42,12,NULL,NULL,'3'),
	(43,13,NULL,NULL,'MAY BE'),
	(44,14,NULL,NULL,'a>=b'),
	(45,15,NULL,NULL,'D=b*b-4*a*c'),
	(46,16,NULL,NULL,'100'),
	(47,17,NULL,NULL,'99'),
	(48,18,NULL,NULL,'0,1,4'),
	(49,19,'continue',NULL,'0'),
	(50,19,'stop',NULL,'0'),
	(51,19,'exit',NULL,'0'),
	(52,19,'break',NULL,'1'),
	(53,20,'continue',NULL,'1'),
	(54,20,'stop',NULL,'0'),
	(55,20,'exit',NULL,'0'),
	(56,20,'break',NULL,'0'),
	(57,21,'','','0,1,4'),
	(58,22,'find_all','','0'),
	(59,22,'map','','1'),
	(60,22,'inject','','0'),
	(61,22,'delete','','0\r\n'),
	(62,23,'find_all','','1'),
	(63,23,'map','','0'),
	(64,23,'inject','','0'),
	(65,23,'delete','','0\r\n'),
	(66,24,'delete_at','','0'),
	(67,24,'map','','1'),
	(68,24,'inject','','0'),
	(69,24,'delete','','1\r\n'),
	(70,25,'','','9'),
	(71,26,'','','0'),
	(72,27,'','','15'),
	(73,28,'','','2'),
	(74,29,'','','2.5'),
	(75,30,'','','1'),
	(76,31,'','','2'),
	(77,32,'','','-6'),
	(78,33,NULL,NULL,'abcabcabc'),
	(79,34,'','','ccbbad'),
	(80,35,'','','ccbbdd'),
	(81,36,'','','3'),
	(82,37,'','','1,3,2'),
	(83,38,'','','false'),
	(84,39,'','','true'),
	(85,40,'','','true');

/*!40000 ALTER TABLE `answers` ENABLE KEYS */;
UNLOCK TABLES;


# Дамп таблицы categories
# ------------------------------------------------------------

DROP TABLE IF EXISTS `categories`;

CREATE TABLE `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) DEFAULT NULL,
  `urlkey` varchar(100) NOT NULL,
  `title` varchar(100) NOT NULL,
  `url` varchar(200) DEFAULT NULL,
  `navigation` tinyint(1) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `mode` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `categories_I_1` (`pid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;

INSERT INTO `categories` (`id`, `pid`, `urlkey`, `title`, `url`, `navigation`, `is_active`, `mode`)
VALUES
	(1,NULL,'root','Базовая',NULL,NULL,1,NULL),
	(2,1,'news','Новости',NULL,1,1,NULL),
	(3,1,'keynote','Презентации',NULL,0,0,1);

/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;


# Дамп таблицы configs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `configs`;

CREATE TABLE `configs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) DEFAULT NULL,
  `title` varchar(200) DEFAULT NULL,
  `key` varchar(200) NOT NULL,
  `value` text NOT NULL,
  `type` varchar(20) NOT NULL,
  `is_visible` tinyint(1) DEFAULT '1',
  `rank` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `configs_FI_1` (`pid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Дамп таблицы content
# ------------------------------------------------------------

DROP TABLE IF EXISTS `content`;

CREATE TABLE `content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `text` longtext NOT NULL,
  `urlkey` varchar(50) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `weight` int(11) DEFAULT NULL,
  `file` varchar(200) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `content_I_1` (`user_id`),
  KEY `content_I_2` (`category_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `content` WRITE;
/*!40000 ALTER TABLE `content` DISABLE KEYS */;

INSERT INTO `content` (`id`, `user_id`, `category_id`, `title`, `description`, `text`, `urlkey`, `is_active`, `weight`, `file`, `created_at`, `updated_at`)
VALUES
	(1,1,3,'Вирусы и антивирусы','Презентация посвящена теме вирусов и способам борьбы с ними. В качестве видеолекции используется выступление на TED.','<div id=\"__ss_9447888\" style=\"width:595px\">\r\n	<strong style=\"display:block;margin:12px 0 4px\"><a href=\"http://www.slideshare.net/smirik/ss-9447888\" target=\"_blank\" title=\"Вирусы и Антивирусы\">Вирусы и Антивирусы</a></strong><iframe frameborder=\"0\" height=\"497\" marginheight=\"0\" marginwidth=\"0\" scrolling=\"no\" src=\"http://www.slideshare.net/slideshow/embed_code/9447888?rel=0\" width=\"595\"></iframe>\r\n	<div style=\"padding:5px 0 12px\">\r\n		View more <a href=\"http://www.slideshare.net/\" target=\"_blank\">presentations</a> from <a href=\"http://www.slideshare.net/smirik\" target=\"_blank\">Evgeny Smirnov</a></div>\r\n</div>',NULL,1,NULL,'Viruses and the Net Raw.pdf','2011-09-27 00:00:00','2011-11-21 00:00:00'),
	(2,1,3,'Основы программирования на ruby','Рассказывается об основах программирования на ruby: переменные, типы переменных, операции и пр. В конце приводятся блок-схема решения линейного уравнения.','<div style=\"width:595px\" id=\"__ss_9448188\"> <strong style=\"display:block;margin:12px 0 4px\"><a href=\"http://www.slideshare.net/smirik/ruby-9448188\" title=\"Основы программирования на ruby\" target=\"_blank\">Основы программирования на ruby</a></strong> <iframe src=\"http://www.slideshare.net/slideshow/embed_code/9448188?rel=0\" width=\"595\" height=\"497\" frameborder=\"0\" marginwidth=\"0\" marginheight=\"0\" scrolling=\"no\"></iframe> <div style=\"padding:5px 0 12px\"> View more <a href=\"http://www.slideshare.net/\" target=\"_blank\">presentations</a> from <a href=\"http://www.slideshare.net/smirik\" target=\"_blank\">Evgeny Smirnov</a> </div> </div>',NULL,1,NULL,'Ruby Starting.pdf','2011-09-27 00:00:00','2011-09-27 00:00:00'),
	(3,1,3,'Управляющие структуры в ruby: условия','Презентация описывает различные способы задания','<div style=\"width:595px\" id=\"__ss_9541023\"> <strong style=\"display:block;margin:12px 0 4px\"><a href=\"http://www.slideshare.net/smirik/ruby-9541023\" title=\"Управляющие структуры в Ruby: условия\" target=\"_blank\">Управляющие структуры в Ruby: условия</a></strong> <iframe src=\"http://www.slideshare.net/slideshow/embed_code/9541023?rel=0\" width=\"595\" height=\"497\" frameborder=\"0\" marginwidth=\"0\" marginheight=\"0\" scrolling=\"no\"></iframe> <div style=\"padding:5px 0 12px\"> View more <a href=\"http://www.slideshare.net/\" target=\"_blank\">presentations</a> from <a href=\"http://www.slideshare.net/smirik\" target=\"_blank\">Evgeny Smirnov</a> </div> </div>',NULL,1,NULL,'Ruby control structures.pdf','2011-10-04 00:00:00','2011-10-04 00:00:00'),
	(4,1,2,'Презентация по управляющим структурам в ruby','Добавлена первая презентация по управляющим структурам в ruby, посвящённая условиям и модификаторам.','<a href=\"http://school.smirik.ru/show/15\">Страница с презентацией</a>.',NULL,1,NULL,NULL,'2011-10-04 00:00:00','2011-10-04 00:00:00'),
	(5,1,3,'Циклы в ruby','Использование управляющих структур циклов в ruby: явные циклы (for, times), неявные циклы (while). Вычисление чисел Фибоначчи с помощью циклов.','<div style=\"width:595px\" id=\"__ss_9660389\"> <strong style=\"display:block;margin:12px 0 4px\"><a href=\"http://www.slideshare.net/smirik/ruby-9660389\" title=\"Ruby: управляющие структуры — циклы\" target=\"_blank\">Ruby: управляющие структуры — циклы</a></strong> <iframe src=\"http://www.slideshare.net/slideshow/embed_code/9660389?rel=0\" width=\"595\" height=\"497\" frameborder=\"0\" marginwidth=\"0\" marginheight=\"0\" scrolling=\"no\"></iframe> <div style=\"padding:5px 0 12px\"> View more <a href=\"http://www.slideshare.net/\" target=\"_blank\">presentations</a> from <a href=\"http://www.slideshare.net/smirik\" target=\"_blank\">Evgeny Smirnov</a> </div> </div>',NULL,1,NULL,'Ruby control structures - cycles.pdf','2011-10-12 00:00:00','2011-10-12 00:00:00'),
	(6,1,2,'Презентация по использованию циклов в ruby','В одноимённый раздел добавлена презентация по использованию управляющих структур циклов в ruby.','<a href=\"http://school.smirik.ru/show/20\">Посмотреть презентацию</a>\r\n<br /><br />\r\nУдачи',NULL,1,NULL,NULL,'2011-10-12 00:00:00','2011-10-12 00:00:00'),
	(7,1,3,'Сервисы Google','Презентация по GMail и Google Docs, 2 кратких скринкаста без голоса','<p>\r\n<div style=\"width:595px\" id=\"__ss_9776103\"> <strong style=\"display:block;margin:12px 0 4px\"><a href=\"http://www.slideshare.net/smirik/google-gmail-google-docs\" title=\"Сервисы Google: GMail и Google Docs\" target=\"_blank\">Сервисы Google: GMail и Google Docs</a></strong> <iframe src=\"http://www.slideshare.net/slideshow/embed_code/9776103?rel=0\" width=\"595\" height=\"497\" frameborder=\"0\" marginwidth=\"0\" marginheight=\"0\" scrolling=\"no\"></iframe> <div style=\"padding:5px 0 12px\"> View more <a href=\"http://www.slideshare.net/\" target=\"_blank\">presentations</a> from <a href=\"http://www.slideshare.net/smirik\" target=\"_blank\">Evgeny Smirnov</a> </div> </div>\r\n</p>\r\n<p>\r\n<iframe width=\"560\" height=\"315\" src=\"http://www.youtube.com/embed/tQOBZ6cL1Mk?rel=0\" frameborder=\"0\" allowfullscreen></iframe>\r\n</p>\r\n<p>\r\n<iframe width=\"560\" height=\"315\" src=\"http://www.youtube.com/embed/mUYY2M2Q3-Y?rel=0\" frameborder=\"0\" allowfullscreen></iframe>\r\n</p>',NULL,1,NULL,'Google - GMail и Docs.pdf','2011-10-19 00:00:00','2011-10-19 00:00:00');

/*!40000 ALTER TABLE `content` ENABLE KEYS */;
UNLOCK TABLES;


# Дамп таблицы courses
# ------------------------------------------------------------

DROP TABLE IF EXISTS `courses`;

CREATE TABLE `courses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) DEFAULT NULL,
  `title` varchar(200) NOT NULL,
  `description` text NOT NULL,
  `type` int(11) DEFAULT '1',
  `file` varchar(100) DEFAULT NULL,
  `is_public` tinyint(1) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `courses_I_1` (`pid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `courses` WRITE;
/*!40000 ALTER TABLE `courses` DISABLE KEYS */;

INSERT INTO `courses` (`id`, `pid`, `title`, `description`, `type`, `file`, `is_public`, `is_active`, `created_at`, `updated_at`)
VALUES
	(1,NULL,'Основы программирования на ruby','<p>Курс посвящён основам программирования на ruby. Основные темы:<br />\r\n&nbsp;</p>\r\n\r\n<ul>\r\n	<li>Основы ruby.</li>\r\n	<li>Управляющие структуры.</li>\r\n	<li>Циклы.</li>\r\n	<li>Массивы.</li>\r\n	<li>Работа со строками.</li>\r\n	<li>Динамическое программирование.</li>\r\n	<li>Алгоритмы: перебор и рекурсия.</li>\r\n	<li>Алгоритмы: жадные алгоритмы.</li>\r\n	<li>Паттерны программирования.</li>\r\n	<li>Хэши.</li>\r\n</ul>',0,'1375314140_1_ruby_logo.png',1,1,'2012-09-02 22:20:19','2013-08-01 03:42:20'),
	(2,NULL,'Информация','<p>&nbsp;Курс посвящён трём базовым темам информатики:</p>\r\n\r\n<ul>\r\n	<li>Информации и информационному обществу.</li>\r\n	<li>Измерению и&nbsp;кодированию информации (текст, числа, звук, графика, видео).</li>\r\n	<li>Системам счисления.</li>\r\n</ul>',1,NULL,1,1,'2013-08-05 12:59:13','2013-08-05 12:59:13');

/*!40000 ALTER TABLE `courses` ENABLE KEYS */;
UNLOCK TABLES;


# Дамп таблицы exams
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exams`;

CREATE TABLE `exams` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quiz_id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `started_at` datetime DEFAULT NULL,
  `description` text NOT NULL,
  `status` int(11) DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `exams_FI_1` (`type_id`),
  KEY `exams_FI_2` (`quiz_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `exams` WRITE;
/*!40000 ALTER TABLE `exams` DISABLE KEYS */;

INSERT INTO `exams` (`id`, `quiz_id`, `type_id`, `name`, `started_at`, `description`, `status`, `created_at`, `updated_at`)
VALUES
	(1,1,2,'Тестовая КР','2013-08-05 00:00:00','<p>Контрольая работа по материалам курса.</p>',2,'2013-08-05 11:30:33','2013-08-05 11:34:07');

/*!40000 ALTER TABLE `exams` ENABLE KEYS */;
UNLOCK TABLES;


# Дамп таблицы exams_types
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exams_types`;

CREATE TABLE `exams_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `exams_types` WRITE;
/*!40000 ALTER TABLE `exams_types` DISABLE KEYS */;

INSERT INTO `exams_types` (`id`, `name`)
VALUES
	(1,'Проверочная работа'),
	(2,'Контрольная работа');

/*!40000 ALTER TABLE `exams_types` ENABLE KEYS */;
UNLOCK TABLES;


# Дамп таблицы exams_users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exams_users`;

CREATE TABLE `exams_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `exam_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `user_quiz_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `exams_users_FI_1` (`exam_id`),
  KEY `exams_users_FI_2` (`user_id`),
  KEY `exams_users_FI_3` (`user_quiz_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `exams_users` WRITE;
/*!40000 ALTER TABLE `exams_users` DISABLE KEYS */;

INSERT INTO `exams_users` (`id`, `exam_id`, `user_id`, `user_quiz_id`)
VALUES
	(1,1,2,2),
	(2,1,1,3);

/*!40000 ALTER TABLE `exams_users` ENABLE KEYS */;
UNLOCK TABLES;


# Дамп таблицы fos_group
# ------------------------------------------------------------

DROP TABLE IF EXISTS `fos_group`;

CREATE TABLE `fos_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `roles` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `fos_group` WRITE;
/*!40000 ALTER TABLE `fos_group` DISABLE KEYS */;

INSERT INTO `fos_group` (`id`, `name`, `roles`)
VALUES
	(1,'Test',NULL);

/*!40000 ALTER TABLE `fos_group` ENABLE KEYS */;
UNLOCK TABLES;


# Дамп таблицы fos_user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `fos_user`;

CREATE TABLE `fos_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `username_canonical` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `email_canonical` varchar(255) DEFAULT NULL,
  `enabled` tinyint(1) DEFAULT '0',
  `salt` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `locked` tinyint(1) DEFAULT '0',
  `expired` tinyint(1) DEFAULT '0',
  `expires_at` datetime DEFAULT NULL,
  `confirmation_token` varchar(255) DEFAULT NULL,
  `password_requested_at` datetime DEFAULT NULL,
  `credentials_expired` tinyint(1) DEFAULT '0',
  `credentials_expire_at` datetime DEFAULT NULL,
  `roles` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `fos_user_U_1` (`username_canonical`),
  UNIQUE KEY `fos_user_U_2` (`email_canonical`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `fos_user` WRITE;
/*!40000 ALTER TABLE `fos_user` DISABLE KEYS */;

INSERT INTO `fos_user` (`id`, `username`, `username_canonical`, `email`, `email_canonical`, `enabled`, `salt`, `password`, `last_login`, `locked`, `expired`, `expires_at`, `confirmation_token`, `password_requested_at`, `credentials_expired`, `credentials_expire_at`, `roles`)
VALUES
	(1,'test','test','smirik@gmail.com','smirik@gmail.com',1,'4u2oi7ahb62os0kk4ocg8gowg4ook0o','o9jtUCYjmar9GrxmHJGszZtpzV0UGPMDQ/EhaU7iWaCt2YqMgIHcnQdv3MvFG89lc8STsGiQW3nbL9CcmJKQ9Q==',NULL,0,0,NULL,NULL,NULL,0,NULL,'| ROLE_USER | ROLE_ADMIN |'),
	(2,'test2','test2','smirik+2@gmail.com','smirik+2@gmail.com',1,'4u2oi7ahb62os0kk4ocg8gowg4ook0o','EEKt4SmSa5f9I4T86ek2iwM80KAkZNgmzGkIxH6b+fKK3Q9CMf45s3qwxsHMyUDhOLPmTF25zLAvf61lzQf5CA==',NULL,0,0,NULL,NULL,NULL,0,NULL,'| ROLE_USER |'),
	(3,'test3','test3','smirik+3@gmail.com','smirik+3@gmail.com',1,'2fha40muvrk0ckgwwgoo8wooc0w08os','uGASEtYbRAicAlqAkMfcN/3SdMIRlETQcfuqerPp85DlTx30RikW1Cw7OWQQRBCHg2mFPDtV9cOmdGO0DCm++w==',NULL,0,0,NULL,NULL,NULL,0,NULL,NULL);

/*!40000 ALTER TABLE `fos_user` ENABLE KEYS */;
UNLOCK TABLES;


# Дамп таблицы fos_user_group
# ------------------------------------------------------------

DROP TABLE IF EXISTS `fos_user_group`;

CREATE TABLE `fos_user_group` (
  `fos_user_id` int(11) NOT NULL,
  `fos_group_id` int(11) NOT NULL,
  PRIMARY KEY (`fos_user_id`,`fos_group_id`),
  KEY `fos_user_group_FI_2` (`fos_group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `fos_user_group` WRITE;
/*!40000 ALTER TABLE `fos_user_group` DISABLE KEYS */;

INSERT INTO `fos_user_group` (`fos_user_id`, `fos_group_id`)
VALUES
	(1,1),
	(2,1),
	(3,1);

/*!40000 ALTER TABLE `fos_user_group` ENABLE KEYS */;
UNLOCK TABLES;


# Дамп таблицы lessons
# ------------------------------------------------------------

DROP TABLE IF EXISTS `lessons`;

CREATE TABLE `lessons` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course_id` int(11) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `sortable_rank` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `lessons_I_1` (`course_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `lessons` WRITE;
/*!40000 ALTER TABLE `lessons` DISABLE KEYS */;

INSERT INTO `lessons` (`id`, `course_id`, `title`, `created_at`, `updated_at`, `sortable_rank`)
VALUES
	(1,1,'Основы','2012-09-02 22:21:09','2012-09-02 22:21:09',1),
	(2,1,'Управляющие структуры','2012-09-02 22:29:48','2012-09-02 22:29:48',2),
	(3,1,'Циклы в ruby','2012-09-02 22:30:39','2012-09-02 22:30:39',3),
	(4,1,'Работа с массивами','2012-09-02 22:31:12','2012-09-02 22:31:12',4),
	(5,1,'Работа со строками и строковыми функциями','2012-09-02 22:31:48','2012-09-02 22:31:48',5),
	(6,1,'Динамическое программирование','2012-09-02 22:32:46','2012-09-02 22:32:46',6),
	(7,1,'Алгоритмы: перебор и рекурсия','2012-09-02 22:33:16','2012-09-02 22:33:16',7),
	(8,1,'Жадные алгоритмы','2012-09-02 22:33:48','2012-09-02 22:33:48',8),
	(9,1,'Паттерны программирования','2012-09-02 22:34:17','2012-09-02 22:34:17',9),
	(10,1,'Хэши','2012-09-02 22:34:55','2012-09-02 22:34:55',10),
	(11,2,'Информационное общество','2013-08-05 12:59:38','2013-08-05 12:59:38',1);

/*!40000 ALTER TABLE `lessons` ENABLE KEYS */;
UNLOCK TABLES;


# Дамп таблицы lessons_answers
# ------------------------------------------------------------

DROP TABLE IF EXISTS `lessons_answers`;

CREATE TABLE `lessons_answers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `lesson_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `text` text,
  `is_visible` tinyint(1) DEFAULT '0',
  `is_accepted` tinyint(1) DEFAULT '0',
  `accepted_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `lessons_answers_I_1` (`user_id`),
  KEY `lessons_answers_I_2` (`lesson_id`),
  KEY `lessons_answers_I_3` (`question_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `lessons_answers` WRITE;
/*!40000 ALTER TABLE `lessons_answers` DISABLE KEYS */;

INSERT INTO `lessons_answers` (`id`, `user_id`, `lesson_id`, `question_id`, `text`, `is_visible`, `is_accepted`, `accepted_by`, `created_at`, `updated_at`)
VALUES
	(1,1,1,1,'num = num.to_i',1,1,NULL,'2012-09-09 19:29:10','2012-09-09 19:29:27');

/*!40000 ALTER TABLE `lessons_answers` ENABLE KEYS */;
UNLOCK TABLES;


# Дамп таблицы lessons_content
# ------------------------------------------------------------

DROP TABLE IF EXISTS `lessons_content`;

CREATE TABLE `lessons_content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lesson_id` int(11) DEFAULT NULL,
  `title` varchar(200) NOT NULL,
  `description` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `sortable_rank` int(11) DEFAULT NULL,
  `descendant_class` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `lessons_content_I_1` (`lesson_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `lessons_content` WRITE;
/*!40000 ALTER TABLE `lessons_content` DISABLE KEYS */;

INSERT INTO `lessons_content` (`id`, `lesson_id`, `title`, `description`, `created_at`, `updated_at`, `sortable_rank`, `descendant_class`)
VALUES
	(1,1,'Основы программирования на ruby',NULL,'2012-09-02 22:22:50','2012-09-02 22:22:50',1,'SlideshareContent'),
	(2,1,'Официальный сайт по ruby',NULL,'2012-09-02 22:28:44','2012-09-02 22:28:44',2,'UrlContent'),
	(3,1,'Ruby за 20 минут',NULL,'2012-09-02 22:28:44','2012-09-02 22:28:44',3,'UrlContent'),
	(4,1,'Викиучебник по ruby',NULL,'2012-09-02 22:28:44','2012-09-02 22:28:44',4,'UrlContent'),
	(5,2,'Управляющие структуры в ruby',NULL,'2012-09-02 22:30:21','2012-09-02 22:30:21',1,'SlideshareContent'),
	(6,3,'Управляющие структуры: циклы',NULL,'2012-09-02 22:30:55','2012-09-02 22:30:55',1,'SlideshareContent'),
	(7,4,'Массивы',NULL,'2012-09-02 22:31:21','2012-09-02 22:31:21',1,'SlideshareContent'),
	(8,5,'Строки в ruby',NULL,'2012-09-02 22:32:11','2012-09-02 22:32:11',1,'SlideshareContent'),
	(9,6,'Концепция динамического программирования в ruby',NULL,'2012-09-02 22:33:01','2012-09-02 22:33:01',1,'SlideshareContent'),
	(10,7,'Реализация перебора и рекурсии в ruby',NULL,'2012-09-02 22:33:35','2012-09-02 22:33:35',1,'SlideshareContent'),
	(11,8,'Жадные алгоритмы в ruby',NULL,'2012-09-02 22:34:00','2012-09-02 22:34:00',1,'SlideshareContent'),
	(12,9,'Паттерны программирования в ruby',NULL,'2012-09-02 22:34:30','2012-09-02 22:34:47',1,'SlideshareContent'),
	(13,10,'Об использовании хэшей в ruby',NULL,'2012-09-02 22:35:09','2012-09-02 22:35:09',1,'SlideshareContent'),
	(14,1,'Основы программирования на ruby',NULL,'2012-09-02 22:22:50','2012-09-02 22:22:50',1,'Smirik\\CourseBundle\\Model\\SlideshareContent'),
	(15,2,'Управляющие структуры в ruby',NULL,'2012-09-02 22:30:21','2012-09-02 22:30:21',1,'Smirik\\CourseBundle\\Model\\SlideshareContent'),
	(16,3,'Управляющие структуры: циклы',NULL,'2012-09-02 22:30:55','2012-09-02 22:30:55',1,'Smirik\\CourseBundle\\Model\\SlideshareContent'),
	(17,4,'Массивы',NULL,'2012-09-02 22:31:21','2012-09-02 22:31:21',1,'Smirik\\CourseBundle\\Model\\SlideshareContent'),
	(18,5,'Строки в ruby',NULL,'2012-09-02 22:32:11','2012-09-02 22:32:11',1,'Smirik\\CourseBundle\\Model\\SlideshareContent'),
	(19,6,'Концепция динамического программирования в ruby',NULL,'2012-09-02 22:33:01','2012-09-02 22:33:01',1,'Smirik\\CourseBundle\\Model\\SlideshareContent'),
	(20,7,'Реализация перебора и рекурсии в ruby',NULL,'2012-09-02 22:33:35','2012-09-02 22:33:35',1,'Smirik\\CourseBundle\\Model\\SlideshareContent'),
	(21,8,'Жадные алгоритмы в ruby',NULL,'2012-09-02 22:34:00','2012-09-02 22:34:00',1,'Smirik\\CourseBundle\\Model\\SlideshareContent'),
	(22,9,'Паттерны программирования в ruby',NULL,'2012-09-02 22:34:30','2012-09-02 22:34:47',1,'Smirik\\CourseBundle\\Model\\SlideshareContent'),
	(23,10,'Об использовании хэшей в ruby',NULL,'2012-09-02 22:35:09','2012-09-02 22:35:09',1,'Smirik\\CourseBundle\\Model\\SlideshareContent'),
	(24,11,'Информационное общество: плюсы и минусы',NULL,'2013-08-05 13:00:37','2013-08-05 13:00:37',1,'Smirik\\CourseBundle\\Model\\SlideshareContent'),
	(25,1,'Официальный сайт по ruby',NULL,'2012-09-02 22:28:44','2012-09-02 22:28:44',1,'Smirik\\CourseBundle\\Model\\UrlContent'),
	(26,1,'Ruby за 20 минут',NULL,'2012-09-02 22:28:44','2012-09-02 22:28:44',2,'Smirik\\CourseBundle\\Model\\UrlContent'),
	(27,1,'Викиучебник по ruby',NULL,'2012-09-02 22:28:44','2012-09-02 22:28:44',3,'Smirik\\CourseBundle\\Model\\UrlContent');

/*!40000 ALTER TABLE `lessons_content` ENABLE KEYS */;
UNLOCK TABLES;


# Дамп таблицы lessons_content_files
# ------------------------------------------------------------

DROP TABLE IF EXISTS `lessons_content_files`;

CREATE TABLE `lessons_content_files` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lesson_content_id` int(11) DEFAULT NULL,
  `file` varchar(255) NOT NULL,
  `type` varchar(50) NOT NULL,
  `title` varchar(200) DEFAULT NULL,
  `caption` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `lessons_content_files_I_1` (`lesson_content_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Дамп таблицы lessons_content_slideshare
# ------------------------------------------------------------

DROP TABLE IF EXISTS `lessons_content_slideshare`;

CREATE TABLE `lessons_content_slideshare` (
  `url` varchar(255) NOT NULL,
  `id` int(11) NOT NULL,
  `lesson_id` int(11) DEFAULT NULL,
  `title` varchar(200) NOT NULL,
  `description` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `sortable_rank` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `lessons_content_slideshare_I_1` (`lesson_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `lessons_content_slideshare` WRITE;
/*!40000 ALTER TABLE `lessons_content_slideshare` DISABLE KEYS */;

INSERT INTO `lessons_content_slideshare` (`url`, `id`, `lesson_id`, `title`, `description`, `created_at`, `updated_at`, `sortable_rank`)
VALUES
	('http://www.slideshare.net/smirik/ruby-9448188',14,1,'Основы программирования на ruby',NULL,'2012-09-02 22:22:50','2012-09-02 22:22:50',1),
	('http://www.slideshare.net/smirik/ruby-9541023',15,2,'Управляющие структуры в ruby',NULL,'2012-09-02 22:30:21','2012-09-02 22:30:21',1),
	('http://www.slideshare.net/smirik/ruby-9660389',16,3,'Управляющие структуры: циклы',NULL,'2012-09-02 22:30:55','2012-09-02 22:30:55',1),
	('http://www.slideshare.net/smirik/ruby-9776149',17,4,'Массивы',NULL,'2012-09-02 22:31:21','2012-09-02 22:31:21',1),
	('http://www.slideshare.net/smirik/ruby-10105277',18,5,'Строки в ruby',NULL,'2012-09-02 22:32:11','2012-09-02 22:32:11',1),
	('http://www.slideshare.net/smirik/ruby-10207425',19,6,'Концепция динамического программирования в ruby',NULL,'2012-09-02 22:33:01','2012-09-02 22:33:01',1),
	('http://www.slideshare.net/smirik/ruby-10449462',20,7,'Реализация перебора и рекурсии в ruby',NULL,'2012-09-02 22:33:35','2012-09-02 22:33:35',1),
	('http://www.slideshare.net/smirik/ruby-11212715',21,8,'Жадные алгоритмы в ruby',NULL,'2012-09-02 22:34:00','2012-09-02 22:34:00',1),
	('http://www.slideshare.net/smirik/ruby-11652000',22,9,'Паттерны программирования в ruby',NULL,'2012-09-02 22:34:30','2012-09-02 22:34:47',1),
	('http://www.slideshare.net/smirik/ruby-11601320',23,10,'Об использовании хэшей в ruby',NULL,'2012-09-02 22:35:09','2012-09-02 22:35:09',1),
	('http://www.slideshare.net/smirik/ss-14156533',24,11,'Информационное общество: плюсы и минусы',NULL,'2013-08-05 13:00:37','2013-08-05 13:00:37',1);

/*!40000 ALTER TABLE `lessons_content_slideshare` ENABLE KEYS */;
UNLOCK TABLES;


# Дамп таблицы lessons_content_texts
# ------------------------------------------------------------

DROP TABLE IF EXISTS `lessons_content_texts`;

CREATE TABLE `lessons_content_texts` (
  `text` text,
  `id` int(11) NOT NULL,
  `lesson_id` int(11) DEFAULT NULL,
  `title` varchar(200) NOT NULL,
  `description` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `sortable_rank` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `lessons_content_texts_I_1` (`lesson_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Дамп таблицы lessons_content_urls
# ------------------------------------------------------------

DROP TABLE IF EXISTS `lessons_content_urls`;

CREATE TABLE `lessons_content_urls` (
  `url` varchar(255) NOT NULL,
  `id` int(11) NOT NULL,
  `lesson_id` int(11) DEFAULT NULL,
  `title` varchar(200) NOT NULL,
  `description` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `sortable_rank` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `lessons_content_urls_I_1` (`lesson_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `lessons_content_urls` WRITE;
/*!40000 ALTER TABLE `lessons_content_urls` DISABLE KEYS */;

INSERT INTO `lessons_content_urls` (`url`, `id`, `lesson_id`, `title`, `description`, `created_at`, `updated_at`, `sortable_rank`)
VALUES
	('http://ruby-lang.org',25,1,'Официальный сайт по ruby',NULL,'2012-09-02 22:28:44','2012-09-02 22:28:44',1),
	('http://preview.ruby-lang.org/ru/documentation/quickstart/',26,1,'Ruby за 20 минут',NULL,'2012-09-02 22:28:44','2012-09-02 22:28:44',2),
	('http://ru.wikibooks.org/wiki/Ruby',27,1,'Викиучебник по ruby',NULL,'2012-09-02 22:28:44','2012-09-02 22:28:44',3);

/*!40000 ALTER TABLE `lessons_content_urls` ENABLE KEYS */;
UNLOCK TABLES;


# Дамп таблицы lessons_content_youtube
# ------------------------------------------------------------

DROP TABLE IF EXISTS `lessons_content_youtube`;

CREATE TABLE `lessons_content_youtube` (
  `url` varchar(255) NOT NULL,
  `id` int(11) NOT NULL,
  `lesson_id` int(11) DEFAULT NULL,
  `title` varchar(200) NOT NULL,
  `description` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `sortable_rank` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `lessons_content_youtube_I_1` (`lesson_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Дамп таблицы lessons_questions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `lessons_questions`;

CREATE TABLE `lessons_questions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `lesson_id` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `text` text,
  `is_visible` tinyint(1) DEFAULT '0',
  `is_answered` tinyint(1) DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `sortable_rank` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `lessons_questions_I_1` (`user_id`),
  KEY `lessons_questions_I_2` (`lesson_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `lessons_questions` WRITE;
/*!40000 ALTER TABLE `lessons_questions` DISABLE KEYS */;

INSERT INTO `lessons_questions` (`id`, `user_id`, `lesson_id`, `title`, `text`, `is_visible`, `is_answered`, `created_at`, `updated_at`, `sortable_rank`)
VALUES
	(1,1,1,'Как сделать вещественное число целым?','У меня есть вещественное число num, надо сделать его целым. Как это сделать в ruby?',1,1,'2012-09-03 16:40:43','2012-09-09 19:29:20',1);

/*!40000 ALTER TABLE `lessons_questions` ENABLE KEYS */;
UNLOCK TABLES;


# Дамп таблицы lessons_quizes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `lessons_quizes`;

CREATE TABLE `lessons_quizes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lesson_id` int(11) NOT NULL,
  `quiz_id` int(11) NOT NULL,
  `sortable_rank` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `lessons_quizes_I_1` (`lesson_id`),
  KEY `lessons_quizes_I_2` (`quiz_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `lessons_quizes` WRITE;
/*!40000 ALTER TABLE `lessons_quizes` DISABLE KEYS */;

INSERT INTO `lessons_quizes` (`id`, `lesson_id`, `quiz_id`, `sortable_rank`)
VALUES
	(1,1,3,1),
	(2,3,2,1),
	(3,10,1,1);

/*!40000 ALTER TABLE `lessons_quizes` ENABLE KEYS */;
UNLOCK TABLES;


# Дамп таблицы profiles
# ------------------------------------------------------------

DROP TABLE IF EXISTS `profiles`;

CREATE TABLE `profiles` (
  `user_id` int(11) NOT NULL,
  `vk_id` varchar(50) DEFAULT NULL,
  `first_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `middle_name` varchar(100) DEFAULT NULL,
  `birthday` datetime DEFAULT NULL,
  `position` varchar(200) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `skype` varchar(50) DEFAULT NULL,
  `file` varchar(100) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `profiles` WRITE;
/*!40000 ALTER TABLE `profiles` DISABLE KEYS */;

INSERT INTO `profiles` (`user_id`, `vk_id`, `first_name`, `last_name`, `middle_name`, `birthday`, `position`, `phone`, `skype`, `file`, `created_at`, `updated_at`)
VALUES
	(1,NULL,'Евгений','Смирнов',NULL,NULL,NULL,NULL,NULL,NULL,'2013-03-18 21:43:58','2013-03-18 21:44:08'),
	(2,NULL,'dsasd','dsadsa',NULL,NULL,NULL,NULL,NULL,NULL,'2013-03-18 21:43:58','2013-04-22 14:32:04'),
	(3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2013-03-18 21:43:58','2013-03-18 21:43:58');

/*!40000 ALTER TABLE `profiles` ENABLE KEYS */;
UNLOCK TABLES;


# Дамп таблицы questions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `questions`;

CREATE TABLE `questions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` longtext,
  `type` varchar(50) DEFAULT NULL,
  `file` varchar(255) DEFAULT NULL,
  `num_answers` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `questions` WRITE;
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;

INSERT INTO `questions` (`id`, `text`, `type`, `file`, `num_answers`, `created_at`, `updated_at`)
VALUES
	(1,'Какой из нижеперечисленных операторов задаёт неявный цикл?','radio',NULL,4,'2011-11-23 05:37:07','2011-11-23 05:37:07'),
	(2,'Как в ruby записывается операция дизъюнкция (логическое или)','radio',NULL,4,'2011-11-23 05:37:07','2011-11-23 05:37:07'),
	(3,'Как в ruby записывается операция конъюнкция (логическое и)','radio',NULL,4,'2011-11-23 05:37:07','2011-11-23 05:37:07'),
	(4,'Как в ruby записывается операция отрицание (логическое не)','radio',NULL,4,'2011-11-23 05:37:07','2011-11-23 05:37:07'),
	(5,'Как в программировании (в т.ч. на ruby) называют логический тип переменных?','radio',NULL,4,'2011-11-23 05:37:07','2011-11-23 05:37:07'),
	(6,'Как в программировании (в т.ч. на ruby) называют целочисленный тип переменных?','radio',NULL,4,'2011-11-23 05:37:07','2011-11-23 05:37:07'),
	(7,'Как в программировании (в т.ч. на ruby) называют тип переменных для вещественных чисел?','radio',NULL,4,'2011-11-23 05:37:07','2011-11-23 05:37:07'),
	(8,'Вася задал переменную, в которой будет хранить возраст человека. Какого типа будет переменная?','radio',NULL,4,'2011-11-23 05:37:07','2011-11-23 05:37:07'),
	(9,'Вася задал переменную, в которой будет хранить информацию о том, женат / замужем ли человек. Какого типа будет переменная?','radio',NULL,4,'2011-11-23 05:37:07','2011-11-23 05:37:07'),
	(10,'Вася задал переменную, в которой будет хранить e-mail человека. Какого типа будет переменная?','radio',NULL,4,'2011-11-23 05:37:07','2011-11-23 05:37:07'),
	(11,'Чему будет равна в ruby переменная num = 6+3/3+2*5**2','text',NULL,1,'2011-11-23 05:37:07','2011-11-23 05:37:07'),
	(12,'Чему будет равна переменная a после выполнения программы: <br>a = 5<br>b = 3<br>c = a<br>a = b<br>b = c<br>','text',NULL,1,'2011-11-23 05:37:07','2012-09-02 23:25:03'),
	(13,'Что выведет на экран программа: <br>a = 5<br>if (a &gt; 10)<br>  puts \"YES\"<br>elsif (a &gt; 3)<br>  puts \"MAY BE\"<br>else<br>  puts \"NO\"<br>end<br><br>','text',NULL,1,'2011-11-23 05:37:07','2012-09-19 12:24:40'),
	(14,'Запишите слитно без пробелов и операторов условие: переменная a БОЛЬШЕ ЛИБО РАВНА переменной b','text',NULL,1,'2011-11-23 05:37:07','2011-11-23 05:37:07'),
	(15,'Даны a,b,c. Запишите слитно без пробелов вычисление дискриминанта D уравнения ax2+bx+c = 0 (используя только операции +, *, -, /). Результат должен быть записан в переменную D.','text',NULL,1,'2011-11-23 05:37:07','2012-11-11 09:22:13'),
	(16,'Сколько чисел выведет программа:<br>i=0<br>while (i&lt;100)<br>  i=i+1<br>  puts i<br>end<br>','text',NULL,1,'2011-11-23 05:37:07','2012-09-02 23:24:44'),
	(17,'Сколько чисел выведет программа:<br>i=1<br>while (i&lt;100)<br>  i=i+1<br>  puts i<br>end<br>','text',NULL,1,'2011-11-23 05:37:07','2012-09-02 23:24:40'),
	(18,'Перечислите через запятую без пробелов числа, которые выведет программа:<br>3.times {|i| puts i**2}','text',NULL,1,'2011-11-23 05:37:07','2012-09-02 23:24:35'),
	(19,'Какой оператор позволяет закончить выполнение цикла?','radio',NULL,4,'2011-11-23 05:37:07','2011-11-23 05:37:07'),
	(20,'Какой оператор позволяет закончить текущую итерацию цикла и перейти к следующей?','radio',NULL,4,'2011-11-23 05:37:07','2011-11-23 05:37:07'),
	(21,'Перечислите через запятую без пробелов числа, которые выведет программа:<br />3.times {|i| puts i**2}','text',NULL,1,'2011-11-23 05:37:07','2011-11-23 05:37:07'),
	(22,'Какой из нижеперечисленных методов позволяет изменить каждый элемент массива?','radio',NULL,4,'2011-11-23 05:37:07','2011-11-23 05:37:07'),
	(23,'Какой из нижеперечисленных методов позволяет извлечь из массива подмассив по заданному условию?','radio',NULL,4,'2011-11-23 05:37:07','2011-11-23 05:37:07'),
	(24,'Какой из нижеперечисленных методов позволяет удалить элемент массива?','radio',NULL,4,'2011-11-23 05:37:07','2011-11-23 05:37:07'),
	(25,'Что выведет на экран программа: <br />arr = [3,5,1]<br />puts arr.inject(0){|res, elem| res + elem}<br />','text',NULL,1,'2011-11-23 05:37:07','2011-11-23 05:37:07'),
	(26,'Что выведет на экран программа: <br />arr = [3,5,1]<br />puts arr.inject(0){|res, elem| res * elem}<br />','text',NULL,1,'2011-11-23 05:37:07','2011-11-23 05:37:07'),
	(27,'Что выведет на экран программа: <br />arr = [3,5,1]<br />puts arr.inject(1){|res, elem| res * elem}<br />','text',NULL,1,'2011-11-23 05:37:07','2011-11-23 05:37:07'),
	(28,'Что выведет на экран программа: <br />arr = [3,5,1, 1]<br />puts arr.inject(0){|res, elem| res + elem}/arr.size<br />','text',NULL,1,'2011-11-23 05:37:07','2011-11-23 05:37:07'),
	(29,'Что выведет на экран программа: <br />arr = [3.0,5.0,1.0, 1.0]<br />puts arr.inject(0){|res, elem| res + elem}/arr.size<br />','text',NULL,1,'2011-11-23 05:37:07','2011-11-23 05:37:07'),
	(30,'Что выведет на экран программа: <br />arr = [3,5,1, 1]<br />puts arr.find_all{|elem| elem > arr.size}.size<br />','text',NULL,1,'2011-11-23 05:37:07','2011-11-23 05:37:07'),
	(31,'Что выведет на экран программа: <br />arr = [3,-5,-1, 1]<br />puts arr.find_all{|elem| elem > 0}.size<br />','text',NULL,1,'2011-11-23 05:37:07','2011-11-23 05:37:07'),
	(32,'Что выведет на экран программа: <br />arr = [3,-5,-1, 1]<br />arr = arr.map{|elem| 3*elem }<br />puts arr.inject(0){|res, elem| res+elem}<br />','text',NULL,1,'2011-11-23 05:37:07','2011-11-23 05:37:07'),
	(33,'Что выведет на экран программа: <br>puts ‘abc’*3<br>','text',NULL,1,'2011-11-23 05:37:07','2012-09-02 23:24:21'),
	(34,'Что выведет на экран программа: <br />puts ‘aabbcc’.sub(’a’, ‘d’).reverse<br />','text',NULL,1,'2011-11-23 05:37:07','2011-11-23 05:37:07'),
	(35,'Что выведет на экран программа: <br />puts ‘aabbcc’.gsub(’a’, ‘d’).reverse<br />','text',NULL,1,'2011-11-23 05:37:07','2011-11-23 05:37:07'),
	(36,'Что выведет на экран программа: <br />puts ‘aa bb cc’.split(’ ‘).size<br />','text',NULL,1,'2011-11-23 05:37:07','2011-11-23 05:37:07'),
	(37,'Укажите через запятую без пробелов, что выведет на экран программа: <br />arr = ‘a bbb cc’.split(’ ‘)<br />arr.each {|elem| puts elem.size } ','text',NULL,1,'2011-11-23 05:37:07','2011-11-23 05:37:07'),
	(38,'Что выведет на экран программа: <br />puts ‘aa bb cc’.empty?<br />','text',NULL,1,'2011-11-23 05:37:07','2011-11-23 05:37:07'),
	(39,'Что выведет на экран программа: <br />puts ‘aa bb cc’.any?<br />','text',NULL,1,'2011-11-23 05:37:07','2011-11-23 05:37:07'),
	(40,'Что выведет на экран программа: <br />puts ‘aa bb cc’.include?(’b’)<br />','text',NULL,1,'2011-11-23 05:37:07','2011-11-23 05:37:07');

/*!40000 ALTER TABLE `questions` ENABLE KEYS */;
UNLOCK TABLES;


# Дамп таблицы quiz
# ------------------------------------------------------------

DROP TABLE IF EXISTS `quiz`;

CREATE TABLE `quiz` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `description` longtext NOT NULL,
  `time` int(11) NOT NULL,
  `num_questions` int(11) NOT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `is_opened` tinyint(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `quiz` WRITE;
/*!40000 ALTER TABLE `quiz` DISABLE KEYS */;

INSERT INTO `quiz` (`id`, `title`, `description`, `time`, `num_questions`, `is_active`, `is_opened`, `created_at`, `updated_at`)
VALUES
	(1,'Программирование на ruby','Тест по основам программирования на ruby. Базовые вопросы, синтаксис, основные операторы, условия, циклы, методы работы с массивами. Простейшие программы и алгоритмы.',600,6,1,0,'2011-11-23 05:37:07','2012-09-02 23:27:04'),
	(2,'Ruby: основы, условия, циклы','Тест по следующим темам:<br><ul><li>Основы программирования на ruby.</li><li>Управляющие структуры: условия.</li><li>Циклы в ruby.</li></ul>',180,5,1,1,'2012-09-02 23:22:48','2012-09-12 12:44:17'),
	(3,'Основы программирования на ruby','Тест посвящён базовым основам программирования на ruby. Соответствует первому уроку курса по ruby.',120,3,1,0,'2012-09-02 23:26:48','2012-09-02 23:28:57');

/*!40000 ALTER TABLE `quiz` ENABLE KEYS */;
UNLOCK TABLES;


# Дамп таблицы quiz_questions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `quiz_questions`;

CREATE TABLE `quiz_questions` (
  `question_id` int(11) NOT NULL,
  `quiz_id` int(11) NOT NULL,
  PRIMARY KEY (`question_id`,`quiz_id`),
  KEY `quiz_questions_I_1` (`question_id`),
  KEY `quiz_questions_I_2` (`quiz_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `quiz_questions` WRITE;
/*!40000 ALTER TABLE `quiz_questions` DISABLE KEYS */;

INSERT INTO `quiz_questions` (`question_id`, `quiz_id`)
VALUES
	(1,1),
	(1,2),
	(2,1),
	(2,2),
	(3,1),
	(3,2),
	(4,1),
	(4,2),
	(5,1),
	(5,2),
	(5,3),
	(6,1),
	(6,2),
	(6,3),
	(7,1),
	(7,2),
	(7,3),
	(8,1),
	(8,2),
	(8,3),
	(9,1),
	(9,2),
	(9,3),
	(10,1),
	(10,2),
	(10,3),
	(11,1),
	(11,2),
	(11,3),
	(12,1),
	(12,2),
	(12,3),
	(13,1),
	(13,2),
	(14,1),
	(14,2),
	(15,1),
	(15,2),
	(16,1),
	(16,2),
	(17,1),
	(17,2),
	(18,1),
	(18,2),
	(19,1),
	(19,2),
	(20,1),
	(20,2),
	(21,1),
	(22,1),
	(23,1),
	(24,1),
	(25,1),
	(26,1),
	(27,1),
	(28,1),
	(29,1),
	(30,1),
	(31,1),
	(32,1),
	(33,1),
	(33,2),
	(34,1),
	(35,1),
	(36,1),
	(37,1),
	(38,1),
	(39,1),
	(40,1);

/*!40000 ALTER TABLE `quiz_questions` ENABLE KEYS */;
UNLOCK TABLES;


# Дамп таблицы tasks
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tasks`;

CREATE TABLE `tasks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lesson_id` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `text` text,
  `file` varchar(200) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `sortable_rank` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tasks_I_1` (`lesson_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `tasks` WRITE;
/*!40000 ALTER TABLE `tasks` DISABLE KEYS */;

INSERT INTO `tasks` (`id`, `lesson_id`, `title`, `text`, `file`, `created_at`, `updated_at`, `sortable_rank`)
VALUES
	(1,1,'Калькулятор','Напишите программу, которая вычисляет 2 в степени 100, 3 в степени 50, 2+2*2, корень из 3. В ответе, помимо текста самой программы, укажите результат выполнения программы.&nbsp;',NULL,'2012-09-02 22:40:31','2012-09-02 22:40:31',1),
	(2,1,'Смена переменных','Даны две переменные типа integer: <i>a</i> и <i>b</i>. Напишите программу, которая без создания дополнительной переменной меняет их значения местами, то есть переменная&nbsp;<i>a</i> становится равной <i>b<b></b></i><b></b>, а&nbsp;<i>b</i> —&nbsp;<b></b><i>a</i>. Если вы не можете придумать решение, укажите хотя бы ваши идеи.',NULL,'2012-09-02 22:42:04','2012-09-02 22:42:04',2),
	(3,2,'Сравнения','Напишите программу, которая сравнивает два числа: 2 в степени 100 и 3 в степени 50. Программа должна выводить слово \"больше\", если первое число больше второго, \"равно\" — если числа равны, \"меньше\" — если первое число меньше второго. Сами числа выводить не нужно.',NULL,'2012-09-02 22:44:00','2012-09-02 22:44:00',1),
	(4,3,'Формула Хартли','Задана переменная N (типа integer), в которой хранится количество символов некоего алфавита, неизвестно какого. Напишите программу, которая посчитает, какое минимальное количество&nbsp;бит может занимать один символ данного алфавита. В ответе программа должна выводить только число — количество бит.',NULL,'2012-09-02 22:46:40','2012-09-02 22:46:40',1),
	(5,3,'Числа Фибоначчи','Напишите программу, вычисляющую N-ное число Фибоначчи (N задаётся в виде переменной в начале программы) с помощью цикла whilte. Вычислите 100-ое число Фибоначчи с помощью программы и сравните результат с программой, указанной в презентации.<br><br>Дополнительно укажите, какая из программ вам кажется более удачной и почему?<br><br>В ответе нужно написать:<br><ul><li>программу с циклом while,</li><li>два значения: 100-ое число Фибоначчи, вычисленное обеими программами,</li><li>мнение насчёт явного и неявного циклов.</li></ul>',NULL,'2012-09-02 22:48:41','2012-09-02 22:48:41',2),
	(6,4,'Произведение элементов','Напишите программу, которая с помощью метода inject вычисляет произведение элементов массива. В качестве массива можно использовать любой набор целых чисел, задаваемый в начале программы.',NULL,'2012-09-02 22:49:47','2012-09-02 22:49:47',1),
	(7,4,'Средние','Напишите программу, которая для заданного в начале программы массива натуральных чисел вычисляет:<br><ul><li>среднее арифметическое элементов массива,</li><li>среднее геометрическое элементов массива,</li><li>среднее гармоническое элементов массива.</li></ul>',NULL,'2012-09-02 22:50:44','2012-09-02 22:50:44',2),
	(8,4,'Поиск элементов','Задан массив из 10 целых чисел (любых). Напишите программу, которая с помощью метода find_all выводит на экран все элементы массива, меньшие нуля и делящиеся на 3.',NULL,'2012-09-02 22:51:54','2012-09-02 22:51:54',3),
	(9,4,'Поиск и сумма','Задан массив из 10 целых чисел (любых). Напишите программу, которая выводит на экран сумму всех чётных положитительных элементов массива.',NULL,'2012-09-02 22:52:38','2012-09-02 22:52:38',4),
	(10,5,'Длина слов','Задана строка <i>s</i>. Напишите программу, вычисляющую среднюю длину слова.<br><br><b>Пояснение:</b> <i>средняя длина слова в строке — это среднее арифметическое длин всех слов строки.</i><br><br><b>Пример:</b><br>Дана строка: \"Мама мыла раму доместосом\".<br>Средняя длина слова: (4+4+4+10)/4 = 5.5 символов.<br>Ответ: 5.5',NULL,'2012-09-02 22:54:57','2012-09-02 22:54:57',1),
	(11,5,'Палиндромы','Дана строка <i>s</i>. Напишите программу, выводящую на экран все слова-палиндромы, встречающиеся в строке.<br><br><b>Пояснение</b><br>Палиндромом называют слово (или словосочетание), одинаково читающееся в обоих направлениях.<br><br><b>Примеры:</b><br><ul><li>топот,</li><li>анна,</li><li>А роза упала на лапу Азора.</li></ul>',NULL,'2012-09-02 22:56:28','2012-09-02 22:56:28',2),
	(12,5,'Сложные палиндромы','Дана строка <i>s</i>. Напишите программу, выводящую на экран все палиндромы, находящиеся в данной строке (включая палиндромы-словосочетания).<br><br><b>Комментарий</b><br>Если вы не можете решить эту задачу, в ответе укажите идеи насчёт решения.',NULL,'2012-09-02 22:57:34','2012-09-02 22:57:34',3),
	(13,6,'451 градус по Фаренгейту','Напишите функцию, которая переводит градусы по Фаренгейту в градусы по Цельсию. С помощью функции найдите, чему равен 451 градус по Фаренгейту в Цельсиях и укажите это число в ответе. <br><br>Дополнительно поясните, откуда взялось вообще число 451.&nbsp;<br><br>Ответ должен содержать 3 части:<br><ul><li>функция перевода градусов,</li><li>значение 451 градуса по Фаренгейту в Цельсиях,</li><li>объяснение, откуда взялось число 451.&nbsp;<br></li></ul>',NULL,'2012-09-02 23:00:52','2012-09-02 23:00:52',1),
	(14,7,'Взаимно-простые числа','Дано натуральное число <i>a</i>. Выведите на экран все числа, которые взаимно просты с <i>a</i> и не превышают некоего числа N, заданного в начале программы.<br><br><b>Пример</b><br>N = 10<br>a = 3<br>Программа должна вывести все числа, меньшие либо равные&nbsp;10 и взаимно простые с 3. Таких чисел шесть: 2, 4, 5, 7, 8, 10.',NULL,'2012-09-02 23:02:46','2012-09-02 23:02:46',1),
	(15,7,'Ханойские башни','Напишите программу, которая выводит на экран алгоритм решения задачи о Ханойских башнях для заданного количества колец N (N задаётся в начале программы).<br><br><b>Дополнительно</b> решите следующую задачу:<br>Предположим, что на перекладывание одного кольца монахи тратят 1 минуту. Посчитайте, сколько потребуется монахам времени, чтобы выполнить условие Брахмы для конца света.',NULL,'2012-09-02 23:05:46','2012-09-02 23:05:46',2),
	(16,8,'Задача о коммивояжёре','Коммивояжёру для продажи своего товара нужно посетить несколько городов. Некоторые города соединены дорогами. Напишите самый простой жадный алгоритм, который бы выбрал коммивояжёру кратчайший путь из возможных.<br><br><b>Замечание</b><br>В данном задании не требуется:<br><ul><li>Написать программу. Достаточно только алгоритма.</li><li>Найти самый-самый короткий путь. Ваша цель — предложить рабочий алгоритм, использующий жадный принцип выбора.</li></ul>',NULL,'2012-09-02 23:08:44','2012-09-02 23:08:44',1),
	(17,9,'Резюме','Напишите краткое резюме, что вы поняли из презентации по паттернам программирования. Выделите те моменты, которые показались вам наиболее актуальными, и <b>объясните</b>, почему.',NULL,'2012-09-02 23:11:36','2012-09-02 23:11:36',1),
	(18,10,'Повторение слов','Задана строка <i>s</i>. Выведите на экран 10 наиболее встречающихся слов в строке.<br><br><b>Замечание</b><br>Для проверки в этой задаче рекомендуется вводить достаточно большой кусок текста. Взять его можно из любой книги, например, из Войны и Мира.',NULL,'2012-09-02 23:13:01','2012-09-02 23:13:01',1),
	(19,10,'Парсинг данных','Задан кусок вывода одной из метеорологических служб в виде строковой переменной <i>s</i> в следующем формате: весь текст состоит из строк (количество строк неизвестно), каждая строка состоит из:<br><ol><li>Даты в следующем формате: <i>число</i> (одна или&nbsp;две цифры), затем символ&nbsp;<i>точка</i>, затем <i>месяц</i> (одна или две цифры). Пример: 13.02</li><li>Символ <i>пробела</i> после даты.</li><li>Температуры в виде вещественного числа: 15.23. Дробная часть отделена от целой запятой.</li></ol>Пример входной строки <i>s</i>:<br>13.02 -22.5<br>14.01 -5.9<br>18.02 -9.5<br>15.04 2.3<br>17.05 10.4<br>18.06 22.2<br>01.01 -10.1<br><br><b>Задание</b><br>Вывести на экран среднемесячные температуры за каждый месяц в формате \"<i>номер месяца</i> пробел <i>средняя температура</i>). Если для данного месяца данные отсутствуют — вывести \"<i>номер месяца </i>пробел <i>данные отсутствуют</i>).<i> </i>Месяцы выводить в порядке возрастания, начиная с января (01).<br><br>Пример вывода:<br>01 -8.0<br>02 -16.0<br>03 данные отсутствуют<br>04 2.3<br>05 10.4<br>06 22.2<br>07 данные отсутствуют<br>08&nbsp;данные отсутствуют<br>09&nbsp;данные отсутствуют<br>10&nbsp;данные отсутствуют<br>11&nbsp;данные отсутствуют<br>12&nbsp;данные отсутствуют',NULL,'2012-09-02 23:21:04','2012-09-02 23:21:04',2),
	(20,11,'Приоритет','<p>Расставьте минусы информационного общества в порядке их важности (согласно вашим представлениям) и объясните, почему вы расставили именно так.</p>',NULL,'2013-08-05 13:01:03','2013-08-05 13:01:26',1),
	(21,11,'Плюсы и минусы','<p>Дополните список плюсов и минусов информационного общества своими примерами, три (или больше) плюса и три (или больше) минуса.</p>',NULL,'2013-08-05 13:01:44','2013-08-05 13:01:44',2);

/*!40000 ALTER TABLE `tasks` ENABLE KEYS */;
UNLOCK TABLES;


# Дамп таблицы users_courses
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users_courses`;

CREATE TABLE `users_courses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `started_at` datetime DEFAULT NULL,
  `stopped_at` datetime DEFAULT NULL,
  `is_passed` tinyint(1) DEFAULT '0',
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `users_courses_I_1` (`user_id`),
  KEY `users_courses_I_2` (`course_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `users_courses` WRITE;
/*!40000 ALTER TABLE `users_courses` DISABLE KEYS */;

INSERT INTO `users_courses` (`id`, `user_id`, `course_id`, `started_at`, `stopped_at`, `is_passed`, `updated_at`)
VALUES
	(1,1,1,'2012-09-02 22:25:13',NULL,0,'2012-09-02 22:25:13'),
	(2,3,1,'2012-09-05 14:06:51',NULL,0,'2012-09-05 14:06:51');

/*!40000 ALTER TABLE `users_courses` ENABLE KEYS */;
UNLOCK TABLES;


# Дамп таблицы users_groups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users_groups`;

CREATE TABLE `users_groups` (
  `group_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`group_id`,`user_id`),
  KEY `users_groups_I_1` (`group_id`),
  KEY `users_groups_I_2` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Дамп таблицы users_lessons
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users_lessons`;

CREATE TABLE `users_lessons` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `lesson_id` int(11) NOT NULL,
  `started_at` datetime DEFAULT NULL,
  `stopped_at` datetime DEFAULT NULL,
  `is_passed` tinyint(1) DEFAULT '0',
  `is_closed` tinyint(1) DEFAULT '0',
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `users_lessons_I_1` (`user_id`),
  KEY `users_lessons_FI_2` (`lesson_id`),
  KEY `users_lessons_FI_3` (`course_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `users_lessons` WRITE;
/*!40000 ALTER TABLE `users_lessons` DISABLE KEYS */;

INSERT INTO `users_lessons` (`id`, `user_id`, `course_id`, `lesson_id`, `started_at`, `stopped_at`, `is_passed`, `is_closed`, `updated_at`)
VALUES
	(1,1,1,1,'2012-09-02 23:31:46',NULL,1,1,'2012-09-03 11:21:33'),
	(2,1,1,2,'2012-09-03 11:21:40',NULL,1,1,'2012-09-03 11:22:32'),
	(3,1,1,3,'2012-09-03 11:22:38','2013-04-15 11:03:45',1,1,'2013-04-15 11:03:45'),
	(4,3,1,1,'2012-09-05 14:13:13','2012-09-11 09:55:07',1,1,'2012-09-11 09:55:07'),
	(5,3,1,2,'2012-09-11 21:29:30','2012-09-12 14:04:37',1,1,'2012-09-12 14:04:37'),
	(6,3,1,3,'2012-09-12 14:09:21','2012-09-27 22:11:27',1,1,'2012-09-27 22:11:27'),
	(7,3,1,4,'2012-09-27 22:11:52','2012-10-16 09:31:11',1,1,'2012-10-16 09:31:11'),
	(8,3,1,5,'2012-10-17 18:53:58','2012-11-10 01:08:10',1,1,'2012-11-10 01:08:10'),
	(9,3,1,6,'2012-11-10 01:08:33','2012-11-13 09:16:20',1,1,'2012-11-13 09:16:20'),
	(10,3,1,7,'2012-11-13 09:16:34',NULL,0,0,'2012-11-13 09:16:34'),
	(11,1,1,4,'2013-04-15 11:03:57',NULL,0,0,'2013-04-15 11:03:57');

/*!40000 ALTER TABLE `users_lessons` ENABLE KEYS */;
UNLOCK TABLES;


# Дамп таблицы users_questions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users_questions`;

CREATE TABLE `users_questions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `quiz_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `user_quiz_id` int(11) NOT NULL,
  `answer_id` int(11) DEFAULT NULL,
  `answer_text` varchar(200) DEFAULT NULL,
  `is_right` tinyint(1) DEFAULT NULL,
  `is_closed` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `users_questions_I_1` (`user_id`),
  KEY `users_questions_I_2` (`quiz_id`),
  KEY `users_questions_I_3` (`question_id`),
  KEY `users_questions_I_4` (`user_quiz_id`),
  KEY `users_questions_I_5` (`answer_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `users_questions` WRITE;
/*!40000 ALTER TABLE `users_questions` DISABLE KEYS */;

INSERT INTO `users_questions` (`id`, `user_id`, `quiz_id`, `question_id`, `user_quiz_id`, `answer_id`, `answer_text`, `is_right`, `is_closed`)
VALUES
	(1,2,1,3,2,9,'',1,1),
	(2,2,1,10,2,39,'',1,1),
	(3,2,1,24,2,69,'',1,1),
	(4,2,1,12,2,42,'3',1,1),
	(5,2,1,16,2,46,'100',1,1),
	(6,2,1,20,2,53,'',1,1),
	(7,1,1,28,3,73,'2.5',0,1),
	(8,1,1,15,3,45,'b*b-4*a*c',0,1),
	(9,1,1,9,3,36,'',1,1),
	(10,1,1,1,3,1,'',1,1),
	(11,1,1,27,3,72,'15',1,1),
	(12,1,1,29,3,74,'2.5',1,1),
	(13,1,3,5,1,20,'',1,1),
	(14,1,3,6,1,21,'',1,1),
	(15,1,3,8,1,29,'',1,1);

/*!40000 ALTER TABLE `users_questions` ENABLE KEYS */;
UNLOCK TABLES;


# Дамп таблицы users_quiz
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users_quiz`;

CREATE TABLE `users_quiz` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `quiz_id` int(11) DEFAULT NULL,
  `questions` varchar(255) NOT NULL,
  `current` int(11) NOT NULL,
  `num_right_answers` int(11) DEFAULT NULL,
  `started_at` datetime DEFAULT NULL,
  `stopped_at` datetime DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `is_closed` tinyint(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `users_quiz_I_1` (`user_id`),
  KEY `users_quiz_I_2` (`quiz_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `users_quiz` WRITE;
/*!40000 ALTER TABLE `users_quiz` DISABLE KEYS */;

INSERT INTO `users_quiz` (`id`, `user_id`, `quiz_id`, `questions`, `current`, `num_right_answers`, `started_at`, `stopped_at`, `is_active`, `is_closed`, `created_at`, `updated_at`)
VALUES
	(1,1,3,'[\"74\",\"72\",\"71\"]',2,3,'2013-08-05 10:51:52','2013-08-05 10:52:18',1,1,'2013-08-05 10:51:52','2013-08-05 10:52:18'),
	(2,2,1,'[\"69\",\"76\",\"90\",\"78\",\"82\",\"86\"]',5,6,'2013-08-05 11:30:52','2013-08-05 11:33:51',1,1,'2013-08-05 11:30:52','2013-08-05 11:33:51'),
	(3,1,1,'[\"95\",\"67\",\"93\",\"75\",\"81\",\"94\"]',5,4,'2013-08-05 11:30:52','2013-08-05 11:31:52',1,1,'2013-08-05 11:30:52','2013-08-05 11:31:52');

/*!40000 ALTER TABLE `users_quiz` ENABLE KEYS */;
UNLOCK TABLES;


# Дамп таблицы users_tasks
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users_tasks`;

CREATE TABLE `users_tasks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lesson_id` int(11) NOT NULL,
  `task_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `text` text,
  `url` varchar(200) DEFAULT NULL,
  `file` varchar(200) DEFAULT NULL,
  `status` int(11) DEFAULT '0',
  `mark` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `users_tasks_I_1` (`lesson_id`),
  KEY `users_tasks_I_2` (`user_id`),
  KEY `users_tasks_I_3` (`task_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `users_tasks` WRITE;
/*!40000 ALTER TABLE `users_tasks` DISABLE KEYS */;

INSERT INTO `users_tasks` (`id`, `lesson_id`, `task_id`, `user_id`, `text`, `url`, `file`, `status`, `mark`, `created_at`, `updated_at`)
VALUES
	(1,1,1,1,'puts 2**100<br>puts 3**50<br>puts 2+2*2<br>puts 3**0.5',NULL,NULL,3,5,'2012-09-02 23:31:46','2012-09-02 23:49:25'),
	(2,1,2,1,'a = a-b<br>b = a+b<br>a = b-a',NULL,NULL,3,4,'2012-09-02 23:31:46','2012-09-03 11:21:13'),
	(3,2,3,1,'if (2**100 &gt; 3**50)<br>&nbsp; puts \"больше\"<br>elsif (2**100 == 3**50)<br>&nbsp; puts \"равно\"<br>else<br>&nbsp; puts \"меньше\"<br>end',NULL,NULL,3,4,'2012-09-03 11:21:40','2012-09-03 11:22:27'),
	(4,3,4,1,'логарифм',NULL,NULL,3,3,'2012-09-03 11:22:38','2012-11-20 10:57:14'),
	(5,3,5,1,'544434',NULL,NULL,3,5,'2012-09-03 11:22:38','2013-04-15 10:58:54'),
	(6,1,1,3,'puts 2**100<br>puts 3**50<br>puts 3**0.5<br>puts 2+2*2<br><br>1267650600228229401496703205376<br>717897987691852588770249<br>1.73205080756888<br>6',NULL,NULL,3,5,'2012-09-05 14:13:13','2012-09-05 14:35:19'),
	(7,1,2,3,'a=2<br>b=3<br><br>a = a + b<br>b = a - b<br>a = a - b<br><br>puts a<br>puts b',NULL,NULL,3,4,'2012-09-05 14:13:13','2012-09-11 09:50:18'),
	(8,2,3,3,'a = 2**100<br>b = 3**50<br>if (a &gt; b) <br> puts \"Bolshe\" <br> elsif (a == b)<br> puts \"Ravno\" <br> else <br> puts \"Menshe\"<br>end',NULL,NULL,3,4,'2012-09-11 21:29:30','2012-09-12 14:04:10'),
	(9,3,4,3,'N=32<br>i=0 <br>for i in 1..N <br>&nbsp;&nbsp;break if (2**i&gt;=N) <br>end <br>puts i',NULL,NULL,3,4,'2012-09-12 14:09:21','2012-09-26 07:36:16'),
	(10,3,5,3,'i = 1<br>a0 = 1<br>a1 = 1<br>a_new = 0<br>while (i &lt;&nbsp;100)<br>i = i +1<br>a_new = a1 + a0<br>a0 = a1<br>a1 = a_new<br>end<br><br>puts a_new',NULL,NULL,3,5,'2012-09-12 14:09:21','2012-09-17 16:41:21'),
	(11,4,6,3,'arr=[3, 4, 4, 5] Res=arr.inject(1){ |res, elem| res*elem } puts Res<br>',NULL,NULL,3,5,'2012-09-27 22:11:52','2012-10-01 14:03:25'),
	(12,4,7,3,'arr=[2, 3, 3, 5]&nbsp;<br>sum=arr.inject(0){ |res, elem| res+elem }&nbsp;<br>size=arr.size&nbsp;<br>ari=sum/size&nbsp;<br>m=arr.inject(1){ |res, elem| res*elem }&nbsp;<br>geom=m**0.5&nbsp;<br>sum1=arr.inject(0){ |res, elem| res+(1.0/elem)}&nbsp;<br>harm=size/sum1&nbsp;<br>puts ari<br>puts geom<br>puts harm<br><br>',NULL,NULL,3,5,'2012-09-27 22:11:52','2012-10-15 20:46:03'),
	(13,4,8,3,'arr=[3, 4, 4, 5, -3, 6, -6, 7, 12, 8] <br>array=arr.find_all{ |elem| (elem&lt;0) &amp;&amp; (elem%3==0) } <br>puts array<br><br><br><br>',NULL,NULL,3,5,'2012-09-27 22:11:52','2012-10-01 14:03:13'),
	(14,4,9,3,'arr=[3, 4, 4, 5, -3, 6, -6, 7, 12, 8]&nbsp;<br>array=arr.find_all{ |elem| (elem&gt;0) &amp;&amp; (elem%2==0) }&nbsp;<br>sum=array.inject(0){ |res, elem| elem+res }&nbsp;<br>puts sum',NULL,NULL,3,5,'2012-09-27 22:11:52','2012-10-15 20:45:13'),
	(15,5,10,3,'s = \"ccc cc\"<br>puts s.gsub(\" \", \"\").size/s.split(\" \").size.to_f',NULL,NULL,3,5,'2012-10-17 18:53:58','2012-10-19 18:13:20'),
	(16,5,11,3,'s = \"aa sd bb bdcg bccb\"<br>arr = s.split(\" \")<br><br>for i in 0..arr.size-1<span>	<br>&nbsp;puts arr[i] if arr[i] == arr[i].reverse<br></span>end<br><br>',NULL,NULL,3,5,'2012-10-17 18:53:58','2012-11-07 18:54:19'),
	(17,5,12,3,'Не знаю как делать.<br>',NULL,NULL,3,2,'2012-10-17 18:53:58','2012-11-07 18:54:31'),
	(18,6,13,3,'<b>array = [451]<br>Fahrenheit_to_Celsius=0.555555556<br>array_in_Celsius=array.map{|elem| elem*Fahrenheit_to_Celsius-32}<br><span>puts array_in_Celsius<br></span></b><br>451 градус по Фаренгейту = 218,5 градусов по Цельсию.<br><br>Температура при которой плавится бумага.<br><br>в этом задании мне немножко помогали)<br>',NULL,NULL,3,5,'2012-11-10 01:08:33','2012-11-11 06:40:44'),
	(19,7,14,3,NULL,NULL,NULL,0,NULL,'2012-11-13 09:16:34','2012-11-13 09:16:34'),
	(20,7,15,3,NULL,NULL,NULL,0,NULL,'2012-11-13 09:16:34','2012-11-13 09:16:34'),
	(21,4,6,1,'231231123123',NULL,NULL,3,5,'2013-04-15 11:03:58','2013-06-19 16:14:39'),
	(22,4,7,1,NULL,NULL,NULL,4,1,'2013-04-15 11:03:58','2013-04-19 15:36:52'),
	(23,4,8,1,NULL,NULL,NULL,0,NULL,'2013-04-15 11:03:58','2013-04-15 11:03:58'),
	(24,4,9,1,NULL,NULL,NULL,0,NULL,'2013-04-15 11:03:58','2013-04-15 11:03:58');

/*!40000 ALTER TABLE `users_tasks` ENABLE KEYS */;
UNLOCK TABLES;


# Дамп таблицы users_tasks_reviews
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users_tasks_reviews`;

CREATE TABLE `users_tasks_reviews` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_task_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `text` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `users_tasks_reviews_I_1` (`user_id`),
  KEY `users_tasks_reviews_I_2` (`user_task_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `users_tasks_reviews` WRITE;
/*!40000 ALTER TABLE `users_tasks_reviews` DISABLE KEYS */;

INSERT INTO `users_tasks_reviews` (`id`, `user_task_id`, `user_id`, `text`, `created_at`, `updated_at`)
VALUES
	(1,1,1,'Не понял, а где сама программа?','2012-09-02 23:47:11','2012-09-02 23:47:11'),
	(2,7,1,'Третья переменная не должна присутствовать.','2012-09-11 09:11:15','2012-09-11 09:11:15'),
	(3,8,1,'Вывод не соответствует условиям программы (посмотрите внимательнее условие).','2012-09-12 09:18:35','2012-09-12 09:18:35'),
	(4,4,1,'Бред!','2012-11-20 10:56:51','2012-11-20 10:56:51'),
	(5,21,1,'Бред','2013-05-29 16:13:54','2013-05-29 16:13:54');

/*!40000 ALTER TABLE `users_tasks_reviews` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
