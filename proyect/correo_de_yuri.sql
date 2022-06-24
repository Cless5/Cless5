-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 23-06-2022 a las 02:32:22
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `correo_de_yuri`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `area`
--

CREATE TABLE `area` (
  `ID` int(11) NOT NULL,
  `NOMBRE` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `area`
--

INSERT INTO `area` (`ID`, `NOMBRE`) VALUES
(1, 'Administración'),
(2, 'Producción'),
(3, 'Finanzas'),
(4, 'Comercial');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carga_familiar`
--

CREATE TABLE `carga_familiar` (
  `RUT` varchar(10) NOT NULL,
  `NOMBRE` varchar(30) NOT NULL,
  `APELLIDO` varchar(30) NOT NULL,
  `PARENTESCO` varchar(30) NOT NULL,
  `ID_GENERO` int(11) NOT NULL,
  `ID_EMPLEADO` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cargo`
--

CREATE TABLE `cargo` (
  `ID` int(11) NOT NULL,
  `DESCRIPCION` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `cargo`
--

INSERT INTO `cargo` (`ID`, `DESCRIPCION`) VALUES
(1, 'Administrador'),
(2, 'Jefe RRHH'),
(3, 'Trabajdor RRHH'),
(4, 'Trabajdor');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ciudad`
--

CREATE TABLE `ciudad` (
  `ID` int(11) NOT NULL,
  `NOMBRE` varchar(30) NOT NULL,
  `ID_REGION` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `ciudad`
--

INSERT INTO `ciudad` (`ID`, `NOMBRE`, `ID_REGION`) VALUES
(1, 'Santiago', 13);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comuna`
--

CREATE TABLE `comuna` (
  `ID` int(11) NOT NULL,
  `NOMBRE` varchar(30) NOT NULL,
  `ID_CIUDAD` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `comuna`
--

INSERT INTO `comuna` (`ID`, `NOMBRE`, `ID_CIUDAD`) VALUES
(1, 'Santiago Centro', 1),
(2, 'La Florida', 1),
(3, 'Puente Alto', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contact_emerg`
--

CREATE TABLE `contact_emerg` (
  `RUT` varchar(10) NOT NULL,
  `NOMBRE` varchar(30) NOT NULL,
  `APELLIDO` varchar(30) NOT NULL,
  `TELEFONO` varchar(30) NOT NULL,
  `RELACION` varchar(30) NOT NULL,
  `ID_EMPLEADO` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departamento`
--

CREATE TABLE `departamento` (
  `ID` int(11) NOT NULL,
  `NOMBRE` varchar(30) NOT NULL,
  `ID_AREA` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `departamento`
--

INSERT INTO `departamento` (`ID`, `NOMBRE`, `ID_AREA`) VALUES
(1, 'Departamento Administración', 1),
(2, 'Departamento RRHH', 1),
(3, 'Departamento Producción', 2),
(4, 'Departamento Compras', 2),
(5, 'Departamento Financiero', 3),
(6, 'Departamento Contabilidad', 3),
(7, 'Departamento Tesorería', 3),
(8, 'Departamento Marketing', 4),
(9, 'Departamento Comercial', 4),
(10, 'Departamento Ventas', 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

CREATE TABLE `empleado` (
  `RUT` varchar(10) NOT NULL,
  `NOMBRE` varchar(30) NOT NULL,
  `APELLIDO` varchar(30) NOT NULL,
  `ID_GENERO` int(11) NOT NULL,
  `TELEFONO` varchar(30) DEFAULT NULL,
  `DIRECCION` varchar(50) NOT NULL,
  `ID_COMUNA` int(11) NOT NULL,
  `ID_CARGO` int(11) NOT NULL,
  `ID_DEPARTAMENTO` int(11) NOT NULL,
  `NOMBRE_USUARIO` varchar(30) NOT NULL,
  `CONTRASENIA` varchar(30) NOT NULL,
  `ID_ESTADO` int(11) NOT NULL,
  `ID_JEFE` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `empleado`
--

INSERT INTO `empleado` (`RUT`, `NOMBRE`, `APELLIDO`, `ID_GENERO`, `TELEFONO`, `DIRECCION`, `ID_COMUNA`, `ID_CARGO`, `ID_DEPARTAMENTO`, `NOMBRE_USUARIO`, `CONTRASENIA`, `ID_ESTADO`, `ID_JEFE`) VALUES
('13456843-2', 'Andrés', 'Trozado', 1, '+56935674321', 'Aguas Claras 7743', 1, 2, 2, 'andres.trozado', '123', 1, '13456843-2');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado_usuario`
--

CREATE TABLE `estado_usuario` (
  `ID` int(11) NOT NULL,
  `DESCRIPCION` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `estado_usuario`
--

INSERT INTO `estado_usuario` (`ID`, `DESCRIPCION`) VALUES
(1, 'Activo'),
(2, 'Inactivo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `genero`
--

CREATE TABLE `genero` (
  `ID` int(11) NOT NULL,
  `NOMBRE` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `genero`
--

INSERT INTO `genero` (`ID`, `NOMBRE`) VALUES
(1, 'Masculino'),
(2, 'Femenino');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `region`
--

CREATE TABLE `region` (
  `ID` int(11) NOT NULL,
  `NOMBRE` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `region`
--

INSERT INTO `region` (`ID`, `NOMBRE`) VALUES
(1, 'Arica y Parinacota y Tarapacá'),
(2, 'Antofagasta'),
(3, 'Atacama y Coquimbo'),
(5, 'Valparaíso'),
(6, 'O\'Higgins'),
(7, 'Maule'),
(8, 'Ñuble, Biobío y La Araucanía'),
(9, 'La Araucanía'),
(10, 'Los Ríos y Los Lagos '),
(11, 'Los Lagos y Aysén'),
(12, 'Magallanes'),
(13, 'Metropolitana de Santiago');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `area`
--
ALTER TABLE `area`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `carga_familiar`
--
ALTER TABLE `carga_familiar`
  ADD PRIMARY KEY (`RUT`),
  ADD KEY `FK_CARGA_EMPLEADO` (`ID_EMPLEADO`),
  ADD KEY `FK_GENERO_CARGA` (`ID_GENERO`);

--
-- Indices de la tabla `cargo`
--
ALTER TABLE `cargo`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `ciudad`
--
ALTER TABLE `ciudad`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_CIUDAD_REGION` (`ID_REGION`);

--
-- Indices de la tabla `comuna`
--
ALTER TABLE `comuna`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_CIUDAD_COMUNA` (`ID_CIUDAD`);

--
-- Indices de la tabla `contact_emerg`
--
ALTER TABLE `contact_emerg`
  ADD PRIMARY KEY (`RUT`),
  ADD KEY `FK_EMERG_EMPLEADO` (`ID_EMPLEADO`);

--
-- Indices de la tabla `departamento`
--
ALTER TABLE `departamento`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_AREA_DEPARTAMENTO` (`ID_AREA`);

--
-- Indices de la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD PRIMARY KEY (`RUT`),
  ADD KEY `FK_GENERO_EMPLEADO` (`ID_GENERO`),
  ADD KEY `FK_CARGO_EMPLEADO` (`ID_CARGO`),
  ADD KEY `FK_DEPARTAMENTO_EMPLEADO` (`ID_DEPARTAMENTO`),
  ADD KEY `FK_JEFE_EMPLEADO` (`ID_JEFE`),
  ADD KEY `FK_COMUNA` (`ID_COMUNA`),
  ADD KEY `FK_ESTADO_EMPLEADO` (`ID_ESTADO`);

--
-- Indices de la tabla `estado_usuario`
--
ALTER TABLE `estado_usuario`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `genero`
--
ALTER TABLE `genero`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `region`
--
ALTER TABLE `region`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `area`
--
ALTER TABLE `area`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `cargo`
--
ALTER TABLE `cargo`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `ciudad`
--
ALTER TABLE `ciudad`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `comuna`
--
ALTER TABLE `comuna`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `departamento`
--
ALTER TABLE `departamento`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `estado_usuario`
--
ALTER TABLE `estado_usuario`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `genero`
--
ALTER TABLE `genero`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `region`
--
ALTER TABLE `region`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `carga_familiar`
--
ALTER TABLE `carga_familiar`
  ADD CONSTRAINT `FK_CARGA_EMPLEADO` FOREIGN KEY (`ID_EMPLEADO`) REFERENCES `empleado` (`RUT`),
  ADD CONSTRAINT `FK_GENERO_CARGA` FOREIGN KEY (`ID_GENERO`) REFERENCES `genero` (`ID`);

--
-- Filtros para la tabla `ciudad`
--
ALTER TABLE `ciudad`
  ADD CONSTRAINT `FK_CIUDAD_REGION` FOREIGN KEY (`ID_REGION`) REFERENCES `region` (`ID`);

--
-- Filtros para la tabla `comuna`
--
ALTER TABLE `comuna`
  ADD CONSTRAINT `FK_CIUDAD_COMUNA` FOREIGN KEY (`ID_CIUDAD`) REFERENCES `ciudad` (`ID`);

--
-- Filtros para la tabla `contact_emerg`
--
ALTER TABLE `contact_emerg`
  ADD CONSTRAINT `FK_EMERG_EMPLEADO` FOREIGN KEY (`ID_EMPLEADO`) REFERENCES `empleado` (`RUT`);

--
-- Filtros para la tabla `departamento`
--
ALTER TABLE `departamento`
  ADD CONSTRAINT `FK_AREA_DEPARTAMENTO` FOREIGN KEY (`ID_AREA`) REFERENCES `area` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
