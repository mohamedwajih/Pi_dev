-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  Dim 18 fév. 2018 à 16:43
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `fos_user`
--

INSERT INTO `fos_user` (`id`, `username`, `username_canonical`, `email`, `email_canonical`, `enabled`, `salt`, `password`, `last_login`, `locked`, `expired`, `expires_at`, `confirmation_token`, `password_requested_at`, `roles`, `credentials_expired`, `credentials_expire_at`, `nom`, `prenom`, `age`, `sexe`, `num_tel`, `photo_de_profil`, `date_de_naissance`, `adresse`) VALUES
(1, 'fatmaessafi', NULL, 'fatma.essafi@esprit.tn', NULL, NULL, NULL, 'fatmafatma', NULL, NULL, NULL, NULL, NULL, NULL, 'admin', NULL, NULL, 'Essafi', 'Fatma', 21, 'F', 55271016, 'file:C:/Users/Fatma/Documents/NetBeansProjects/MySoulmateMatching/src/Presentation/fatma.jpg', '1996-10-27', 'Menzah 8\r\n'),
(2, 'wajihhamza', NULL, 'mohamedwajih.hamza@esprit.tn', NULL, NULL, NULL, '1282659', NULL, NULL, NULL, NULL, NULL, NULL, 'admin', NULL, NULL, 'Hamza', 'Mohamed Wajih', 23, 'M', 52392540, 'file:C:/Users/Fatma/Documents/NetBeansProjects/MySoulmateMatching/src/Presentation/wajih.png', '1994-09-16', 'Rades Meliane'),
(3, 'selmaessafi', NULL, 'selma.essafi@gmail.com', NULL, NULL, NULL, 'selmaessafi', NULL, NULL, NULL, NULL, NULL, NULL, 'utilisateur', NULL, NULL, 'Essafi', 'Selma', 18, 'F', 54061999, 'file:C:/Users/Fatma/Documents/NetBeansProjects/MySoulmateMatching/src/Presentation/selma.jpg', '1999-06-23', 'Menzah 8'),
(4, 'ferielmufti', NULL, 'feriel.mufti@esprit.tn', NULL, NULL, NULL, 'feriel', NULL, NULL, NULL, NULL, NULL, NULL, 'utilisateur', NULL, NULL, 'Mufti', 'Feriel', 22, 'F', 222222222, 'file:C:/Users/Fatma/Documents/NetBeansProjects/MySoulmateMatching/src/Presentation/feriel.jpeg', '2018-02-06', 'Gafsa');

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

--
-- Déchargement des données de la table `matching`
--

INSERT INTO `matching` (`idUser1`, `idUser2`, `pourcentage`) VALUES
(1, 2, 80),
(2, 1, 80),
(2, 3, 60),
(2, 4, 55),
(3, 2, 60),
(4, 2, 55);

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

--
-- Déchargement des données de la table `personnalite`
--

INSERT INTO `personnalite` (`idUser`, `nerveux`, `attirant`, `sensible`, `romantique`, `sportif`, `artiste`, `musicien`, `famille`, `actif`, `sociable`, `fidele`, `soigne`, `genereux`, `ambitieux`, `jaloux`, `serieux`, `drole`, `materialiste`, `tolerant`, `aventurier`) VALUES
(2, 25, 50, 75, 100, 50, 75, 75, 100, 50, 125, 50, 50, 50, 50, 75, 50, 50, 75, 50, 50);

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

--
-- Déchargement des données de la table `preference`
--

INSERT INTO `preference` (`idUser`, `nerveux`, `attirant`, `sensible`, `romantique`, `sportif`, `artiste`, `musicien`, `famille`, `actif`, `sociable`, `fidele`, `soigne`, `genereux`, `ambitieux`, `jaloux`, `serieux`, `drole`, `materialiste`, `tolerant`, `aventurier`) VALUES
(1, 20, 70, 50, 80, 90, 60, 60, 70, 80, 80, 90, 90, 90, 60, 40, 80, 90, 10, 70, 70);

