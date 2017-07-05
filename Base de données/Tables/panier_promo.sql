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
-- Structure de la table `panier_promo`
--

CREATE TABLE `panier_promo` (
  `ID` int(11) NOT NULL,
  `ID_User` int(11) NOT NULL,
  `ID_Promo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `panier_promo`
--

INSERT INTO `panier_promo` (`ID`, `ID_User`, `ID_Promo`) VALUES
(38, 3, 26),
(40, 4, 1);

--
-- Index pour les tables exportées
--

--
-- Index pour la table `panier_promo`
--
ALTER TABLE `panier_promo`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `user_and_promo` (`ID_User`,`ID_Promo`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `panier_promo`
--
ALTER TABLE `panier_promo`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
