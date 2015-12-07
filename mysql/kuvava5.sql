-- Adminer 4.2.2fx MySQL dump

SET NAMES utf8;
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

INSERT INTO `editor_obsahu_stranky` (`id`, `poradi`, `pocet_sloupcu`, `stranka_id`, `galerie_skupina_fotek_id`, `obsah_texy`) VALUES
(1,	0,	1,	1,	NULL,	'Vítejte na webu o lidech, štěstí a léčitelství\r\n####################################################\r\n\r\nAž na výjimky, u nichž je to uvedeno, texty v současnosti utváří a služby nabízí Tomáš Urban: \"Terapeutická a magická činnost je moje vášeň. Porozhlédněte se po našich stránkách a vyberte si, co potřebujete.\"\r\n\r\n\r\nKontaktní údaje\r\n****************\r\n\r\n**Tomáš Urban**:\r\n    - tel: +420 / **777 790 528**\r\n    - e-mail: **urban@kuvava.cz**\r\n\r\n\r\nčeský účet::\r\n    - **107-3720830217 / 0100** (u Komerční banky)\r\n    - (jako variabilní symbol uveďte své telefonní číslo, na které Vám zašleme SMSkou potvrzení o přijetí platby)\r\n\r\n\r\nslovenský účet::\r\n    - 18561447 / 6500 (u Poštové banky)');

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


