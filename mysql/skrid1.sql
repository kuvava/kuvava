-- Adminer 4.2.0 MySQL dump

SET NAMES utf8mb4;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

DROP TABLE IF EXISTS `editor_obsahu_stranky`;
CREATE TABLE `editor_obsahu_stranky` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `poradi` int(11) NOT NULL DEFAULT '0' COMMENT 'Výchozí hodnota je 0',
  `pocet_sloupcu` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT 'Výchozí hodnota je 1 - nemá to smysl u galerie, má to smysl pouze u textu',
  `stranka_id` int(11) NOT NULL,
  `galerie_skupina_fotek_id` int(11) DEFAULT NULL,
  `obsah_texy` text COLLATE utf8_czech_ci NOT NULL COMMENT 'TOTO POLÍČKO VYPLŇUJEŠ TY',
  PRIMARY KEY (`id`),
  KEY `stranka_id` (`stranka_id`),
  KEY `galerie_skupina_fotek_id` (`galerie_skupina_fotek_id`),
  CONSTRAINT `editor_obsahu_stranky_ibfk_1` FOREIGN KEY (`stranka_id`) REFERENCES `stranka` (`id`),
  CONSTRAINT `editor_obsahu_stranky_ibfk_2` FOREIGN KEY (`galerie_skupina_fotek_id`) REFERENCES `galerie_skupina_fotek` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;


DROP TABLE IF EXISTS `galerie_prirazene_polozky`;
CREATE TABLE `galerie_prirazene_polozky` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `galerie_skupina_fotek_id` int(11) NOT NULL,
  `vsechny_fotky_id` int(11) NOT NULL,
  `poradi` int(11) NOT NULL DEFAULT '0' COMMENT 'Lze zadávat i záporná čísla, čím je číslo nižší, tím bude fotka blíže k začátku skupiny... Fotky se stejnou hodnotou sloupce `poradi` se řadí vzestupně podle sloupce `id`',
  PRIMARY KEY (`id`),
  KEY `galerie_skupina_fotek_id` (`galerie_skupina_fotek_id`),
  KEY `vsechny_fotky_id` (`vsechny_fotky_id`),
  CONSTRAINT `galerie_prirazene_polozky_ibfk_1` FOREIGN KEY (`galerie_skupina_fotek_id`) REFERENCES `galerie_skupina_fotek` (`id`),
  CONSTRAINT `galerie_prirazene_polozky_ibfk_2` FOREIGN KEY (`vsechny_fotky_id`) REFERENCES `vsechny_fotky` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;


DROP TABLE IF EXISTS `galerie_skupina_fotek`;
CREATE TABLE `galerie_skupina_fotek` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `poznamka` varchar(255) COLLATE utf8_czech_ci NOT NULL COMMENT 'Slouží pro Tvou orientaci.',
  `googlepopis_automatizovane` varchar(255) COLLATE utf8_czech_ci NOT NULL COMMENT 'Fotografie, které nemají vlastní googlepopis obdrží tento společný.',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;


DROP TABLE IF EXISTS `stranka`;
CREATE TABLE `stranka` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rubrika` varchar(50) COLLATE utf8_czech_ci DEFAULT NULL COMMENT 'neměň',
  `googletitulek` varchar(100) COLLATE utf8_czech_ci DEFAULT NULL COMMENT 'optimum max 45 znaků (nepiš www.skryta-identita.cz - to se doplňuje samo)',
  `googlepopisek` varchar(160) COLLATE utf8_czech_ci DEFAULT NULL COMMENT 'optimum max 140 znaků',
  `editor_zmeneno` varchar(5) COLLATE utf8_czech_ci NOT NULL DEFAULT 'ne' COMMENT 'ZMĚŇ NA ''ano''',
  `obsah_html_nahore` text COLLATE utf8_czech_ci COMMENT 'neměň - vygeneruje se automaticky podle editoru',
  `obsah_html_dole` text COLLATE utf8_czech_ci COMMENT 'neměň - vygeneruje se automaticky podle editoru',
  `obsahuje_galerii` varchar(5) COLLATE utf8_czech_ci NOT NULL DEFAULT 'ne' COMMENT 'neměň - vygeneruje se automaticky',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;


DROP TABLE IF EXISTS `vsechny_fotky`;
CREATE TABLE `vsechny_fotky` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nahled_posun` smallint(6) NOT NULL,
  `googlepopis` varchar(255) COLLATE utf8_czech_ci DEFAULT NULL COMMENT 'stručně a výstižně',
  `gallery_text` text COLLATE utf8_czech_ci COMMENT 'klidně i obsáhleji',
  `size` int(11) NOT NULL,
  `width` int(11) NOT NULL,
  `height` int(11) NOT NULL,
  `html_attr` varchar(50) COLLATE utf8_czech_ci NOT NULL,
  `fileextension` varchar(10) COLLATE utf8_czech_ci NOT NULL,
  `tvar` varchar(20) COLLATE utf8_czech_ci NOT NULL DEFAULT 'neznamy',
  `l_size` int(11) NOT NULL,
  `l_width` int(11) NOT NULL,
  `l_height` int(11) NOT NULL,
  `l_html_attr` varchar(50) COLLATE utf8_czech_ci NOT NULL,
  `m_size` int(11) NOT NULL,
  `m_width` int(11) NOT NULL,
  `m_height` int(11) NOT NULL,
  `m_html_attr` varchar(50) COLLATE utf8_czech_ci NOT NULL,
  `s_size` int(11) NOT NULL,
  `s_width` int(11) NOT NULL,
  `s_height` int(11) NOT NULL,
  `s_html_attr` varchar(50) COLLATE utf8_czech_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;


DROP TABLE IF EXISTS `zaloha_obsah`;
CREATE TABLE `zaloha_obsah` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stranka_id` int(11) NOT NULL,
  `editor_obsahu_stranky_id` int(11) NOT NULL,
  `poradi` int(11) NOT NULL,
  `pocet_sloupcu` int(11) NOT NULL,
  `texy` text COLLATE utf8_czech_ci NOT NULL,
  `datum` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;


-- 2015-04-20 19:10:26
