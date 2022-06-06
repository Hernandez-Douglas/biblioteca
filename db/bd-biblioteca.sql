-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 06-06-2022 a las 21:34:19
-- Versión del servidor: 10.4.22-MariaDB
-- Versión de PHP: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bd-biblioteca`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `autor`
--

CREATE TABLE `autor` (
  `idAutor` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `fechaNacimiento` date DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `autor`
--

INSERT INTO `autor` (`idAutor`, `nombre`, `fechaNacimiento`, `image`) VALUES
(1, 'Gabriel García Márquez', '1927-03-06', '/biblioteca/assets/image/ggma01.jpg'),
(2, 'William Shakespeare', '1564-04-23', '/biblioteca/assets/image/ggma01.jpg'),
(3, 'Bertha Yoshiko Higashida Hirose', '1972-06-14', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bibliotecario`
--

CREATE TABLE `bibliotecario` (
  `codigoBbliotecario` int(11) NOT NULL,
  `rol` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `bibliotecario`
--

INSERT INTO `bibliotecario` (`codigoBbliotecario`, `rol`) VALUES
(1000, 'administrador');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `devolucion`
--

CREATE TABLE `devolucion` (
  `idDevolucion` int(11) NOT NULL,
  `idPrestamo` int(11) NOT NULL,
  `idBbliotecario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lector`
--

CREATE TABLE `lector` (
  `codigoLector` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `lector`
--

INSERT INTO `lector` (`codigoLector`) VALUES
(1001),
(1002);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `libro`
--

CREATE TABLE `libro` (
  `id` int(11) NOT NULL,
  `isbn` varchar(18) NOT NULL,
  `titulo` varchar(50) NOT NULL,
  `copias` tinyint(4) NOT NULL DEFAULT 1,
  `idAutor` int(11) NOT NULL,
  `tipoLibro` tinyint(3) NOT NULL,
  `codigoBbliotecario` int(11) NOT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT 1,
  `image` varchar(100) DEFAULT NULL,
  `fechaRegistro` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `libro`
--

INSERT INTO `libro` (`id`, `isbn`, `titulo`, `copias`, `idAutor`, `tipoLibro`, `codigoBbliotecario`, `estado`, `image`, `fechaRegistro`) VALUES
(1, '0-2021-2022-1', 'Hamlet', 11, 2, 2, 1000, 1, 'default.png', '2022-06-05 13:11:00'),
(2, '1-2021-2022-2', 'El rey Lear', 1, 2, 2, 1000, 1, 'default.png', '2022-06-05 13:39:38'),
(17, '1-2021-2022-3', 'El sueño de una noche de verano', 1, 2, 2, 1000, 1, 'default.png', '2022-06-05 14:20:40'),
(19, '1-2021-2022-4', 'El sueño de una noche de verano', 1, 1, 2, 1000, 1, 'default.png', '2022-06-05 19:57:05'),
(20, '1-2021-2022-5', 'Cien años de soledad', 1, 1, 2, 1000, 1, 'default.png', '2022-06-05 21:51:06'),
(21, '1-2021-2022-6', 'El amor en los tiempos del cólera', 1, 1, 2, 1000, 1, 'default.png', '2022-06-05 22:07:42'),
(29, '970-10-35-17-8', 'Ciencias de la Salud', 14, 3, 1, 1000, 1, '970-10-35-17-8-ciencias-de-la-salud.png', '2022-06-06 11:03:43');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prestamo`
--

CREATE TABLE `prestamo` (
  `idPrestamo` int(11) NOT NULL,
  `fechaPrestamo` date NOT NULL DEFAULT current_timestamp(),
  `fechaDevolucion` date NOT NULL,
  `codigoLector` int(11) NOT NULL,
  `codigoBbliotecario` int(11) NOT NULL,
  `isbn` varchar(13) NOT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipos-de-libros`
--

CREATE TABLE `tipos-de-libros` (
  `idtipoLibro` tinyint(3) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `fecha-registro` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tipos-de-libros`
--

INSERT INTO `tipos-de-libros` (`idtipoLibro`, `nombre`, `descripcion`, `fecha-registro`) VALUES
(1, 'Científicos', 'La ciencia (del latín scientĭa, \'conocimiento\') es un sistema que organiza y construye el conocimiento a través de preguntas comprobables y un método estructurado que estudia e interpreta los fenómenos naturales, sociales y artificiales.', '2022-06-04 00:00:00'),
(2, 'Literatura y lingüísticos', 'Según la Real Academia Española (RAE), literatura es el «arte de la expresión verbal»1​ (entendiéndose como verbal aquello «que se refiere a la palabra, o se sirve de ella»2​) y, por lo tanto, abarca tanto textos escritos (literatura escrita) como hablados o cantados (literatura oral).', '2022-06-04 00:00:00'),
(3, 'De viaje', 'Libro de viaje, es la exposición de las experiencias y observaciones realizadas por un viajero, y puede acompañarse de mapas, dibujos, grabados, fotografías, etcétera, realizadas por el autor o por sus compañeros de viaje.', '2022-06-04 00:00:00'),
(4, 'Biografía', 'La biografía es la historia de la vida de una persona narrada por otra persona, es decir, en pleno sentido desde su nacimiento hasta su muerte.', '2022-06-04 00:00:00'),
(5, 'Libro de texto', 'Un libro de texto es un libro estándar en cualquier rama de estudio y corresponde a un recurso didáctico de tipo impreso que sirve como material de apoyo a las estrategias metodológicas del docente y enriquece el proceso de enseñanza-aprendizaje.', '2022-06-04 22:30:49'),
(6, 'De referencia o consulta', NULL, '2022-06-04 22:30:49');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `codigo` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `telefono` varchar(11) NOT NULL,
  `direccion` varchar(100) NOT NULL,
  `usuario` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT 1,
  `fechaRegistro` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`codigo`, `nombre`, `telefono`, `direccion`, `usuario`, `password`, `estado`, `fechaRegistro`) VALUES
(1000, 'Nicolas', '80508050', 'casa', 'us@gmail.com', '12345', 1, '2022-06-04 22:20:38'),
(1001, 'Edgar Allan Poe', '95950000', 'Calle No. 1040', 'allanpoe@biblioteca.com', '12345', 1, '2022-06-06 12:37:52'),
(1002, 'M.Émile Lauvriére', '', 'Calle No. 1221', 'm.emile@biblioteca.com', '12345', 1, '2022-06-06 12:37:52');

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `v_editar_libro`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `v_editar_libro` (
`ideditar` int(11)
,`isbn` varchar(18)
,`titulo` varchar(50)
,`copias` tinyint(4)
,`id autor` int(11)
,`nombre autor` varchar(50)
,`id tipo libro` tinyint(3)
,`tipo de libro` varchar(50)
,`imagen` varchar(100)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `v_libros`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `v_libros` (
`id libro` int(11)
,`isbn` varchar(18)
,`titulo` varchar(50)
,`copias` tinyint(4)
,`Autor` varchar(50)
,`Tipo de Libro` varchar(50)
,`image` varchar(100)
);

-- --------------------------------------------------------

--
-- Estructura para la vista `v_editar_libro`
--
DROP TABLE IF EXISTS `v_editar_libro`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_editar_libro`  AS SELECT `lib`.`id` AS `ideditar`, `lib`.`isbn` AS `isbn`, `lib`.`titulo` AS `titulo`, `lib`.`copias` AS `copias`, `lib`.`idAutor` AS `id autor`, `au`.`nombre` AS `nombre autor`, `lib`.`tipoLibro` AS `id tipo libro`, `tlib`.`nombre` AS `tipo de libro`, `lib`.`image` AS `imagen` FROM ((`libro` `lib` join `autor` `au`) join `tipos-de-libros` `tlib` on(`lib`.`idAutor` = `au`.`idAutor`)) WHERE `lib`.`tipoLibro` = `tlib`.`idtipoLibro` ;

-- --------------------------------------------------------

--
-- Estructura para la vista `v_libros`
--
DROP TABLE IF EXISTS `v_libros`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_libros`  AS SELECT `lib`.`id` AS `id libro`, `lib`.`isbn` AS `isbn`, `lib`.`titulo` AS `titulo`, `lib`.`copias` AS `copias`, `a`.`nombre` AS `Autor`, `t`.`nombre` AS `Tipo de Libro`, `lib`.`image` AS `image` FROM ((`libro` `lib` join `autor` `a`) join `tipos-de-libros` `t` on(`lib`.`tipoLibro` = `t`.`idtipoLibro`)) WHERE `lib`.`idAutor` = `a`.`idAutor` AND `lib`.`estado` = 1 ORDER BY `lib`.`id` DESC ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `autor`
--
ALTER TABLE `autor`
  ADD PRIMARY KEY (`idAutor`);

--
-- Indices de la tabla `bibliotecario`
--
ALTER TABLE `bibliotecario`
  ADD UNIQUE KEY `codigoBbliotecario` (`codigoBbliotecario`);

--
-- Indices de la tabla `devolucion`
--
ALTER TABLE `devolucion`
  ADD PRIMARY KEY (`idDevolucion`),
  ADD UNIQUE KEY `idPrestamo` (`idPrestamo`),
  ADD KEY `idBbliotecario` (`idBbliotecario`);

--
-- Indices de la tabla `lector`
--
ALTER TABLE `lector`
  ADD UNIQUE KEY `codigoLector` (`codigoLector`);

--
-- Indices de la tabla `libro`
--
ALTER TABLE `libro`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `isbn` (`isbn`),
  ADD KEY `codigoBbliotecario` (`codigoBbliotecario`),
  ADD KEY `idAutor` (`idAutor`),
  ADD KEY `tipoLibro` (`tipoLibro`);

--
-- Indices de la tabla `prestamo`
--
ALTER TABLE `prestamo`
  ADD PRIMARY KEY (`idPrestamo`),
  ADD KEY `codigoLector` (`codigoLector`),
  ADD KEY `codigoBbliotecario` (`codigoBbliotecario`),
  ADD KEY `isbn` (`isbn`);

--
-- Indices de la tabla `tipos-de-libros`
--
ALTER TABLE `tipos-de-libros`
  ADD PRIMARY KEY (`idtipoLibro`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`codigo`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `autor`
--
ALTER TABLE `autor`
  MODIFY `idAutor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `devolucion`
--
ALTER TABLE `devolucion`
  MODIFY `idDevolucion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `libro`
--
ALTER TABLE `libro`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT de la tabla `prestamo`
--
ALTER TABLE `prestamo`
  MODIFY `idPrestamo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tipos-de-libros`
--
ALTER TABLE `tipos-de-libros`
  MODIFY `idtipoLibro` tinyint(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1004;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `bibliotecario`
--
ALTER TABLE `bibliotecario`
  ADD CONSTRAINT `bibliotecario_ibfk_1` FOREIGN KEY (`codigoBbliotecario`) REFERENCES `usuario` (`codigo`);

--
-- Filtros para la tabla `devolucion`
--
ALTER TABLE `devolucion`
  ADD CONSTRAINT `devolucion_ibfk_1` FOREIGN KEY (`idPrestamo`) REFERENCES `prestamo` (`idPrestamo`),
  ADD CONSTRAINT `devolucion_ibfk_2` FOREIGN KEY (`idBbliotecario`) REFERENCES `bibliotecario` (`codigoBbliotecario`);

--
-- Filtros para la tabla `lector`
--
ALTER TABLE `lector`
  ADD CONSTRAINT `lector_ibfk_1` FOREIGN KEY (`codigoLector`) REFERENCES `usuario` (`codigo`);

--
-- Filtros para la tabla `libro`
--
ALTER TABLE `libro`
  ADD CONSTRAINT `libro_ibfk_1` FOREIGN KEY (`idAutor`) REFERENCES `autor` (`idAutor`),
  ADD CONSTRAINT `libro_ibfk_2` FOREIGN KEY (`codigoBbliotecario`) REFERENCES `bibliotecario` (`codigoBbliotecario`),
  ADD CONSTRAINT `libro_ibfk_3` FOREIGN KEY (`tipoLibro`) REFERENCES `tipos-de-libros` (`idtipoLibro`);

--
-- Filtros para la tabla `prestamo`
--
ALTER TABLE `prestamo`
  ADD CONSTRAINT `prestamo_ibfk_1` FOREIGN KEY (`isbn`) REFERENCES `libro` (`isbn`),
  ADD CONSTRAINT `prestamo_ibfk_2` FOREIGN KEY (`codigoLector`) REFERENCES `lector` (`codigoLector`),
  ADD CONSTRAINT `prestamo_ibfk_3` FOREIGN KEY (`codigoBbliotecario`) REFERENCES `bibliotecario` (`codigoBbliotecario`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
