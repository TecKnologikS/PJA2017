-- phpMyAdmin SQL Dump
-- version 4.6.5.1
-- https://www.phpmyadmin.net/
--
-- Client :  localhost
-- Généré le :  Mer 05 Juillet 2017 à 21:20
-- Version du serveur :  5.5.55-0+deb8u1
-- Version de PHP :  7.0.19-1~dotdeb+8.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `commercial`
--

-- --------------------------------------------------------

--
-- Structure de la table `devis_article`
--

CREATE TABLE `devis_article` (
  `ID` int(11) NOT NULL,
  `ID_Devis` int(11) NOT NULL,
  `ID_Article` int(11) NOT NULL,
  `Qte` int(11) NOT NULL,
  `Prix` double NOT NULL,
  `Reduction` double NOT NULL,
  `Prix_final` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `devis_article`
--

INSERT INTO `devis_article` (`ID`, `ID_Devis`, `ID_Article`, `Qte`, `Prix`, `Reduction`, `Prix_final`) VALUES
(1, 6, 1, 38, 100, 10, 90),
(2, 6, 3, 1, 30, 3, 27),
(3, 7, 1, 38, 100, 10, 90),
(4, 7, 3, 1, 30, 3, 27),
(5, 8, 1, 38, 100, 10, 90),
(6, 8, 3, 1, 30, 3, 27),
(7, 9, 1, 38, 100, 10, 90),
(8, 9, 3, 1, 30, 3, 27),
(9, 10, 1, 38, 100, 380, 3420),
(10, 10, 3, 1, 30, 3, 27),
(11, 11, 1, 38, 100, 380, 3420),
(12, 11, 3, 1, 30, 3, 27),
(13, 12, 1, 38, 100, 380, 3420),
(14, 12, 3, 1, 30, 3, 27),
(15, 13, 1, 39, 100, 390, 3510),
(16, 13, 3, 1, 30, 3, 27),
(17, 14, 1, 41, 100, 410, 3690),
(18, 14, 3, 1, 30, 3, 27),
(19, 15, 1, 1, 100, 10, 90),
(20, 15, 2, 1, 10, 1, 9),
(21, 15, 3, 1, 30, 3, 27),
(22, 15, 4, 1, 100, 10, 90),
(23, 15, 5, 23, 79, 181.7, 1635.3),
(24, 15, 6, 1, 500, 50, 450),
(25, 15, 7, 1, 40, 4, 36),
(26, 15, 8, 1, 85, 8.5, 76.5),
(27, 15, 9, 1, 71, 7.1, 63.9),
(28, 15, 10, 3, 97, 29.1, 261.9),
(29, 16, 1, 1, 100, 0, 100),
(30, 16, 4, 1, 100, 0, 100),
(31, 17, 1, 2, 100, 0, 200),
(32, 17, 2, 4, 10, 0, 40),
(33, 17, 3, 2, 30, 0, 60),
(34, 17, 4, 1, 100, 0, 100),
(35, 17, 5, 1, 79, 0, 79),
(36, 17, 6, 1, 500, 0, 500),
(37, 17, 10, 1, 97, 0, 97),
(38, 18, 1, 2, 100, 0, 200),
(39, 18, 2, 4, 10, 0, 40),
(40, 18, 3, 2, 30, 0, 60),
(41, 18, 4, 1, 100, 0, 100),
(42, 18, 5, 1, 79, 0, 79),
(43, 18, 6, 1, 500, 0, 500),
(44, 18, 10, 1, 97, 0, 97),
(45, 19, 1, 2, 100, 0, 200),
(46, 19, 2, 4, 10, 0, 40),
(47, 19, 3, 2, 30, 0, 60),
(48, 19, 4, 1, 100, 0, 100),
(49, 19, 5, 1, 79, 0, 79),
(50, 19, 6, 1, 500, 0, 500),
(51, 19, 10, 1, 97, 0, 97),
(52, 20, 2, 102, 10, 1009.8, 10.2),
(53, 20, 4, 1, 100, 99, 1),
(54, 21, 2, 102, 10, 1009.8, 10.2),
(55, 21, 4, 1, 100, 99, 1),
(56, 23, 1, 11, 100, 1089, 11),
(57, 23, 2, 106, 10, 1049.4, 10.6),
(58, 23, 4, 1, 100, 99, 1),
(59, 23, 8, 1, 85, 84.15, 0.84999999999999),
(60, 23, 11, 101, 100, 9999, 101),
(61, 24, 2, 10, 10, 99, 1),
(62, 24, 4, 10, 100, 990, 10),
(63, 24, 8, 13, 85, 1093.95, 11.05),
(64, 25, 2, 10, 10, 99, 1),
(65, 25, 4, 10, 100, 990, 10),
(66, 25, 8, 13, 85, 1093.95, 11.05),
(67, 26, 1, 1, 100, 100, 0),
(68, 26, 2, 10, 10, 100, 0),
(69, 26, 4, 10, 100, 1000, 0),
(70, 26, 8, 13, 85, 1105, 0),
(71, 27, 1, 1, 100, 100, 0),
(72, 27, 2, 10, 10, 100, 0),
(73, 27, 4, 10, 100, 1000, 0),
(74, 27, 8, 13, 85, 1105, 0),
(75, 28, 4, 10, 100, 100, 900),
(76, 28, 8, 13, 85, 110.5, 994.5),
(77, 28, 11, 101, 100, 1010, 9090);

--
-- Index pour les tables exportées
--

--
-- Index pour la table `devis_article`
--
ALTER TABLE `devis_article`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `devis_article`
--
ALTER TABLE `devis_article`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
