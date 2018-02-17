-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  sam. 17 fév. 2018 à 22:41
-- Version du serveur :  5.7.19
-- Version de PHP :  5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `mysoulmate`
--

-- --------------------------------------------------------

--
-- Structure de la table `amis`
--

DROP TABLE IF EXISTS `amis`;
CREATE TABLE IF NOT EXISTS `amis` (
  `id_u1` int(11) NOT NULL,
  `id_u2` int(11) NOT NULL,
  `etat` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `amis`
--

INSERT INTO `amis` (`id_u1`, `id_u2`, `etat`) VALUES
(1, 2, 1),
(1, 4, 1),
(1, 5, 1),
(1, 3, 1);

-- --------------------------------------------------------

--
-- Structure de la table `event`
--

DROP TABLE IF EXISTS `event`;
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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `event`
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
-- Structure de la table `fos_user`
--

DROP TABLE IF EXISTS `fos_user`;
CREATE TABLE IF NOT EXISTS `fos_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `username_canonical` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `email_canonical` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `enabled` tinyint(1) DEFAULT NULL,
  `salt` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `locked` tinyint(1) DEFAULT NULL,
  `expired` tinyint(1) DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  `confirmation_token` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `password_requested_at` datetime DEFAULT NULL,
  `roles` enum('admin','utilisateur','internaute','responsableEvent') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Typearray)',
  `credentials_expired` tinyint(1) DEFAULT NULL,
  `credentials_expire_at` datetime DEFAULT NULL,
  `nom` varchar(50) NOT NULL,
  `prenom` varchar(50) NOT NULL,
  `age` int(11) NOT NULL,
  `sexe` varchar(20) NOT NULL,
  `num_tel` int(11) NOT NULL,
  `photo_de_profil` varchar(1000) NOT NULL,
  `date_de_naissance` date NOT NULL,
  `adresse` varchar(250) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_canonical` (`email_canonical`),
  UNIQUE KEY `username_canonical` (`username_canonical`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `fos_user`
--

INSERT INTO `fos_user` (`id`, `username`, `username_canonical`, `email`, `email_canonical`, `enabled`, `salt`, `password`, `last_login`, `locked`, `expired`, `expires_at`, `confirmation_token`, `password_requested_at`, `roles`, `credentials_expired`, `credentials_expire_at`, `nom`, `prenom`, `age`, `sexe`, `num_tel`, `photo_de_profil`, `date_de_naissance`, `adresse`) VALUES
(1, 'fatma', 'fatma', 'fatma.essafi@esprit.tn', 'fatma.essafi@esprit.tn', 1, NULL, '', NULL, NULL, NULL, NULL, NULL, '2018-02-16 00:00:00', 'utilisateur', NULL, NULL, 'fatma', 'essafi', 21, 'femme', 52698745, 'fdsfdsfdsfsd.jpg', '2018-02-14', 'manzah8'),
(2, 'Nastya', NULL, 'fdsfsdfsdfdsf', NULL, NULL, NULL, 'dsdsfdsfds', NULL, NULL, NULL, NULL, NULL, NULL, 'utilisateur', NULL, NULL, 'hamdi', 'megdich', 23, 'homme', 98959, 'file:/C:/Users/asus/Documents/NetBeansProjects/Mysoulmatewajih/Ress/1.jpg', '2018-02-22', 'Ukraine'),
(3, 'Beth', NULL, 'fdsfsdfsdf@', NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'utilisateur', NULL, NULL, 'montassar', 'fdsfh', 29, 'homme', 4545, 'file:/C:/Users/asus/Documents/NetBeansProjects/Mysoulmatewajih/Ress/4.jpg', '2018-02-07', 'UK'),
(4, 'Taniya', NULL, 'fdsfnjskdhfjsdkf@esprit.tn', NULL, NULL, NULL, 'fdsfsdfsdf', NULL, NULL, NULL, NULL, NULL, NULL, 'utilisateur', NULL, NULL, 'azza', 'daghmouri', 22, 'fdsfsdf', 4545, 'file:/C:/Users/asus/Documents/NetBeansProjects/Mysoulmatewajih/Ress/2.jpg', '2018-02-06', 'Poland'),
(5, 'Maria', NULL, 'sdfdsfdsfds', NULL, NULL, NULL, 'fdsfdsfds', NULL, NULL, NULL, NULL, NULL, NULL, 'utilisateur', NULL, NULL, 'fdsfs', 'dsfsdf', 20, 'sqds', 54545, 'file:/C:/Users/asus/Documents/NetBeansProjects/Mysoulmatewajih/Ress/3.jpg', '2018-02-06', 'USA');

-- --------------------------------------------------------

--
-- Structure de la table `messages`
--

DROP TABLE IF EXISTS `messages`;
CREATE TABLE IF NOT EXISTS `messages` (
  `id_msg` int(11) NOT NULL AUTO_INCREMENT,
  `id_emet` int(11) NOT NULL,
  `id_dest` int(11) NOT NULL,
  `text` varchar(255) NOT NULL,
  `date_envoi` date NOT NULL,
  PRIMARY KEY (`id_msg`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `messages`
--

INSERT INTO `messages` (`id_msg`, `id_emet`, `id_dest`, `text`, `date_envoi`) VALUES
(66, 1, 5, 'aaaa', '2018-02-16'),
(67, 1, 2, 'aaaa', '2018-02-16'),
(68, 1, 2, 'waa', '2018-02-16'),
(69, 1, 4, 'ahla azza', '2018-02-16'),
(70, 1, 2, 'ahla', '2018-02-17'),
(71, 1, 5, 'jdifjsdfsdf', '2018-02-17'),
(72, 1, 5, 'hhhhgghghg\n', '2018-02-17');

-- --------------------------------------------------------

--
-- Structure de la table `notification`
--

DROP TABLE IF EXISTS `notification`;
CREATE TABLE IF NOT EXISTS `notification` (
  `id_notification` int(11) NOT NULL AUTO_INCREMENT,
  `type_notification` varchar(50) NOT NULL,
  `texte_notification` varchar(50) NOT NULL,
  `date_notification` datetime NOT NULL,
  `id_user_notif` int(11) NOT NULL,
  `etat_notif` int(11) NOT NULL,
  PRIMARY KEY (`id_notification`),
  KEY `fk_usernot` (`id_user_notif`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `notification`
--

INSERT INTO `notification` (`id_notification`, `type_notification`, `texte_notification`, `date_notification`, `id_user_notif`, `etat_notif`) VALUES
(6, 'Event', ' Saint-Valentin ', '2018-02-14 00:00:00', 1, 0),
(13, 'msg', 'new message', '2018-02-16 00:00:00', 2, 0),
(14, 'msg', 'new message', '2018-02-16 00:00:00', 2, 0),
(15, 'msg', 'new message', '2018-02-16 00:00:00', 4, 0),
(16, 'msg', 'new message', '2018-02-17 00:00:00', 2, 0),
(17, 'rdv', 'rdv', '2018-02-01 18:14:00', 2, 0),
(18, 'msg', 'new message', '2018-02-17 00:00:00', 5, 0),
(19, 'rdv', 'rdv', '2018-02-10 20:08:00', 4, 0),
(20, 'msg', 'new message', '2018-02-17 00:00:00', 5, 0);

-- --------------------------------------------------------

--
-- Structure de la table `places`
--

DROP TABLE IF EXISTS `places`;
CREATE TABLE IF NOT EXISTS `places` (
  `id_place` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(255) NOT NULL,
  `adr` varchar(255) NOT NULL,
  `photo` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  PRIMARY KEY (`id_place`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `places`
--

INSERT INTO `places` (`id_place`, `libelle`, `adr`, `photo`, `type`) VALUES
(1, 'Belvidere', 'Centre ville', 'file:/C:/wamp64/www/place_images/belvedere-1.jpg', 'Nature'),
(2, 'Cinema colisée', 'avenue hbib bourgiba', 'file:/C:/wamp64/www/place_images/cinema_colisse.jpg', 'Culturel'),
(3, 'musée bardo', 'bardo', 'file:/C:/wamp64/www/place_images/les-lieux-saints-partages-en-debat-au-musee-du-bardo.jpg', 'Culturel'),
(4, 'Parcours de santé', 'manzah 1', 'file:/C:/wamp64/www/place_images/parcours menzah.JPG', 'Sport'),
(8, 'Yuka', 'gammarth', 'file:/C:/wamp64/www/place_images/yukaopenair.jpg', 'Fête');

-- --------------------------------------------------------

--
-- Structure de la table `rdv`
--

DROP TABLE IF EXISTS `rdv`;
CREATE TABLE IF NOT EXISTS `rdv` (
  `id_1` int(11) NOT NULL,
  `id_2` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `id_lieu` int(11) NOT NULL,
  `etat` int(11) NOT NULL,
  KEY `fk_lieu` (`id_lieu`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `rdv`
--

INSERT INTO `rdv` (`id_1`, `id_2`, `date`, `id_lieu`, `etat`) VALUES
(1, 2, '2018-03-15 21:07:00', 3, 0),
(1, 4, '2019-03-15 21:21:00', 3, 0),
(1, 5, '2018-02-11 10:21:00', 1, 0),
(1, 4, '2018-02-01 17:17:00', 1, 0),
(1, 4, '2018-02-24 17:10:00', 1, 0),
(1, 2, '2018-02-23 17:13:00', 1, 0),
(1, 2, '2018-02-23 16:15:00', 1, 0),
(1, 2, '2018-02-01 18:14:00', 1, 0),
(1, 4, '2018-02-10 20:08:00', 1, 0);

-- --------------------------------------------------------

--
-- Structure de la table `typeevent`
--

DROP TABLE IF EXISTS `typeevent`;
CREATE TABLE IF NOT EXISTS `typeevent` (
  `name_type` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `typeevent`
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

DROP TABLE IF EXISTS `typenotif`;
CREATE TABLE IF NOT EXISTS `typenotif` (
  `name_type` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `typenotif`
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

DROP TABLE IF EXISTS `users`;
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`idUser`, `nom`, `prenom`, `age`, `login`, `mdp`, `email`, `role`, `sexe`, `numTel`, `photoDeProfil`, `adresse`) VALUES
(1, 'Garaali', 'Asma', 26, 'AsmaGaraali', 'asma', 'aaa.aaa@gmail.com', 'responsableEvent', 'femme', 2222222, 'hhhhhhhhhhhhhhhhh', 'tunis');

--
-- Contraintes pour les tables déchargées
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
  ADD CONSTRAINT `fk_usernot` FOREIGN KEY (`id_user_notif`) REFERENCES `fos_user` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
