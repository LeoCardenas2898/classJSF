-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 26-11-2018 a las 22:47:12
-- Versión del servidor: 10.1.35-MariaDB
-- Versión de PHP: 7.2.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `tienda1`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `articulo`
--

CREATE TABLE `articulo` (
  `idarticulo` int(10) UNSIGNED NOT NULL,
  `idcategoria` int(11) NOT NULL DEFAULT '0',
  `nombre` varchar(50) NOT NULL DEFAULT '',
  `descripcion` text NOT NULL,
  `precio` float NOT NULL DEFAULT '0',
  `foto` varchar(20) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `articulo`
--

INSERT INTO `articulo` (`idarticulo`, `idcategoria`, `nombre`, `descripcion`, `precio`, `foto`) VALUES
(1, 1, 'Polo', 'Polo Adidas color blanco, cuello redondo', 120, '11.jpg'),
(2, 1, 'Zapatilas', 'Zapatillas Adidas Color blanco con Azul', 160, '92.jpg'),
(3, 1, 'Zapatillas', 'Zapatilla Tigre color Blanco', 90, '101.jpg'),
(4, 1, 'Buso', 'Buso Nike color negro', 250, '104.jpg'),
(5, 2, 'Guantes de pesca', 'Guantes de pesca spinning Hart.', 85, '105.jpg'),
(6, 2, 'Gorra de pesca', 'Gorra Hart Peak de visera', 120, '61.jpg'),
(7, 2, 'Chaquetas', 'Impermeabilidad 6.000 mm; transpirabilidad 3.000 gr/m2 24 horas', 320, '71.jpg'),
(8, 4, 'Mizuno Volleyball Shoes', 'Zapatillas Mizuno para Voley.', 130, '81.jpg'),
(9, 2, 'Gancho para pescar.', 'Gancho para cualquier tipo de caña de pescar', 25, '51.jpg'),
(10, 2, 'Polo con cuello Nike', 'Rayas azules y de color blanco', 123, '23.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `idcategoria` int(10) UNSIGNED NOT NULL,
  `categoria` varchar(50) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`idcategoria`, `categoria`) VALUES
(1, 'Implementos de Futbol'),
(2, 'Implementos de Pesca'),
(3, 'Implementos de Natacion'),
(4, 'Implementos de Voley');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `idcliente` int(10) UNSIGNED NOT NULL,
  `apellidos` varchar(30) NOT NULL,
  `nombres` varchar(50) NOT NULL DEFAULT '',
  `email` varchar(60) NOT NULL,
  `Idpais` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`idcliente`, `apellidos`, `nombres`, `email`, `Idpais`) VALUES
(1, 'Mendoza Diaz', 'Angelica', 'ang@hotmail.com', 5),
(2, 'Ruiz  Villar', 'Jose', 'jos@hormail.com', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

CREATE TABLE `empleado` (
  `idempleado` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `apepaterno` varchar(45) DEFAULT NULL,
  `apematerno` varchar(45) DEFAULT NULL,
  `cargo` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `empleado`
--

INSERT INTO `empleado` (`idempleado`, `nombre`, `apepaterno`, `apematerno`, `cargo`) VALUES
(2, 'Angel', 'Velasquez', 'Tello', 'Asistente'),
(3, 'Ana', 'Zelada', 'Vela', 'Secretaria'),
(13, 'Angel', 'Loyza', 'Delgado', 'Programador'),
(21, 'German', 'Fernandez', 'Silva', 'Asistente'),
(23, 'Angel', 'Guevara', 'Diaz', 'Secretario'),
(30, 'Jesus', 'Villar', 'Alvarado', 'Gerente'),
(32, 'José', 'Valverde', 'Lozano', 'Administrador');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pais`
--

CREATE TABLE `pais` (
  `Idpais` int(11) NOT NULL,
  `pais` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `pais`
--

INSERT INTO `pais` (`Idpais`, `pais`) VALUES
(1, 'Peru'),
(2, 'Colombia'),
(3, 'Chile'),
(4, 'Bolivia'),
(5, 'Ecuador');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido_detalle`
--

CREATE TABLE `pedido_detalle` (
  `iddetalle` int(10) UNSIGNED NOT NULL,
  `idarticulo` int(10) UNSIGNED NOT NULL,
  `idpedido` int(11) UNSIGNED NOT NULL,
  `precio` float NOT NULL DEFAULT '0',
  `cantidad` int(11) NOT NULL DEFAULT '0',
  `subtotal` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `pedido_detalle`
--

INSERT INTO `pedido_detalle` (`iddetalle`, `idarticulo`, `idpedido`, `precio`, `cantidad`, `subtotal`) VALUES
(1, 4, 1, 250, 2, 500),
(2, 1, 2, 120, 1, 120),
(3, 2, 2, 160, 1, 160);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido_encabezado`
--

CREATE TABLE `pedido_encabezado` (
  `idpedido` int(11) UNSIGNED NOT NULL,
  `fecha` date NOT NULL,
  `total` double NOT NULL,
  `idempleado` int(11) NOT NULL,
  `idcliente` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `pedido_encabezado`
--

INSERT INTO `pedido_encabezado` (`idpedido`, `fecha`, `total`, `idempleado`, `idcliente`) VALUES
(1, '2006-05-26', 500, 3, 2),
(2, '2015-06-18', 280, 3, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `idusuario` int(11) NOT NULL,
  `usuario` varchar(12) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `password` varchar(255) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `estado` char(2) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `idempleado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`idusuario`, `usuario`, `password`, `estado`, `idempleado`) VALUES
(1, 'xyz', '123', 'a', 2),
(2, 'abc', '456', 'a', 3);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `articulo`
--
ALTER TABLE `articulo`
  ADD PRIMARY KEY (`idarticulo`);

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`idcategoria`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`idcliente`);

--
-- Indices de la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD PRIMARY KEY (`idempleado`);

--
-- Indices de la tabla `pais`
--
ALTER TABLE `pais`
  ADD PRIMARY KEY (`Idpais`);

--
-- Indices de la tabla `pedido_detalle`
--
ALTER TABLE `pedido_detalle`
  ADD PRIMARY KEY (`iddetalle`,`idarticulo`,`idpedido`);

--
-- Indices de la tabla `pedido_encabezado`
--
ALTER TABLE `pedido_encabezado`
  ADD PRIMARY KEY (`idpedido`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idusuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `articulo`
--
ALTER TABLE `articulo`
  MODIFY `idarticulo` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `idcategoria` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `idcliente` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `empleado`
--
ALTER TABLE `empleado`
  MODIFY `idempleado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT de la tabla `pais`
--
ALTER TABLE `pais`
  MODIFY `Idpais` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `pedido_detalle`
--
ALTER TABLE `pedido_detalle`
  MODIFY `iddetalle` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `idusuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
