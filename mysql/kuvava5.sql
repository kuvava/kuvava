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
(1,	0,	1,	1,	NULL,	'Vítejte na webu o lidech, štěstí a léčitelství\r\n####################################################\r\n\r\nAž na výjimky, u nichž je to uvedeno, texty v současnosti utváří a služby nabízí Tomáš Urban: \"Terapeutická a magická činnost je moje vášeň. Porozhlédněte se po našich stránkách a vyberte si, co potřebujete.\"\r\n\r\n\r\nKontaktní údaje\r\n****************\r\n\r\n**Tomáš Urban**:\r\n    - tel: +420 / **777 790 528**\r\n    - e-mail: **urban@kuvava.cz**\r\n\r\n\r\nčeský účet::\r\n    - **107-3720830217 / 0100** (u Komerční banky)\r\n    - (jako variabilní symbol uveďte své telefonní číslo, na které Vám zašleme SMSkou potvrzení o přijetí platby)\r\n\r\n\r\nslovenský účet::\r\n    - 18561447 / 6500 (u Poštové banky)'),
(2,	0,	1,	2,	NULL,	'Co je kuvava a kdo jsou její autoři?\r\n####################################\r\n\r\nTak to je poněkud rozsáhlejší téma, proto jsme jej rozdělili do více rubrik, kterými se můžete proklikat:\r\n\r\n- \"význam slova kuvava\":[/co-znamena-slovo-kuvava/]\r\n- \"logo webu = s láskou máme naději změny\":[/symbol-vyrovnaneho-cloveka/]\r\n- \"kdo jsou manželé Urbanovi\":[/rodina-urbanova/jana-urbanova-tomas-urban-jejich-deti/]\r\n- \"kdo je Tomáš Urban\":[/tomas-urban/jsem-lecitel-terapeut/]\r\n- \"videoupoutávka\":[/video/jana-urbanova-tomas-urban/]'),
(3,	0,	1,	101,	NULL,	'<div class=\"but back e1\"><a href=\"/tym-lecitelu-terapeutu/\">&larr; zpět na seznam témat v rubrice \"O nás\"</a></div>\r\n\r\nSlovo kuvava je výrazem vděčnosti\r\n########################\r\n\r\nKdyž našemu synovi Lukáškovi byly necelé dva roky, používal (tak jako asi každé malé dítě) vlastní slovíčka. Takové ty zkomoleniny vzdáleně připomínající české ekvivalenty, které slýchával od nás rodičů.\r\n\r\nMísto českého \"děkuji\" říkal něco, co by se dalo zapsat zhruba jako \"kuvava\". A říkal to poměrně často, takže jsme si to dobře zapamatovali i do dalších let, kdy už své \"kuvava\" nahradil obvyklým \"děkuju\".\r\n\r\nV roce 2011 jsme hledali název domény pro naše stránky a ono \"kuvava\" nám přišlo vhod.\r\n\r\n<div class=\"but back e3\"><a href=\"/tym-lecitelu-terapeutu/\">&larr; zpět na seznam témat v rubrice \"O nás\"</a></div>');

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
(2,	0,	0,	0,	0,	NULL,	1,	NULL,	NULL),
(3,	0,	0,	0,	0,	NULL,	2,	NULL,	NULL);

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
(1,	'Kontakt',	'',	'Terapeut a léčitel Tomáš Urban',	'Přihlaste se na poradenství, léčbu na dálku, zrušení geopatogenních i elektrických zón, tématická setkání. Nebo čtěte terapeutické články.',	'ne',	NULL,	'ne'),
(2,	'O nás',	'tym-lecitelu-terapeutu',	'Co je kuvava a kdo jsou Jana a Tomáš Urbanovi',	'Rozcestník k informacím o Janě Urbanové, Tomáši Urbanovi, jejich dětech, významu slova kuvava a o logu (symbolu) webu www.kuvava.cz',	'ne',	NULL,	'ne'),
(101,	'Význam slova kuvava',	'co-znamena-slovo-kuvava',	'Co je to kuvava?',	'Když jsme hledali vhodný název pro naši doménu, zvolili jsme dětskou zkomoleninu českého slova děkuji.',	'ne',	NULL,	'ne');

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
(1,	1,	'<!DOCTYPE html>\n<html>\n<head>\n<meta http-equiv=\"Content-Language\" content=\"cs\">\n<meta http-equiv=\"content-type\" content=\"text/html; charset=utf-8\">\n<meta charset=\"utf-8\">\n<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n\n<title>Terapeut a léčitel Tomáš Urban | www.kuvava.cz</title>\n<meta name=\"description\" content=\"Přihlaste se na poradenství, léčbu na dálku, zrušení geopatogenních i elektrických zón, tématická setkání. Nebo čtěte terapeutické články.\">\n\n<link rel=\"stylesheet\" href=\"/css/kuvava-5-0-1.css\">\n<link rel=\"shortcut icon\" href=\"/favicon5.ico\">\n\n<!--[if lt IE 9]><script src=\"http://cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7.2/html5shiv.min.js\"></script><![endif]-->\n\n</head>\n<body>\n<script> document.documentElement.className+=\' js\' </script>\n<div id=\"all\">\n<div id=\"pack\">\n<div id=\"head\"><a href=\"/\">terapeutický&nbsp;web = kouzlo&nbsp;pohody = <span class=\"tdu\">www.kuvava.cz</span></a></div>\n<div id=\"pack2\">\n<div id=\"map\">\n<div class=\"tac\"><div id=\"but1\" class=\"but\">&nbsp;<span class=\"e1\">Zobrazit menu</span>&nbsp;</div></div>\n<menu id=\"ma\"><div id=\"jst1\" class=\"e1\">\n<div class=\"modd\"><a class=\"act\" href=\"/\"><li>Kontakt</li></a><a href=\"/tym-lecitelu-terapeutu/\"><li>O nás</li></a></div>\n</div></menu></div><div id=\"text\">\n<div class=\"e1\" id=\"jst2\">\n\n<div class=\"col1\">\n\n<h1>Vítejte na webu o lidech, štěstí a léčitelství</h1>\n\n<p>Až na výjimky, u nichž je to uvedeno, texty v současnosti utváří a\nslužby nabízí Tomáš Urban: „Terapeutická a magická činnost je moje\nvášeň. Porozhlédněte se po našich stránkách a vyberte si, co\npotřebujete.“</p>\n\n<h2>Kontaktní údaje</h2>\n\n<dl>\n	<dt><strong>Tomáš Urban</strong></dt>\n\n	<dd>tel: +420 / <strong>777 790 528</strong></dd>\n\n	<dd>e-mail: <strong><a\n	href=\"mailto:urban&#64;kuvava.cz\">urban&#64;<!-- -->kuvava.cz</a></strong></dd>\n</dl>\n\n<dl>\n	<dt>český účet:</dt>\n\n	<dd><strong>107–3720830217 / 0100</strong> (u Komerční banky)</dd>\n\n	<dd>(jako variabilní symbol uveďte své telefonní číslo, na které Vám\n	zašleme SMSkou potvrzení o přijetí platby)</dd>\n</dl>\n\n<dl>\n	<dt>slovenský účet:</dt>\n\n	<dd>18561447 / 6500 (u Poštové banky)</dd>\n</dl>\n\n</div>\n\n<div class=\"col1\">\n</div>\n</div>\n</div>\n</div>\n<div id=\"cr\">\n&copy; 2011-2015, spravuje <a href=\"/\">Tomáš Urban</a><span id=\"mlog\"><a href=\"/\"><img src=\"/images/logo/kuvava-logo-5xs.png\" alt=\"www.kuvava.cz = web o lidech, pohodě a léčitelství\" height=23 width=23></a></span></div>\n</div>\n</div>\n<div id=\"test\"></div>\n<!--[if lt IE 9]><script src=\"http://code.jquery.com/jquery-1.11.2.min.js\"></script><![endif]-->\n<![if gt IE 8]>\n<script src=\"http://code.jquery.com/jquery-2.1.3.min.js\"></script>\n<![endif]>\n<script src=\"http://nette.github.io/resources/js/netteForms.min.js\"></script>\n<script src=\"/js/my-1-0-6.js\"></script>\n\n'),
(2,	2,	'<!DOCTYPE html>\n<html>\n<head>\n<meta http-equiv=\"Content-Language\" content=\"cs\">\n<meta http-equiv=\"content-type\" content=\"text/html; charset=utf-8\">\n<meta charset=\"utf-8\">\n<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n\n<title>Co je kuvava a kdo jsou Jana a Tomáš Urbanovi | www.kuvava.cz</title>\n<meta name=\"description\" content=\"Rozcestník k informacím o Janě Urbanové, Tomáši Urbanovi, jejich dětech, významu slova kuvava a o logu (symbolu) webu www.kuvava.cz\">\n\n<link rel=\"stylesheet\" href=\"/css/kuvava-5-0-1.css\">\n<link rel=\"shortcut icon\" href=\"/favicon5.ico\">\n\n<!--[if lt IE 9]><script src=\"http://cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7.2/html5shiv.min.js\"></script><![endif]-->\n\n</head>\n<body>\n<script> document.documentElement.className+=\' js\' </script>\n<div id=\"all\">\n<div id=\"pack\">\n<div id=\"head\"><a href=\"/\">terapeutický&nbsp;web = kouzlo&nbsp;pohody = <span class=\"tdu\">www.kuvava.cz</span></a></div>\n<div id=\"pack2\">\n<div id=\"map\">\n<div class=\"tac\"><div id=\"but1\" class=\"but\">&nbsp;<span class=\"e1\">Zobrazit menu</span>&nbsp;</div></div>\n<menu id=\"ma\"><div id=\"jst1\" class=\"e1\">\n<div class=\"modd\"><a href=\"/\"><li>Kontakt</li></a><a class=\"act\" href=\"/tym-lecitelu-terapeutu/\"><li>O nás</li></a></div>\n</div></menu></div><div id=\"text\">\n<div class=\"e1\" id=\"jst2\">\n\n<div class=\"col1\">\n\n<h1>Co je kuvava a kdo jsou její autoři?</h1>\n\n<p>Tak to je poněkud rozsáhlejší téma, proto jsme jej rozdělili do více\nrubrik, kterými se můžete proklikat:</p>\n\n<ul>\n	<li><a href=\"/co-znamena-slovo-kuvava/\">význam slova kuvava</a></li>\n\n	<li><a href=\"/symbol-vyrovnaneho-cloveka/\">logo webu = s láskou máme naději\n	změny</a></li>\n\n	<li><a href=\"/rodina-urbanova/jana-urbanova-tomas-urban-jejich-deti/\">kdo jsou\n	manželé Urbanovi</a></li>\n\n	<li><a href=\"/tomas-urban/jsem-lecitel-terapeut/\">kdo je Tomáš Urban</a></li>\n\n	<li><a href=\"/video/jana-urbanova-tomas-urban/\">videoupoutávka</a></li>\n</ul>\n\n</div>\n\n<div class=\"col1\">\n</div>\n</div>\n</div>\n</div>\n<div id=\"cr\">\n&copy; 2011-2015, spravuje <a href=\"/\">Tomáš Urban</a><span id=\"mlog\"><a href=\"/\"><img src=\"/images/logo/kuvava-logo-5xs.png\" alt=\"www.kuvava.cz = web o lidech, pohodě a léčitelství\" height=23 width=23></a></span></div>\n</div>\n</div>\n<div id=\"test\"></div>\n<!--[if lt IE 9]><script src=\"http://code.jquery.com/jquery-1.11.2.min.js\"></script><![endif]-->\n<![if gt IE 8]>\n<script src=\"http://code.jquery.com/jquery-2.1.3.min.js\"></script>\n<![endif]>\n<script src=\"http://nette.github.io/resources/js/netteForms.min.js\"></script>\n<script src=\"/js/my-1-0-6.js\"></script>\n\n'),
(3,	101,	'<!DOCTYPE html>\n<html>\n<head>\n<meta http-equiv=\"Content-Language\" content=\"cs\">\n<meta http-equiv=\"content-type\" content=\"text/html; charset=utf-8\">\n<meta charset=\"utf-8\">\n<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n\n<title>Co je to kuvava? | www.kuvava.cz</title>\n<meta name=\"description\" content=\"Když jsme hledali vhodný název pro naši doménu, zvolili jsme dětskou zkomoleninu českého slova děkuji.\">\n\n<link rel=\"stylesheet\" href=\"/css/kuvava-5-0-1.css\">\n<link rel=\"shortcut icon\" href=\"/favicon5.ico\">\n\n<!--[if lt IE 9]><script src=\"http://cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7.2/html5shiv.min.js\"></script><![endif]-->\n\n</head>\n<body>\n<script> document.documentElement.className+=\' js\' </script>\n<div id=\"all\">\n<div id=\"pack\">\n<div id=\"head\"><a href=\"/\">terapeutický&nbsp;web = kouzlo&nbsp;pohody = <span class=\"tdu\">www.kuvava.cz</span></a></div>\n<div id=\"pack2\">\n<div id=\"map\">\n<div class=\"tac\"><div id=\"but1\" class=\"but\">&nbsp;<span class=\"e1\">Zobrazit menu</span>&nbsp;</div></div>\n<menu id=\"ma\"><div id=\"jst1\" class=\"e1\">\n<div class=\"modd\"><a href=\"/\"><li>Kontakt</li></a><a href=\"/tym-lecitelu-terapeutu/\"><li>O nás</li></a></div>\n</div></menu></div><div id=\"text\">\n<div class=\"e1\" id=\"jst2\">\n\n<div class=\"col1\">\n\n<div class=\"but back e1\"><a href=\"/tym-lecitelu-terapeutu/\">← zpět na seznam\ntémat v rubrice „O nás“</a></div>\n\n<h1>Slovo kuvava je výrazem vděčnosti</h1>\n\n<p>Když našemu synovi Lukáškovi byly necelé dva roky, používal (tak jako\nasi každé malé dítě) vlastní slovíčka. Takové ty zkomoleniny vzdáleně\npřipomínající české ekvivalenty, které slýchával od nás rodičů.</p>\n\n<p>Místo českého „děkuji“ říkal něco, co by se dalo zapsat zhruba\njako „kuvava“. A říkal to poměrně často, takže jsme si to dobře\nzapamatovali i do dalších let, kdy už své „kuvava“ nahradil obvyklým\n„děkuju“.</p>\n\n<p>V roce 2011 jsme hledali název domény pro naše stránky a ono\n„kuvava“ nám přišlo vhod.</p>\n\n<div class=\"but back e3\"><a href=\"/tym-lecitelu-terapeutu/\">← zpět na seznam\ntémat v rubrice „O nás“</a></div>\n\n</div>\n\n<div class=\"col1\">\n</div>\n</div>\n</div>\n</div>\n<div id=\"cr\">\n&copy; 2011-2015, spravuje <a href=\"/\">Tomáš Urban</a><span id=\"mlog\"><a href=\"/\"><img src=\"/images/logo/kuvava-logo-5xs.png\" alt=\"www.kuvava.cz = web o lidech, pohodě a léčitelství\" height=23 width=23></a></span></div>\n</div>\n</div>\n<div id=\"test\"></div>\n<!--[if lt IE 9]><script src=\"http://code.jquery.com/jquery-1.11.2.min.js\"></script><![endif]-->\n<![if gt IE 8]>\n<script src=\"http://code.jquery.com/jquery-2.1.3.min.js\"></script>\n<![endif]>\n<script src=\"http://nette.github.io/resources/js/netteForms.min.js\"></script>\n<script src=\"/js/my-1-0-6.js\"></script>\n\n');

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

