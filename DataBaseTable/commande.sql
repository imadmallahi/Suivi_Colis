-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le :  mar. 24 sep. 2019 à 17:18
-- Version du serveur :  10.4.6-MariaDB
-- Version de PHP :  7.1.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `liraki`
--

-- --------------------------------------------------------

--
-- Structure de la table `commande`
--

CREATE TABLE `commande` (
  `id` int(11) NOT NULL,
  `num_agent` varchar(200) NOT NULL,
  `num_adherent` varchar(200) NOT NULL,
  `montant_total` varchar(11) NOT NULL,
  `etat` varchar(20) NOT NULL,
  `idSuperviseur` int(11) NOT NULL,
  `idDistributeur` int(11) NOT NULL DEFAULT 0,
  `idAgentDistination` int(11) NOT NULL,
  `point_depart` varchar(250) DEFAULT NULL,
  `point_destination` varchar(250) DEFAULT NULL,
  `emplacement` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `commande`
--

INSERT INTO `commande` (`id`, `num_agent`, `num_adherent`, `montant_total`, `etat`, `idSuperviseur`, `idDistributeur`, `idAgentDistination`, `point_depart`, `point_destination`, `emplacement`) VALUES
(10, '5', '5', '5', '', 0, 0, 0, NULL, NULL, NULL),
(12, '9', '9', '9', '', 0, 0, 0, NULL, NULL, NULL),
(13, '1', '9', '9', 'effectue', 0, 0, 1, NULL, NULL, NULL),
(15, '26', '12', '12', 'en attente', 0, 0, 12, NULL, NULL, NULL),
(17, '1', '100', '100', 'effectue', 0, 1, 1, NULL, NULL, NULL),
(18, '', '3', '0000', 'effectue', 0, 0, 1, NULL, NULL, NULL),
(21, '1 ', '1', '1000', 'effectue', 1, 1, 26, NULL, NULL, NULL),
(22, '', '1', '8888', 'en route', 1, 1, 26, NULL, NULL, NULL),
(23, '', '1', '000000', 'en route', 1, 1, 2, NULL, NULL, NULL),
(24, '1 ', '1', '20000', 'en attente', 1, 1, 1, NULL, NULL, NULL),
(26, '1 ', '1', '10000', 'effectue', 1, 1, 1, NULL, NULL, NULL),
(27, '1 ', '1', '4000', 'effectue', 1, 1, 1, NULL, NULL, NULL),
(28, '1 ', '1', '8000', 'en attente', 1, 1, 26, NULL, NULL, NULL),
(29, '1 ', '1', '9000', 'effectue', 1, 1, 26, NULL, NULL, NULL),
(30, '1 ', '1', '99999', 'en route', 1, 1, 26, NULL, NULL, NULL),
(32, '1 ', '1', '988466', 'en route', 1, 1, 16, NULL, NULL, NULL),
(33, '1 ', '1', '7777', 'en route', 1, 1, 777, NULL, NULL, NULL),
(34, '1 ', '1', '1234', 'en route', 1, 1, 26, NULL, NULL, NULL),
(35, '1 ', '87', '123', 'en attente', 1, 1, 26, NULL, NULL, NULL),
(36, '11', ' -- ', '9', 'en attente', 1, 0, 9, NULL, NULL, NULL),
(37, '11', ' -- ', '7', 'en attente', 1, 0, 7, NULL, NULL, NULL),
(38, '11', ' -- ', '7', 'en attente', 1, 0, 7, NULL, NULL, NULL),
(39, ' --- ', ' -- ', '-1', 'en attente', -1, 0, 0, NULL, NULL, NULL),
(40, '11', ' -- ', '77', 'en attente', 1, 0, 77, NULL, NULL, NULL),
(41, '1', '123', '250', 'en attente', 1, 0, 1, 'agence', 'adarissa', 'Agence départ'),
(42, '6', '12', '450', 'en attente', 1, 0, 6, 'agence', 'taha', 'Agence départ'),
(43, '12', '12548', '150', 'en attente', 1, 0, 12, 'agence', 'point de destination', 'Agence départ'),
(44, '11', '147', '550', 'en attente', 1, 0, 18, 'agence', 'maison 2', 'Agence départ'),
(45, '11', '', '', 'en attente', 1, 0, 1, 'agence', '', 'Agence départ'),
(46, '11', '', '', 'en attente', 1, 0, 1, 'agence', '', 'Agence départ'),
(47, '11', '', '', 'en attente', 1, 0, 1, 'agence', '', 'Agence départ'),
(48, '11', '', '', 'en attente', 1, 0, 1, 'agence', '', 'Agence départ');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `commande`
--
ALTER TABLE `commande`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `commande`
--
ALTER TABLE `commande`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
