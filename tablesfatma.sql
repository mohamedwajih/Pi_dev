-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  lun. 12 fév. 2018 à 13:50
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `fos_user`
--

INSERT INTO `fos_user` (`id`, `username`, `username_canonical`, `email`, `email_canonical`, `enabled`, `salt`, `password`, `last_login`, `locked`, `expired`, `expires_at`, `confirmation_token`, `password_requested_at`, `roles`, `credentials_expired`, `credentials_expire_at`, `nom`, `prenom`, `age`, `sexe`, `num_tel`, `photo_de_profil`, `date_de_naissance`, `adresse`) VALUES
(1, 'fatmaessafi', NULL, 'fatma.essafi@esprit.tn', NULL, NULL, NULL, 'fatmafatma', NULL, NULL, NULL, NULL, NULL, NULL, 'admin', NULL, NULL, 'Essafi', 'Fatma', 21, 'F', 55271016, 'fatma.png', '1996-10-27', 'Menzah 8\r\n'),
(2, 'wajihhamza', NULL, 'mohamedwajih.hamza@esprit.tn', NULL, NULL, NULL, '1282659', NULL, NULL, NULL, NULL, NULL, NULL, 'admin', NULL, NULL, 'Hamza', 'Mohamed Wajih', 23, 'M', 52392540, 'wajih.png', '1994-09-16', 'Rades Meliane');

-- --------------------------------------------------------

--
-- Structure de la table `matching`
--

DROP TABLE IF EXISTS `matching`;
CREATE TABLE IF NOT EXISTS `matching` (
  `idUser1` int(20) NOT NULL,
  `idUser2` int(20) NOT NULL,
  `pourcentage` int(20) NOT NULL,
  PRIMARY KEY (`idUser1`,`idUser2`),
  KEY `fk_matching2` (`idUser2`),
  KEY `fk_matching1` (`idUser1`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `personnalite`
--

DROP TABLE IF EXISTS `personnalite`;
CREATE TABLE IF NOT EXISTS `personnalite` (
  `idUser` int(20) NOT NULL,
  `nerveux` int(20) DEFAULT NULL,
  `attirant` int(20) DEFAULT NULL,
  `sensible` int(20) DEFAULT NULL,
  `romantique` int(20) DEFAULT NULL,
  `sportif` int(20) DEFAULT NULL,
  `artiste` int(20) DEFAULT NULL,
  `musicien` int(20) DEFAULT NULL,
  `famille` int(20) DEFAULT NULL,
  `actif` int(20) DEFAULT NULL,
  `sociable` int(20) DEFAULT NULL,
  `fidele` int(20) DEFAULT NULL,
  `soigne` int(20) DEFAULT NULL,
  `genereux` int(20) DEFAULT NULL,
  `ambitieux` int(20) DEFAULT NULL,
  `jaloux` int(20) DEFAULT NULL,
  `serieux` int(20) DEFAULT NULL,
  `drole` int(20) DEFAULT NULL,
  `materialiste` int(20) DEFAULT NULL,
  `tolerant` int(20) DEFAULT NULL,
  `aventurier` int(20) DEFAULT NULL,
  PRIMARY KEY (`idUser`),
  KEY `fk_personnalite` (`idUser`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `preference`
--

DROP TABLE IF EXISTS `preference`;
CREATE TABLE IF NOT EXISTS `preference` (
  `idUser` int(20) NOT NULL,
  `nerveux` int(20) NOT NULL,
  `attirant` int(20) NOT NULL,
  `sensible` int(20) NOT NULL,
  `romantique` int(20) NOT NULL,
  `sportif` int(20) NOT NULL,
  `artiste` int(20) NOT NULL,
  `musicien` int(20) NOT NULL,
  `famille` int(20) NOT NULL,
  `actif` int(20) NOT NULL,
  `sociable` int(20) NOT NULL,
  `fidele` int(20) NOT NULL,
  `soigne` int(20) NOT NULL,
  `genereux` int(20) NOT NULL,
  `ambitieux` int(20) NOT NULL,
  `jaloux` int(20) NOT NULL,
  `serieux` int(20) NOT NULL,
  `drole` int(20) NOT NULL,
  `materialiste` int(20) NOT NULL,
  `tolerant` int(20) NOT NULL,
  `aventurier` int(20) NOT NULL,
  PRIMARY KEY (`idUser`),
  KEY `fk_preference` (`idUser`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `question`
--

DROP TABLE IF EXISTS `question`;
CREATE TABLE IF NOT EXISTS `question` (
  `idQuestion` int(20) NOT NULL AUTO_INCREMENT,
  `question` varchar(250) NOT NULL,
  `trait` enum('nerveux','attirant','sensible','romantique','sportif','artiste','musicien','famille','actif','sociable','fidele','soigne','genereux','ambitieux','jaloux','serieux','drole','materialiste','tolerant','aventurier') NOT NULL,
  `reponse1` varchar(250) NOT NULL,
  `reponse2` varchar(250) NOT NULL,
  `reponse3` varchar(250) NOT NULL,
  PRIMARY KEY (`idQuestion`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `question`
--

INSERT INTO `question` (`idQuestion`, `question`, `trait`, `reponse1`, `reponse2`, `reponse3`) VALUES
(1, 'Comment vous trouvez vous physiquement?', 'attirant', 'Beau', 'Normal', 'Moche'),
(2, 'Votre corpulence est elle :', 'attirant', 'Forte', 'Maigre', 'Musclée'),
(3, 'Pratiquez vous du sport?', 'sportif', 'Régulièrement', 'Rarement', 'Jamais'),
(4, 'Que mangez vous le plus?', 'sportif', 'Des légumes et de la viande', 'Beaucoup de junk food plein de gras et de sucre', 'Ca dépend des jours'),
(5, 'Que préférez vous le samedi soir?', 'sportif', 'Aller faire la fête ou sortir manger au resto ', 'Regarder un match de foot', 'Aller à salle de musculation');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `matching`
--
ALTER TABLE `matching`
  ADD CONSTRAINT `fk_matching1` FOREIGN KEY (`idUser1`) REFERENCES `fos_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_matching2` FOREIGN KEY (`idUser2`) REFERENCES `fos_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `personnalite`
--
ALTER TABLE `personnalite`
  ADD CONSTRAINT `fk_personnalite` FOREIGN KEY (`idUser`) REFERENCES `fos_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `preference`
--
ALTER TABLE `preference`
  ADD CONSTRAINT `fk_preference` FOREIGN KEY (`idUser`) REFERENCES `fos_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
