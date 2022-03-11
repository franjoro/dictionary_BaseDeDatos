-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 09-03-2022 a las 14:19:53
-- Versión del servidor: 8.0.21
-- Versión de PHP: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `clase_jsoin_mysql`
--

DELIMITER $$
--
-- Procedimientos
--
DROP PROCEDURE IF EXISTS `json_from_table_fields`$$
CREATE DEFINER=`madeline.trejos`@`%` PROCEDURE `json_from_table_fields` (IN `name_table` VARCHAR(50), IN `name_schema` VARCHAR(50))  NO SQL
BEGIN
SET @fields = JSON_OBJECT('fields',(SELECT JSON_ARRAYAGG(JSON_OBJECT('table_schema',TABLE_SCHEMA,'table_name',TABLE_NAME,'column_name',COLUMN_NAME))
                                     FROM information_schema.COLUMNS WHERE TABLE_NAME = name_table AND TABLE_SCHEMA = name_schema));
                                     SELECT @fields;
                                     
                                     END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tables`
--

DROP TABLE IF EXISTS `tables`;
CREATE TABLE IF NOT EXISTS `tables` (
  `id` int NOT NULL AUTO_INCREMENT,
  `json` json NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
