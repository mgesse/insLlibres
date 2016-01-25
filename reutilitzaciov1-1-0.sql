-- phpMyAdmin SQL Dump
-- version 4.2.7.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 23-12-2015 a las 23:53:07
-- Versión del servidor: 5.6.20
-- Versión de PHP: 5.5.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `reutilitzaciov1-1-0`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bookdata`
--

CREATE TABLE IF NOT EXISTS `bookdata` (
  `idbookData` int(11) NOT NULL,
  `idBookCourse` int(11) NOT NULL,
  `idSubject` int(11) NOT NULL,
  `bookTitle` varchar(45) NOT NULL,
  `bookSubtitle` varchar(45) NOT NULL,
  `idPublisher` int(11) NOT NULL,
  `collectPrice` varchar(6) NOT NULL,
  `salePrice` varchar(6) NOT NULL,
  `activeBookCollect` tinyint(1) NOT NULL,
  `activeBookSale` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `bookdata`
--

INSERT INTO `bookdata` (`idbookData`, `idBookCourse`, `idSubject`, `bookTitle`, `bookSubtitle`, `idPublisher`, `collectPrice`, `salePrice`, `activeBookCollect`, `activeBookSale`) VALUES
(0, 0, 0, 'SENSE DADES', '---', 0, '0,00', '0,00', 0, 0),
(101, 100, 1, 'CATALÀ', 'Llengua Catalana', 9, '28,60', '35,19', 1, 1),
(102, 100, 2, 'CASTELLÀ', 'Nuevo Azacán Lengua Cast. y Literatura', 3, '32,55', '39,32', 1, 1),
(103, 100, 3, 'NATURALS', 'Ciències Naturals, 1r d''ESO', 1, '31,70', '38,50', 1, 1),
(104, 100, 5, 'TECNOLOGIA', 'Tecnologia 1 - Projecte Fluvià', 2, '35,10', '42,47', 1, 1),
(105, 100, 4, 'SOCIALS', 'Polis 1', 4, '30,85', '37,25', 1, 1),
(106, 100, 6, 'ANGLÈS', 'PULSE 1. Student’s book', 11, '00,00', '00,00', 1, 1),
(151, 100, 999, 'QUOTA per al manteniment del projecte de reut', '', 99, '-24,00', '0,00', 1, 0),
(201, 200, 1, 'CATALÀ', 'Llengua Catalana', 9, '28,60', '35,20', 1, 1),
(202, 200, 2, 'CASTELLÀ', 'Broquel', 3, '32,55', '39,32', 1, 1),
(203, 200, 3, 'NATURALS', 'Ciències Naturals, 2n d''ESO', 1, '32,40', '39,53', 1, 1),
(204, 200, 5, 'TECNOLOGIA', 'Tecnologia 2 - Projecte Fluvià', 2, '35,10', '42,47', 1, 1),
(205, 200, 4, 'SOCIALS', 'Polis 2', 4, '30,85', '37,25', 1, 1),
(206, 200, 6, 'ANGLÈS', 'PULSE 2. Student’s book', 11, '00,00', '00,00', 1, 1),
(251, 200, 999, 'QUOTA per al manteniment del projecte de reut', '', 99, '-24,00', '0,00', 1, 0),
(301, 300, 1, 'CATALÀ', 'Llengua Catalana', 9, '29,35', '36,13', 1, 1),
(302, 300, 2, 'CASTELLÀ', 'Nuevo Cantel Lengua Cast. y Lit.', 3, '32,55', '39,32', 1, 1),
(303, 300, 4, 'SOCIALS', 'Polis 3', 4, '32,50', '39,30', 1, 1),
(304, 300, 5, 'TECNOLOGIA', 'Tecnologia 3 - Projecte Fluvià', 2, '35,10', '42,47', 1, 1),
(305, 300, 7, 'BIOLOGIA I GEOLOGIA', 'Naturals 3r', 1, '26,45', '32,33', 1, 1),
(306, 300, 8, 'FÍSICA I QUÍMICA', 'Naturals 3r', 1, '22,70', '27,74', 1, 1),
(307, 300, 9, 'MATEMÀTIQUES', 'Matemàtiques 3 - Projecte Fluvià', 2, '35,10', '42,47', 1, 1),
(308, 300, 6, 'ANGLÈS', 'English Plus 3 Student''s Book 3', 10, '29,10', '34,66', 1, 1),
(351, 300, 999, 'QUOTA per al manteniment del projecte de reut', '', 99, '-24,00', '0,00', 1, 0),
(401, 400, 1, 'CATALÀ', 'Llengua Catalana', 9, '29,35', '36,13', 1, 1),
(402, 400, 2, 'CASTELLÀ', 'Zorzal', 3, '32,55', '39,32', 1, 1),
(403, 400, 4, 'SOCIALS', 'Polis 4', 4, '31,65', '38,25', 1, 1),
(404, 400, 9, 'MATEMÀTIQUES', 'Matemàtiques - Projecte Fluvià', 2, '33,95', '41,10', 1, 1),
(405, 400, 6, 'ANGLÈS', 'English Plus 4 Student’s Book', 5, '29,10', '34,66', 1, 1),
(451, 400, 999, 'QUOTA per al manteniment del projecte de reut', '', 99, '-24,00', '0,00', 1, 0),
(452, 400, 999, 'Manteniment Llibres Optatives.', '', 99, '0,00', '20,00', 0, 1),
(501, 500, 1, 'CATALÀ', 'Ll. Catalana - Petjada(Només Llibre de Text)', 7, '34,30', '41,60', 1, 1),
(502, 500, 2, 'CASTELLÀ', 'Bitácora 1 - Lengua Castellana y literatura', 7, '32,95', '39,96', 1, 1),
(503, 500, 10, 'FILOSOFIA', 'Filosofia i Ciutadania', 6, '29,55', '37,00', 1, 1),
(504, 500, 13, 'HISTÒRIA DEL MÓN CONTEMPORANI', '', 4, '37,40', '45,15', 1, 1),
(505, 500, 11, 'TECNOLOGIA INDUSTRIAL', 'Tecnologia Ind. 1 - Sèrie Fluvià', 2, '35,70', '43,50', 1, 1),
(506, 500, 12, 'LLATÍ', '', 4, '32,40', '39,15', 1, 1),
(507, 500, 14, 'MATEMÀTIQUES - MAC', 'Matemàtiques Científic-Tecnològic', 2, '35,05', '35,30', 1, 1),
(508, 500, 15, 'MATEMÀTIQUES - MAH', 'Matemàtiques Humanístic- Apl. C. Socials', 2, '35,05', '35,30', 1, 1),
(509, 500, 16, 'FÍSICA', 'Física 1 - Sèrie Fluvià', 2, '35,05', '42,50', 1, 1),
(510, 500, 17, 'QUÍMICA', 'Química 1 - Sèrie Fluvià', 2, '36,75', '44,50', 1, 1),
(511, 500, 18, 'ECONOMIA I ORGANITZACIÓ D''EMPRESES', 'Sèrie Fluvià', 2, '34,85', '41,50', 1, 1),
(512, 500, 19, 'BIOLOGIA', 'Biologia 1', 8, '32,85', '39,10', 1, 1),
(513, 500, 21, 'ECONOMIA', '', 4, '31,95', '38,60', 1, 1),
(551, 500, 999, 'QUOTA per al manteniment del projecte de reut', '', 99, '-36,00', '0,00', 1, 0),
(561, 500, 1, 'CATALÀ CAX', 'Català - Libre d''Exercicis', 7, '0,00', '16,00', 0, 1),
(601, 600, 1, 'CATALÀ', 'Ll. Catalana i Literatura Altaveu 2', 7, '34,30', '41,60', 1, 1),
(602, 600, 2, 'CASTELLÀ', 'Bitácora 2 - Lengua Castellana y literatura', 7, '34,30', '41,60', 1, 1),
(603, 600, 11, 'TECNOLOGIA INDUSTRIAL', 'Tecnologia Ind. 1 - Sèrie Fluvià', 2, '35,05', '43,50', 1, 1),
(604, 600, 12, 'LLATÍ', '', 4, '33,65', '40,94', 1, 1),
(605, 600, 14, 'MATEMÀTIQUES - MAC', 'Matemàtiques Científic-Tecnològic', 2, '34,65', '35,30', 1, 1),
(606, 600, 15, 'MATEMÀTIQUES - MAH', 'Matemàtiques Humanístic- Apl. C. Socials', 2, '34,65', '35,30', 1, 1),
(607, 600, 16, 'FÍSICA', 'Física 2 - Sèrie Fluvià', 2, '35,30', '42,50', 1, 1),
(608, 600, 17, 'QUÍMICA', 'Química 2 - Sèrie Fluvià', 2, '35,70', '44,50', 1, 1),
(609, 600, 18, 'ECONOMIA I ORGANITZACIÓ D''EMPRESES', '2 - Sèrie Fluvià', 2, '35,05', '41,50', 1, 1),
(610, 600, 19, 'BIOLOGIA', 'Biologia 2', 8, '32,85', '39,10', 1, 1),
(611, 600, 26, 'HISTÒRIA DE LA FILOSOFIA', '', 4, '34,25', '41,40', 1, 1),
(612, 600, 22, 'HISTÒRIA', 'Crònica', 7, '34,30', '41,60', 1, 1),
(613, 600, 24, 'GEOGRAFIA', '', 4, '34,70', '42,55', 1, 1),
(614, 600, 25, 'HISTÒRIA DE L''ART', 'Visualart', 4, '47,15', '57,00', 1, 1),
(651, 600, 999, 'QUOTA per al manteniment del projecte de reut', '', 99, '-36,00', '0,00', 0, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `books`
--

CREATE TABLE IF NOT EXISTS `books` (
`idBook` int(11) NOT NULL,
  `idBookData` int(11) NOT NULL,
  `bookNumber` int(11) DEFAULT NULL,
  `internalEvaluation` varchar(3) DEFAULT NULL,
  `externalEvaluation` varchar(3) DEFAULT NULL,
  `globalEvaluation` varchar(3) DEFAULT NULL,
  `idBookState` int(11) NOT NULL,
  `lastUpdatedBook` timestamp NULL DEFAULT NULL,
  `observations` text
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=20 ;

--
-- Volcado de datos para la tabla `books`
--

INSERT INTO `books` (`idBook`, `idBookData`, `bookNumber`, `internalEvaluation`, `externalEvaluation`, `globalEvaluation`, `idBookState`, `lastUpdatedBook`, `observations`) VALUES
(0, 0, NULL, NULL, NULL, NULL, 5, '2015-11-19 11:43:00', 'Reservat'),
(1, 151, NULL, NULL, NULL, NULL, 5, '2015-11-19 11:43:00', 'Quota Pagada 1r ESO'),
(2, 251, NULL, NULL, NULL, NULL, 5, '2015-11-19 11:43:00', 'Quota Pagada 2n ESO'),
(3, 351, NULL, NULL, NULL, NULL, 5, '2015-11-19 11:43:00', 'Quota Pagada 3r ESO'),
(4, 451, NULL, NULL, NULL, NULL, 5, '2015-11-19 11:43:00', 'Quota Pagada 4rt ESO'),
(5, 551, NULL, NULL, NULL, NULL, 5, '2015-11-19 11:43:00', 'Quota Pagada 1r BATX'),
(6, 651, NULL, NULL, NULL, NULL, 5, '2015-11-19 11:43:00', 'Quota Pagada 2n BATX'),
(7, 0, NULL, NULL, NULL, NULL, 5, '2015-11-19 11:43:00', 'Reservat'),
(8, 0, NULL, NULL, NULL, NULL, 5, '2015-11-19 11:43:00', 'Reservat'),
(9, 0, NULL, NULL, NULL, NULL, 5, '2015-11-19 11:43:00', 'Reservat'),
(10, 0, NULL, NULL, NULL, NULL, 5, '2015-11-19 11:43:00', 'Reservat'),
(11, 0, NULL, NULL, NULL, NULL, 5, '2015-11-19 11:43:00', 'Reservat'),
(12, 0, NULL, NULL, NULL, NULL, 5, '2015-11-19 11:43:00', 'Reservat'),
(13, 0, NULL, NULL, NULL, NULL, 5, '2015-11-19 11:43:00', 'Reservat'),
(14, 452, NULL, NULL, NULL, NULL, 5, '2015-11-19 11:43:00', 'Optativa Pagada 4rt ESO'),
(15, 0, NULL, NULL, NULL, NULL, 5, '2015-11-19 11:43:00', 'Reservat'),
(16, 0, NULL, NULL, NULL, NULL, 5, '2015-11-19 11:43:00', 'Reservat'),
(17, 0, NULL, NULL, NULL, NULL, 5, '2015-11-19 11:43:00', 'Reservat'),
(18, 0, NULL, NULL, NULL, NULL, 5, '2015-11-19 11:43:00', 'Reservat'),
(19, 0, NULL, NULL, NULL, NULL, 5, '2015-11-19 11:43:00', 'Reservat');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bookstate`
--

