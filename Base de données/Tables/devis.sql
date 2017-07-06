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
-- Structure de la table `devis`
--

CREATE TABLE `devis` (
  `ID` int(11) NOT NULL,
  `ID_User` int(11) NOT NULL,
  `Societe` varchar(500) NOT NULL,
  `Date_Creation` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Facture` tinyint(1) NOT NULL DEFAULT '0',
  `Date_Facture` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `Date_Validity` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `Siret` varchar(500) NOT NULL,
  `Tel` varchar(250) NOT NULL,
  `Fax` varchar(250) NOT NULL,
  `Email` varchar(500) NOT NULL,
  `Adresse` varchar(5000) NOT NULL,
  `CP` varchar(250) NOT NULL,
  `Ville` varchar(500) NOT NULL,
  `Nom` varchar(500) NOT NULL,
  `Prenom` varchar(500) NOT NULL,
  `Prix` double NOT NULL,
  `Reduction` double NOT NULL,
  `Prix_final` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `devis`
--

INSERT INTO `devis` (`ID`, `ID_User`, `Societe`, `Date_Creation`, `Facture`, `Date_Facture`, `Date_Validity`, `Siret`, `Tel`, `Fax`, `Email`, `Adresse`, `CP`, `Ville`, `Nom`, `Prenom`, `Prix`, `Reduction`, `Prix_final`) VALUES
(1, 1, 'test', '2017-06-14 09:06:05', 0, '0000-00-00 00:00:00', '2017-09-12 09:06:05', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 130, 13, 117),
(2, 1, 'test', '2017-06-14 09:06:10', 0, '0000-00-00 00:00:00', '2017-09-12 09:06:10', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 130, 13, 117),
(3, 1, 'test', '2017-06-14 09:07:17', 0, '0000-00-00 00:00:00', '2017-09-12 09:07:17', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 130, 13, 117),
(4, 1, 'test', '2017-06-14 09:10:29', 0, '0000-00-00 00:00:00', '2017-09-12 09:10:29', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 130, 13, 117),
(5, 1, 'test', '2017-06-14 09:10:52', 0, '0000-00-00 00:00:00', '2017-09-12 09:10:52', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 130, 13, 117),
(6, 1, 'test', '2017-06-14 09:12:14', 0, '0000-00-00 00:00:00', '2017-09-12 09:12:14', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 130, 13, 117),
(7, 1, 'test', '2017-06-14 09:12:49', 0, '0000-00-00 00:00:00', '2017-09-12 09:12:49', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 130, 13, 117),
(8, 1, 'test', '2017-06-14 09:28:31', 0, '0000-00-00 00:00:00', '2017-09-12 09:28:31', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 130, 13, 117),
(9, 1, 'YRDY', '2017-06-14 09:34:42', 0, '0000-00-00 00:00:00', '2017-09-12 09:34:42', 'RYYREH', '0102030405', '0102030405', 'test@test.com', 'FRFR', '95270', 'seugy', 'test', 'test', 130, 13, 117),
(10, 1, 'YRDY', '2017-06-14 15:33:28', 0, '0000-00-00 00:00:00', '2017-09-12 15:33:28', 'cddccdc', '0102030405', '102030405', 'test@test.com', 'FRFR', '95270', 'seugy', 'test', 'test', 130, 383, 3447),
(11, 1, 'YRDY', '2017-06-14 15:44:21', 0, '0000-00-00 00:00:00', '2017-09-12 15:44:21', 'dedede', '0102030405', '102030405', 'test@test.com', 'FRFR', '95270', 'seugy', 'test', 'test', 3830, 383, 3447),
(12, 1, 'test', '2017-06-15 15:14:11', 0, '0000-00-00 00:00:00', '2017-09-13 15:14:11', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 3830, 383, 3447),
(13, 1, 'test', '2017-06-15 15:19:54', 0, '0000-00-00 00:00:00', '2017-09-13 15:19:54', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 3930, 393, 3537),
(14, 1, 'test', '2017-06-15 18:41:26', 0, '0000-00-00 00:00:00', '2017-09-13 18:41:26', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 4130, 413, 3717),
(15, 3, 'SGDBF', '2017-06-19 14:57:15', 0, '0000-00-00 00:00:00', '2017-09-17 14:57:15', '', '0658888995', '', 'pierre.mehu@saint-gobain.com', '23 Rue des Ardennes', '75019', 'Paris', 'Mehu', 'Pierre', 3044, 304.4, 2739.6),
(19, 3, 'ESGI', '2017-06-22 09:09:16', 0, '0000-00-00 00:00:00', '2017-09-20 09:09:16', 'Reseau-GES', '0140863647', '0137463829', 'ecolesgi@educ.fr', '242 Rue du Faubourg Saint-Antoine', '75012', 'Paris', 'Dupont', 'Jean', 1076, 0, 1076),
(20, 4, 'Societe de test', '2017-06-22 09:54:51', 0, '0000-00-00 00:00:00', '2017-09-20 09:54:51', '', '0130354877', '130354877', 'test@test.com', '50 rue henri farman', '93290', 'Tremblay en france', 'Machin', 'Jean', 1120, 1108.8, 11.2),
(21, 4, 'Societe de test', '2017-06-22 09:55:17', 0, '0000-00-00 00:00:00', '2017-09-20 09:55:17', '', '0130354877', '130354877', 'test@test.com', '50 rue henri farman', '93290', 'Tremblay en france', 'Machin', 'Jean', 1120, 1108.8, 11.2),
(23, 4, '1994', '2017-06-30 20:27:36', 0, '0000-00-00 00:00:00', '2017-09-28 20:27:36', '', '0679251965', '679251965', 'robinpauquet@gmail.com', '12 Hemenway St, 46', '02115', 'Boston', 'Pauquet', 'Robin', 12445, 12320.55, 124.45),
(24, 4, 'test', '2017-07-01 04:19:11', 0, '0000-00-00 00:00:00', '2017-09-29 04:19:11', '', '0102030405', '', 'test@test.com', '1 rue du test', '95270', 'seugy', 'mo', 'moi', 2205, 2182.95, 22.05),
(25, 4, 'test', '2017-07-01 04:21:26', 0, '0000-00-00 00:00:00', '2017-09-29 04:21:26', '', '', '', 'test@test.com', '', '', '', 'test', 'test', 2205, 2182.95, 22.05),
(26, 4, '1994', '2017-07-03 14:01:20', 0, '0000-00-00 00:00:00', '2017-10-01 14:01:20', '', '0679251965', '679251965', 'robinpauquet@gmail.com', '12 Hemenway St, 46', '02115', 'Boston', 'Pauquet', 'Robin', 2305, 2305, 0),
(27, 4, 'Societe de test', '2017-07-03 14:03:59', 0, '0000-00-00 00:00:00', '2017-10-01 14:03:59', '', '0130354877', '130354877', 'test@test.com', '50 rue henri farman', '93290', 'Tremblay en france', 'Machin', 'Jean', 2305, 2305, 0),
(28, 4, 'WebApp', '2017-07-03 22:22:40', 0, '0000-00-00 00:00:00', '2017-10-01 22:22:40', '', '0102030405', '', 'test@tecknologiks.com', '1 rue de l\'ESGI', '75012', 'Paris', 'MEHU', 'Pierre', 12205, 1220.5, 10984.5);

--
-- Index pour les tables exportées
--

--
-- Index pour la table `devis`
--
ALTER TABLE `devis`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `devis`
--
ALTER TABLE `devis`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
