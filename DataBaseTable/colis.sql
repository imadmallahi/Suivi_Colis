-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le :  mar. 24 sep. 2019 à 17:19
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
-- Structure de la table `colis`
--

CREATE TABLE `colis` (
  `id` int(11) NOT NULL,
  `nature` varchar(100) NOT NULL,
  `poids` varchar(11) NOT NULL,
  `id_commande` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `colis`
--

INSERT INTO `colis` (`id`, `nature`, `poids`, `id_commande`) VALUES
(18, '20', '20', 17),
(19, '20', '20', 17),
(20, '20', '20', 17),
(21, '20', '20', 17),
(22, 'Colis', '12', 18),
(23, 'Colis', '23', 18),
(24, 'Colis', '23', 18),
(25, 'Colis', '23', 18),
(27, 'Colis', '23', 18),
(28, 'Colis', '23', 18),
(29, 'Colis', '23', 18),
(33, 'Colis', '23', 21),
(34, '', '', 21),
(35, 'Colis', '23', 22),
(36, 'Colis', '23', 23),
(37, 'Colis1', '23', 24),
(38, 'Colis2', '23', 24),
(40, 'Colis', '40', 26),
(41, 'Colis', '40', 26),
(42, 'COLIS', '60', 27),
(43, 'COLIS', '4O', 27),
(44, 'Colis', '23', 28),
(45, 'Colis', '23', 29),
(46, 'Argent', '4O', 30),
(47, 'Colis', '398', 31),
(48, 'Colis', '398', 32),
(49, 'Argent', '4O', 33),
(50, 'Argent', '4O', 34),
(51, 'Cols', '34', 35),
(52, '9', '9', 37),
(53, '11', '11', 38),
(54, '9', '9', 38),
(55, '7', '7', 39),
(56, '9', '9', 40),
(57, 'Argent', '350', 42),
(58, 'Colis', '150 dh', 42),
(59, 'Argent', '250', 42),
(60, 'Colis', '750', 43),
(61, 'Argent', '450', 43),
(62, 'Argent', '550', 43),
(63, 'Argent', '700', 44),
(64, 'Colis', '550', 44),
(65, 'Argent', '550', 44),
(66, 'Argent', '550', 44),
(67, 'Colis', '550', 44);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `colis`
--
ALTER TABLE `colis`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `colis`
--
ALTER TABLE `colis`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
