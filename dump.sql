-- --------------------------------------------------------
-- Хост:                         10.10.0.196
-- Версия сервера:               5.5.56-MariaDB - MariaDB Server
-- Операционная система:         Linux
-- HeidiSQL Версия:              9.4.0.5125
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Дамп структуры базы данных DAO
CREATE DATABASE IF NOT EXISTS `u0742521_dao` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `u0742521_dao`;

-- Дамп структуры для таблица DAO.E_Auth
CREATE TABLE IF NOT EXISTS `E_Auth` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(50) NOT NULL,
  `hash` varchar(50) NOT NULL,
  `canonical` varchar(50) NOT NULL,
  `level` varchar(50) NOT NULL,
  `last_login` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы DAO.E_Auth: ~1 rows (приблизительно)
DELETE FROM `E_Auth`;
/*!40000 ALTER TABLE `E_Auth` DISABLE KEYS */;
INSERT INTO `E_Auth` (`id`, `login`, `hash`, `canonical`, `level`, `last_login`) VALUES
	(1, 'testtest', '25d55ad283aa400af464c76d713c07ad', 'Сидор Иванов', 'Администратор', '2018-03-12 09:31:28');
/*!40000 ALTER TABLE `E_Auth` ENABLE KEYS */;

-- Дамп структуры для таблица DAO.E_Binder
CREATE TABLE IF NOT EXISTS `E_Binder` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page` varchar(255) NOT NULL,
  `method` varchar(255) NOT NULL,
  `variable` varchar(255) NOT NULL,
  `parameters` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Дамп данных таблицы DAO.E_Binder: ~0 rows (приблизительно)
DELETE FROM `E_Binder`;
/*!40000 ALTER TABLE `E_Binder` DISABLE KEYS */;
/*!40000 ALTER TABLE `E_Binder` ENABLE KEYS */;

-- Дамп структуры для таблица DAO.E_Content
CREATE TABLE IF NOT EXISTS `E_Content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `alias` varchar(255) NOT NULL,
  `category` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_E_Content_E_Site_Tree` (`category`),
  CONSTRAINT `FK_E_Content_E_Site_Tree` FOREIGN KEY (`category`) REFERENCES `E_Content_Tree` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Дамп данных таблицы DAO.E_Content: ~0 rows (приблизительно)
DELETE FROM `E_Content`;
/*!40000 ALTER TABLE `E_Content` DISABLE KEYS */;
/*!40000 ALTER TABLE `E_Content` ENABLE KEYS */;

-- Дамп структуры для таблица DAO.E_Content_Fields
CREATE TABLE IF NOT EXISTS `E_Content_Fields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `canonical` varchar(255) NOT NULL,
  `alias` varchar(255) NOT NULL,
  `params` varchar(5000) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_E_Content_Fields_E_Site_Tree` (`category`),
  KEY `FK_E_Content_Fields_E_Content_Fields` (`type`),
  CONSTRAINT `FK_E_Content_Fields_E_Site_Tree` FOREIGN KEY (`category`) REFERENCES `E_Content_Tree` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Дамп данных таблицы DAO.E_Content_Fields: ~0 rows (приблизительно)
DELETE FROM `E_Content_Fields`;
/*!40000 ALTER TABLE `E_Content_Fields` DISABLE KEYS */;
/*!40000 ALTER TABLE `E_Content_Fields` ENABLE KEYS */;

-- Дамп структуры для таблица DAO.E_Content_Tree
CREATE TABLE IF NOT EXISTS `E_Content_Tree` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(500) NOT NULL,
  `alias` varchar(500) DEFAULT '',
  `lft` int(11) NOT NULL,
  `rgt` int(11) NOT NULL,
  `lvl` int(11) NOT NULL,
  `image` varchar(500) DEFAULT '',
  `description` text,
  `created` datetime NOT NULL,
  `template` varchar(500) DEFAULT '',
  `setup` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы DAO.E_Content_Tree: ~0 rows (приблизительно)
DELETE FROM `E_Content_Tree`;
/*!40000 ALTER TABLE `E_Content_Tree` DISABLE KEYS */;
/*!40000 ALTER TABLE `E_Content_Tree` ENABLE KEYS */;

-- Дамп структуры для таблица DAO.E_Data_Type
CREATE TABLE IF NOT EXISTS `E_Data_Type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(11) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `type` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы DAO.E_Data_Type: ~9 rows (приблизительно)
DELETE FROM `E_Data_Type`;
/*!40000 ALTER TABLE `E_Data_Type` DISABLE KEYS */;
INSERT INTO `E_Data_Type` (`id`, `type`, `name`) VALUES
	(1, 1, 'Varchar'),
	(2, 11, 'Integer'),
	(3, 12, 'Decimal .0'),
	(4, 10, 'DateTime'),
	(5, 2, 'Text'),
	(6, 9, 'Date'),
	(8, 13, 'Decimal .00'),
	(9, 14, 'Decimal .000'),
	(10, 15, 'Decimal .0000');
