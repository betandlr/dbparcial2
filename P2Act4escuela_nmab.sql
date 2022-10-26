-- phpMyAdmin SQL Dump
-- version 4.8.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 26-10-2022 a las 07:16:52
-- Versión del servidor: 10.1.31-MariaDB
-- Versión de PHP: 5.6.35

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `escuela_nmab`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asignatura`
--

CREATE TABLE `asignatura` (
  `nombre` varchar(10) NOT NULL,
  `horas_totales` tinyint(4) NOT NULL,
  `clave` varchar(4) NOT NULL,
  `horas_semana` tinyint(4) NOT NULL,
  `estudiante` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `asignatura`
--

INSERT INTO `asignatura` (`nombre`, `horas_totales`, `clave`, `horas_semana`, `estudiante`) VALUES
('CTSV', 3, '107', 3, '20145876953210'),
('Fisica II', 6, '108', 6, '20145876953210'),
('Ingles V', 5, '109 ', 5, '20145876953210'),
('Calculo in', 4, '110', 4, '20145876953210'),
('Desarrolla', 6, '142 ', 6, '20145876953210'),
('ConstruyeB', 6, '143 ', 6, '20145876953210'),
('Tutoria', 1, 'T', 1, '20145876953210');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carrera`
--

CREATE TABLE `carrera` (
  `nombre` varchar(20) NOT NULL,
  `turno` varchar(15) NOT NULL,
  `lider_academia` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `carrera`
--

INSERT INTO `carrera` (`nombre`, `turno`, `lider_academia`) VALUES
('Administracion RH', 'Vespertino', NULL),
('Contabilidad', 'Matutino', NULL),
('Electricidad', 'Matutino', NULL),
('Logistica', 'Vespertino', NULL),
('Mecanica', 'Matutino', NULL),
('Programacion', 'Mixto', NULL),
('Soporte', 'Diurno', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudiante`
--

CREATE TABLE `estudiante` (
  `telefono` varchar(10) NOT NULL,
  `noControl` varchar(14) NOT NULL,
  `apellidos` varchar(30) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `edad` varchar(3) NOT NULL,
  `domicilio` varchar(50) NOT NULL,
  `grupo` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `estudiante`
--

INSERT INTO `estudiante` (`telefono`, `noControl`, `apellidos`, `nombre`, `edad`, `domicilio`, `grupo`) VALUES
('4181002458', '20145876953210', 'Mendiola Rangel', 'Luis Arturo', '16', 'Lindavista #78', '5PV'),
('4189875661', '20151536857596', 'Aldavera Guerra', 'Alberto', '17', 'Fracc Gto #43', '5PV'),
('4189785676', '20987678541307', 'Lozada Jimenez', 'Angel', '16', 'Lindavista #91', '5PV');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudiante_asignatura`
--

CREATE TABLE `estudiante_asignatura` (
  `noControl` varchar(14) NOT NULL,
  `asignatura` varchar(30) NOT NULL,
  `fecha` date NOT NULL,
  `semestre` varchar(4) NOT NULL,
  `calificacion` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grupo`
--

CREATE TABLE `grupo` (
  `nombre` varchar(3) NOT NULL,
  `turno` varchar(10) NOT NULL,
  `representante` varchar(30) DEFAULT NULL,
  `tutor` varchar(30) DEFAULT NULL,
  `carrera` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `grupo`
--

INSERT INTO `grupo` (`nombre`, `turno`, `representante`, `tutor`, `carrera`) VALUES
('1PV', 'Vespertino', NULL, NULL, 'Programacion'),
('3SV', 'Vespertino', NULL, NULL, 'Soporte'),
('5AM', 'Matutino', NULL, NULL, 'Administracion RH'),
('5AV', 'Vespertino', NULL, NULL, 'Administracion RH'),
('5CM', 'Matutino', NULL, NULL, 'Contabilidad'),
('5CV', 'Vespertino', NULL, NULL, 'Contabilidad'),
('5EM', 'Matutino', NULL, NULL, 'Electricidad'),
('5LM', 'Matutino', NULL, NULL, 'Logistica'),
('5LV', 'Vespertino', NULL, NULL, 'Logistica'),
('5MM', 'Matutino', NULL, NULL, 'Mecanica'),
('5PM', 'Matutino', NULL, NULL, 'Programacion'),
('5PV', 'Vespertino', NULL, NULL, 'Programacion'),
('5SM', 'Matutino', NULL, NULL, 'Soporte'),
('5SV', 'Vespertino', NULL, NULL, 'Soporte');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `asignatura`
--
ALTER TABLE `asignatura`
  ADD PRIMARY KEY (`clave`),
  ADD KEY `index_estudiante` (`estudiante`);

--
-- Indices de la tabla `carrera`
--
ALTER TABLE `carrera`
  ADD PRIMARY KEY (`nombre`);

--
-- Indices de la tabla `estudiante`
--
ALTER TABLE `estudiante`
  ADD PRIMARY KEY (`noControl`),
  ADD KEY `index_grupo` (`grupo`);

--
-- Indices de la tabla `estudiante_asignatura`
--
ALTER TABLE `estudiante_asignatura`
  ADD PRIMARY KEY (`noControl`,`asignatura`),
  ADD KEY `asignaturar` (`asignatura`);

--
-- Indices de la tabla `grupo`
--
ALTER TABLE `grupo`
  ADD PRIMARY KEY (`nombre`),
  ADD KEY `carrera_index` (`carrera`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `asignatura`
--
ALTER TABLE `asignatura`
  ADD CONSTRAINT `asignatura` FOREIGN KEY (`estudiante`) REFERENCES `estudiante` (`noControl`);

--
-- Filtros para la tabla `estudiante`
--
ALTER TABLE `estudiante`
  ADD CONSTRAINT `estudiante_ibfk_1` FOREIGN KEY (`grupo`) REFERENCES `grupo` (`nombre`);

--
-- Filtros para la tabla `estudiante_asignatura`
--
ALTER TABLE `estudiante_asignatura`
  ADD CONSTRAINT `asignaturar` FOREIGN KEY (`asignatura`) REFERENCES `asignatura` (`clave`),
  ADD CONSTRAINT `numControl` FOREIGN KEY (`noControl`) REFERENCES `estudiante` (`noControl`);

--
-- Filtros para la tabla `grupo`
--
ALTER TABLE `grupo`
  ADD CONSTRAINT `carrera` FOREIGN KEY (`carrera`) REFERENCES `carrera` (`nombre`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
