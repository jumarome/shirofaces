-- phpMyAdmin SQL Dump
-- version 4.2.8
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 15-09-2014 a las 05:03:13
-- Versión del servidor: 5.6.17
-- Versión de PHP: 5.5.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `shiro`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rolepermission`
--

CREATE TABLE IF NOT EXISTS `rolepermission` (
`PERMISSIONID` bigint(20) NOT NULL,
  `PERMISSION` varchar(45) DEFAULT NULL,
  `ROLEID` bigint(20) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `rolepermission`
--

INSERT INTO `rolepermission` (`PERMISSIONID`, `PERMISSION`, `ROLEID`) VALUES
(1, '*', 1),
(2, 'view', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE IF NOT EXISTS `roles` (
`ID` bigint(20) NOT NULL,
  `role` varchar(255) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`ID`, `role`, `descripcion`) VALUES
(1, 'administrador', 'El administrador'),
(2, 'empleado', 'el Empleado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user`
--

CREATE TABLE IF NOT EXISTS `user` (
`ID` bigint(20) NOT NULL,
  `PASSWORD` varchar(255) NOT NULL,
  `USERNAME` varchar(255) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `user`
--

INSERT INTO `user` (`ID`, `PASSWORD`, `USERNAME`) VALUES
(1, '$shiro1$SHA-256$50000$fqgS0fTRWwTvi/XoChdNbQ==$MqNh3akqAOsky35uE6RhkOuyQ/d2ZWSN3GeoMeBg4Ik=', 'jumarome'),
(2, '$shiro1$SHA-256$50000$ljoi7LI+Ami0UmucU/O/ZQ==$nfujQ1Yuo6sLjm4eWVU/zHndKf0K2dF+AsV7fBX+KuY=', 'jeff'),
(3, '$shiro1$SHA-256$50000$32mZapKYLE4bQC6d+FYRUg==$Ry/GRDqWj9YbvcQfU7u4vwIFHDcso8N3QsEwyabrc+U=', 'ayance');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `userroles`
--

CREATE TABLE IF NOT EXISTS `userroles` (
  `USERID` bigint(19) NOT NULL,
`ROLEID` bigint(20) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `userroles`
--

INSERT INTO `userroles` (`USERID`, `ROLEID`) VALUES
(1, 1),
(2, 2);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `rolepermission`
--
ALTER TABLE `rolepermission`
 ADD PRIMARY KEY (`PERMISSIONID`), ADD KEY `ROLEID` (`ROLEID`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
 ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `user`
--
ALTER TABLE `user`
 ADD PRIMARY KEY (`ID`), ADD UNIQUE KEY `USERNAME` (`USERNAME`);

--
-- Indices de la tabla `userroles`
--
ALTER TABLE `userroles`
 ADD PRIMARY KEY (`ROLEID`), ADD KEY `USERID` (`USERID`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `rolepermission`
--
ALTER TABLE `rolepermission`
MODIFY `PERMISSIONID` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `user`
--
ALTER TABLE `user`
MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `userroles`
--
ALTER TABLE `userroles`
MODIFY `ROLEID` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `rolepermission`
--
ALTER TABLE `rolepermission`
ADD CONSTRAINT `rolepermission_ibfk_1` FOREIGN KEY (`ROLEID`) REFERENCES `roles` (`ID`);

--
-- Filtros para la tabla `userroles`
--
ALTER TABLE `userroles`
ADD CONSTRAINT `userroles_ibfk_2` FOREIGN KEY (`ROLEID`) REFERENCES `roles` (`ID`),
ADD CONSTRAINT `userroles_ibfk_1` FOREIGN KEY (`USERID`) REFERENCES `user` (`ID`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
