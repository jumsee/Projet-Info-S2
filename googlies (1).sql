-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  Dim 07 avr. 2019 à 14:42
-- Version du serveur :  5.7.24
-- Version de PHP :  7.2.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `googlies`
--

-- --------------------------------------------------------

--
-- Structure de la table `article`
--

DROP TABLE IF EXISTS `article`;
CREATE TABLE IF NOT EXISTS `article` (
  `ID_ARTICLE` int(11) NOT NULL AUTO_INCREMENT,
  `NOM_ARTICLE` varchar(50) NOT NULL,
  `DESCRIPTION` longtext NOT NULL,
  `PRIX_HT` float NOT NULL,
  `PRIX_TTC` float NOT NULL,
  `IMAGE` varchar(50) NOT NULL,
  `ID_CATEGORIE` int(11) NOT NULL,
  `ID_COLLECTION` int(11) NOT NULL,
  PRIMARY KEY (`ID_ARTICLE`),
  KEY `ARTICLE_CATEGORIE_FK` (`ID_CATEGORIE`),
  KEY `ARTICLE_COLLECTION0_FK` (`ID_COLLECTION`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `article`
--

INSERT INTO `article` (`ID_ARTICLE`, `NOM_ARTICLE`, `DESCRIPTION`, `PRIX_HT`, `PRIX_TTC`, `IMAGE`, `ID_CATEGORIE`, `ID_COLLECTION`) VALUES
(1, 'Mug DarkVador', 'C\'est une tasse dark Vador', 13.19, 10.99, '', 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `categorie`
--

DROP TABLE IF EXISTS `categorie`;
CREATE TABLE IF NOT EXISTS `categorie` (
  `ID_CATEGORIE` int(11) NOT NULL AUTO_INCREMENT,
  `NOM_CATEGORIE` varchar(50) NOT NULL,
  PRIMARY KEY (`ID_CATEGORIE`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `categorie`
--

INSERT INTO `categorie` (`ID_CATEGORIE`, `NOM_CATEGORIE`) VALUES
(1, 'Mug');

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

DROP TABLE IF EXISTS `client`;
CREATE TABLE IF NOT EXISTS `client` (
  `ID_CLIENT` int(11) NOT NULL AUTO_INCREMENT,
  `EMAIL` varchar(50) NOT NULL,
  `MDP` varchar(50) NOT NULL,
  `NOM` varchar(50) NOT NULL,
  `PRENOM` varchar(50) NOT NULL,
  `TELEPHONE` int(11) NOT NULL,
  `DATE_NAISSANCE` date NOT NULL,
  `PTS_FIDELITE` int(11) NOT NULL,
  `ADRESSE` varchar(5) NOT NULL,
  `COORD_BANC` varchar(50) NOT NULL,
  PRIMARY KEY (`ID_CLIENT`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `client`
--

INSERT INTO `client` (`ID_CLIENT`, `EMAIL`, `MDP`, `NOM`, `PRENOM`, `TELEPHONE`, `DATE_NAISSANCE`, `PTS_FIDELITE`, `ADRESSE`, `COORD_BANC`) VALUES
(1, 'narvin.chana@etu.univ-tours.fr', 'motdepasse', 'Chana', 'Narvin', 675908412, '2000-08-21', 0, 'tours', '84546563654615654488498599895987');

-- --------------------------------------------------------

--
-- Structure de la table `collection`
--

DROP TABLE IF EXISTS `collection`;
CREATE TABLE IF NOT EXISTS `collection` (
  `ID_COLLECTION` int(11) NOT NULL AUTO_INCREMENT,
  `NOM_COLLECTION` varchar(50) NOT NULL,
  PRIMARY KEY (`ID_COLLECTION`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `collection`
--

INSERT INTO `collection` (`ID_COLLECTION`, `NOM_COLLECTION`) VALUES
(1, 'StarWars'),
(2, 'Marvel');

-- --------------------------------------------------------

--
-- Structure de la table `commande`
--

DROP TABLE IF EXISTS `commande`;
CREATE TABLE IF NOT EXISTS `commande` (
  `ID_COMMANDE` int(11) NOT NULL AUTO_INCREMENT,
  `DATE_COMMANDE` date NOT NULL,
  `ETAT` varchar(50) NOT NULL,
  `ID_CLIENT` int(11) NOT NULL,
  `ID_LIVRAISON` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_COMMANDE`),
  KEY `COMMANDE_CLIENT_FK` (`ID_CLIENT`),
  KEY `COMMANDE_LIVRAISON0_FK` (`ID_LIVRAISON`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `commande`
--

INSERT INTO `commande` (`ID_COMMANDE`, `DATE_COMMANDE`, `ETAT`, `ID_CLIENT`, `ID_LIVRAISON`) VALUES
(1, '2019-02-02', 'Livré', 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `est_commande`
--

DROP TABLE IF EXISTS `est_commande`;
CREATE TABLE IF NOT EXISTS `est_commande` (
  `ID_ARTICLE` int(11) NOT NULL,
  `ID_COMMANDE` int(11) NOT NULL,
  PRIMARY KEY (`ID_ARTICLE`,`ID_COMMANDE`),
  KEY `EST_COMMANDE_COMMANDE0_FK` (`ID_COMMANDE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `est_en_promo`
--

DROP TABLE IF EXISTS `est_en_promo`;
CREATE TABLE IF NOT EXISTS `est_en_promo` (
  `ID_PROMO` int(11) NOT NULL,
  `ID_ARTICLE` int(11) NOT NULL,
  PRIMARY KEY (`ID_PROMO`,`ID_ARTICLE`),
  KEY `EST_EN_PROMO_ARTICLE0_FK` (`ID_ARTICLE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `etre`
--

DROP TABLE IF EXISTS `etre`;
CREATE TABLE IF NOT EXISTS `etre` (
  `ID_ARTICLE` int(11) NOT NULL,
  `ID_TAILLE` int(11) NOT NULL,
  `QUANTITE` int(11) NOT NULL,
  PRIMARY KEY (`ID_ARTICLE`,`ID_TAILLE`),
  KEY `ETRE_TAILLE0_FK` (`ID_TAILLE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `livraison`
--

DROP TABLE IF EXISTS `livraison`;
CREATE TABLE IF NOT EXISTS `livraison` (
  `ID_LIVRAISON` int(11) NOT NULL AUTO_INCREMENT,
  `LIVREUR` varchar(50) NOT NULL,
  `DATE_LIVRAISON` date NOT NULL,
  PRIMARY KEY (`ID_LIVRAISON`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `livraison`
--

INSERT INTO `livraison` (`ID_LIVRAISON`, `LIVREUR`, `DATE_LIVRAISON`) VALUES
(1, 'ChronoPost', '2019-02-19');

-- --------------------------------------------------------

--
-- Structure de la table `promotion`
--

DROP TABLE IF EXISTS `promotion`;
CREATE TABLE IF NOT EXISTS `promotion` (
  `ID_PROMO` int(11) NOT NULL AUTO_INCREMENT,
  `REDUCTION` varchar(50) NOT NULL,
  PRIMARY KEY (`ID_PROMO`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `taille`
--

DROP TABLE IF EXISTS `taille`;
CREATE TABLE IF NOT EXISTS `taille` (
  `ID_TAILLE` int(11) NOT NULL AUTO_INCREMENT,
  `SIZE` varchar(50) NOT NULL,
  PRIMARY KEY (`ID_TAILLE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `article`
--
ALTER TABLE `article`
  ADD CONSTRAINT `ARTICLE_CATEGORIE_FK` FOREIGN KEY (`ID_CATEGORIE`) REFERENCES `categorie` (`ID_CATEGORIE`),
  ADD CONSTRAINT `ARTICLE_COLLECTION0_FK` FOREIGN KEY (`ID_COLLECTION`) REFERENCES `collection` (`ID_COLLECTION`);

--
-- Contraintes pour la table `commande`
--
ALTER TABLE `commande`
  ADD CONSTRAINT `COMMANDE_CLIENT_FK` FOREIGN KEY (`ID_CLIENT`) REFERENCES `client` (`ID_CLIENT`),
  ADD CONSTRAINT `COMMANDE_LIVRAISON0_FK` FOREIGN KEY (`ID_LIVRAISON`) REFERENCES `livraison` (`ID_LIVRAISON`);

--
-- Contraintes pour la table `est_commande`
--
ALTER TABLE `est_commande`
  ADD CONSTRAINT `EST_COMMANDE_ARTICLE_FK` FOREIGN KEY (`ID_ARTICLE`) REFERENCES `article` (`ID_ARTICLE`),
  ADD CONSTRAINT `EST_COMMANDE_COMMANDE0_FK` FOREIGN KEY (`ID_COMMANDE`) REFERENCES `commande` (`ID_COMMANDE`);

--
-- Contraintes pour la table `est_en_promo`
--
ALTER TABLE `est_en_promo`
  ADD CONSTRAINT `EST_EN_PROMO_ARTICLE0_FK` FOREIGN KEY (`ID_ARTICLE`) REFERENCES `article` (`ID_ARTICLE`),
  ADD CONSTRAINT `EST_EN_PROMO_PROMOTION_FK` FOREIGN KEY (`ID_PROMO`) REFERENCES `promotion` (`ID_PROMO`);

--
-- Contraintes pour la table `etre`
--
ALTER TABLE `etre`
  ADD CONSTRAINT `ETRE_ARTICLE_FK` FOREIGN KEY (`ID_ARTICLE`) REFERENCES `article` (`ID_ARTICLE`),
  ADD CONSTRAINT `ETRE_TAILLE0_FK` FOREIGN KEY (`ID_TAILLE`) REFERENCES `taille` (`ID_TAILLE`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
