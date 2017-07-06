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
-- Structure de la table `promocode`
--

CREATE TABLE `promocode` (
  `ID` int(11) NOT NULL,
  `Nom` varchar(500) NOT NULL,
  `Code` varchar(50) NOT NULL,
  `Reduction` int(11) NOT NULL,
  `Minimum` int(11) NOT NULL,
  `Type` int(11) NOT NULL,
  `Catégorie` int(11) NOT NULL DEFAULT '0',
  `Validity` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `promocode`
--

INSERT INTO `promocode` (`ID`, `Nom`, `Code`, `Reduction`, `Minimum`, `Type`, `Catégorie`, `Validity`) VALUES
(1, '10% sur tout des 10€', 'COM10', 10, 10, 1, 0, '2018-06-07 13:54:39'),
(2, '30% sur tout des 10€', 'COM30', 30, 10, 1, 0, '2018-06-07 13:54:39'),
(25, 'Remboursement', 'SPE_Remb', 100, 1, 1, 0, '2017-07-16 12:51:20');

--
-- Index pour les tables exportées
--

--
-- Index pour la table `promocode`
--
ALTER TABLE `promocode`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `promocode`
--
ALTER TABLE `promocode`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
