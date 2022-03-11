-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 09-03-2022 a las 14:05:16
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
-- Base de datos: `tiendita`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

DROP TABLE IF EXISTS `categoria`;
CREATE TABLE IF NOT EXISTS `categoria` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`id`, `nombre`) VALUES
(1, 'Refrescos'),
(2, 'Aceites'),
(3, 'Detergentes'),
(4, 'Dulces'),
(5, 'Frituras');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura`
--

DROP TABLE IF EXISTS `factura`;
CREATE TABLE IF NOT EXISTS `factura` (
  `id_factura` int NOT NULL AUTO_INCREMENT,
  `fecha` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `pagada` tinyint(1) NOT NULL,
  `id_cliente` int NOT NULL,
  PRIMARY KEY (`id_factura`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

DROP TABLE IF EXISTS `productos`;
CREATE TABLE IF NOT EXISTS `productos` (
  `idProducto` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `descripcion` varchar(255) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `fecha_alta` datetime DEFAULT CURRENT_TIMESTAMP,
  `idCategoria` int NOT NULL,
  `existencia` int NOT NULL,
  PRIMARY KEY (`idProducto`),
  KEY `fk_CatPro_idx` (`idCategoria`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`idProducto`, `nombre`, `descripcion`, `precio`, `fecha_alta`, `idCategoria`, `existencia`) VALUES
(2, 'Refesco de limon', '', '8.10', '2015-02-06 00:00:00', 1, 15),
(3, 'Limonada', 'Limonada', '10.80', '2014-05-09 00:00:00', 1, 12),
(4, 'Refresco de toronja', '', '8.10', '2016-05-07 00:00:00', 1, 20),
(5, 'Agua Mineral', 'Agua Mineral', '13.50', '2016-02-15 00:00:00', 1, 8),
(6, 'Aceite Natural 1 Litro', '', '18.00', '2015-09-20 00:00:00', 2, 25),
(7, 'Aceite de Coco 500 ml', '', '13.50', '2016-03-24 00:00:00', 2, 20),
(8, 'Jabon lavanda 1 kg', '', '10.80', '2014-02-21 00:00:00', 3, 6),
(9, 'Detergente en polvo 1 kg', '', '16.65', '2014-11-17 00:00:00', 3, 9),
(10, 'Jabon para manos 500 ml', '', '23.85', '2016-01-10 00:00:00', 3, 7),
(11, 'Detergente en polvo 2 kg', '', '27.00', '2014-11-17 00:00:00', 3, 5),
(12, 'Detergente en polvo para trastes 500 g', '', '16.65', '2016-02-20 00:00:00', 3, 8),
(13, 'Paleta de caramelo', '', '4.50', '2013-01-01 00:00:00', 4, 50),
(14, 'Paleta de chocolate', '', '5.85', '2014-05-20 00:00:00', 4, 34),
(15, 'Gomitas', '', '11.25', '2016-03-30 00:00:00', 4, 16),
(16, 'Bolsa de dulces variados', '', '13.05', '2015-12-12 00:00:00', 4, 23),
(17, 'Papas fritas', '', '8.55', '2013-04-09 00:00:00', 5, 14),
(18, 'Frituras de queso', '', '7.20', '2014-10-09 00:00:00', 5, 12),
(19, 'Patatas frista con limon', 'Patatas', '9.00', '2015-09-08 00:00:00', 5, 8),
(20, 'Bolsa de chicharrones', '', '13.50', '2016-05-20 00:00:00', 5, 19),
(21, 'Palomitas de mantequilla', '', '16.20', '2015-11-28 00:00:00', 5, 12);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores`
--

DROP TABLE IF EXISTS `proveedores`;
CREATE TABLE IF NOT EXISTS `proveedores` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `direccion` varchar(50) DEFAULT NULL,
  `telefono` varchar(191) DEFAULT NULL,
  `poblacion` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `proveedores`
--

INSERT INTO `proveedores` (`id`, `nombre`, `direccion`, `telefono`, `poblacion`) VALUES
(1, 'Refrescante', 'Santander 345', '387 844 945 ', 'Santander'),
(2, 'Refrescos SA de CV', '', '', ''),
(3, 'Naturalite', '', '', ''),
(4, 'Campullo', 'Liencres', '456 798 234', 'Zoto'),
(5, 'Grupo cambay', '', '', ''),
(6, 'Detergentes de Mexico', '', '', ''),
(7, 'Sonrisas', '', '', ''),
(8, 'Ricodulce', '', '', ''),
(9, 'Bartel', 'Liencres', '678 453 890', 'Zoto'),
(10, 'Frituras de Monterrey', '', '', ''),
(11, 'Autos El Campon', 'Santander 456', '767 879 456', 'Alvericia');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

DROP TABLE IF EXISTS `ventas`;
CREATE TABLE IF NOT EXISTS `ventas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `idProducto` int NOT NULL,
  `idProveedor` int NOT NULL,
  `cantidad` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_prov_idx` (`idProveedor`),
  KEY `fk_prod_idx` (`idProducto`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ventas`
--

INSERT INTO `ventas` (`id`, `idProducto`, `idProveedor`, `cantidad`) VALUES
(2, 2, 1, 10),
(3, 3, 2, 15),
(4, 4, 2, 7),
(5, 5, 1, 0),
(6, 6, 4, 0),
(7, 7, 3, 0),
(8, 8, 5, 0),
(9, 9, 6, 56),
(10, 10, 5, 0),
(11, 11, 5, 0),
(12, 12, 6, 0),
(13, 13, 8, 0),
(14, 14, 7, 55),
(15, 15, 7, 0),
(16, 16, 8, 0),
(17, 17, 10, 0),
(18, 18, 9, 7),
(19, 19, 10, 90),
(20, 20, 10, 0),
(21, 21, 9, 0);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `fk_CatPro` FOREIGN KEY (`idCategoria`) REFERENCES `categoria` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD CONSTRAINT `fk_prod` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`idProducto`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_prov` FOREIGN KEY (`idProveedor`) REFERENCES `proveedores` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
