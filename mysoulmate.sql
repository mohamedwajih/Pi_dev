-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Jeu 08 Février 2018 à 08:02
-- Version du serveur :  5.6.17
-- Version de PHP :  5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données :  `mysoulmate`
--

-- --------------------------------------------------------

--
-- Structure de la table `event`
--

CREATE TABLE IF NOT EXISTS `event` (
  `id_event` int(11) NOT NULL AUTO_INCREMENT,
  `titre_event` varchar(50) NOT NULL,
  `type_event` varchar(50) NOT NULL,
  `texte_event` varchar(250) NOT NULL,
  `date_event` datetime NOT NULL,
  `lieu_event` varchar(50) NOT NULL,
  `id_user_event` int(11) NOT NULL,
  PRIMARY KEY (`id_event`),
  KEY `fk_userev` (`id_user_event`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=16 ;

--
-- Contenu de la table `event`
--

INSERT INTO `event` (`id_event`, `titre_event`, `type_event`, `texte_event`, `date_event`, `lieu_event`, `id_user_event`) VALUES
(4, 'Soirée', 'Soirée Saint-Valentin', 'Saint-Valentin à Hôtel Lella Baya-Hammamet ', '2018-02-14 00:00:00', 'Hammamet ', 1),
(5, 'Comping', 'Comping', 'Comping', '2018-03-30 00:00:00', 'Beja ', 1),
(6, 'match football', 'Sport', 'match football', '2018-06-05 00:00:00', 'Tunis ', 1),
(7, 'Soirée', 'Soirée Saint-Valentin', 'Saint-Valentin à Hôtel Lella Baya-Hammamet ', '2018-02-14 00:00:00', 'Hammamet ', 1),
(8, 'Comping', 'Comping', 'Comping', '2018-03-30 00:00:00', 'Beja ', 1),
(9, 'match football', 'Sport', 'match football', '2018-06-05 00:00:00', 'Tunis ', 1),
(10, 'Soirée', 'Soirée Saint-Valentin', 'Saint-Valentin à Hôtel Lella Baya-Hammamet ', '2018-02-14 00:00:00', 'Hammamet ', 1),
(11, 'Comping', 'Comping', 'Comping', '2018-03-30 00:00:00', 'Beja ', 1),
(12, 'match football', 'Sport', 'match football', '2018-06-05 00:00:00', 'Tunis ', 1),
(13, 'Soirée', 'Soirée Saint-Valentin', 'Saint-Valentin à Hôtel Lella Baya-Hammamet ', '2018-02-14 00:00:00', 'Hammamet ', 1),
(14, 'Comping', 'Comping', 'Comping', '2018-03-30 00:00:00', 'Beja ', 1),
(15, 'match football', 'Sport', 'match football', '2018-06-05 00:00:00', 'Tunis ', 1);

-- --------------------------------------------------------

--
-- Structure de la table `notification`
--

CREATE TABLE IF NOT EXISTS `notification` (
  `id_notification` int(11) NOT NULL AUTO_INCREMENT,
  `type_notification` varchar(50) NOT NULL,
  `texte_notification` varchar(50) NOT NULL,
  `date_notification` datetime NOT NULL,
  `id_user_notif` int(11) NOT NULL,
  `etat_notif` int(11) NOT NULL,
  PRIMARY KEY (`id_notification`),
  KEY `fk_usernot` (`id_user_notif`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Contenu de la table `notification`
--

INSERT INTO `notification` (`id_notification`, `type_notification`, `texte_notification`, `date_notification`, `id_user_notif`, `etat_notif`) VALUES
(6, 'Event', ' Saint-Valentin ', '2018-02-14 00:00:00', 1, 0);

-- --------------------------------------------------------

--
-- Structure de la table `typeevent`
--

CREATE TABLE IF NOT EXISTS `typeevent` (
  `name_type` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `typeevent`
--

INSERT INTO `typeevent` (`name_type`) VALUES
('Randonnée'),
('camping'),
('international'),
('local'),
('personnel'),
('soirée');

-- --------------------------------------------------------

--
-- Structure de la table `typenotif`
--

CREATE TABLE IF NOT EXISTS `typenotif` (
  `name_type` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `typenotif`
--

INSERT INTO `typenotif` (`name_type`) VALUES
('matching'),
('event'),
('like'),
('message'),
('RDV');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `idUser` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) NOT NULL,
  `prenom` varchar(50) NOT NULL,
  `age` int(11) NOT NULL,
  `login` varchar(50) NOT NULL,
  `mdp` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `role` enum('admin','utilisateur','internaute','responsableEvent') NOT NULL,
  `sexe` varchar(50) NOT NULL,
  `numTel` int(11) NOT NULL,
  `photoDeProfil` varchar(50) NOT NULL,
  `adresse` varchar(100) NOT NULL,
  PRIMARY KEY (`idUser`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Contenu de la table `users`
--

INSERT INTO `users` (`idUser`, `nom`, `prenom`, `age`, `login`, `mdp`, `email`, `role`, `sexe`, `numTel`, `photoDeProfil`, `adresse`) VALUES
(1, 'Garaali', 'Asma', 26, 'AsmaGaraali', 'asma', 'aaa.aaa@gmail.com', 'responsableEvent', 'femme', 2222222, 'hhhhhhhhhhhhhhhhh', 'tunis');

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `event`
--
ALTER TABLE `event`
  ADD CONSTRAINT `fk_userev` FOREIGN KEY (`id_user_event`) REFERENCES `users` (`idUser`) ON DELETE CASCADE;

--
-- Contraintes pour la table `notification`
--
ALTER TABLE `notification`
  ADD CONSTRAINT `fk_usernot` FOREIGN KEY (`id_user_notif`) REFERENCES `users` (`idUser`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
