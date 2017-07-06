-- phpMyAdmin SQL Dump
-- version 4.6.5.1
-- https://www.phpmyadmin.net/
--
-- Client :  localhost
-- Généré le :  Mer 05 Juillet 2017 à 21:21
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
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `ID` int(11) NOT NULL,
  `Login` varchar(250) NOT NULL,
  `Password` varchar(750) NOT NULL,
  `Admin` tinyint(1) NOT NULL DEFAULT '0',
  `Token` varchar(750) NOT NULL,
  `time_end_token` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `last_timestamp` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `user`
--

INSERT INTO `user` (`ID`, `Login`, `Password`, `Admin`, `Token`, `time_end_token`, `last_timestamp`) VALUES
(1, 'toto', 'tutu', 0, '9f5d85a966b60b6d7fb4a93a5fa3c0d0028fda8880e6366efd', '2017-07-04 17:10:54', '2017-04-07 12:43:37'),
(3, 'pierrot', 'pierrot', 1, 'adcc246aca8ddadb1044388117903f8af2fe567a9e3cb0027f', '2017-07-05 15:48:34', '0000-00-00 00:00:00'),
(4, 'robin', 'robin', 1, '50deace28cdc11e69c57750fe456162a445d2b49e8454dfeb6', '2017-07-05 21:04:43', '0000-00-00 00:00:00'),
(43, 'adresse_mail@gmail.com', 'mail', 1, 'bb2c0eb967b7fbccf42974f06c2baf1181920451604734d767', '2017-07-02 13:57:14', '0000-00-00 00:00:00');

--
-- Index pour les tables exportées
--

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
