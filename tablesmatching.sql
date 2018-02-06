-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  mar. 06 fév. 2018 à 12:50
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
  PRIMARY KEY (`idUser1`,`idUser2`),
  KEY `fk3` (`idUser2`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `personnalite`
--

DROP TABLE IF EXISTS `personnalite`;
CREATE TABLE IF NOT EXISTS `personnalite` (
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
  KEY `fk1` (`idUser`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

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
  KEY `fk1` (`idUser`)
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
