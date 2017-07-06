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
-- Structure de la table `remise_et_commission`
--

CREATE TABLE `remise_et_commission` (
  `ID` int(11) NOT NULL,
  `Commission` int(11) NOT NULL,
  `RemiseMin` int(11) NOT NULL,
  `RemiseMax` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `remise_et_commission`
--

INSERT INTO `remise_et_commission` (`ID`, `Commission`, `RemiseMin`, `RemiseMax`) VALUES
(1, 15, 0, 10),
(2, 13, 10, 20),
(3, 11, 20, 25),
(4, 10, 25, 30),
(5, 9, 30, 35),
(6, 8, 35, 40),
(7, 7, 40, 50),
(8, 5, 50, 100);

--
-- Index pour les tables exportées
--

--
-- Index pour la table `remise_et_commission`
--
ALTER TABLE `remise_et_commission`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `remise_et_commission`
--
ALTER TABLE `remise_et_commission`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