DROP TABLE IF EXISTS `menu_polozky`;
CREATE TABLE `menu_polozky` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_id` int(11) NOT NULL DEFAULT '0',
  `rodic` int(11) NOT NULL DEFAULT '0',
  `uroven` int(11) NOT NULL DEFAULT '0',
  `poradi` int(11) NOT NULL DEFAULT '0',
  `obal` varchar(20) COLLATE utf8_czech_ci DEFAULT NULL,
  `stranka_id` int(11) DEFAULT NULL,
  `alternativni_napis` varchar(100) COLLATE utf8_czech_ci DEFAULT NULL,
  `class` varchar(50) COLLATE utf8_czech_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `stranka_id` (`stranka_id`),
  CONSTRAINT `menu_polozky_ibfk_1` FOREIGN KEY (`stranka_id`) REFERENCES `stranka` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

INSERT INTO `menu_polozky` (`id`, `menu_id`, `rodic`, `uroven`, `poradi`, `obal`, `stranka_id`, `alternativni_napis`, `class`) VALUES
(1,	0,	0,	0,	0,	'modd',	NULL,	NULL,	NULL),
(2,	0,	0,	0,	0,	NULL,	1,	NULL,	NULL);

DROP TABLE IF EXISTS `nastaveni`;
CREATE TABLE `nastaveni` (
  `vlastnost` varchar(50) COLLATE utf8_czech_ci NOT NULL,
  `hodnota` char(1) COLLATE utf8_czech_ci NOT NULL DEFAULT 'n',
  PRIMARY KEY (`vlastnost`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

INSERT INTO `nastaveni` (`vlastnost`, `hodnota`) VALUES
('menu_vse_velke',	'n'),
('texy_heading_top',	'1');

DROP TABLE IF EXISTS `stranka`;
CREATE TABLE `stranka` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rubrika` varchar(50) COLLATE utf8_czech_ci NOT NULL COMMENT 'vyplň standardní označení v menu',
  `url` varchar(150) COLLATE utf8_czech_ci NOT NULL COMMENT 'pečlivě vyplň adresu stránky, vynech úvod: www.mojedomena.cz/',
  `googletitulek` varchar(100) COLLATE utf8_czech_ci DEFAULT NULL COMMENT 'optimum max 45 znaků (nepiš www.skryta-identita.cz - to se doplňuje samo)',
  `googlepopisek` varchar(160) COLLATE utf8_czech_ci DEFAULT NULL COMMENT 'optimum max 140 znaků',
  `editor_zmeneno` varchar(5) COLLATE utf8_czech_ci NOT NULL DEFAULT 'ne' COMMENT 'neměň - použij tlačítko na webu na adrese /_nastroje/',
  `obsah_html_dole` text COLLATE utf8_czech_ci COMMENT 'neměň - vygeneruje se automaticky podle editoru',
  `obsahuje_galerii` varchar(5) COLLATE utf8_czech_ci NOT NULL DEFAULT 'ne' COMMENT 'neměň - vygeneruje se automaticky',
  PRIMARY KEY (`id`),
  KEY `url` (`url`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

INSERT INTO `stranka` (`id`, `rubrika`, `url`, `googletitulek`, `googlepopisek`, `editor_zmeneno`, `obsah_html_dole`, `obsahuje_galerii`) VALUES
(1,	'Kontakt',	'',	'Terapeut a léčitel Tomáš Urban',	'Přihlaste se na poradenství, léčbu na dálku, zrušení geopatogenních i elektrických zón, tématická setkání. Nebo čtěte terapeutické články.',	'ne',	NULL,	'ne');

DROP TABLE IF EXISTS `stranka_html_celek`;
CREATE TABLE `stranka_html_celek` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stranka_id` int(11) NOT NULL,
  `html` text COLLATE utf8_czech_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `stranka_id` (`stranka_id`),
  CONSTRAINT `stranka_html_celek_ibfk_1` FOREIGN KEY (`stranka_id`) REFERENCES `stranka` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

INSERT INTO `stranka_html_celek` (`id`, `stranka_id`, `html`) VALUES
(1,	1,	'<!DOCTYPE html>\n<html>\n<head>\n<meta http-equiv=\"Content-Language\" content=\"cs\">\n<meta http-equiv=\"content-type\" content=\"text/html; charset=utf-8\">\n<meta charset=\"utf-8\">\n<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n\n<title>Terapeut a léčitel Tomáš Urban | www.kuvava.cz</title>\n<meta name=\"description\" content=\"Přihlaste se na poradenství, léčbu na dálku, zrušení geopatogenních i elektrických zón, tématická setkání. Nebo čtěte terapeutické články.\">\n\n<link rel=\"stylesheet\" href=\"/css/kuvava-5-0-1.css\">\n<link rel=\"shortcut icon\" href=\"/favicon5.ico\">\n\n<!--[if lt IE 9]><script src=\"http://cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7.2/html5shiv.min.js\"></script><![endif]-->\n\n</head>\n<body>\n<script> document.documentElement.className+=\' js\' </script>\n<div id=\"all\">\n<div id=\"pack\">\n<div id=\"head\"><a href=\"/\">terapeutický&nbsp;web = kouzlo&nbsp;pohody = <span class=\"tdu\">www.kuvava.cz</span></a></div>\n<div id=\"pack2\">\n<div id=\"map\">\n<div class=\"tac\"><div id=\"but1\" class=\"but\">&nbsp;<span class=\"e1\">Zobrazit menu</span>&nbsp;</div></div>\n<menu id=\"ma\"><div id=\"jst1\" class=\"e1\">\n<div class=\"modd\"><a class=\"act\" href=\"/\"><li>Kontakt</li></a></div>\n</div></menu></div><div id=\"text\">\n<div class=\"e1\" id=\"jst2\">\n\n<div class=\"col1\">\n\n<h1>Vítejte na webu o lidech, štěstí a léčitelství</h1>\n\n<p>Až na výjimky, u nichž je to uvedeno, texty v současnosti utváří a\nslužby nabízí Tomáš Urban: „Terapeutická a magická činnost je moje\nvášeň. Porozhlédněte se po našich stránkách a vyberte si, co\npotřebujete.“</p>\n\n<h2>Kontaktní údaje</h2>\n\n<dl>\n	<dt><strong>Tomáš Urban</strong></dt>\n\n	<dd>tel: +420 / <strong>777 790 528</strong></dd>\n\n	<dd>e-mail: <strong><a\n	href=\"mailto:urban&#64;kuvava.cz\">urban&#64;<!-- -->kuvava.cz</a></strong></dd>\n</dl>\n\n<dl>\n	<dt>český účet:</dt>\n\n	<dd><strong>107–3720830217 / 0100</strong> (u Komerční banky)</dd>\n\n	<dd>(jako variabilní symbol uveďte své telefonní číslo, na které Vám\n	zašleme SMSkou potvrzení o přijetí platby)</dd>\n</dl>\n\n<dl>\n	<dt>slovenský účet:</dt>\n\n	<dd>18561447 / 6500 (u Poštové banky)</dd>\n</dl>\n\n</div>\n\n<div class=\"col1\">\n</div>\n</div>\n</div>\n</div>\n<div id=\"cr\">\n&copy; 2011-2015, spravuje <a href=\"/\">Tomáš Urban</a><span id=\"mlog\"><a href=\"/\"><img src=\"/images/logo/kuvava-logo-5xs.png\" alt=\"www.kuvava.cz = web o lidech, pohodě a léčitelství\" height=23 width=23></a></span></div>\n</div>\n</div>\n<div id=\"test\"></div>\n<!--[if lt IE 9]><script src=\"http://code.jquery.com/jquery-1.11.2.min.js\"></script><![endif]-->\n<![if gt IE 8]>\n<script src=\"http://code.jquery.com/jquery-2.1.3.min.js\"></script>\n<![endif]>\n<script src=\"http://nette.github.io/resources/js/netteForms.min.js\"></script>\n<script src=\"/js/my-1-0-6.js\"></script>\n\n');

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


-- 2015-12-07 10:40:04