/*!40000 ALTER TABLE `E_Data_Type` ENABLE KEYS */;

-- Дамп структуры для таблица DAO.E_Field_Types
CREATE TABLE IF NOT EXISTS `E_Field_Types` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `alias` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `params` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы DAO.E_Field_Types: ~10 rows (приблизительно)
DELETE FROM `E_Field_Types`;
/*!40000 ALTER TABLE `E_Field_Types` DISABLE KEYS */;
INSERT INTO `E_Field_Types` (`id`, `name`, `alias`, `type`, `params`) VALUES
	(1, 'Текстовое поле', 'text', 'text', NULL),
	(2, 'Длинное текстовое поле', 'description', 'textarea', NULL),
	(3, 'Файл', 'file', 'file', NULL),
	(4, 'Отметка', 'check', 'checkbox', NULL),
	(5, 'Выбор', 'select', 'radio', NULL),
	(6, 'Скрытое поле', 'hidden', 'hidden', NULL),
	(7, 'Пароль', 'password', 'password', NULL),
	(8, 'Список', 'list', 'select', 'вариант1;вариант2;вариант3'),
	(9, 'Дата', 'date', 'date', NULL),
	(10, 'Дата/Время', 'datetime', 'datetime', NULL);
/*!40000 ALTER TABLE `E_Field_Types` ENABLE KEYS */;

-- Дамп структуры для таблица DAO.E_Form
CREATE TABLE IF NOT EXISTS `E_Form` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `alias` varchar(50) DEFAULT NULL,
  `token` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Дамп данных таблицы DAO.E_Form: ~0 rows (приблизительно)
DELETE FROM `E_Form`;
/*!40000 ALTER TABLE `E_Form` DISABLE KEYS */;
/*!40000 ALTER TABLE `E_Form` ENABLE KEYS */;

-- Дамп структуры для таблица DAO.E_Form_Fields
CREATE TABLE IF NOT EXISTS `E_Form_Fields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `E_Form` int(10) DEFAULT NULL,
  `canonical` varchar(255) DEFAULT NULL,
  `alias` varchar(255) DEFAULT NULL,
  `type` int(5) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `value` varchar(100) DEFAULT NULL,
  `required` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_E_Form_Fields_E_Field_Types` (`type`),
  KEY `FK_E_Form_Fields_E_Form` (`E_Form`),
  CONSTRAINT `FK_E_Form_Fields_E_Form` FOREIGN KEY (`E_Form`) REFERENCES `E_Form` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Дамп данных таблицы DAO.E_Form_Fields: ~0 rows (приблизительно)
DELETE FROM `E_Form_Fields`;
/*!40000 ALTER TABLE `E_Form_Fields` DISABLE KEYS */;
/*!40000 ALTER TABLE `E_Form_Fields` ENABLE KEYS */;

-- Дамп структуры для таблица DAO.E_Import
CREATE TABLE IF NOT EXISTS `E_Import` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `type` varchar(1000) NOT NULL,
  `source` varchar(1000) NOT NULL,
  `table` varchar(255) NOT NULL,
  `location` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы DAO.E_Import: ~0 rows (приблизительно)
DELETE FROM `E_Import`;
/*!40000 ALTER TABLE `E_Import` DISABLE KEYS */;
/*!40000 ALTER TABLE `E_Import` ENABLE KEYS */;

-- Дамп структуры для таблица DAO.E_Import_Fields
CREATE TABLE IF NOT EXISTS `E_Import_Fields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `import` int(11) NOT NULL,
  `key` varchar(255) NOT NULL,
  `column` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_E_Import_Fields_E_Import` (`import`),
  CONSTRAINT `FK_E_Import_Fields_E_Import` FOREIGN KEY (`import`) REFERENCES `E_Import` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Дамп данных таблицы DAO.E_Import_Fields: ~0 rows (приблизительно)
DELETE FROM `E_Import_Fields`;
/*!40000 ALTER TABLE `E_Import_Fields` DISABLE KEYS */;
/*!40000 ALTER TABLE `E_Import_Fields` ENABLE KEYS */;

-- Дамп структуры для таблица DAO.E_Import_Update
CREATE TABLE IF NOT EXISTS `E_Import_Update` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `import` int(11) NOT NULL,
  `field` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Дамп данных таблицы DAO.E_Import_Update: ~0 rows (приблизительно)
DELETE FROM `E_Import_Update`;
/*!40000 ALTER TABLE `E_Import_Update` DISABLE KEYS */;
/*!40000 ALTER TABLE `E_Import_Update` ENABLE KEYS */;

-- Дамп структуры для таблица DAO.E_Log
CREATE TABLE IF NOT EXISTS `E_Log` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `user` int(10) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `message` text,
  `date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `ip` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Дамп данных таблицы DAO.E_Log: ~0 rows (приблизительно)
DELETE FROM `E_Log`;
/*!40000 ALTER TABLE `E_Log` DISABLE KEYS */;
/*!40000 ALTER TABLE `E_Log` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