-- --------------------------------------------------------

--
-- Structure de la table `question`
--

DROP TABLE IF EXISTS `question`;
CREATE TABLE IF NOT EXISTS `question` (
  `idQuestion` int(20) NOT NULL AUTO_INCREMENT,
  `question` varchar(250) NOT NULL,
  `type` enum('personnalite','preference') NOT NULL,
  `trait` enum('nerveux','attirant','sensible','romantique','sportif','artiste','musicien','famille','actif','sociable','fidele','soigne','genereux','ambitieux','jaloux','serieux','drole','materialiste','tolerant','aventurier') NOT NULL,
  `reponse1` varchar(250) NOT NULL,
  `reponse2` varchar(250) NOT NULL,
  `reponse3` varchar(250) NOT NULL,
  PRIMARY KEY (`idQuestion`)
) ENGINE=MyISAM AUTO_INCREMENT=66 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `question`
--

INSERT INTO `question` (`idQuestion`, `question`, `type`, `trait`, `reponse1`, `reponse2`, `reponse3`) VALUES
(1, 'Si vous découvrez qu un ami vous cache quelque chose d important', 'personnalite', 'nerveux', 'Vous essayez den discuter avec lui même si vous êtes énervé', 'Vous lui dites ses quatres vérités et ne lui adressez plus la parole', 'S il l a fait c est qu il a ses raisons et vous comprenez'),
(2, 'Votre partenaire parle avec une personne du sexe opposé au téléphone', 'personnalite', 'jaloux', 'Vous lui demandez des informations sur la nature de la relation entre eux', 'Vous lui piquez son téléphone et essayez de lire les messages sans l ecouter ', 'Vous avez vos amis et lui/elle les siens donc ça ne vous dérange pas'),
(3, 'Votre partenaire vous ment et vous le découvrez', 'personnalite', 'nerveux', 'Sur le moment vous ne l ecoutez pas mais après vous essayez de comprendre', 'Me mentir? C est impardonnable', 'Qui ne ment jamais? Vous lui pardonnez pour cette fois'),
(4, 'Un camion heurte votre voiture et prend la fuite', 'personnalite', 'nerveux', 'Vous prenez le numero de sa plaque d immatriculation et allez au commissariat porter plainte', 'Vous allez à sa trousse et l insultez par la fenêtre', 'Il n a pas du faire exprès pas la peine d en faire un drame'),
(5, 'Physiquement, vous vous trouvez :', 'personnalite', 'attirant', 'Pas mal du tout', 'Très attirant(e)', 'La nature aurait pu mieux faire pour moi'),
(7, 'Quel est votre plus gros atout physique?', 'personnalite', 'attirant', 'Mon corps que j entretiens assidument', 'Mon visage angélique', 'Mes beaux cheveux'),
(8, 'A quelle fréquence prenez vous soin de votre apparence (coiffeur/ estheticienne/ hygiène...)?', 'personnalite', 'attirant', 'Quand j ai le temps ou que j ai un évènement', 'Le plus souvent possible car j adore me chouchouter', 'Je n ai pas le temps pour ce genre de choses superficielles'),
(9, 'La dernière fois où vous avez pleuré c était :', 'personnalite', 'sensible', 'Devant un film triste que j ai regardé ', 'En me brulant avec l eau chaude sous la douche', 'Quand mon grand père est décédé'),
(10, 'Un(e) de mes ami(e)s a oublié mon anniversaire:', 'personnalite', 'sensible', 'Ca me fait un peu de peine car je me souviens toujours du sien', 'Je suis très attristé(e) et me demande ce que j ai bien pu faire de mal pour mériter ça', 'Et alors ce n est pas comme si c était Noël'),
(11, 'Ma dernière rupture a été:', 'personnalite', 'sensible', 'Assez douloureuse mais je m en suis vite remis(e)', 'Je ne supporte pas d y penser tellement ça fait mal', 'Un de perdu dix de retrouvés!'),
(12, 'La St Valentin pour vous:', 'personnalite', 'romantique', 'C est une fête commerciale mais ça fait plaisir d y recevoir un cadeau d un être aimé', 'C est l occasion pour tous les amoureux d exprimer haut et fort leur amour l un envers l autre', 'Je ne m appelle pas Valentin donc ce n est pas ma fête'),
(13, 'Votre film préféré des trois est sûrement:', 'personnalite', 'romantique', 'Fifty Shades of Grey', 'Titanic', 'Mission Impossible'),
(14, 'Votre partenaire vous propose un rendez-vous:', 'personnalite', 'romantique', 'Une soirée ciné en amoureux', 'Un diner au chandelles en tête à tête', 'Un café c est pas mal'),
(15, 'Votre relation avec le sport c est:', 'personnalite', 'sportif', 'Une relation assez conflictuelle mais on finit toujours par se réconcilier', 'Une relation fusionnelle et vitale', 'Le sport? C est quoi?'),
(16, 'C est samedi soir vous préférez:', 'personnalite', 'sportif', 'Le passer devant la télé à regarder un match de foot', 'Aller à la gym car c est le meilleur moment de la journée', 'Sortir avec des amis faire la fête'),
(17, 'La voiture est en panne', 'personnalite', 'sportif', 'Je vais à pieds au boulot ça me fera de la marche', 'J enfile mes baskets et je fais un footing jusqu au bureau comme chaque matin', 'Je prends un taxi pas question d arriver en sueur au travail'),
(18, 'On me propose des tickets pour une piece de théatre:', 'personnalite', 'artiste', 'Je n y suis jamais allé(e) c est une occasion', 'J ai déjà vu cette pièce mais j adorerai la revoir', 'Je les passe à ma soeur ce n est pas ma tasse de thé'),
(20, 'Au lycée, en arts plastiques:', 'personnalite', 'artiste', 'Je me débrouille', 'J étais le/la plus douée de la classe', 'J avais deux mains gauches'),
(21, 'La dernière fois que vous êtes allé(e) à une galerie d art, c était : ', 'personnalite', 'artiste', 'L année dernière', 'La semaine dernière', 'Au primaire avec l école'),
(22, 'La musique représente pour vous:', 'personnalite', 'musicien', 'Quelque chose d agréable à écouter', 'Un échappatoire dans lequel je me réfugie', 'Ca fait passer le temps'),
(23, 'Bethhoven était:', 'personnalite', 'musicien', 'Un prodige', 'Sourd', 'Aveugle'),
(24, 'Les concerts de musique classique', 'personnalite', 'musicien', 'Ca permet de changer de style des fois', 'C est un veritable bonheur à écouter', 'C est très ennuyant'),
(25, 'Une repas de famille est synonyme pour vous de:', 'personnalite', 'famille', 'Obligations parfois', 'Bonheur parce qu on est entouré des êtres qu on aime', 'Ennui total'),
(26, 'Plus tard vous aimeriez avoir:', 'personnalite', 'famille', 'Un ou deux enfants c est suffisant', 'Une famille très nombreuse', 'Aucun enfant car je veux profiter de ma liberté'),
(27, 'Vous rendez visite à votre famille aggrandie (oncles/ tantes/ cousins...):', 'personnalite', 'famille', 'Chaque deux trois mois histoire de ne pas les vexer', 'Chaque semaine au moins', 'Parfois pendant les grandes occasions'),
(28, 'Quand vous êtes en congé:', 'personnalite', 'actif', 'Vous en profitez pour faire le ménage chez vous', 'Vous faites les courses et allez faire une balade', 'Vous passez la journée au lit'),
(29, 'Une journée quand vous êtes malade est pour vous:', 'personnalite', 'actif', 'Une journée où vous vous reposez mais manquez de faire plusieurs choses', 'Le cauchemar car votre temps est précieux', 'Une occasion de ne rien faire et de dormir toute la journée'),
(30, 'Vous pouvez rester au même endroit:', 'personnalite', 'actif', 'Jusqu à ce que je m ennuie', 'Une ou deux heures pas plus j ai tout le temps à faire', 'Tout le temps qu il me faut pour prendre mon temps'),
(31, 'Un(e) ami(e) vous propose de sortir avec des personnes que vous ne connaissez pas', 'personnalite', 'sociable', 'Vous essayerez de faire connaissance avec eux', 'Quel est le problème? Vous adorez rencontrer de nouvelles personnes', 'Vous refusez parce que vous ne vous sentez pas à l aise'),
(32, 'Vous vous retrouvez dans un groupe de travail avec de nouvelles personnes:', 'personnalite', 'sociable', 'Vous essayez de travailler avec eux même si vous ne vous connaissez pas', 'Vous devenez vite amis ce n est pas un obstacle', 'Vous êtes démotivé parce que vous ne vous sentez pas à votre place'),
(33, 'Vos amis vous qualifient souvent de:', 'personnalite', 'sociable', 'Amical', 'Très extraverti', 'Réservé'),
(34, 'Vous êtes avec votre partenaire et une jolie fille/un bel homme passe devant vous:', 'personnalite', 'fidele', 'Vous l admirez discrètement', 'Vous baissez les yeux par peur que votre partenaire le prenne mal', 'Vous regardez ouvertement devant votre partenaire en complimentant la beauté de cette personne'),
(35, 'Votre partenaire vous a fait un sale coup et un(e) ami(e) vous dit de l envoyer balader:', 'personnalite', 'fidele', 'Vous lui répondez que vous allez y réfléchir', 'Vous vous énervez contre lui et défendez quand même votre partenaire', 'Il/elle a raison après tout de vouloir mon bien '),
(36, 'Vous sortez en soirée entre amis et un homme/une femme vous accoste pendant que vous êtes en train de danser en vous faisant des compliments:', 'personnalite', 'fidele', 'Vous la remerciez poliment et continuez', 'Vous essayez de faire mine et de ne pas l avoir entendue', 'Vous lui retournez le compliment à votre tour'),
(37, 'Vous ne pouvez pas sortir:', 'personnalite', 'soigne', 'Sans vous être brossé les dents', 'Sans avoir fait votre lit', 'Sans avoir pris votre petit déjeuner'),
(38, 'Quel est votre pire défaut?', 'personnalite', 'soigne', 'Vous laissez trainez vos affaire trop souvent', 'Vous êtes maniaque', 'Vous êtes complètement bordélique'),
(39, 'On vous reproche souvent:', 'personnalite', 'soigne', 'D etre organisé dans votre travail mais pas dans votre vie privée', 'De trop chercher à être perfectionniste', 'De ne pas être organisé du tout'),
(40, 'Vous trouvez 10$ par terre:', 'personnalite', 'genereux', 'Vous allez sortir avec vos amis prendre un café', 'Vous allez acheter avec un cadeau à votre mère', 'Vous allez les mettre dans votre tirrelire'),
(41, 'Vous voyez un mandiant en manche courte sous la pluie:', 'personnalite', 'genereux', 'Vous lui donnez quelques pièces de monnaie', 'Vous lui donnez votre manteau', 'Il vous fait pitié mais il n a qu a chercher du travail'),
(42, 'Votre plus grand rêve est:', 'personnalite', 'ambitieux', 'Avoir une situation confortable et être bien entouré', 'Devenir riche et puissant', 'Profiter de la vie'),
(43, 'Les études sont pour vous:', 'personnalite', 'ambitieux', 'Un passage obligé', 'Un moyen pour arriver à ses fins', 'Un fardeau '),
(44, 'Les diplômes?', 'personnalite', 'ambitieux', 'Ca joue un grand role dans notre avenir', 'Si on a des ambitions on peut arriver a tout même sans diplome', 'C est bien mais c est pas tout dans la vie'),
(45, 'Quelqu un essaye de flirter avec votre partenaire:', 'personnalite', 'jaloux', 'Vous lui faites comprendre que vous êtes là', 'Vous ne manquerez pas une occasion de le/la défoncer', 'C est normal ca vous arrive aussi'),
(46, 'La jalousie pour vous:', 'personnalite', 'jaloux', 'C est naturel', 'C est une preuve d amour', 'C est un manque de confiance dans un couple'),
(47, 'La plupart de vos relations étaient:', 'personnalite', 'serieux', 'Des amours de jeunesse', 'Des relations sérieuses', 'Des relations passagères pour s amuser'),
(48, 'Votre plus longue relation c était:', 'personnalite', 'serieux', 'Quelques mois', 'Quelques semaines', 'Quelques années'),
(49, 'Ce que vous recherchez: ', 'personnalite', 'serieux', 'Quelqu un avec qui vous pouvez vous entendre ', 'Un partenaire pour l avenir et pour fonder une famille', 'Une aventure pour vous amuser'),
(50, 'Vos amis pensent que vous êtes', 'personnalite', 'drole', 'Sympathique', 'A mourir de rire', 'Sympa quand vous faites des efforts'),
(51, 'Une sortie sans vous, pour vos amis c est:', 'personnalite', 'drole', 'Dommage car vous participez à l ambiance', 'Inconcevable car vous êtes toujours le clou du spectable', 'Une sortie sans vous'),
(52, 'Vos blagues:', 'personnalite', 'drole', 'La plupart du temps on y rit', 'Tout le monde les adore et vous demande d en raconter ', 'Ne font rire que vous'),
(53, 'Offrir un cadeau pour vous:', 'personnalite', 'genereux', 'Vous fait plaisir quand c est quelqu un de proche', 'Vous fait plus plaisir que quand vous en recevez', 'Vous préferez en recevoir'),
(54, 'L argent est pour vous:', 'personnalite', 'materialiste', 'Aide au bonheur', 'Rend heureux', 'Ne rend pas heureux'),
(55, 'Vous payez l addition:', 'personnalite', 'materialiste', 'Quand vous invitez quelqu un', 'Quand vous voulez vous la péter', 'Quand vous le pouvez'),
(56, 'Vous voulez acheter une jolie voiture pour:', 'personnalite', 'materialiste', 'Me faire plus draguer', 'Attirer l attention et frimer', 'Vous amuser'),
(57, 'Les personnes différentes de vous:', 'personnalite', 'tolerant', 'Sont libres', 'Enrichissent le monde par leur différence', 'Ont tord'),
(58, 'Les personnes qui sont pour le mariage homosexuel sont:', 'personnalite', 'tolerant', 'Libres', 'Totalement justes', 'Folles car c est contre nature'),
(59, 'Les femmes en burka:', 'personnalite', 'tolerant', 'Ne sont pas mon problème', 'Pratiquent leur liberté', 'Contre la sécurité'),
(60, 'Pour votre voyage de noce vous aimeriez:', 'personnalite', 'aventurier', 'Partir pour une destination paradisiaque', 'Faire un road trip', 'Aller dans des endroits luxueux'),
(61, 'Un safari dans la savanne vous inspire:', 'personnalite', 'aventurier', 'La découverte', 'Quelque chose de formidable car j adore l aventure', 'La peur d être attaqué par des animaux sauvages'),
(62, 'Un camping à la montagne:', 'personnalite', 'aventurier', 'Ca peut être pas mal si c est sécurisé ', 'Vous êtes habitué aux campings et vous adorez ça', 'Ce n est pas pour vous car vous préférez le confort');

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
