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
-- Structure de la table `article_details`
--

CREATE TABLE `article_details` (
  `ID_Article` int(11) NOT NULL,
  `W` int(11) DEFAULT NULL,
  `K` int(11) DEFAULT NULL,
  `Lm` int(11) DEFAULT NULL,
  `LmW` double DEFAULT NULL,
  `F` int(11) DEFAULT NULL,
  `V` int(11) DEFAULT NULL,
  `IRC` int(11) DEFAULT NULL,
  `H` int(11) DEFAULT NULL,
  `Longueur` int(11) DEFAULT NULL,
  `Largeur` int(11) DEFAULT NULL,
  `Profondeur` int(11) DEFAULT NULL,
  `Poids` double DEFAULT NULL,
  `Min` int(11) DEFAULT NULL,
  `Max` int(11) DEFAULT NULL,
  `DEEE` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
