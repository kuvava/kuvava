-- phpMyAdmin SQL Dump
-- version 3.5.8.2
-- http://www.phpmyadmin.net
--
-- Počítač: wm93.wedos.net:3306
-- Vygenerováno: Sob 05. zář 2015, 14:15
-- Verze serveru: 5.6.23
-- Verze PHP: 5.4.23

SET FOREIGN_KEY_CHECKS=0;
SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Databáze: `d107491_gorazd1`
--

-- --------------------------------------------------------

--
-- Struktura tabulky `editor_obsahu_stranky`
--

DROP TABLE IF EXISTS `editor_obsahu_stranky`;
CREATE TABLE IF NOT EXISTS `editor_obsahu_stranky` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `poradi` int(11) NOT NULL DEFAULT '0' COMMENT 'Výchozí hodnota je 0',
  `pocet_sloupcu` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT 'Výchozí hodnota je 1 - nemá to smysl u galerie, má to smysl pouze u textu',
  `stranka_id` int(11) NOT NULL,
  `galerie_skupina_fotek_id` int(11) DEFAULT NULL,
  `obsah_texy` text COLLATE utf8_czech_ci NOT NULL COMMENT 'TOTO POLÍČKO VYPLŇUJEŠ TY',
  PRIMARY KEY (`id`),
  KEY `stranka_id` (`stranka_id`),
  KEY `galerie_skupina_fotek_id` (`galerie_skupina_fotek_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci AUTO_INCREMENT=8 ;

--
-- Vypisuji data pro tabulku `editor_obsahu_stranky`
--

INSERT INTO `editor_obsahu_stranky` (`id`, `poradi`, `pocet_sloupcu`, `stranka_id`, `galerie_skupina_fotek_id`, `obsah_texy`) VALUES
(1, 0, 1, 1, NULL, 'O nás\r\n#################\r\n\r\nJsme architektonická a projekční kancelář klasického zaměření. Poskytujeme kompletní služby pro ty, kteří mají záměr stavět dům nebo jakoukoli jinou budovu. Pokrýváme celý rozsah projektové přípravy staveb od prvotního záměru až po kolaudaci stavby. Navrhujeme a projektujeme jak nové stavby, tak i rekonstrukce stávajících objektů.\r\n \r\nZákladem naší kanceláře jsou dva architekti s dlouholetou praxí; dále máme okruh spolupracovníků pro projektové části: statika staveb, tepelná bilance, požární bezpečnost, zdravotně technické instalace (voda, kanalizace, plyn), vytápění budov a vzduchotechnika, elektroinstalace. Spolupracujeme dlouhodobě s geodety, specialisty na měření hluku, oslunění, radonový průzkum a dalšími odborníky.\r\nSpolupracujeme také s dalšími architekty a stavebními inženýry a studenty, jsme flexibilní a v případě potřeby jsme schopni navýšit několikanásobně kapacitu naší kanceláře.\r\n\r\nVzdělání a profesní praxe:\r\n############################\r\n\r\n| 1990-2015 | vlastní projekční kancelář ATELIER G (autorizace 1993)\r\n| 1998 | atelier Hlaváček&partner, samostatný projektant\r\n| 1989-90 | Arch. Sepp Müller, Wien/Austria, spolupracující architekt/zaměstnanec\r\n| 1988-89 | Atelier prof. Arch. Gustav Peichel, Wien/Austria, spolupracující architekt \r\n| 1985-88 | architekt ve svobodném povolání Praha \r\n| 1986-87 | Krajský projektový ústav Praha, architekt-projektant\r\n| 1985-90 | AVU Praha, obor architektura\r\n| 1979-85 | ČVUT Praha – Fakulta architektury, diplom 1985\r\n| 1978-79 | VUT Brno – Stavební fakulta \r\n| 1977-78 | Projektant pozemních staveb, Texing Trenčín\r\n| 1973-77 | Střední průmyslová škola stavební, obor pozemní stavby, maturita 1977\r\n| 1964-73 | Základní devítiletá škola s rozšířenou výukou němčiny'),
(2, 0, 1, 2, NULL, 'Pro naše klienty zabezpečujeme tyto odborné činnosti:\r\n##########################################\r\n\r\n- poradenství při výběru pozemku nebo stavebního objektu (domu)\r\n- sestavení stavebního záměru a programu stavby\r\n- návrh stavby ( architektonická studie)\r\n- projekt stavby pro územní řízení (DÚR)\r\n- vyřízení Územního rozhodnutí včetně kompletního projednání a zajištění stanovisek\r\n- projekt stavby pro stavební povolení nebo ohlášení (DSP)\r\n- vyřízení Stavebního povolení včetně kompletního projednání a zajištění stanovisek\r\n- prováděcí (realizační) projekt stavby (PP)  \r\n- dokumentace k výběrovému řízení\r\n- autorský dozor nad realizací stavby\r\n- kolaudace stavby (převzetí hotové stavby, vyúčtování, projekt skutečného provedení)\r\n- návrhy a projekty interiérů\r\n- zastavovací plány a urbanistické studie\r\n- návrhy zahrad, dětských hřišť, venkovních ploch a veřejných prostranství včetně mobiliáře\r\n- poradenství ve všech otázkách okolo stavění, projektování, interiérů, zahrad a jiných budovatelských záměrů.\r\n\r\nKaždou z předešlých činností lze objednat jednotlivě např. jenom návrh stavby či jenom konzultaci. Objednání jakékoli činnosti Vás nezavazuje k objednání činnosti další.'),
(3, 0, 1, 5, NULL, 'Kontakty\r\n###########\r\n                                                                                          \r\n**Ing. arch. Gorazd Balejík**:\r\n   - tel: **602 667 885**\r\n   - e-mail: gorazd@seznam.cz\r\n   - web: www.vas-architekt.cz\r\n\r\n\r\n**Ing. arch. Michaela Šťastná**:\r\n   - tel: **724 205 352**\r\n   - e-mail: stastna.michaela@tiscali.cz\r\n   - web: www.mi-atelier.cz\r\n\r\n\r\n**sídlo**:\r\n   - **788 03 Nový Malín 583**\r\n   - okres Šumperk\r\n   - kraj Olomoucký\r\n   - Česká republika'),
(4, 0, 1, 6, NULL, '**Motto:**\r\n Architektura je **tvorba prostředí** ve kterém žijeme (pohybujeme se, pracujeme, odpočíváme, tvoříme, přemýšlíme, radujeme se, milujeme a umíráme). Uvědomujeme si jak je důležitá kvalita prostředí ve kterém trávíme většinu života? Protože ovlivňuje kvalitu našeho života fyzického (pohyb, způsob užívání, pocity) i duchovního (inspiruje, povznáší, dělá nás šťastnějšími..nebo také naopak). Dobrá architektura je nejčastěji vlídným místem pro náš život, místem radosti a dobrých vztahů, místem které se jmenuje **domov**.\r\n\r\n\r\n[* model02b.png .{width:80%} *] .[tar]'),
(5, 0, 1, 3, NULL, 'Omlouváme se, ale galerie je právě ve výstavbě. V případě zájmu Vám rádi zašleme ukázky naší práce e-mailem. \r\n\r\nDěkujeme za porozumění.\r\n\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>'),
(7, 0, 1, 4, NULL, 'Omlouváme se, ale náš ceník právě aktualizujeme. Ceny služeb lze poptat individuálně e-mailem nebo telefonem.\n\nDěkujeme za porozumění.\n\n<p>&nbsp;</p>\n<p>&nbsp;</p>\n<p>&nbsp;</p>\n<p>&nbsp;</p>\n<p>&nbsp;</p>\n<p>&nbsp;</p>\n<p>&nbsp;</p>\n<p>&nbsp;</p>\n<p>&nbsp;</p>');

-- --------------------------------------------------------

--
-- Struktura tabulky `galerie_prirazene_polozky`
--

DROP TABLE IF EXISTS `galerie_prirazene_polozky`;
CREATE TABLE IF NOT EXISTS `galerie_prirazene_polozky` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `galerie_skupina_fotek_id` int(11) NOT NULL,
  `vsechny_fotky_id` int(11) NOT NULL,
  `poradi` int(11) NOT NULL DEFAULT '0' COMMENT 'Lze zadávat i záporná čísla, čím je číslo nižší, tím bude fotka blíže k začátku skupiny... Fotky se stejnou hodnotou sloupce `poradi` se řadí vzestupně podle sloupce `id`',
  PRIMARY KEY (`id`),
  KEY `galerie_skupina_fotek_id` (`galerie_skupina_fotek_id`),
  KEY `vsechny_fotky_id` (`vsechny_fotky_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struktura tabulky `galerie_skupina_fotek`
--

DROP TABLE IF EXISTS `galerie_skupina_fotek`;
CREATE TABLE IF NOT EXISTS `galerie_skupina_fotek` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `poznamka` varchar(255) COLLATE utf8_czech_ci NOT NULL COMMENT 'Slouží pro Tvou orientaci.',
  `googlepopis_automatizovane` varchar(255) COLLATE utf8_czech_ci NOT NULL COMMENT 'Fotografie, které nemají vlastní googlepopis obdrží tento společný.',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struktura tabulky `menu_polozky`
--

DROP TABLE IF EXISTS `menu_polozky`;
CREATE TABLE IF NOT EXISTS `menu_polozky` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_id` int(11) NOT NULL DEFAULT '0',
  `rodic` int(11) NOT NULL DEFAULT '0',
  `uroven` int(11) NOT NULL DEFAULT '0',
  `poradi` int(11) NOT NULL DEFAULT '0',
  `stranka_id` int(11) NOT NULL,
  `alternativni_napis` varchar(100) COLLATE utf8_czech_ci DEFAULT NULL,
  `class` varchar(50) COLLATE utf8_czech_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `stranka_id` (`stranka_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci AUTO_INCREMENT=6 ;

--
-- Vypisuji data pro tabulku `menu_polozky`
--

INSERT INTO `menu_polozky` (`id`, `menu_id`, `rodic`, `uroven`, `poradi`, `stranka_id`, `alternativni_napis`, `class`) VALUES
(0, 0, 0, 0, 0, 6, NULL, NULL),
(1, 0, 0, 0, 0, 1, NULL, NULL),
(2, 0, 0, 0, 0, 2, NULL, NULL),
(3, 0, 0, 0, 0, 3, NULL, NULL),
(4, 0, 0, 0, 0, 4, NULL, NULL),
(5, 0, 0, 0, 0, 5, NULL, NULL);

-- --------------------------------------------------------

--
-- Struktura tabulky `stranka`
--

DROP TABLE IF EXISTS `stranka`;
CREATE TABLE IF NOT EXISTS `stranka` (
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci AUTO_INCREMENT=7 ;

--
-- Vypisuji data pro tabulku `stranka`
--

INSERT INTO `stranka` (`id`, `rubrika`, `url`, `googletitulek`, `googlepopisek`, `editor_zmeneno`, `obsah_html_dole`, `obsahuje_galerii`) VALUES
(1, 'Kdo jsme', 'gorazd-balejik-atelier-g', NULL, NULL, 'ne', '', 'ne'),
(2, 'Co děláme', 'gorazd-balejik', NULL, NULL, 'ne', '', 'ne'),
(3, 'Galerie staveb', 'archiv-architektonickych-projektu', NULL, NULL, 'ne', '', 'ne'),
(4, 'Cena služeb', 'architektonicka-a-projekcni-kancelar/cenik', NULL, NULL, 'ne', '', 'ne'),
(5, 'Kontakt', 'michaela-stastna-gorazd-balejik/kontakt', NULL, NULL, 'ne', '', 'ne'),
(6, 'Úvod', '', NULL, NULL, 'ne', NULL, 'ne');

-- --------------------------------------------------------

--
-- Struktura tabulky `stranka_html_celek`
--

DROP TABLE IF EXISTS `stranka_html_celek`;
CREATE TABLE IF NOT EXISTS `stranka_html_celek` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stranka_id` int(11) NOT NULL,
  `html` text COLLATE utf8_czech_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `stranka_id` (`stranka_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci AUTO_INCREMENT=7 ;

--
-- Vypisuji data pro tabulku `stranka_html_celek`
--

INSERT INTO `stranka_html_celek` (`id`, `stranka_id`, `html`) VALUES
(1, 1, '<!DOCTYPE html>\n<html>\n<head>\n<meta http-equiv="Content-Language" content="cs">\n<meta http-equiv="content-type" content="text/html; charset=utf-8">\n<meta charset="utf-8">\n<meta name="viewport" content="width=device-width, initial-scale=1.0">\n\n<title>Architekt Gorazd Balejík | www.vas-architekt.cz</title>\n\n<link rel="stylesheet" href="/css/arch-1-0-2.css">\n<link rel="shortcut icon" href="/favicon.ico">\n\n<!--[if lt IE 9]><script src="http://cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7.2/html5shiv.min.js"></script><![endif]-->\n\n</head>\n<body>\n<script> document.documentElement.className+='' js'' </script>\n<div id="all">\n<div id="pack">\n<a href="/" id="h1"><div class="bgi"><img src="/images/main-content/final01-s.jpg"><h1><div class="e1"><strong>ING. ARCH. GORAZD BALEJÍK</strong> <small>&nbsp;AUTORIZOVANÝ&nbsp;ARCHITEKT&nbsp;ČKA</small></div><div>ATELIER G – ARCHITEKTONICKÁ A&nbsp;PROJEKČNÍ&nbsp;KANCELÁŘ</div></h1></div></a>\n<div id="pack2">\n<div id="map">\n<div class="tac"><div id="but1" class="but">&nbsp;<span class="e1">Zobrazit menu</span>&nbsp;</div></div>\n<menu id="ma"><div id="jst1" class="e1">\n<a href="/"><li>ÚVOD</li></a><a class="act" href="/gorazd-balejik-atelier-g/"><li>KDO JSME</li></a><a href="/gorazd-balejik/"><li>CO DĚLÁME</li></a><a href="/archiv-architektonickych-projektu/"><li>GALERIE STAVEB</li></a><a href="/architektonicka-a-projekcni-kancelar/cenik/"><li>CENA SLUŽEB</li></a><a href="/michaela-stastna-gorazd-balejik/kontakt/"><li>KONTAKT</li></a>\n</div></menu></div><div id="text"><div class="e1" id="jst2">\n\n<div class="col1">\n\n<h2>O nás</h2>\n\n<p>Jsme architektonická a projekční kancelář klasického zaměření.\nPoskytujeme kompletní služby pro ty, kteří mají záměr stavět dům nebo\njakoukoli jinou budovu. Pokrýváme celý rozsah projektové přípravy staveb\nod prvotního záměru až po kolaudaci stavby. Navrhujeme a projektujeme jak\nnové stavby, tak i rekonstrukce stávajících objektů.</p>\n\n<p>Základem naší kanceláře jsou dva architekti s dlouholetou praxí; dále\nmáme okruh spolupracovníků pro projektové části: statika staveb, tepelná\nbilance, požární bezpečnost, zdravotně technické instalace (voda,\nkanalizace, plyn), vytápění budov a vzduchotechnika, elektroinstalace.\nSpolupracujeme dlouhodobě s geodety, specialisty na měření hluku,\noslunění, radonový průzkum a dalšími odborníky. Spolupracujeme také\ns dalšími architekty a stavebními inženýry a studenty, jsme flexibilní a\nv případě potřeby jsme schopni navýšit několikanásobně kapacitu naší\nkanceláře.</p>\n\n<h2>Vzdělání a profesní praxe:</h2>\n\n<table>\n	<tbody>\n		<tr>\n			<td>1990–2015</td>\n\n			<td>vlastní projekční kancelář ATELIER G (autorizace 1993)</td>\n		</tr>\n\n		<tr>\n			<td>1998</td>\n\n			<td> atelier Hlaváček&amp;partner, samostatný projektant</td>\n		</tr>\n\n		<tr>\n			<td>1989–90</td>\n\n			<td>Arch. Sepp Müller, Wien/Austria, spolupracující\n			architekt/zaměs­tnanec</td>\n		</tr>\n\n		<tr>\n			<td>1988–89</td>\n\n			<td>Atelier prof. Arch. Gustav Peichel, Wien/Austria, spolupracující\n			architekt</td>\n		</tr>\n\n		<tr>\n			<td>1985–88</td>\n\n			<td>architekt ve svobodném povolání Praha</td>\n		</tr>\n\n		<tr>\n			<td>1986–87</td>\n\n			<td>Krajský projektový ústav Praha, architekt-projektant</td>\n		</tr>\n\n		<tr>\n			<td>1985–90</td>\n\n			<td>AVU Praha, obor architektura</td>\n		</tr>\n\n		<tr>\n			<td>1979–85</td>\n\n			<td>ČVUT Praha – Fakulta architektury, diplom 1985</td>\n		</tr>\n\n		<tr>\n			<td>1978–79</td>\n\n			<td>VUT Brno – Stavební fakulta</td>\n		</tr>\n\n		<tr>\n			<td>1977–78</td>\n\n			<td>Projektant pozemních staveb, Texing Trenčín</td>\n		</tr>\n\n		<tr>\n			<td>1973–77</td>\n\n			<td>Střední průmyslová škola stavební, obor pozemní stavby,\n			maturita 1977</td>\n		</tr>\n\n		<tr>\n			<td>1964–73</td>\n\n			<td>Základní devítiletá škola s rozšířenou výukou němčiny</td>\n		</tr>\n	</tbody>\n</table>\n\n</div>\n\n<div class="col1">\n</div>\n<div class="col1">\n\n</div>\n</div>\n</div>\n</div>\n<div id="cr">\n<p><a href="/michaela-stastna-gorazd-balejik/kontakt/">&copy; 2015 - www.vas-architekt.cz</a></p>\n</div>\n</div>\n</div>\n<div id="test"></div>\n<!--[if lt IE 9]><script src="http://code.jquery.com/jquery-1.11.2.min.js"></script><![endif]-->\n<![if gt IE 8]>\n<script src="http://code.jquery.com/jquery-2.1.3.min.js"></script>\n<![endif]>\n<script src="http://nette.github.io/resources/js/netteForms.min.js"></script>\n<script src="/js/my-1-0-5.js"></script>\n\n'),
(2, 2, '<!DOCTYPE html>\n<html>\n<head>\n<meta http-equiv="Content-Language" content="cs">\n<meta http-equiv="content-type" content="text/html; charset=utf-8">\n<meta charset="utf-8">\n<meta name="viewport" content="width=device-width, initial-scale=1.0">\n\n<title>Architekt Gorazd Balejík | www.vas-architekt.cz</title>\n\n<link rel="stylesheet" href="/css/arch-1-0-2.css">\n<link rel="shortcut icon" href="/favicon.ico">\n\n<!--[if lt IE 9]><script src="http://cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7.2/html5shiv.min.js"></script><![endif]-->\n\n</head>\n<body>\n<script> document.documentElement.className+='' js'' </script>\n<div id="all">\n<div id="pack">\n<a href="/" id="h1"><div class="bgi"><img src="/images/main-content/final01-s.jpg"><h1><div class="e1"><strong>ING. ARCH. GORAZD BALEJÍK</strong> <small>&nbsp;AUTORIZOVANÝ&nbsp;ARCHITEKT&nbsp;ČKA</small></div><div>ATELIER G – ARCHITEKTONICKÁ A&nbsp;PROJEKČNÍ&nbsp;KANCELÁŘ</div></h1></div></a>\n<div id="pack2">\n<div id="map">\n<div class="tac"><div id="but1" class="but">&nbsp;<span class="e1">Zobrazit menu</span>&nbsp;</div></div>\n<menu id="ma"><div id="jst1" class="e1">\n<a href="/"><li>ÚVOD</li></a><a href="/gorazd-balejik-atelier-g/"><li>KDO JSME</li></a><a class="act" href="/gorazd-balejik/"><li>CO DĚLÁME</li></a><a href="/archiv-architektonickych-projektu/"><li>GALERIE STAVEB</li></a><a href="/architektonicka-a-projekcni-kancelar/cenik/"><li>CENA SLUŽEB</li></a><a href="/michaela-stastna-gorazd-balejik/kontakt/"><li>KONTAKT</li></a>\n</div></menu></div><div id="text"><div class="e1" id="jst2">\n\n<div class="col1">\n\n<h2>Pro naše klienty zabezpečujeme tyto odborné činnosti:</h2>\n\n<ul>\n	<li>poradenství při výběru pozemku nebo stavebního objektu (domu)</li>\n\n	<li>sestavení stavebního záměru a programu stavby</li>\n\n	<li>návrh stavby ( architektonická studie)</li>\n\n	<li>projekt stavby pro územní řízení (DÚR)</li>\n\n	<li>vyřízení Územního rozhodnutí včetně kompletního projednání a\n	zajištění stanovisek</li>\n\n	<li>projekt stavby pro stavební povolení nebo ohlášení (DSP)</li>\n\n	<li>vyřízení Stavebního povolení včetně kompletního projednání a\n	zajištění stanovisek</li>\n\n	<li>prováděcí (realizační) projekt stavby (PP)</li>\n\n	<li>dokumentace k výběrovému řízení</li>\n\n	<li>autorský dozor nad realizací stavby</li>\n\n	<li>kolaudace stavby (převzetí hotové stavby, vyúčtování, projekt\n	skutečného provedení)</li>\n\n	<li>návrhy a projekty interiérů</li>\n\n	<li>zastavovací plány a urbanistické studie</li>\n\n	<li>návrhy zahrad, dětských hřišť, venkovních ploch a veřejných\n	prostranství včetně mobiliáře</li>\n\n	<li>poradenství ve všech otázkách okolo stavění, projektování,\n	interiérů, zahrad a jiných budovatelských záměrů.</li>\n</ul>\n\n<p>Každou z předešlých činností lze objednat jednotlivě např. jenom\nnávrh stavby či jenom konzultaci. Objednání jakékoli činnosti Vás\nnezavazuje k objednání činnosti další.</p>\n\n</div>\n\n<div class="col1">\n</div>\n<div class="col1">\n\n</div>\n</div>\n</div>\n</div>\n<div id="cr">\n<p><a href="/michaela-stastna-gorazd-balejik/kontakt/">&copy; 2015 - www.vas-architekt.cz</a></p>\n</div>\n</div>\n</div>\n<div id="test"></div>\n<!--[if lt IE 9]><script src="http://code.jquery.com/jquery-1.11.2.min.js"></script><![endif]-->\n<![if gt IE 8]>\n<script src="http://code.jquery.com/jquery-2.1.3.min.js"></script>\n<![endif]>\n<script src="http://nette.github.io/resources/js/netteForms.min.js"></script>\n<script src="/js/my-1-0-5.js"></script>\n\n'),
(3, 3, '<!DOCTYPE html>\n<html>\n<head>\n<meta http-equiv="Content-Language" content="cs">\n<meta http-equiv="content-type" content="text/html; charset=utf-8">\n<meta charset="utf-8">\n<meta name="viewport" content="width=device-width, initial-scale=1.0">\n\n<title>Architekt Gorazd Balejík | www.vas-architekt.cz</title>\n\n<link rel="stylesheet" href="/css/arch-1-0-2.css">\n<link rel="shortcut icon" href="/favicon.ico">\n\n<!--[if lt IE 9]><script src="http://cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7.2/html5shiv.min.js"></script><![endif]-->\n\n</head>\n<body>\n<script> document.documentElement.className+='' js'' </script>\n<div id="all">\n<div id="pack">\n<a href="/" id="h1"><div class="bgi"><img src="/images/main-content/final01-s.jpg"><h1><div class="e1"><strong>ING. ARCH. GORAZD BALEJÍK</strong> <small>&nbsp;AUTORIZOVANÝ&nbsp;ARCHITEKT&nbsp;ČKA</small></div><div>ATELIER G – ARCHITEKTONICKÁ A&nbsp;PROJEKČNÍ&nbsp;KANCELÁŘ</div></h1></div></a>\n<div id="pack2">\n<div id="map">\n<div class="tac"><div id="but1" class="but">&nbsp;<span class="e1">Zobrazit menu</span>&nbsp;</div></div>\n<menu id="ma"><div id="jst1" class="e1">\n<a href="/"><li>ÚVOD</li></a><a href="/gorazd-balejik-atelier-g/"><li>KDO JSME</li></a><a href="/gorazd-balejik/"><li>CO DĚLÁME</li></a><a class="act" href="/archiv-architektonickych-projektu/"><li>GALERIE STAVEB</li></a><a href="/architektonicka-a-projekcni-kancelar/cenik/"><li>CENA SLUŽEB</li></a><a href="/michaela-stastna-gorazd-balejik/kontakt/"><li>KONTAKT</li></a>\n</div></menu></div><div id="text"><div class="e1" id="jst2">\n\n<div class="col1">\n\n<p>Omlouváme se, ale galerie je právě ve výstavbě. V případě zájmu\nVám rádi zašleme ukázky naší práce e-mailem.</p>\n\n<p>Děkujeme za porozumění.</p>\n\n<p> </p>\n\n<p> </p>\n\n<p> </p>\n\n<p> </p>\n\n<p> </p>\n\n<p> </p>\n\n<p> </p>\n\n<p> </p>\n\n<p> </p>\n\n</div>\n\n<div class="col1">\n</div>\n<div class="col1">\n\n</div>\n</div>\n</div>\n</div>\n<div id="cr">\n<p><a href="/michaela-stastna-gorazd-balejik/kontakt/">&copy; 2015 - www.vas-architekt.cz</a></p>\n</div>\n</div>\n</div>\n<div id="test"></div>\n<!--[if lt IE 9]><script src="http://code.jquery.com/jquery-1.11.2.min.js"></script><![endif]-->\n<![if gt IE 8]>\n<script src="http://code.jquery.com/jquery-2.1.3.min.js"></script>\n<![endif]>\n<script src="http://nette.github.io/resources/js/netteForms.min.js"></script>\n<script src="/js/my-1-0-5.js"></script>\n\n'),
(4, 4, '<!DOCTYPE html>\n<html>\n<head>\n<meta http-equiv="Content-Language" content="cs">\n<meta http-equiv="content-type" content="text/html; charset=utf-8">\n<meta charset="utf-8">\n<meta name="viewport" content="width=device-width, initial-scale=1.0">\n\n<title>Architekt Gorazd Balejík | www.vas-architekt.cz</title>\n\n<link rel="stylesheet" href="/css/arch-1-0-2.css">\n<link rel="shortcut icon" href="/favicon.ico">\n\n<!--[if lt IE 9]><script src="http://cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7.2/html5shiv.min.js"></script><![endif]-->\n\n</head>\n<body>\n<script> document.documentElement.className+='' js'' </script>\n<div id="all">\n<div id="pack">\n<a href="/" id="h1"><div class="bgi"><img src="/images/main-content/final01-s.jpg"><h1><div class="e1"><strong>ING. ARCH. GORAZD BALEJÍK</strong> <small>&nbsp;AUTORIZOVANÝ&nbsp;ARCHITEKT&nbsp;ČKA</small></div><div>ATELIER G – ARCHITEKTONICKÁ A&nbsp;PROJEKČNÍ&nbsp;KANCELÁŘ</div></h1></div></a>\n<div id="pack2">\n<div id="map">\n<div class="tac"><div id="but1" class="but">&nbsp;<span class="e1">Zobrazit menu</span>&nbsp;</div></div>\n<menu id="ma"><div id="jst1" class="e1">\n<a href="/"><li>ÚVOD</li></a><a href="/gorazd-balejik-atelier-g/"><li>KDO JSME</li></a><a href="/gorazd-balejik/"><li>CO DĚLÁME</li></a><a href="/archiv-architektonickych-projektu/"><li>GALERIE STAVEB</li></a><a class="act" href="/architektonicka-a-projekcni-kancelar/cenik/"><li>CENA SLUŽEB</li></a><a href="/michaela-stastna-gorazd-balejik/kontakt/"><li>KONTAKT</li></a>\n</div></menu></div><div id="text"><div class="e1" id="jst2">\n\n<div class="col1">\n\n<p>Omlouváme se, ale náš ceník právě aktualizujeme. Ceny služeb lze\npoptat individuálně e-mailem nebo telefonem.</p>\n\n<p>Děkujeme za porozumění.</p>\n\n<p> </p>\n\n<p> </p>\n\n<p> </p>\n\n<p> </p>\n\n<p> </p>\n\n<p> </p>\n\n<p> </p>\n\n<p> </p>\n\n<p> </p>\n\n</div>\n\n<div class="col1">\n</div>\n<div class="col1">\n\n</div>\n</div>\n</div>\n</div>\n<div id="cr">\n<p><a href="/michaela-stastna-gorazd-balejik/kontakt/">&copy; 2015 - www.vas-architekt.cz</a></p>\n</div>\n</div>\n</div>\n<div id="test"></div>\n<!--[if lt IE 9]><script src="http://code.jquery.com/jquery-1.11.2.min.js"></script><![endif]-->\n<![if gt IE 8]>\n<script src="http://code.jquery.com/jquery-2.1.3.min.js"></script>\n<![endif]>\n<script src="http://nette.github.io/resources/js/netteForms.min.js"></script>\n<script src="/js/my-1-0-5.js"></script>\n\n'),
(5, 5, '<!DOCTYPE html>\n<html>\n<head>\n<meta http-equiv="Content-Language" content="cs">\n<meta http-equiv="content-type" content="text/html; charset=utf-8">\n<meta charset="utf-8">\n<meta name="viewport" content="width=device-width, initial-scale=1.0">\n\n<title>Architekt Gorazd Balejík | www.vas-architekt.cz</title>\n\n<link rel="stylesheet" href="/css/arch-1-0-2.css">\n<link rel="shortcut icon" href="/favicon.ico">\n\n<!--[if lt IE 9]><script src="http://cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7.2/html5shiv.min.js"></script><![endif]-->\n\n</head>\n<body>\n<script> document.documentElement.className+='' js'' </script>\n<div id="all">\n<div id="pack">\n<a href="/" id="h1"><div class="bgi"><img src="/images/main-content/final01-s.jpg"><h1><div class="e1"><strong>ING. ARCH. GORAZD BALEJÍK</strong> <small>&nbsp;AUTORIZOVANÝ&nbsp;ARCHITEKT&nbsp;ČKA</small></div><div>ATELIER G – ARCHITEKTONICKÁ A&nbsp;PROJEKČNÍ&nbsp;KANCELÁŘ</div></h1></div></a>\n<div id="pack2">\n<div id="map">\n<div class="tac"><div id="but1" class="but">&nbsp;<span class="e1">Zobrazit menu</span>&nbsp;</div></div>\n<menu id="ma"><div id="jst1" class="e1">\n<a href="/"><li>ÚVOD</li></a><a href="/gorazd-balejik-atelier-g/"><li>KDO JSME</li></a><a href="/gorazd-balejik/"><li>CO DĚLÁME</li></a><a href="/archiv-architektonickych-projektu/"><li>GALERIE STAVEB</li></a><a href="/architektonicka-a-projekcni-kancelar/cenik/"><li>CENA SLUŽEB</li></a><a class="act" href="/michaela-stastna-gorazd-balejik/kontakt/"><li>KONTAKT</li></a>\n</div></menu></div><div id="text"><div class="e1" id="jst2">\n\n<div class="col1">\n\n<h2>Kontakty</h2>\n\n<dl>\n	<dt><strong>Ing. arch. Gorazd Balejík</strong></dt>\n\n	<dd>tel: <strong>602 667 885</strong></dd>\n\n	<dd>e-mail: <a\n	href="mailto:gorazd&#64;seznam.cz">gorazd&#64;<!-- -->seznam.cz</a></dd>\n\n	<dd>web: <a href="http://www.vas-architekt.cz">www.vas-architekt.cz</a></dd>\n</dl>\n\n<dl>\n	<dt><strong>Ing. arch. Michaela Šťastná</strong></dt>\n\n	<dd>tel: <strong>724 205 352</strong></dd>\n\n	<dd>e-mail: <a\n	href="mailto:stastna.michaela&#64;tiscali.cz">stastna.michaela&#64;<!-- -->tiscali.cz</a></dd>\n\n	<dd>web: <a href="http://www.mi-atelier.cz">www.mi-atelier.cz</a></dd>\n</dl>\n\n<dl>\n	<dt><strong>sídlo</strong></dt>\n\n	<dd><strong>788 03 Nový Malín 583</strong></dd>\n\n	<dd>okres Šumperk</dd>\n\n	<dd>kraj Olomoucký</dd>\n\n	<dd>Česká republika</dd>\n</dl>\n\n</div>\n\n<div class="col1">\n</div>\n<div class="col1">\n\n</div>\n</div>\n</div>\n</div>\n<div id="cr">\n<p><a href="/michaela-stastna-gorazd-balejik/kontakt/">&copy; 2015 - www.vas-architekt.cz</a></p>\n</div>\n</div>\n</div>\n<div id="test"></div>\n<!--[if lt IE 9]><script src="http://code.jquery.com/jquery-1.11.2.min.js"></script><![endif]-->\n<![if gt IE 8]>\n<script src="http://code.jquery.com/jquery-2.1.3.min.js"></script>\n<![endif]>\n<script src="http://nette.github.io/resources/js/netteForms.min.js"></script>\n<script src="/js/my-1-0-5.js"></script>\n\n'),
(6, 6, '<!DOCTYPE html>\n<html>\n<head>\n<meta http-equiv="Content-Language" content="cs">\n<meta http-equiv="content-type" content="text/html; charset=utf-8">\n<meta charset="utf-8">\n<meta name="viewport" content="width=device-width, initial-scale=1.0">\n\n<title>Architekt Gorazd Balejík | www.vas-architekt.cz</title>\n\n<link rel="stylesheet" href="/css/arch-1-0-2.css">\n<link rel="shortcut icon" href="/favicon.ico">\n\n<!--[if lt IE 9]><script src="http://cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7.2/html5shiv.min.js"></script><![endif]-->\n\n</head>\n<body>\n<script> document.documentElement.className+='' js'' </script>\n<div id="all">\n<div id="pack">\n<a href="/" id="h1"><div class="bgi"><img src="/images/main-content/final01-s.jpg"><h1><div class="e1"><strong>ING. ARCH. GORAZD BALEJÍK</strong> <small>&nbsp;AUTORIZOVANÝ&nbsp;ARCHITEKT&nbsp;ČKA</small></div><div>ATELIER G – ARCHITEKTONICKÁ A&nbsp;PROJEKČNÍ&nbsp;KANCELÁŘ</div></h1></div></a>\n<div id="pack2">\n<div id="map">\n<div class="tac"><div id="but1" class="but">&nbsp;<span class="e1">Zobrazit menu</span>&nbsp;</div></div>\n<menu id="ma"><div id="jst1" class="e1">\n<a class="act" href="/"><li>ÚVOD</li></a><a href="/gorazd-balejik-atelier-g/"><li>KDO JSME</li></a><a href="/gorazd-balejik/"><li>CO DĚLÁME</li></a><a href="/archiv-architektonickych-projektu/"><li>GALERIE STAVEB</li></a><a href="/architektonicka-a-projekcni-kancelar/cenik/"><li>CENA SLUŽEB</li></a><a href="/michaela-stastna-gorazd-balejik/kontakt/"><li>KONTAKT</li></a>\n</div></menu></div><div id="text"><div class="e1" id="jst2">\n\n<div class="col1">\n\n<p><strong>Motto:</strong><br />\nArchitektura je <strong>tvorba prostředí</strong> ve kterém žijeme\n(pohybujeme se, pracujeme, odpočíváme, tvoříme, přemýšlíme, radujeme\nse, milujeme a umíráme). Uvědomujeme si jak je důležitá kvalita\nprostředí ve kterém trávíme většinu života? Protože ovlivňuje kvalitu\nnašeho života fyzického (pohyb, způsob užívání, pocity) i duchovního\n(inspiruje, povznáší, dělá nás šťastnějšími..nebo také naopak).\nDobrá architektura je nejčastěji vlídným místem pro náš život, místem\nradosti a dobrých vztahů, místem které se jmenuje\n<strong>domov</strong>.</p>\n\n<div class="tar"><img src="/images/main-content/model02b.png"\nstyle="width:80%;max-width:964px;max-height:363px" alt="" width="964"\nheight="363" class="texy" /></div>\n\n</div>\n\n<div class="col1">\n</div>\n</div>\n</div>\n</div>\n<div id="cr">\n<p><a href="/michaela-stastna-gorazd-balejik/kontakt/">&copy; 2015 - www.vas-architekt.cz</a></p>\n</div>\n</div>\n</div>\n<div id="test"></div>\n<!--[if lt IE 9]><script src="http://code.jquery.com/jquery-1.11.2.min.js"></script><![endif]-->\n<![if gt IE 8]>\n<script src="http://code.jquery.com/jquery-2.1.3.min.js"></script>\n<![endif]>\n<script src="http://nette.github.io/resources/js/netteForms.min.js"></script>\n<script src="/js/my-1-0-5.js"></script>\n\n');

-- --------------------------------------------------------

--
-- Struktura tabulky `vsechny_fotky`
--

DROP TABLE IF EXISTS `vsechny_fotky`;
CREATE TABLE IF NOT EXISTS `vsechny_fotky` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struktura tabulky `zaloha_obsah`
--

DROP TABLE IF EXISTS `zaloha_obsah`;
CREATE TABLE IF NOT EXISTS `zaloha_obsah` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stranka_id` int(11) NOT NULL,
  `editor_obsahu_stranky_id` int(11) NOT NULL,
  `poradi` int(11) NOT NULL,
  `pocet_sloupcu` int(11) NOT NULL,
  `texy` text COLLATE utf8_czech_ci NOT NULL,
  `datum` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci AUTO_INCREMENT=26 ;

--
-- Vypisuji data pro tabulku `zaloha_obsah`
--

INSERT INTO `zaloha_obsah` (`id`, `stranka_id`, `editor_obsahu_stranky_id`, `poradi`, `pocet_sloupcu`, `texy`, `datum`) VALUES
(1, 1, 1, 0, 1, 'Motto:\r\n##############\r\n\r\nArchitektura je **tvorba prostředí** ve kterém žijeme (pohybujeme se, pracujeme, odpočíváme, tvoříme, přemýšlíme, radujeme se, milujeme a umíráme). Uvědomujeme si jak je důležitá kvalita prostředí ve kterém trávíme většinu života? Ovlivňuje kvalitu našeho života fyzického (pohyb, způsob užívání, pocity) i duchovního (inspiruje, povznáší, dělá nás šťastnějšími..nebo také naopak). Dobrá architektura je nejčastěji vlídným místem pro náš život, místem radosti a dobrých vztahů, místem které se jmenuje **domov**.\r\n\r\nTak to je způsob jakým o tvorbě architektury uvažujeme.', '2015-08-03 05:26:33'),
(2, 1, 1, 0, 1, 'Motto:\n##############\n\nArchitektura je **tvorba prostředí** ve kterém žijeme (pohybujeme se, pracujeme, odpočíváme, tvoříme, přemýšlíme, radujeme se, milujeme a umíráme). Uvědomujeme si jak je důležitá kvalita prostředí ve kterém trávíme většinu života? Ovlivňuje kvalitu našeho života fyzického (pohyb, způsob užívání, pocity) i duchovního (inspiruje, povznáší, dělá nás šťastnějšími..nebo také naopak). Dobrá architektura je nejčastěji vlídným místem pro náš život, místem radosti a dobrých vztahů, místem které se jmenuje **domov**.\n\nTak to je způsob jakým o tvorbě architektury uvažujeme.\n\n\nVzdělání a profesní praxe:\n############################\n\n| 1990-2015 | vlastní projekční kancelář ATELIER G (autorizace 1993)\n| 1998 | atelier Hlaváček&partner, samostatný projektant\n| 1989-90 | Arch. Sepp Müller, Wien/Austria, spolupracující architekt/zaměstnanec\n| 1988-89 | Atelier prof. Arch. Gustav Peichel, Wien/Austria, spolupracující architekt \n| 1985-88 | architekt ve svobodném povolání Praha \n| 1986-87 | Krajský projektový ústav Praha, architekt-projektant\n| 1985-90 | AVU Praha, obor architektura\n| 1979-85 | ČVUT Praha – Fakulta architektury, diplom 1985\n| 1978-79 | VUT Brno – Stavební fakulta \n| 1977-78 | Projektant pozemních staveb, Texing Trenčín\n| 1973-77 | Střední průmyslová škola stavební, obor pozemní stavby, maturita 1977\n| 1964-73 | Základní devítiletá škola s rozšířenou výukou němčiny', '2015-08-03 05:31:02'),
(3, 2, 2, 0, 1, 'Kdo jsme a co děláme\r\n#######################\r\n\r\nJsme architektonická a projekční kancelář klasického zaměření. Poskytujeme kompletní služby pro ty, kteří mají záměr stavět dům nebo jakoukoli jinou budovu. Pokrýváme celý rozsah projektové přípravy staveb od prvotního záměru až po kolaudaci stavby. Navrhujeme a projektujeme jak nové stavby, tak i rekonstrukce stávajících objektů.\r\n \r\nZákladem naší kanceláře jsou dva architekti s dlouholetou praxí; dále máme okruh spolupracovníků pro projektové části: statika staveb, tepelná bilance, požární bezpečnost, zdravotně technické instalace (voda, kanalizace, plyn), vytápění budov a vzduchotechnika, elektroinstalace. Spolupracujeme dlouhodobě s geodety, specialisty na měření hluku, oslunění, radonový průzkum a dalšími odborníky.\r\nSpolupracujeme také s dalšími architekty a stavebními inženýry a studenty, jsme flexibilní a v případě potřeby jsme schopni navýšit několikanásobně kapacitu naší kanceláře.\r\n\r\n**Pro naše klienty zabezpečujeme tyto odborné činnosti:**\r\n- poradenství při výběru pozemku nebo stavebního objektu (domu)\r\n- sestavení stavebního záměru a programu stavby\r\n- návrh stavby ( architektonická studie)\r\n- projekt stavby pro územní řízení (DÚR)\r\n- vyřízení Územního rozhodnutí včetně kompletního projednání a zajištění stanovisek\r\n- projekt stavby pro stavební povolení nebo ohlášení (DSP)\r\n- vyřízení Stavebního povolení včetně kompletního projednání a zajištění stanovisek\r\n- prováděcí (realizační) projekt stavby (PP)  \r\n- dokumentace k výběrovému řízení\r\n- autorský dozor nad realizací stavby\r\n- kolaudace stavby (převzetí hotové stavby, vyúčtování, projekt skutečného provedení)\r\n- návrhy a projekty interiérů\r\n- zastavovací plány a urbanistické studie\r\n- návrhy zahrad, dětských hřišť, venkovních ploch a veřejných prostranství včetně mobiliáře\r\n- poradenství ve všech otázkách okolo stavění, projektování, interiérů, zahrad a jiných budovatelských záměrů.\r\n\r\nKaždou z předešlých činností lze objednat jednotlivě např. jenom návrh stavby či jenom konzultaci. Objednání jakékoli činnosti Vás nezavazuje k objednání činnosti další.', '2015-08-03 05:36:35'),
(4, 5, 3, 0, 1, 'Kontakty\r\n###########\r\n                                                                                          \r\n**Ing. arch. Gorazd Balejík**:\r\n   - tel: **602 667 885**\r\n   - e-mail: gorazd@seznam.cz\r\n\r\n**Ing. arch. Michaela Šťastná**:\r\n   - tel: **724 205 352**\r\n   - e-mail: stastna.michaela@tiscali.cz\r\n   - web: www.mi-atelier.cz\r\n\r\n**sídlo**:\r\n   - 788 03 Nový Malín 583\r\n   - okres Šumperk\r\n   - kraj Olomoucký\r\n   - Česká republika', '2015-08-03 05:42:14'),
(5, 5, 3, 0, 1, 'Kontakty\n###########\n                                                                                          \n**Ing. arch. Gorazd Balejík**:\n   - tel: **602 667 885**\n   - e-mail: gorazd@seznam.cz\n\n\n**Ing. arch. Michaela Šťastná**:\n   - tel: **724 205 352**\n   - e-mail: stastna.michaela@tiscali.cz\n   - web: www.mi-atelier.cz\n\n\n**sídlo**:\n   - 788 03 Nový Malín 583\n   - okres Šumperk\n   - kraj Olomoucký\n   - Česká republika', '2015-08-03 05:43:36'),
(6, 5, 3, 0, 1, 'Kontakty\n###########\n                                                                                          \n**Ing. arch. Gorazd Balejík**:\n   - tel: **602 667 885**\n   - e-mail: gorazd@seznam.cz\n\n\n**Ing. arch. Michaela Šťastná**:\n   - tel: **724 205 352**\n   - e-mail: stastna.michaela@tiscali.cz\n   - web: www.mi-atelier.cz\n\n\n**sídlo**::\n   - **788 03 Nový Malín 583**\n   - okres Šumperk\n   - kraj Olomoucký\n   - Česká republika', '2015-08-03 05:45:47'),
(7, 5, 3, 0, 1, 'Kontakty\r\n###########\r\n                                                                                          \r\n**Ing. arch. Gorazd Balejík**:\r\n   - tel: **602 667 885**\r\n   - e-mail: gorazd@seznam.cz\r\n\r\n\r\n**Ing. arch. Michaela Šťastná**:\r\n   - tel: **724 205 352**\r\n   - e-mail: stastna.michaela@tiscali.cz\r\n   - web: www.mi-atelier.cz\r\n\r\n\r\n**sídlo**::\r\n   - **788 03 Nový Malín 583**\r\n   - okres Šumperk\r\n   - kraj Olomoucký\r\n   - Česká republika', '2015-08-03 06:20:58'),
(8, 2, 2, 0, 1, 'Co děláme\r\n#######################\r\n\r\nJsme architektonická a projekční kancelář klasického zaměření. Poskytujeme kompletní služby pro ty, kteří mají záměr stavět dům nebo jakoukoli jinou budovu. Pokrýváme celý rozsah projektové přípravy staveb od prvotního záměru až po kolaudaci stavby. Navrhujeme a projektujeme jak nové stavby, tak i rekonstrukce stávajících objektů.\r\n \r\nZákladem naší kanceláře jsou dva architekti s dlouholetou praxí; dále máme okruh spolupracovníků pro projektové části: statika staveb, tepelná bilance, požární bezpečnost, zdravotně technické instalace (voda, kanalizace, plyn), vytápění budov a vzduchotechnika, elektroinstalace. Spolupracujeme dlouhodobě s geodety, specialisty na měření hluku, oslunění, radonový průzkum a dalšími odborníky.\r\nSpolupracujeme také s dalšími architekty a stavebními inženýry a studenty, jsme flexibilní a v případě potřeby jsme schopni navýšit několikanásobně kapacitu naší kanceláře.\r\n\r\n**Pro naše klienty zabezpečujeme tyto odborné činnosti:**\r\n- poradenství při výběru pozemku nebo stavebního objektu (domu)\r\n- sestavení stavebního záměru a programu stavby\r\n- návrh stavby ( architektonická studie)\r\n- projekt stavby pro územní řízení (DÚR)\r\n- vyřízení Územního rozhodnutí včetně kompletního projednání a zajištění stanovisek\r\n- projekt stavby pro stavební povolení nebo ohlášení (DSP)\r\n- vyřízení Stavebního povolení včetně kompletního projednání a zajištění stanovisek\r\n- prováděcí (realizační) projekt stavby (PP)  \r\n- dokumentace k výběrovému řízení\r\n- autorský dozor nad realizací stavby\r\n- kolaudace stavby (převzetí hotové stavby, vyúčtování, projekt skutečného provedení)\r\n- návrhy a projekty interiérů\r\n- zastavovací plány a urbanistické studie\r\n- návrhy zahrad, dětských hřišť, venkovních ploch a veřejných prostranství včetně mobiliáře\r\n- poradenství ve všech otázkách okolo stavění, projektování, interiérů, zahrad a jiných budovatelských záměrů.\r\n\r\nKaždou z předešlých činností lze objednat jednotlivě např. jenom návrh stavby či jenom konzultaci. Objednání jakékoli činnosti Vás nezavazuje k objednání činnosti další.', '2015-08-03 08:04:24'),
(9, 5, 3, 0, 1, 'Kontakty\r\n###########\r\n                                                                                          \r\n**Ing. arch. Gorazd Balejík**:\r\n   - tel: **602 667 885**\r\n   - e-mail: gorazd@seznam.cz\r\n   - web: www.vas-architekt.cz\r\n\r\n\r\n**Ing. arch. Michaela Šťastná**:\r\n   - tel: **724 205 352**\r\n   - e-mail: stastna.michaela@tiscali.cz\r\n   - web: www.mi-atelier.cz\r\n\r\n\r\n**sídlo**::\r\n   - **788 03 Nový Malín 583**\r\n   - okres Šumperk\r\n   - kraj Olomoucký\r\n   - Česká republika', '2015-08-03 08:34:21'),
(10, 1, 1, 0, 1, 'O nás\r\n#################\r\n\r\nJsme architektonická a projekční kancelář klasického zaměření. Poskytujeme kompletní služby pro ty, kteří mají záměr stavět dům nebo jakoukoli jinou budovu. Pokrýváme celý rozsah projektové přípravy staveb od prvotního záměru až po kolaudaci stavby. Navrhujeme a projektujeme jak nové stavby, tak i rekonstrukce stávajících objektů.\r\n \r\nZákladem naší kanceláře jsou dva architekti s dlouholetou praxí; dále máme okruh spolupracovníků pro projektové části: statika staveb, tepelná bilance, požární bezpečnost, zdravotně technické instalace (voda, kanalizace, plyn), vytápění budov a vzduchotechnika, elektroinstalace. Spolupracujeme dlouhodobě s geodety, specialisty na měření hluku, oslunění, radonový průzkum a dalšími odborníky.\r\nSpolupracujeme také s dalšími architekty a stavebními inženýry a studenty, jsme flexibilní a v případě potřeby jsme schopni navýšit několikanásobně kapacitu naší kanceláře.\r\n\r\nVzdělání a profesní praxe:\r\n############################\r\n\r\n| 1990-2015 | vlastní projekční kancelář ATELIER G (autorizace 1993)\r\n| 1998 | atelier Hlaváček&partner, samostatný projektant\r\n| 1989-90 | Arch. Sepp Müller, Wien/Austria, spolupracující architekt/zaměstnanec\r\n| 1988-89 | Atelier prof. Arch. Gustav Peichel, Wien/Austria, spolupracující architekt \r\n| 1985-88 | architekt ve svobodném povolání Praha \r\n| 1986-87 | Krajský projektový ústav Praha, architekt-projektant\r\n| 1985-90 | AVU Praha, obor architektura\r\n| 1979-85 | ČVUT Praha – Fakulta architektury, diplom 1985\r\n| 1978-79 | VUT Brno – Stavební fakulta \r\n| 1977-78 | Projektant pozemních staveb, Texing Trenčín\r\n| 1973-77 | Střední průmyslová škola stavební, obor pozemní stavby, maturita 1977\r\n| 1964-73 | Základní devítiletá škola s rozšířenou výukou němčiny', '2015-08-04 11:41:07'),
(11, 2, 2, 0, 1, 'Pro naše klienty zabezpečujeme tyto odborné činnosti:\r\n##########################################\r\n\r\n- poradenství při výběru pozemku nebo stavebního objektu (domu)\r\n- sestavení stavebního záměru a programu stavby\r\n- návrh stavby ( architektonická studie)\r\n- projekt stavby pro územní řízení (DÚR)\r\n- vyřízení Územního rozhodnutí včetně kompletního projednání a zajištění stanovisek\r\n- projekt stavby pro stavební povolení nebo ohlášení (DSP)\r\n- vyřízení Stavebního povolení včetně kompletního projednání a zajištění stanovisek\r\n- prováděcí (realizační) projekt stavby (PP)  \r\n- dokumentace k výběrovému řízení\r\n- autorský dozor nad realizací stavby\r\n- kolaudace stavby (převzetí hotové stavby, vyúčtování, projekt skutečného provedení)\r\n- návrhy a projekty interiérů\r\n- zastavovací plány a urbanistické studie\r\n- návrhy zahrad, dětských hřišť, venkovních ploch a veřejných prostranství včetně mobiliáře\r\n- poradenství ve všech otázkách okolo stavění, projektování, interiérů, zahrad a jiných budovatelských záměrů.\r\n\r\nKaždou z předešlých činností lze objednat jednotlivě např. jenom návrh stavby či jenom konzultaci. Objednání jakékoli činnosti Vás nezavazuje k objednání činnosti další.', '2015-08-04 11:41:07'),
(12, 5, 3, 0, 1, 'Kontakty\r\n###########\r\n                                                                                          \r\n**Ing. arch. Gorazd Balejík**:\r\n   - tel: **602 667 885**\r\n   - e-mail: gorazd@seznam.cz\r\n   - web: www.vas-architekt.cz\r\n\r\n\r\n**Ing. arch. Michaela Šťastná**:\r\n   - tel: **724 205 352**\r\n   - e-mail: stastna.michaela@tiscali.cz\r\n   - web: www.mi-atelier.cz\r\n\r\n\r\n**sídlo**:\r\n   - **788 03 Nový Malín 583**\r\n   - okres Šumperk\r\n   - kraj Olomoucký\r\n   - Česká republika', '2015-08-04 11:41:07'),
(13, 6, 4, 0, 1, 'Motto:\r\n##############\r\n\r\nArchitektura je **tvorba prostředí** ve kterém žijeme (pohybujeme se, pracujeme, odpočíváme, tvoříme, přemýšlíme, radujeme se, milujeme a umíráme). Uvědomujeme si jak je důležitá kvalita prostředí ve kterém trávíme většinu života? Ovlivňuje kvalitu našeho života fyzického (pohyb, způsob užívání, pocity) i duchovního (inspiruje, povznáší, dělá nás šťastnějšími..nebo také naopak). Dobrá architektura je nejčastěji vlídným místem pro náš život, místem radosti a dobrých vztahů, místem které se jmenuje **domov**.', '2015-08-04 11:41:07'),
(14, 6, 4, 0, 1, 'Motto:\r\n##############\r\n\r\nArchitektura je **tvorba prostředí** ve kterém žijeme (pohybujeme se, pracujeme, odpočíváme, tvoříme, přemýšlíme, radujeme se, milujeme a umíráme). Uvědomujeme si jak je důležitá kvalita prostředí ve kterém trávíme většinu života? Protože ovlivňuje kvalitu našeho života fyzického (pohyb, způsob užívání, pocity) i duchovního (inspiruje, povznáší, dělá nás šťastnějšími..nebo také naopak). Dobrá architektura je nejčastěji vlídným místem pro náš život, místem radosti a dobrých vztahů, místem které se jmenuje **domov**.', '2015-08-04 11:55:58'),
(15, 6, 4, 0, 1, '[* model02.png *]\n\nMotto:\n##############\n\nArchitektura je **tvorba prostředí** ve kterém žijeme (pohybujeme se, pracujeme, odpočíváme, tvoříme, přemýšlíme, radujeme se, milujeme a umíráme). Uvědomujeme si jak je důležitá kvalita prostředí ve kterém trávíme většinu života? Protože ovlivňuje kvalitu našeho života fyzického (pohyb, způsob užívání, pocity) i duchovního (inspiruje, povznáší, dělá nás šťastnějšími..nebo také naopak). Dobrá architektura je nejčastěji vlídným místem pro náš život, místem radosti a dobrých vztahů, místem které se jmenuje **domov**.', '2015-08-04 14:39:04'),
(16, 6, 4, 0, 1, 'Motto:\n##############\n\nArchitektura je **tvorba prostředí** ve kterém žijeme (pohybujeme se, pracujeme, odpočíváme, tvoříme, přemýšlíme, radujeme se, milujeme a umíráme). Uvědomujeme si jak je důležitá kvalita prostředí ve kterém trávíme většinu života? Protože ovlivňuje kvalitu našeho života fyzického (pohyb, způsob užívání, pocity) i duchovního (inspiruje, povznáší, dělá nás šťastnějšími..nebo také naopak). Dobrá architektura je nejčastěji vlídným místem pro náš život, místem radosti a dobrých vztahů, místem které se jmenuje **domov**.\n\n\n[* model02.png *]', '2015-08-04 15:35:17'),
(17, 6, 4, 0, 1, '**Motto:**\n Architektura je **tvorba prostředí** ve kterém žijeme (pohybujeme se, pracujeme, odpočíváme, tvoříme, přemýšlíme, radujeme se, milujeme a umíráme). Uvědomujeme si jak je důležitá kvalita prostředí ve kterém trávíme většinu života? Protože ovlivňuje kvalitu našeho života fyzického (pohyb, způsob užívání, pocity) i duchovního (inspiruje, povznáší, dělá nás šťastnějšími..nebo také naopak). Dobrá architektura je nejčastěji vlídným místem pro náš život, místem radosti a dobrých vztahů, místem které se jmenuje **domov**.\n\n\n[* model02.png *]', '2015-08-04 15:37:12'),
(18, 6, 4, 0, 1, '**Motto:**\n Architektura je **tvorba prostředí** ve kterém žijeme (pohybujeme se, pracujeme, odpočíváme, tvoříme, přemýšlíme, radujeme se, milujeme a umíráme). Uvědomujeme si jak je důležitá kvalita prostředí ve kterém trávíme většinu života? Protože ovlivňuje kvalitu našeho života fyzického (pohyb, způsob užívání, pocity) i duchovního (inspiruje, povznáší, dělá nás šťastnějšími..nebo také naopak). Dobrá architektura je nejčastěji vlídným místem pro náš život, místem radosti a dobrých vztahů, místem které se jmenuje **domov**.\n\n\n[* model02.png .[tar] *]', '2015-08-04 16:41:23'),
(19, 6, 4, 0, 1, '**Motto:**\n Architektura je **tvorba prostředí** ve kterém žijeme (pohybujeme se, pracujeme, odpočíváme, tvoříme, přemýšlíme, radujeme se, milujeme a umíráme). Uvědomujeme si jak je důležitá kvalita prostředí ve kterém trávíme většinu života? Protože ovlivňuje kvalitu našeho života fyzického (pohyb, způsob užívání, pocity) i duchovního (inspiruje, povznáší, dělá nás šťastnějšími..nebo také naopak). Dobrá architektura je nejčastěji vlídným místem pro náš život, místem radosti a dobrých vztahů, místem které se jmenuje **domov**.\n\n\n[* model02.png *] .[tar]', '2015-08-04 16:46:19'),
(20, 6, 4, 0, 1, '**Motto:**\n Architektura je **tvorba prostředí** ve kterém žijeme (pohybujeme se, pracujeme, odpočíváme, tvoříme, přemýšlíme, radujeme se, milujeme a umíráme). Uvědomujeme si jak je důležitá kvalita prostředí ve kterém trávíme většinu života? Protože ovlivňuje kvalitu našeho života fyzického (pohyb, způsob užívání, pocity) i duchovního (inspiruje, povznáší, dělá nás šťastnějšími..nebo také naopak). Dobrá architektura je nejčastěji vlídným místem pro náš život, místem radosti a dobrých vztahů, místem které se jmenuje **domov**.\n\n\n[* model02.png .{width:80%} *] .[tar]', '2015-08-04 16:56:36'),
(21, 6, 4, 0, 1, '**Motto:**\r\n Architektura je **tvorba prostředí** ve kterém žijeme (pohybujeme se, pracujeme, odpočíváme, tvoříme, přemýšlíme, radujeme se, milujeme a umíráme). Uvědomujeme si jak je důležitá kvalita prostředí ve kterém trávíme většinu života? Protože ovlivňuje kvalitu našeho života fyzického (pohyb, způsob užívání, pocity) i duchovního (inspiruje, povznáší, dělá nás šťastnějšími..nebo také naopak). Dobrá architektura je nejčastěji vlídným místem pro náš život, místem radosti a dobrých vztahů, místem které se jmenuje **domov**.\r\n\r\n\r\n[* model02b.png .{width:80%} *] .[tar]', '2015-08-04 22:26:30'),
(22, 3, 5, 0, 1, 'Omlouváme se, ale galerie je právě ve výstavbě. V případě zájmu Vám rádi zašleme ukázky naší práce e-mailem. \r\n\r\nDěkujeme za porozumění.\r\n\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>', '2015-08-05 11:42:34'),
(23, 4, 7, 0, 1, 'Omlouváme se, ale náš ceník právě aktualizujeme. Ceny služeb lze poptat individuálně e-mailem nebo telefonem.\r\n\r\nDěkujeme za porozumění.\r\n\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>', '2015-08-05 11:42:34'),
(24, 4, 7, 0, 1, 'Omlouváme se, ale náš ceník právě aktualizujeme. Ceny služeb lze poptat individuálně e-mailem nebo telefonem.\n\nDěkujeme za porozumění.\n\n<p>&nbsp;</p>\n<p>&nbsp;</p>\n<p>&nbsp;</p>\n<p>&nbsp;</p>\n<p>&nbsp;</p>\n<p>&nbsp;</p>\n<p>&nbsp;</p>', '2015-08-05 11:43:36'),
(25, 4, 7, 0, 1, 'Omlouváme se, ale náš ceník právě aktualizujeme. Ceny služeb lze poptat individuálně e-mailem nebo telefonem.\n\nDěkujeme za porozumění.\n\n<p>&nbsp;</p>\n<p>&nbsp;</p>\n<p>&nbsp;</p>\n<p>&nbsp;</p>\n<p>&nbsp;</p>\n<p>&nbsp;</p>\n<p>&nbsp;</p>\n<p>&nbsp;</p>\n<p>&nbsp;</p>', '2015-08-05 11:45:41');

--
-- Omezení pro exportované tabulky
--

--
-- Omezení pro tabulku `editor_obsahu_stranky`
--
ALTER TABLE `editor_obsahu_stranky`
  ADD CONSTRAINT `editor_obsahu_stranky_ibfk_1` FOREIGN KEY (`stranka_id`) REFERENCES `stranka` (`id`),
  ADD CONSTRAINT `editor_obsahu_stranky_ibfk_2` FOREIGN KEY (`galerie_skupina_fotek_id`) REFERENCES `galerie_skupina_fotek` (`id`);

--
-- Omezení pro tabulku `galerie_prirazene_polozky`
--
ALTER TABLE `galerie_prirazene_polozky`
  ADD CONSTRAINT `galerie_prirazene_polozky_ibfk_1` FOREIGN KEY (`galerie_skupina_fotek_id`) REFERENCES `galerie_skupina_fotek` (`id`),
  ADD CONSTRAINT `galerie_prirazene_polozky_ibfk_2` FOREIGN KEY (`vsechny_fotky_id`) REFERENCES `vsechny_fotky` (`id`);

--
-- Omezení pro tabulku `menu_polozky`
--
ALTER TABLE `menu_polozky`
  ADD CONSTRAINT `menu_polozky_ibfk_1` FOREIGN KEY (`stranka_id`) REFERENCES `stranka` (`id`);

--
-- Omezení pro tabulku `stranka_html_celek`
--
ALTER TABLE `stranka_html_celek`
  ADD CONSTRAINT `stranka_html_celek_ibfk_1` FOREIGN KEY (`stranka_id`) REFERENCES `stranka` (`id`);
SET FOREIGN_KEY_CHECKS=1;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;