CREATE TABLE IF NOT EXISTS `bookstate` (
  `idBookState` int(11) NOT NULL,
  `stateName` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `bookstate`
--

INSERT INTO `bookstate` (`idBookState`, `stateName`) VALUES
(1, 'EN RODA'),
(2, 'REVISIÓ'),
(3, 'RESERVA'),
(4, 'CEDIT'),
(5, 'SENSE INFORMACIÓ'),
(6, 'RETIRAT');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `courses`
--

CREATE TABLE IF NOT EXISTS `courses` (
  `idCourses` int(11) NOT NULL,
  `courseName` varchar(20) NOT NULL,
  `idTypeCourse` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `courses`
--

INSERT INTO `courses` (`idCourses`, `courseName`, `idTypeCourse`) VALUES
(0, 'Sense Curs', 0),
(100, '1r d''ESO', 1),
(101, '1r d''ESO A', 1),
(102, '1r d''ESO B', 1),
(200, '2n d''ESO', 1),
(201, '2n d''ESO A', 1),
(202, '2n d''ESO B', 1),
(300, '3r d''ESO', 1),
(301, '3r d''ESO A', 1),
(302, '3r d''ESO B', 1),
(400, '4rt d''ESO', 1),
(401, '4rt d''ESO A', 1),
(402, '4rt d''ESO B', 1),
(403, '4rt d''ESO C', 2),
(500, '1r de BATX', 1),
(501, '1r BATX A', 3),
(502, '1r BATX B', 4),
(600, '2n de ESO', 1),
(601, '2n BATX A', 3),
(602, '2n BATX B', 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `coursessubjects`
--

CREATE TABLE IF NOT EXISTS `coursessubjects` (
  `idCourse` int(11) NOT NULL,
  `idSubject` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `coursessubjects`
--

INSERT INTO `coursessubjects` (`idCourse`, `idSubject`) VALUES
(100, 1),
(200, 1),
(300, 1),
(400, 1),
(500, 1),
(100, 2),
(200, 2),
(300, 2),
(400, 2),
(500, 2),
(100, 3),
(200, 3),
(100, 4),
(200, 4),
(300, 4),
(400, 4),
(100, 5),
(200, 5),
(300, 5),
(300, 6),
(400, 6),
(300, 7),
(300, 8),
(300, 9),
(400, 9),
(500, 10),
(500, 11),
(600, 11),
(500, 12),
(600, 12),
(500, 13),
(500, 14),
(600, 14),
(500, 15),
(600, 15),
(500, 16),
(600, 16),
(500, 17),
(600, 17),
(500, 18),
(600, 18),
(500, 19),
(600, 19),
(500, 20),
(500, 21),
(600, 22),
(600, 23),
(600, 24),
(600, 25),
(600, 26),
(100, 999),
(200, 999),
(300, 999),
(400, 999),
(500, 999),
(600, 999);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `numprov`
--

CREATE TABLE IF NOT EXISTS `numprov` (
  `idBookData` int(11) NOT NULL,
  `provNumber` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `publishers`
--

CREATE TABLE IF NOT EXISTS `publishers` (
  `idPublisher` int(11) NOT NULL,
  `publisherName` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `publishers`
--

INSERT INTO `publishers` (`idPublisher`, `publisherName`) VALUES
(0, 'SENSE DADES'),
(1, 'BARCANOVA'),
(2, 'MC GRAW-HILL'),
(3, 'CASTELLNOU'),
(4, 'VICENS VIVES'),
(5, 'LONGMAN'),
(6, 'EDEBÉ'),
(7, 'TEIDE'),
(8, 'SANTILLANA'),
(9, 'CRUÏLLA'),
(10, 'OXFORD'),
(11, 'MACMILLAN E.L.T'),
(99, 'ESCOLES VERDES');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `studentbookcollect`
--

CREATE TABLE IF NOT EXISTS `studentbookcollect` (
  `idStudent` int(11) NOT NULL,
  `idBook` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `studentbooksale`
--

CREATE TABLE IF NOT EXISTS `studentbooksale` (
  `idStudent` int(11) NOT NULL,
  `idBook` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `students`
--

CREATE TABLE IF NOT EXISTS `students` (
`idStudent` int(11) NOT NULL,
  `studentName` varchar(70) NOT NULL,
  `idCourseCollect` int(11) NOT NULL,
  `idCourseSale` int(11) NOT NULL,
  `observations` text
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=124 ;

--
-- Volcado de datos para la tabla `students`
--

INSERT INTO `students` (`idStudent`, `studentName`, `idCourseCollect`, `idCourseSale`, `observations`) VALUES
(83, 'Gessé Bernadas, Miquel', 101, 0, NULL),
(84, 'Chacón Arroyo, Elisabet', 101, 0, NULL),
(85, 'Plana Juanpere, Nil', 101, 0, NULL),
(86, 'Garcia, Antonio', 102, 0, NULL),
(87, 'Rivera, Aitor', 102, 0, NULL),
(88, 'Venusaur, Bulbasaur Ivysaur', 102, 202, NULL),
(89, 'Charizard, Charmander Charmelon', 102, 202, NULL),
(90, 'Blastoise, Squirtle Wartortle', 102, 202, NULL),
(91, 'Butterfree, Caterpie Metapod', 101, 101, NULL),
(92, 'Beedrill, Wrumple Kakuna', 101, 201, NULL),
(93, 'Pidgeot, Pidgey Pidgeotto', 101, 201, NULL),
(94, 'Meganium, Chikorita Bayleef', 201, 301, NULL),
(95, 'Typhlosion, Cyndaquil Quilava', 201, 301, NULL),
(96, 'Feraligatr, Totodile Croconaw', 201, 301, NULL),
(97, 'Furret, Sentret', 202, 302, NULL),
(98, 'Noctowl, Hoothoot', 202, 302, NULL),
(99, 'Ledian, Ledyba', 202, 302, NULL),
(100, 'Sceptile, Treecko Grovyle', 301, 401, NULL),
(101, 'Blaziken, Torchic Combusken', 301, 401, NULL),
(102, 'Swampert, Mudkip Marshtomp', 301, 401, NULL),
(103, 'Mightyena, Poochyena', 302, 403, NULL),
(104, 'Linoone, Zigzagoon', 302, 402, NULL),
(105, 'Beautifly, Wrumple Silcoon', 302, 402, NULL),
(106, 'Torterra, Turtwig Grotle', 401, 501, NULL),
(107, 'Infernape, Chimchar Monferno', 401, 501, NULL),
(108, 'Empoleon, Piplup Prinplup', 401, 501, NULL),
(109, 'Staraptor, Starly Staravia', 401, 501, NULL),
(110, 'Bibarel, Bidoof', 401, 0, NULL),
(111, 'Kricketune, Kricketot', 401, 501, NULL),
(112, 'Serperior, Snivy Servine', 501, 601, NULL),
(113, 'Samurott, Oshawott Dewott', 501, 601, NULL),
(114, 'Watchog, Patrat', 501, 601, NULL),
(115, 'Stoutland, Lillipup Herdier', 502, 602, NULL),
(116, 'Emboar, Tepgig Pignite', 502, 602, NULL),
(117, 'Liepard, Purrloin', 502, 602, NULL),
(118, 'Chesnaught, Chespin Quilladin', 601, 0, NULL),
(119, 'Delphox, Fennekin Braixen', 601, 0, NULL),
(120, 'Greninja, Froakie Frogadier', 601, 0, NULL),
(121, 'Diggserby, Bunnelby', 602, 0, NULL),
(122, 'Talonflame, Fletchling Fletchinder', 602, 0, NULL),
(123, 'Vivillon, Scatterburg Spewpa', 602, 0, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `subjects`
--

CREATE TABLE IF NOT EXISTS `subjects` (
`idSubject` int(11) NOT NULL,
  `subjectName` varchar(45) NOT NULL,
  `subjectCode` varchar(3) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1000 ;

--
-- Volcado de datos para la tabla `subjects`
--

INSERT INTO `subjects` (`idSubject`, `subjectName`, `subjectCode`) VALUES
(0, 'Sense Dades', 'NDA'),
(1, 'Català', 'CAT'),
(2, 'Castellà', 'CAS'),
(3, 'Naturals', 'NAT'),
(4, 'Socials', 'SOC'),
(5, 'Tecnologia', 'TEC'),
(6, 'Anglès', 'ANG'),
(7, 'Biologia i Geologia', 'BIG'),
(8, 'Física i Química', 'FIQ'),
(9, 'Matemàtiques', 'MAT'),
(10, 'Filosofia', 'FIL'),
(11, 'Tecnologia Industrial', 'TEI'),
(12, 'Llatí', 'LLA'),
(13, 'Història del Món Contemporani', 'HMC'),
(14, 'Matemàtiques (Cinetífic)', 'MAC'),
(15, 'Matemàtiques (Humanístic)', 'MAH'),
(16, 'Física', 'FIS'),
(17, 'Química', 'QUI'),
(18, 'Economia de l''Empresa', 'ECE'),
(19, 'Biologia', 'BIO'),
(20, 'Ciències del Món Contemporani', 'CMC'),
(21, 'Economia', 'ECO'),
(22, 'Història', 'HIS'),
(23, 'Electrotècnia', 'ELE'),
(24, 'Geologia', 'GEO'),
(25, 'Història de l''Art', 'ART'),
(26, 'Història de la Filosofia', 'HFI'),
(999, 'Escoles Verdes', 'E.V');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `typecourse`
--

CREATE TABLE IF NOT EXISTS `typecourse` (
  `idTypeCourse` int(11) NOT NULL,
  `nameTypeCourse` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `typecourse`
--

INSERT INTO `typecourse` (`idTypeCourse`, `nameTypeCourse`) VALUES
(0, 'Sense Dades'),
(1, 'Ordinari'),
(2, 'Adaptat'),
(3, 'Científic'),
(4, 'Humanístic');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `typeuser`
--

CREATE TABLE IF NOT EXISTS `typeuser` (
  `idtypeUser` int(11) NOT NULL,
  `nameTypeUser` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `typeuser`
--

INSERT INTO `typeuser` (`idtypeUser`, `nameTypeUser`) VALUES
(1, 'Master'),
(2, 'Administrador'),
(3, 'Usuari');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `idusers` int(11) NOT NULL,
  `userName` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `idTypeUser` int(11) NOT NULL,
  `lastAccess` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`idusers`, `userName`, `password`, `idTypeUser`, `lastAccess`) VALUES
(0, 'user', 'user', 3, '2015-11-19 11:43:00'),
(1, 'Master', 'Master', 1, '2015-11-19 11:43:00'),
(2, 'Miquel_EV', 'abc', 2, '2015-11-19 11:43:00'),
(3, 'Sara_EV', 'abc', 2, '2015-11-19 11:43:00'),
(4, 'Catalina_EV', 'abc', 2, '2015-11-19 11:43:00'),
(5, 'Candela_EV', 'abc', 2, '2015-11-19 11:43:00'),
(6, 'Viktoria_EV', 'abc', 2, '2015-11-19 11:43:00');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `bookdata`
--
ALTER TABLE `bookdata`
 ADD PRIMARY KEY (`idbookData`), ADD KEY `idCurs_DadesLlibre_CursAssignatures_idx` (`idBookCourse`), ADD KEY `bookData_idSubject_idx` (`idSubject`), ADD KEY `bookData_idPublisher_idx` (`idPublisher`);

--
-- Indices de la tabla `books`
--
ALTER TABLE `books`
 ADD PRIMARY KEY (`idBook`), ADD KEY `FK_idEstatLlibre_idx` (`idBookState`), ADD KEY `books_idBookData_idx` (`idBookData`);

--
-- Indices de la tabla `bookstate`
--
ALTER TABLE `bookstate`
 ADD PRIMARY KEY (`idBookState`);

--
-- Indices de la tabla `courses`
--
ALTER TABLE `courses`
 ADD PRIMARY KEY (`idCourses`), ADD UNIQUE KEY `nomCurs_UNIQUE` (`courseName`), ADD KEY `FK_idTipusCurs_idx` (`idTypeCourse`);

--
-- Indices de la tabla `coursessubjects`
--
ALTER TABLE `coursessubjects`
 ADD PRIMARY KEY (`idCourse`,`idSubject`), ADD KEY `FK_idAssignatura_idx` (`idSubject`);

--
-- Indices de la tabla `numprov`
--
ALTER TABLE `numprov`
 ADD PRIMARY KEY (`idBookData`);

--
-- Indices de la tabla `publishers`
--
ALTER TABLE `publishers`
 ADD PRIMARY KEY (`idPublisher`);

--
-- Indices de la tabla `studentbookcollect`
--
ALTER TABLE `studentbookcollect`
 ADD PRIMARY KEY (`idStudent`,`idBook`), ADD KEY `FK_idLlibre_idx` (`idBook`);

--
-- Indices de la tabla `studentbooksale`
--
ALTER TABLE `studentbooksale`
 ADD PRIMARY KEY (`idStudent`,`idBook`), ADD KEY `FK_idLlibreVenda_idx` (`idBook`);

--
-- Indices de la tabla `students`
--
ALTER TABLE `students`
 ADD PRIMARY KEY (`idStudent`), ADD KEY `FK_idCursRecollida_idx` (`idCourseCollect`), ADD KEY `FK_idCursVenda_idx` (`idCourseSale`);

--
-- Indices de la tabla `subjects`
--
ALTER TABLE `subjects`
 ADD PRIMARY KEY (`idSubject`);

--
-- Indices de la tabla `typecourse`
--
ALTER TABLE `typecourse`
 ADD PRIMARY KEY (`idTypeCourse`);

--
-- Indices de la tabla `typeuser`
--
ALTER TABLE `typeuser`
 ADD PRIMARY KEY (`idtypeUser`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
 ADD PRIMARY KEY (`idusers`), ADD KEY `FK_users_typeUser_idx` (`idTypeUser`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `books`
--
ALTER TABLE `books`
MODIFY `idBook` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT de la tabla `students`
--
ALTER TABLE `students`
MODIFY `idStudent` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=124;
--
-- AUTO_INCREMENT de la tabla `subjects`
--
ALTER TABLE `subjects`
MODIFY `idSubject` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=1000;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `bookdata`
--
ALTER TABLE `bookdata`
ADD CONSTRAINT `DadesLlibre_idCursLlibre_FK` FOREIGN KEY (`idBookCourse`) REFERENCES `courses` (`idCourses`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `bookData_idPublisher` FOREIGN KEY (`idPublisher`) REFERENCES `publishers` (`idPublisher`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `bookData_idSubject` FOREIGN KEY (`idSubject`) REFERENCES `subjects` (`idSubject`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `books`
--
ALTER TABLE `books`
ADD CONSTRAINT `Llibres_idEstatLlibre_FK` FOREIGN KEY (`idBookState`) REFERENCES `bookstate` (`idBookState`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `books_idBookData` FOREIGN KEY (`idBookData`) REFERENCES `bookdata` (`idbookData`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `courses`
--
ALTER TABLE `courses`
ADD CONSTRAINT `Cursos_idTipusCurs_FK` FOREIGN KEY (`idTypeCourse`) REFERENCES `typecourse` (`idTypeCourse`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `coursessubjects`
--
ALTER TABLE `coursessubjects`
ADD CONSTRAINT `CursAssignatura_idAssignatura_FK` FOREIGN KEY (`idSubject`) REFERENCES `subjects` (`idSubject`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `CursAssignatura_idCurs_FK` FOREIGN KEY (`idCourse`) REFERENCES `courses` (`idCourses`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `studentbookcollect`
--
ALTER TABLE `studentbookcollect`
ADD CONSTRAINT `LlibreAlumRec_idAlumne_FK` FOREIGN KEY (`idStudent`) REFERENCES `students` (`idStudent`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `LlibreAlumnRec_idLlibre_FK` FOREIGN KEY (`idBook`) REFERENCES `books` (`idBook`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `studentbooksale`
--
ALTER TABLE `studentbooksale`
ADD CONSTRAINT `LlibreAlumnVen_idAlumne_FK` FOREIGN KEY (`idStudent`) REFERENCES `students` (`idStudent`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `LlibreAlumnVen_idLlibre_FK` FOREIGN KEY (`idBook`) REFERENCES `books` (`idBook`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `students`
--
ALTER TABLE `students`
ADD CONSTRAINT `Alumnes_idCursRec_FK` FOREIGN KEY (`idCourseCollect`) REFERENCES `courses` (`idCourses`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `Alumnes_idCursVen_FK` FOREIGN KEY (`idCourseSale`) REFERENCES `courses` (`idCourses`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `users`
--
ALTER TABLE `users`
ADD CONSTRAINT `FK_users_typeUser` FOREIGN KEY (`idTypeUser`) REFERENCES `typeuser` (`idtypeUser`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
