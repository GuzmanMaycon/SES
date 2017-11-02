-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 02-11-2017 a las 20:35:46
-- Versión del servidor: 10.1.9-MariaDB
-- Versión de PHP: 5.6.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `db_photos`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `archivo`
--

CREATE TABLE `archivo` (
  `id` int(10) UNSIGNED NOT NULL,
  `sesion_fotografica_id` int(10) UNSIGNED NOT NULL,
  `archivo_ruta` varchar(400) COLLATE utf8_spanish_ci NOT NULL,
  `archivo_nombre` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `extension` varchar(10) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `id` int(10) UNSIGNED NOT NULL,
  `documento` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `nombres` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `ap_paterno` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `ap_materno` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `direccion` text COLLATE utf8_spanish_ci,
  `tipo_docs_id` int(10) UNSIGNED NOT NULL,
  `telefono` varchar(50) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `email1` varchar(50) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `email2` varchar(50) COLLATE utf8_spanish_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`id`, `documento`, `nombres`, `ap_paterno`, `ap_materno`, `direccion`, `tipo_docs_id`, `telefono`, `email1`, `email2`) VALUES
(1, '71834023', 'Erick', 'Huanca', 'Tiburcio', 'Av. Los Prados 5066', 1, '5285250', 'cororeo@mail.com', ''),
(2, '81632153', 'Floriponcio', 'Huarcaya', 'Preciado', 'Av. Los Prados 2915', 1, '715632', 'magaly@mail.com', ''),
(3, '51321598', 'El bryam', 'Huaracas', 'Principe', 'Calle San Chullpi 3464', 1, '8746541', 'juezmiguel@mail.com', ''),
(4, '65465486', 'Javier', 'Elera', 'Culque', 'Avenida San Judas 666', 2, '124124124', 'quiensoy@mail.com', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sesion_fotografica`
--

CREATE TABLE `sesion_fotografica` (
  `id` int(10) UNSIGNED NOT NULL,
  `clientes_id` int(10) UNSIGNED NOT NULL,
  `fotos_cantidad` int(3) UNSIGNED NOT NULL DEFAULT '0',
  `fotos_retocadas` int(3) NOT NULL DEFAULT '0',
  `local` enum('INTERNO','EXTERNO') CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL DEFAULT 'INTERNO',
  `individual` int(1) NOT NULL DEFAULT '1' COMMENT '1 para fotografìas de una sóla persona, 0 para fotografías de grupo de personas\n',
  `fecha_creacion_registro` datetime DEFAULT NULL,
  `fecha_entrega` date DEFAULT NULL,
  `fecha_pedido` date DEFAULT NULL,
  `estado` int(1) NOT NULL DEFAULT '0' COMMENT '0: pendiente, 1:atendido, 2:cancelado',
  `tipo_servicios_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `sesion_fotografica`
--

INSERT INTO `sesion_fotografica` (`id`, `clientes_id`, `fotos_cantidad`, `fotos_retocadas`, `local`, `individual`, `fecha_creacion_registro`, `fecha_entrega`, `fecha_pedido`, `estado`, `tipo_servicios_id`) VALUES
(1, 1, 4, 2, 'INTERNO', 1, NULL, NULL, NULL, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_docs`
--

CREATE TABLE `tipo_docs` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(45) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tipo_docs`
--

INSERT INTO `tipo_docs` (`id`, `nombre`) VALUES
(1, 'DNI'),
(3, 'PTP'),
(2, 'RUC');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_servicios`
--

CREATE TABLE `tipo_servicios` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tipo_servicios`
--

INSERT INTO `tipo_servicios` (`id`, `nombre`) VALUES
(4, '15 años'),
(1, 'fotografía de documentos '),
(3, 'fotografías de bodas'),
(7, 'photobook matrimonios'),
(6, 'pre- bodas'),
(2, 'sesiones artísticas'),
(5, 'sesiones familiares en el exterior');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(10) UNSIGNED NOT NULL,
  `username` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `password` varchar(64) COLLATE utf8_spanish_ci NOT NULL COMMENT '''sha256''',
  `nombre` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `ap_paterno` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `ap_materno` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `rol` int(1) NOT NULL DEFAULT '1' COMMENT '1: administrador, 2: usuario común'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `username`, `password`, `nombre`, `ap_paterno`, `ap_materno`, `rol`) VALUES
(1, 'exxel', '12345', 'exxel', 'elera', 'ato', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `archivo`
--
ALTER TABLE `archivo`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD KEY `fk_archivo_sesion_fotografica1_idx` (`sesion_fotografica_id`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD UNIQUE KEY `dni_UNIQUE` (`documento`),
  ADD KEY `fk_cliente_tipo_docs1_idx` (`tipo_docs_id`);

--
-- Indices de la tabla `sesion_fotografica`
--
ALTER TABLE `sesion_fotografica`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD KEY `fk_reservas_clientes_idx` (`clientes_id`),
  ADD KEY `fk_sesion_fotografica_tipo_servicios1_idx` (`tipo_servicios_id`);

--
-- Indices de la tabla `tipo_docs`
--
ALTER TABLE `tipo_docs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD UNIQUE KEY `nombre_UNIQUE` (`nombre`);

--
-- Indices de la tabla `tipo_servicios`
--
ALTER TABLE `tipo_servicios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD UNIQUE KEY `nombre_UNIQUE` (`nombre`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username_UNIQUE` (`username`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `archivo`
--
ALTER TABLE `archivo`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT de la tabla `sesion_fotografica`
--
ALTER TABLE `sesion_fotografica`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `tipo_docs`
--
ALTER TABLE `tipo_docs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `tipo_servicios`
--
ALTER TABLE `tipo_servicios`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `archivo`
--
ALTER TABLE `archivo`
  ADD CONSTRAINT `fk_archivo_reserva1` FOREIGN KEY (`sesion_fotografica_id`) REFERENCES `sesion_fotografica` (`id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD CONSTRAINT `fk_cliente_tipo_docs1` FOREIGN KEY (`tipo_docs_id`) REFERENCES `tipo_docs` (`id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `sesion_fotografica`
--
ALTER TABLE `sesion_fotografica`
  ADD CONSTRAINT `fk_reservas_clientes` FOREIGN KEY (`clientes_id`) REFERENCES `cliente` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_sesion_fotografica_tipo_servicios1` FOREIGN KEY (`tipo_servicios_id`) REFERENCES `tipo_servicios` (`id`) ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
