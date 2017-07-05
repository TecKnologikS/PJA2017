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
-- Structure de la table `devis_promo`
--

CREATE TABLE `devis_promo` (
  `ID` int(11) NOT NULL,
  `ID_Devis` int(11) NOT NULL,
  `ID_Promo` double NOT NULL,
  `Reduction` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `devis_promo`
--

INSERT INTO `devis_promo` (`ID`, `ID_Devis`, `ID_Promo`, `Reduction`) VALUES
(1, 3, 1, 13),
(2, 4, 1, 13),
(3, 5, 1, 13),
(4, 6, 1, 13),
(5, 7, 1, 13),
(6, 8, 1, 13),
(7, 9, 1, 13),
(8, 10, 1, 383),
(9, 11, 1, 383),
(10, 12, 1, 383),
(11, 13, 1, 393),
(12, 14, 1, 413),
(13, 15, 11, 304),
(14, 20, 27, 1109),
(15, 21, 27, 1109),
(16, 22, 33, 0),
(17, 23, 27, 12321),
(18, 24, 36, 2183),
(19, 25, 36, 2183),
(20, 26, 39, 2305),
(21, 27, 25, 2305),
(22, 28, 1, 1221);

--
-- Index pour les tables exportées
--

--
-- Index pour la table `devis_promo`
--
ALTER TABLE `devis_promo`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `devis_promo`
--
ALTER TABLE `devis_promo`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
