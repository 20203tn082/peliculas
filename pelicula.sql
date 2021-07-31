-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 31-07-2021 a las 02:52:44
-- Versión del servidor: 10.4.19-MariaDB
-- Versión de PHP: 8.0.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `pelicula`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `find_movies` ()  BEGIN
SELECT * FROM registration;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_create` (`p_name` VARCHAR(255), `p_description` VARCHAR(255), `p_premiere` DATE, `p_collection` DOUBLE)  BEGIN
INSERT INTO registration (name, description, premiere, collection) VALUES (p_name, p_description, p_premiere, p_collection);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_delete` (`p_idMovie` INT)  BEGIN
UPDATE registration SET status = 0 WHERE id_movie = p_idMovie;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_update` (`p_movie` INT, `p_name` VARCHAR(255), `p_description` VARCHAR(255), `p_premiere` DATE, `p_collection` DOUBLE)  BEGIN
UPDATE registration SET name = p_name, description = p_description, premiere = p_premiere, collection = p_collection WHERE id_movie = p_movie;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `registration`
--

CREATE TABLE `registration` (
  `id_movie` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `premiere` date NOT NULL,
  `collection` double NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `registration`
--

INSERT INTO `registration` (`id_movie`, `name`, `description`, `premiere`, `collection`, `status`) VALUES
(1, 'Black Widow', 'Película de acción y aventura de Marvel', '2021-07-15', 89700, 1),
(2, 'Yo nunca', 'Película de jóvenes y comedia', '2021-07-24', 78965, 0),
(3, 'Diario de una pasión', 'Romance y drama', '2004-08-27', 676768, 1),
(4, 'Son como niños', 'Comedia', '2010-07-23', 67675, 0),
(5, 'La guerra entre dos mundos', 'Guerra y acción', '2005-06-19', 5674.5, 1),
(6, 'Amor de calendario', 'Romance y comedia', '2020-10-28', 5678432, 0);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `registration`
--
ALTER TABLE `registration`
  ADD PRIMARY KEY (`id_movie`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `registration`
--
ALTER TABLE `registration`
  MODIFY `id_movie` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
