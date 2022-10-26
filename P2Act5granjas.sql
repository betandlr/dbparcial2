-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 26-10-2022 a las 03:21:29
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `granjas`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleados`
--

CREATE TABLE `empleados` (
  `nombre_empleado` varchar(30) NOT NULL,
  `curp` varchar(30) NOT NULL,
  `no_telefono` tinyint(10) NOT NULL,
  `sector_trabajo` varchar(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sectores`
--

CREATE TABLE `sectores` (
  `numero_sector` varchar(4) NOT NULL,
  `producciontt_leche` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vacas`
--

CREATE TABLE `vacas` (
  `no_sector` varchar(3) NOT NULL,
  `clave_vaca` varchar(5) NOT NULL,
  `produccion_leche` varchar(4) NOT NULL,
  `peso_vaca` varchar(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD PRIMARY KEY (`curp`),
  ADD KEY `sector_trabajo` (`sector_trabajo`);

--
-- Indices de la tabla `sectores`
--
ALTER TABLE `sectores`
  ADD PRIMARY KEY (`numero_sector`);

--
-- Indices de la tabla `vacas`
--
ALTER TABLE `vacas`
  ADD PRIMARY KEY (`clave_vaca`),
  ADD KEY `sect` (`no_sector`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD CONSTRAINT `empleados` FOREIGN KEY (`sector_trabajo`) REFERENCES `sectores` (`numero_sector`);

--
-- Filtros para la tabla `vacas`
--
ALTER TABLE `vacas`
  ADD CONSTRAINT `sect` FOREIGN KEY (`no_sector`) REFERENCES `sectores` (`numero_sector`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
