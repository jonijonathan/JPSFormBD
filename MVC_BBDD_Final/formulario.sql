-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 04-10-2020 a las 10:54:38
-- Versión del servidor: 8.0.21-0ubuntu0.20.04.4
-- Versión de PHP: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `formulario`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asignatura`
--

CREATE TABLE `asignatura` (
  `email` varchar(50) NOT NULL,
  `nombre` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `asignatura`
--

INSERT INTO `asignatura` (`email`, `nombre`) VALUES
('0', '0'),
('0', '0'),
('0', '0'),
('0', '0'),
('0', '0'),
('0', '0'),
('0', '0');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

CREATE TABLE `persona` (
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `rol` varchar(50) NOT NULL,
  `edad` int NOT NULL,
  `sexo` varchar(50) NOT NULL,
  `fecha` varchar(50) NOT NULL,
  `curso` varchar(50) NOT NULL,
  `contra` varchar(50) NOT NULL,
  `partGanadas` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `persona`
--

INSERT INTO `persona` (`nombre`, `apellido`, `email`, `rol`, `edad`, `sexo`, `fecha`, `curso`, `contra`, `partGanadas`) VALUES
('Jonathan', 'zapico', 'jonathan1526eat@gmail.com', 'administrador', 4, 'hombre', '2020-09-29', 'DAW1', '123', 1),
('Pepe', 'Azul', 'pepe@gmail.com', 'administrador', 2, 'hombre', '2020-10-14', 'DAW1', '123', 0),
('Pepa', 'Verde', 'pepa@gmail.com', 'administrador', 3, 'hombre', '2020-10-06', 'DAW1', '123', 0),
('Aitana', 'Morada', 'aitana@gmail.com', 'administrador', 3, 'hombre', '2020-10-07', 'DAW1', '123', 0),
('Raton', 'Mickey', 'disney@gmail.com', 'administrador', 2, 'hombre', '2020-10-13', 'DAW1', '123', 0),
('Minnie', 'Disney', 'minnie@gmail.com', 'administrador', 2, 'mujer', '2020-10-07', 'DAW1', '1234', 0);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
