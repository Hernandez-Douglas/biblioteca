SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;


DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertarCopias` (IN `isbn` VARCHAR(18), IN `cantidad` INT(11))  BEGIN
    DECLARE
        i INT DEFAULT 1 ; WHILE(i <= cantidad)
    DO
    INSERT INTO `copias`(`isbn`)
VALUES(isbn) ;
SET
    i = i +1 ;
END WHILE ;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `P_LOANS` (IN `_codLector` INT, IN `_codBbliotecario` INT, IN `_idCopia` INT, OUT `msg` VARCHAR(50), OUT `STATTUS` INT)  BEGIN
IF(SELECT estado FROM copias WHERE codigo = _idCopia) = 1 THEN
    IF(SELECT COUNT(*) FROM prestamo WHERE estado = 1 AND codigoLector = _codLector) < 4 THEN
    INSERT INTO `prestamo` (`fechaDevolucion`, `codigoLector`, `codigoBbliotecario`, `idCopia`)
    VALUES (DATE_ADD(CURRENT_DATE(), INTERVAL 3 DAY), _codLector, _codBbliotecario, _idCopia);
    UPDATE copias SET estado = 2 WHERE codigo = _idCopia;
    SET STATTUS = 1;
    SET msg = 'Registro exitoso';
    SELECT msg, STATTUS;
   END IF;
    IF(SELECT COUNT(*) FROM prestamo WHERE estado = 1 AND codigoLector = _codLector) = 3 THEN
    UPDATE lector SET estado = 2 WHERE codigoLector = _codLector;
    END IF;
    ELSE
    SET msg = 'ERROR!, LIBRO [Prestado o sin devolver]';
    SET STATTUS = 0;
    SELECT msg, STATTUS;
END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `P_READER` (IN `_codigoLector` INT, OUT `id` INT, OUT `msg` VARCHAR(25))  BEGIN
    IF (SELECT estado FROM lector WHERE codigoLector = _codigoLector) = 1 THEN
    SET msg = 'Valido';
    SET id = (SELECT estado FROM lector WHERE codigoLector = _codigoLector);
    SELECT id, msg;
    END IF;
    
    IF (SELECT estado FROM lector WHERE codigoLector = _codigoLector) = 2 THEN
    SET msg = 'Limite de Prestamos';
    SET id = (SELECT estado FROM lector WHERE codigoLector = _codigoLector);
    SELECT id, msg;
    END IF;
    
    IF (SELECT estado FROM lector WHERE codigoLector = _codigoLector) = 3 THEN
    SET msg = 'Multas pendientes';
    SET id = (SELECT estado FROM lector WHERE codigoLector = _codigoLector);
    SELECT id, msg;
    END IF;
END$$

DELIMITER ;

CREATE TABLE `autor` (
  `idAutor` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `fechaNacimiento` date DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `autor` (`idAutor`, `nombre`, `fechaNacimiento`, `image`) VALUES
(1, 'Gabriel García Márquez', '1927-03-06', '/biblioteca/assets/image/ggma01.jpg'),
(2, 'William Shakespeare', '1564-04-23', '/biblioteca/assets/image/ggma01.jpg'),
(3, 'Bertha Yoshiko Higashida Hirose', '1972-06-14', NULL);

CREATE TABLE `bibliotecario` (
  `codigoBbliotecario` int(11) NOT NULL,
  `rol` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `bibliotecario` (`codigoBbliotecario`, `rol`) VALUES
(1000, 'administrador');

CREATE TABLE `copias` (
  `codigo` int(11) NOT NULL,
  `isbn` varchar(18) NOT NULL,
  `estado` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `copias` (`codigo`, `isbn`, `estado`) VALUES
(10000, '0-2021-2022-1', 2),
(10001, '0-2021-2022-1', 2),
(10002, '0-2021-2022-1', 2),
(10003, '0-2021-2022-1', 2),
(10004, '0-2021-2022-1', 2),
(10005, '0-2021-2022-1', 2),
(10006, '0-2021-2022-1', 2),
(10007, '0-2021-2022-1', 2),
(10008, '0-2021-2022-1', 2),
(10009, '0-2021-2022-1', 2),
(10010, '0-2021-2022-1', 2),
(10011, '0-2021-2022-1', 2),
(10012, '0-2021-2022-1', 2),
(10013, '0-2021-2022-1', 2),
(10014, '0-2021-2022-1', 2),
(10015, '0-2021-2022-1', 1),
(10016, '0-2021-2022-1', 1),
(10017, '0-2021-2022-1', 1),
(10018, '0-2021-2022-1', 1),
(10019, '0-2021-2022-1', 1),
(10020, '1-2021-2022-2', 1),
(10021, '1-2021-2022-2', 1),
(10022, '1-2021-2022-2', 1),
(10023, '1-2021-2022-2', 1),
(10024, '1-2021-2022-2', 1),
(10025, '1-2021-2022-2', 1),
(10026, '1-2021-2022-2', 1),
(10027, '1-2021-2022-2', 1),
(10028, '1-2021-2022-2', 1),
(10029, '1-2021-2022-2', 1),
(10030, '1-2021-2022-2', 1),
(10031, '1-2021-2022-2', 1),
(10032, '1-2021-2022-2', 1),
(10033, '970-10-35-17-8', 1),
(10035, '970-10-35-17-5', 1),
(10036, '970-10-35-17-5', 1),
(10037, '970-10-35-17-5', 1),
(10038, '970-10-35-17-5', 1),
(10039, '970-10-35-17-5', 1),
(10040, '970-10-35-17-5', 1),
(10041, '970-10-35-17-5', 1),
(10042, '970-10-35-17-5', 1),
(10043, '970-10-35-17-5', 1),
(10044, '970-10-35-17-5', 1),
(10045, '970-10-35-17-5', 1),
(10046, '970-10-35-17-5', 1),
(10047, '970-10-35-17-5', 1),
(10048, '970-10-35-17-5', 1),
(10049, '970-10-35-17-5', 1),
(10050, '970-10-35-17-5', 1),
(10051, '970-10-35-17-5', 1),
(10052, '970-10-35-17-5', 1),
(10053, '970-10-35-17-5', 1),
(10054, '970-10-35-17-8', 1),
(10055, '970-10-35-17-8', 1),
(10056, '970-10-35-17-8', 1),
(10057, '970-10-35-17-8', 1),
(10058, '970-10-35-17-8', 1),
(10059, '970-10-35-17-8', 1),
(10060, '970-10-35-17-8', 1),
(10061, '970-10-35-17-8', 1),
(10062, '970-10-35-17-8', 1),
(10063, '970-10-35-17-8', 1),
(10064, '970-10-35-17-8', 1),
(10065, '970-10-35-17-8', 1),
(10066, '970-10-35-17-8', 1),
(10067, '970-10-35-17-8', 1),
(10068, '970-10-35-17-8', 1),
(10069, '1-2021-2022-4', 1),
(10070, '1-2021-2022-4', 1),
(10071, '1-2021-2022-4', 1),
(10072, '1-2021-2022-4', 1),
(10073, '1-2021-2022-4', 1),
(10074, '1-2021-2022-4', 1),
(10075, '1-2021-2022-4', 1),
(10076, '1-2021-2022-4', 1),
(10077, '1-2021-2022-4', 1),
(10078, '1-2021-2022-4', 1),
(10079, '1-2021-2022-4', 1),
(10080, '1-2021-2022-4', 1),
(10081, '1-2021-2022-4', 1),
(10082, '1-2021-2022-4', 1),
(10083, '1-2021-2022-4', 1),
(10084, '1-2021-2022-3', 1),
(10085, '1-2021-2022-3', 1),
(10086, '1-2021-2022-3', 1),
(10087, '1-2021-2022-3', 1),
(10088, '1-2021-2022-3', 1),
(10089, '1-2021-2022-3', 1),
(10090, '1-2021-2022-3', 1),
(10091, '1-2021-2022-3', 1),
(10092, '1-2021-2022-3', 1),
(10093, '1-2021-2022-3', 1),
(10094, '1-2021-2022-3', 1),
(10095, '1-2021-2022-3', 1),
(10096, '1-2021-2022-3', 1),
(10097, '1-2021-2022-3', 1),
(10098, '1-2021-2022-3', 1),
(10099, '1-2021-2022-5', 1),
(10100, '1-2021-2022-5', 1),
(10101, '1-2021-2022-5', 1),
(10102, '1-2021-2022-5', 1),
(10103, '1-2021-2022-5', 1),
(10104, '1-2021-2022-5', 1),
(10105, '1-2021-2022-5', 1),
(10106, '1-2021-2022-5', 1),
(10107, '1-2021-2022-5', 1),
(10108, '1-2021-2022-5', 1),
(10109, '1-2021-2022-5', 1),
(10110, '1-2021-2022-5', 1),
(10111, '1-2021-2022-5', 1),
(10112, '1-2021-2022-5', 1),
(10113, '1-2021-2022-5', 1),
(10114, '1-2021-2022-6', 1),
(10115, '1-2021-2022-6', 1),
(10116, '1-2021-2022-6', 1),
(10117, '1-2021-2022-6', 1),
(10118, '1-2021-2022-6', 1),
(10119, '1-2021-2022-6', 1),
(10120, '1-2021-2022-6', 1),
(10121, '1-2021-2022-6', 1),
(10122, '1-2021-2022-6', 1),
(10123, '1-2021-2022-6', 1),
(10124, '1-2021-2022-6', 1),
(10125, '1-2021-2022-6', 1),
(10126, '1-2021-2022-6', 1),
(10127, '1-2021-2022-6', 1),
(10128, '1-2021-2022-6', 1);

CREATE TABLE `devolucion` (
  `idDevolucion` int(11) NOT NULL,
  `idPrestamo` int(11) NOT NULL,
  `idBbliotecario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `lector` (
  `codigoLector` int(11) NOT NULL,
  `estado` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `lector` (`codigoLector`, `estado`) VALUES
(1001, 2),
(1002, 2),
(1003, 2),
(1004, 2),
(1005, 1),
(1006, 1),
(1007, 1),
(1008, 1);

CREATE TABLE `libro` (
  `id` int(11) NOT NULL,
  `isbn` varchar(18) NOT NULL,
  `titulo` varchar(50) NOT NULL,
  `idAutor` int(11) NOT NULL,
  `tipoLibro` tinyint(3) NOT NULL,
  `codigoBbliotecario` int(11) NOT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT 1,
  `image` varchar(100) DEFAULT NULL,
  `fechaRegistro` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `libro` (`id`, `isbn`, `titulo`, `idAutor`, `tipoLibro`, `codigoBbliotecario`, `estado`, `image`, `fechaRegistro`) VALUES
(1, '0-2021-2022-1', 'Hamlet', 2, 2, 1000, 1, '2022-06-07-21-18-57-hamlet.jpg', '2022-06-05 13:11:00'),
(2, '1-2021-2022-2', 'El rey Lear', 2, 2, 1000, 1, 'default.png', '2022-06-05 13:39:38'),
(17, '1-2021-2022-3', 'El sueño de una noche de verano', 2, 2, 1000, 1, 'default.png', '2022-06-05 14:20:40'),
(19, '1-2021-2022-4', 'Macbeth', 2, 2, 1000, 1, 'default.png', '2022-06-05 19:57:05'),
(20, '1-2021-2022-5', 'Cien años de soledad', 1, 2, 1000, 1, 'default.png', '2022-06-05 21:51:06'),
(21, '1-2021-2022-6', 'El amor en los tiempos del cólera', 1, 2, 1000, 1, 'default.png', '2022-06-05 22:07:42'),
(29, '970-10-35-17-8', 'Ciencias de la Salud', 3, 1, 1000, 1, '970-10-35-17-8-ciencias-de-la-salud.png', '2022-06-06 11:03:43'),
(30, '970-10-35-17-5', 'Otelo', 2, 2, 1000, 1, '2022-06-07-21-17-18-oteleo.jpg', '2022-06-07 13:06:07');

CREATE TABLE `prestamo` (
  `idPrestamo` int(11) NOT NULL,
  `fechaPrestamo` date NOT NULL DEFAULT current_timestamp(),
  `fechaDevolucion` date NOT NULL,
  `codigoLector` int(11) NOT NULL,
  `codigoBbliotecario` int(11) NOT NULL,
  `idCopia` int(11) NOT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `prestamo` (`idPrestamo`, `fechaPrestamo`, `fechaDevolucion`, `codigoLector`, `codigoBbliotecario`, `idCopia`, `estado`) VALUES
(1, '2022-06-08', '2022-06-10', 1001, 1000, 10000, 1),
(2, '2022-06-08', '2022-06-10', 1001, 1000, 10001, 1),
(3, '2022-06-08', '2022-06-10', 1002, 1000, 10004, 1),
(4, '2022-06-08', '2022-06-10', 1001, 1000, 10007, 1),
(5, '2022-06-08', '2022-06-10', 1002, 1000, 10002, 1),
(6, '2022-06-08', '2022-06-10', 1002, 1000, 10003, 1),
(7, '2022-06-08', '2022-06-10', 1003, 1000, 10005, 1),
(8, '2022-06-08', '2022-06-10', 1003, 1000, 10006, 1),
(9, '2022-06-08', '2022-06-11', 1003, 1000, 10008, 1),
(10, '2022-06-08', '2022-06-11', 1004, 1000, 10009, 1),
(11, '2022-06-08', '2022-06-11', 1004, 1000, 10010, 1),
(12, '2022-06-08', '2022-06-11', 1004, 1000, 10011, 1),
(13, '2022-06-08', '2022-06-11', 1005, 1000, 10012, 1),
(14, '2022-06-08', '2022-06-11', 1005, 1000, 10013, 1),
(15, '2022-06-08', '2022-06-11', 1007, 1000, 10014, 1);

CREATE TABLE `tipos-de-libros` (
  `idtipoLibro` tinyint(3) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `fecha-registro` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `tipos-de-libros` (`idtipoLibro`, `nombre`, `descripcion`, `fecha-registro`) VALUES
(1, 'Científicos', 'La ciencia (del latín scientĭa, \'conocimiento\') es un sistema que organiza y construye el conocimiento a través de preguntas comprobables y un método estructurado que estudia e interpreta los fenómenos naturales, sociales y artificiales.', '2022-06-04 00:00:00'),
(2, 'Literatura y lingüísticos', 'Según la Real Academia Española (RAE), literatura es el «arte de la expresión verbal»1​ (entendiéndose como verbal aquello «que se refiere a la palabra, o se sirve de ella»2​) y, por lo tanto, abarca tanto textos escritos (literatura escrita) como hablados o cantados (literatura oral).', '2022-06-04 00:00:00'),
(3, 'De viaje', 'Libro de viaje, es la exposición de las experiencias y observaciones realizadas por un viajero, y puede acompañarse de mapas, dibujos, grabados, fotografías, etcétera, realizadas por el autor o por sus compañeros de viaje.', '2022-06-04 00:00:00'),
(4, 'Biografía', 'La biografía es la historia de la vida de una persona narrada por otra persona, es decir, en pleno sentido desde su nacimiento hasta su muerte.', '2022-06-04 00:00:00'),
(5, 'Libro de texto', 'Un libro de texto es un libro estándar en cualquier rama de estudio y corresponde a un recurso didáctico de tipo impreso que sirve como material de apoyo a las estrategias metodológicas del docente y enriquece el proceso de enseñanza-aprendizaje.', '2022-06-04 22:30:49'),
(6, 'De referencia o consulta', NULL, '2022-06-04 22:30:49');

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

INSERT INTO `usuario` (`codigo`, `nombre`, `telefono`, `direccion`, `usuario`, `password`, `estado`, `fechaRegistro`) VALUES
(1000, 'Nicolas', '80508050', 'casa', 'us@gmail.com', '12345', 1, '2022-06-04 22:20:38'),
(1001, 'Edgar Allan Poe', '95950000', 'Calle No. 1040', 'allanpoe@biblioteca.com', '12345', 1, '2022-06-06 12:37:52'),
(1002, 'M.Émile Lauvriére', '', 'Calle No. 1221', 'm.emile@biblioteca.com', '12345', 1, '2022-06-06 12:37:52'),
(1003, 'Walter Riso', '99985555', 'Casa No. 452', 'w.riso@biblioteca.com', '12345', 1, '2022-06-08 12:48:59'),
(1004, 'Pablo Neruda', '1904-1973', 'Casa No. 500', 'p.neruda@biblioteca.com', '12345', 1, '2022-06-08 12:48:59'),
(1005, 'Jane Austen', '1775-1817', 'Casa No. 222', 'j.austen@biblioteca.com', '12345', 1, '2022-06-08 21:34:35'),
(1006, 'Charles Dickens', '', 'Casa No. 664', 'c.dickens@biblioteca.com', '12345', 1, '2022-06-08 21:34:35'),
(1007, 'Vladimir Nabokov', '1899-1977', 'Casa No. 787', 'v.nabokov@biblioteca.com', '12345', 1, '2022-06-08 21:42:22'),
(1008, 'Virginia Woolf', '1882-1941', 'Casa No. 3333', 'v.woolf@biblioteca.com', '12345', 1, '2022-06-08 21:42:22');
CREATE TABLE `v_editar_libro` (
`ideditar` int(11)
,`isbn` varchar(18)
,`titulo` varchar(50)
,`id autor` int(11)
,`nombre autor` varchar(50)
,`id tipo libro` tinyint(3)
,`tipo de libro` varchar(50)
,`imagen` varchar(100)
);
CREATE TABLE `v_libros` (
`id libro` int(11)
,`isbn` varchar(18)
,`titulo` varchar(50)
,`copias` bigint(21)
,`Autor` varchar(50)
,`Tipo de Libro` varchar(50)
,`image` varchar(100)
);
DROP TABLE IF EXISTS `v_editar_libro`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_editar_libro`  AS SELECT `lib`.`id` AS `ideditar`, `lib`.`isbn` AS `isbn`, `lib`.`titulo` AS `titulo`, `lib`.`idAutor` AS `id autor`, `au`.`nombre` AS `nombre autor`, `lib`.`tipoLibro` AS `id tipo libro`, `tlib`.`nombre` AS `tipo de libro`, `lib`.`image` AS `imagen` FROM ((`libro` `lib` join `autor` `au`) join `tipos-de-libros` `tlib` on(`lib`.`idAutor` = `au`.`idAutor`)) WHERE `lib`.`tipoLibro` = `tlib`.`idtipoLibro` ;
DROP TABLE IF EXISTS `v_libros`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_libros`  AS SELECT `lib`.`id` AS `id libro`, `lib`.`isbn` AS `isbn`, `lib`.`titulo` AS `titulo`, count(0) AS `copias`, `au`.`nombre` AS `Autor`, `tlib`.`nombre` AS `Tipo de Libro`, `lib`.`image` AS `image` FROM (((`libro` `lib` join `copias` `cop`) join `autor` `au`) join `tipos-de-libros` `tlib` on(`lib`.`isbn` = `cop`.`isbn`)) WHERE `lib`.`isbn` = `cop`.`isbn` AND `lib`.`idAutor` = `au`.`idAutor` AND `lib`.`tipoLibro` = `tlib`.`idtipoLibro` GROUP BY `lib`.`isbn` ;


ALTER TABLE `autor`
  ADD PRIMARY KEY (`idAutor`);

ALTER TABLE `bibliotecario`
  ADD UNIQUE KEY `codigoBbliotecario` (`codigoBbliotecario`);

ALTER TABLE `copias`
  ADD PRIMARY KEY (`codigo`),
  ADD KEY `isbn` (`isbn`);

ALTER TABLE `devolucion`
  ADD PRIMARY KEY (`idDevolucion`),
  ADD UNIQUE KEY `idPrestamo` (`idPrestamo`),
  ADD KEY `idBbliotecario` (`idBbliotecario`);

ALTER TABLE `lector`
  ADD UNIQUE KEY `codigoLector` (`codigoLector`);

ALTER TABLE `libro`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `isbn` (`isbn`),
  ADD KEY `codigoBbliotecario` (`codigoBbliotecario`),
  ADD KEY `idAutor` (`idAutor`),
  ADD KEY `tipoLibro` (`tipoLibro`);

ALTER TABLE `prestamo`
  ADD PRIMARY KEY (`idPrestamo`),
  ADD KEY `codigoLector` (`codigoLector`),
  ADD KEY `codigoBbliotecario` (`codigoBbliotecario`),
  ADD KEY `isbn` (`idCopia`);

ALTER TABLE `tipos-de-libros`
  ADD PRIMARY KEY (`idtipoLibro`);

ALTER TABLE `usuario`
  ADD PRIMARY KEY (`codigo`);


ALTER TABLE `autor`
  MODIFY `idAutor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

ALTER TABLE `copias`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10129;

ALTER TABLE `devolucion`
  MODIFY `idDevolucion` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `libro`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

ALTER TABLE `prestamo`
  MODIFY `idPrestamo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

ALTER TABLE `tipos-de-libros`
  MODIFY `idtipoLibro` tinyint(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

ALTER TABLE `usuario`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1009;


ALTER TABLE `bibliotecario`
  ADD CONSTRAINT `bibliotecario_ibfk_1` FOREIGN KEY (`codigoBbliotecario`) REFERENCES `usuario` (`codigo`);

ALTER TABLE `copias`
  ADD CONSTRAINT `copias_ibfk_1` FOREIGN KEY (`isbn`) REFERENCES `libro` (`isbn`);

ALTER TABLE `devolucion`
  ADD CONSTRAINT `devolucion_ibfk_1` FOREIGN KEY (`idPrestamo`) REFERENCES `prestamo` (`idPrestamo`),
  ADD CONSTRAINT `devolucion_ibfk_2` FOREIGN KEY (`idBbliotecario`) REFERENCES `bibliotecario` (`codigoBbliotecario`);

ALTER TABLE `lector`
  ADD CONSTRAINT `lector_ibfk_1` FOREIGN KEY (`codigoLector`) REFERENCES `usuario` (`codigo`);

ALTER TABLE `libro`
  ADD CONSTRAINT `libro_ibfk_1` FOREIGN KEY (`idAutor`) REFERENCES `autor` (`idAutor`),
  ADD CONSTRAINT `libro_ibfk_2` FOREIGN KEY (`codigoBbliotecario`) REFERENCES `bibliotecario` (`codigoBbliotecario`),
  ADD CONSTRAINT `libro_ibfk_3` FOREIGN KEY (`tipoLibro`) REFERENCES `tipos-de-libros` (`idtipoLibro`);

ALTER TABLE `prestamo`
  ADD CONSTRAINT `prestamo_ibfk_2` FOREIGN KEY (`codigoLector`) REFERENCES `lector` (`codigoLector`),
  ADD CONSTRAINT `prestamo_ibfk_3` FOREIGN KEY (`codigoBbliotecario`) REFERENCES `bibliotecario` (`codigoBbliotecario`),
  ADD CONSTRAINT `prestamo_ibfk_4` FOREIGN KEY (`idCopia`) REFERENCES `copias` (`codigo`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