INSERT INTO `zaloha_obsah` (`id`, `stranka_id`, `editor_obsahu_stranky_id`, `poradi`, `pocet_sloupcu`, `texy`, `datum`) VALUES
(1,	1,	1,	0,	1,	'Vítejte na webu o lidech, štěstí a léčitelství\r\n####################################################\r\n\r\nAž na výjimky, u nichž je to uvedeno, texty v současnosti utváří a služby nabízí Tomáš Urban: \"Terapeutická a magická činnost je moje vášeň. Porozhlédněte se po našich stránkách a vyberte si, co potřebujete.\"\r\n\r\n\r\nKontaktní údaje\r\n****************\r\n\r\n**Tomáš Urban**:\r\n    - tel: +420 / **777 790 528**\r\n    - e-mail: **urban@kuvava.cz**\r\n\r\n\r\nčeský účet::\r\n    - **107-3720830217 / 0100** (u Komerční banky)\r\n    - (jako variabilní symbol uveďte své telefonní číslo, na které Vám zašleme SMSkou potvrzení o přijetí platby)\r\n\r\n\r\nslovenský účet::\r\n    - 18561447 / 6500 (u Poštové banky)',	'2015-12-07 12:29:30'),
(2,	2,	2,	0,	1,	'Co je kuvava a kdo jsou její autoři?\r\n####################################\r\n\r\nTak to je poněkud rozsáhlejší téma, proto jsme jej rozdělili do více rubrik, kterými se můžete proklikat:\r\n\r\n- \"význam slova kuvava\":[/co-znamena-slovo-kuvava/]\r\n- \"logo webu = s láskou máme naději změny\":[/symbol-vyrovnaneho-cloveka/]\r\n- \"kdo jsou manželé Urbanovi\":[/rodina-urbanova/jana-urbanova-tomas-urban-jejich-deti/]\r\n- \"kdo je Tomáš Urban\":[/tomas-urban/jsem-lecitel-terapeut/]\r\n- \"videoupoutávka\":[/video/jana-urbanova-tomas-urban/]',	'2015-12-07 12:29:30'),
(3,	101,	3,	0,	1,	'<div class=\"but back\"><a href=\"/tym-lecitelu-terapeutu/\">&larr; zpět na seznam témat v rubrice \"O nás\"</a></div>\r\n\r\nSlovo kuvava je výraz vděčnosti\r\n########################\r\n\r\nKdyž našemu synovi Lukáškovi byly necelé dva roky, používal (tak jako asi každé malé dítě) vlastní slovíčka. Takové ty zkomoleniny vzdáleně připomínající české ekvivalenty, které slýchával od nás rodičů.\r\n\r\nMísto českého \"děkuji\" říkal něco, co by se dalo zapsat zhruba jako \"kuvava\". A říkal to poměrně často, takže jsme si to dobře zapamatovali i do dalších let, kdy už své \"kuvava\" nahradil obvyklým \"děkuju\".\r\n\r\nV roce 2011 jsme hledali název domény pro naše stránky a ono \"kuvava\" nám přišlo vhod.\r\n\r\n<div class=\"but back\"><a href=\"/tym-lecitelu-terapeutu/\">&larr; zpět na seznam témat v rubrice \"O nás\"</a></div>',	'2015-12-07 12:44:45'),
(4,	101,	3,	0,	1,	'<div class=\"but back\"><a href=\"/tym-lecitelu-terapeutu/\">&larr; zpět na seznam témat v rubrice \"O nás\"</a></div>\r\n\r\nSlovo kuvava je výrazem vděčnosti\r\n########################\r\n\r\nKdyž našemu synovi Lukáškovi byly necelé dva roky, používal (tak jako asi každé malé dítě) vlastní slovíčka. Takové ty zkomoleniny vzdáleně připomínající české ekvivalenty, které slýchával od nás rodičů.\r\n\r\nMísto českého \"děkuji\" říkal něco, co by se dalo zapsat zhruba jako \"kuvava\". A říkal to poměrně často, takže jsme si to dobře zapamatovali i do dalších let, kdy už své \"kuvava\" nahradil obvyklým \"děkuju\".\r\n\r\nV roce 2011 jsme hledali název domény pro naše stránky a ono \"kuvava\" nám přišlo vhod.\r\n\r\n<div class=\"but back\"><a href=\"/tym-lecitelu-terapeutu/\">&larr; zpět na seznam témat v rubrice \"O nás\"</a></div>',	'2015-12-07 12:49:42'),
(5,	101,	3,	0,	1,	'<div class=\"but back e1\"><a href=\"/tym-lecitelu-terapeutu/\">&larr; zpět na seznam témat v rubrice \"O nás\"</a></div>\r\n\r\nSlovo kuvava je výrazem vděčnosti\r\n########################\r\n\r\nKdyž našemu synovi Lukáškovi byly necelé dva roky, používal (tak jako asi každé malé dítě) vlastní slovíčka. Takové ty zkomoleniny vzdáleně připomínající české ekvivalenty, které slýchával od nás rodičů.\r\n\r\nMísto českého \"děkuji\" říkal něco, co by se dalo zapsat zhruba jako \"kuvava\". A říkal to poměrně často, takže jsme si to dobře zapamatovali i do dalších let, kdy už své \"kuvava\" nahradil obvyklým \"děkuju\".\r\n\r\nV roce 2011 jsme hledali název domény pro naše stránky a ono \"kuvava\" nám přišlo vhod.\r\n\r\n<div class=\"but back e3\"><a href=\"/tym-lecitelu-terapeutu/\">&larr; zpět na seznam témat v rubrice \"O nás\"</a></div>',	'2015-12-07 12:59:52');

-- 2015-12-07 12:12:29
