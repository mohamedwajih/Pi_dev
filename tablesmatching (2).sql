-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  Dim 11 fév. 2018 à 14:37
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
-- Structure de la table `matching`
--

DROP TABLE IF EXISTS `matching`;
CREATE TABLE IF NOT EXISTS `matching` (
  `idUser1` int(20) NOT NULL,
  `idUser2` int(20) NOT NULL,
  `pourcentage` int(20) NOT NULL,
  PRIMARY KEY (`idUser1`,`idUser2`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

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
  KEY `fk1` (`idUser`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `personnalite`
--

INSERT INTO `personnalite` (`idUser`, `nerveux`, `attirant`, `sensible`, `romantique`, `sportif`, `artiste`, `musicien`, `famille`, `actif`, `sociable`, `fidele`, `soigne`, `genereux`, `ambitieux`, `jaloux`, `serieux`, `drole`, `materialiste`, `tolerant`, `aventurier`) VALUES
(1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1);

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
  KEY `fk1` (`idUser`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `preference`
--

INSERT INTO `preference` (`idUser`, `nerveux`, `attirant`, `sensible`, `romantique`, `sportif`, `artiste`, `musicien`, `famille`, `actif`, `sociable`, `fidele`, `soigne`, `genereux`, `ambitieux`, `jaloux`, `serieux`, `drole`, `materialiste`, `tolerant`, `aventurier`) VALUES
(2, 90, 2, 28, 2, 2, 1, 2, 2, 85, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2);

-- --------------------------------------------------------

--
-- Structure de la table `question`
--

DROP TABLE IF EXISTS `question`;
CREATE TABLE IF NOT EXISTS `question` (
  `question` varchar(250) NOT NULL,
  `trait` enum('nerveux','attirant','sensible','romantique','sportif','artiste','musicien','famille','actif','sociable','fidele','soigne','genereux','ambitieux','jaloux','serieux','drole','materialiste','tolerant','aventurier') NOT NULL,
  `reponse1` varchar(250) NOT NULL,
  `reponse2` varchar(250) NOT NULL,
  `reponse3` varchar(250) NOT NULL,
  PRIMARY KEY (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`idUser`, `nom`, `prenom`, `age`, `login`, `mdp`, `email`, `role`, `sexe`, `numTel`, `photoDeProfil`, `adresse`) VALUES
(1, 'Essafi', 'fatma', 21, 'fatma', 'fatmafatma', 'fatma', 'admin', 'F', 55271016, 'aaa', 'aaaa'),
(2, 'hamza', 'wajih', 23, 'medwajih', '1282659999', 'med', 'admin', 'M', 22222, 'aaaaaaaaaa', 'aaaaaaaaaaaaa');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
