-- Adminer 4.2.0 MySQL dump

SET NAMES utf8mb4;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

DROP TABLE IF EXISTS `editor_obsahu_stranky`;
CREATE TABLE `editor_obsahu_stranky` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rubrika` varchar(50) COLLATE utf8_czech_ci DEFAULT NULL COMMENT 'neměň',
  `obsah_texy_nahore` text COLLATE utf8_czech_ci NOT NULL COMMENT 'TOTO POLÍČKO VYPLŇUJEŠ TY',
  `obsah_texy_dole` text COLLATE utf8_czech_ci NOT NULL COMMENT 'TOTO POLÍČKO VYPLŇUJEŠ TY',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

INSERT INTO `editor_obsahu_stranky` (`id`, `rubrika`, `obsah_texy_nahore`, `obsah_texy_dole`) VALUES
(1,	'Úvodní stránka',	'**Karkulka šla** \"do lesa\":http://www.lesycr.cz/Stranky/default.aspx a lákamí vůněhulás úmyval rohlivý jednovod lek umělý znou sůl posko dopistroj. Úmyvad z Jít vůně umělý bý umělý rojskočár zno čajený ček. Přední al zako bý ma je kolobicí úmyval čepicí řícipádní obit. Bolo magne málněžná ští podlo zak škoda sou z vůně mený. Poci.\r\n\r\nLorem ipsum dolor sit amet consectetuer Vestibulum pellentesque semper netus laoreet. Dui malesuada quis ut Ut justo felis id pede ligula mauris. Urna Nunc neque Praesent a lacinia tortor vel morbi nibh id. At Phasellus In Sed Phasellus tristique eget egestas id eros volutpat. At Vestibulum mauris ut nibh sollicitudin porttitor Integer.\r\n\r\n\r\n',	'Závěrem potřebujeme dodat, že **Lákamí vůněhulás úmyval rohlivý jednovod lek sůl škověný lžičkodpo úmyvaleka zlem. Rozcuchře nuchředos** halekamat umělý úmyvat umělý nuchváled ří ztepický radložný tlínům. Málněžná rostrojsk vla bájedpodl pa štínkucen **halekamat umraprošt smírní** ka Polivní. Obusí \"úmyvadlou čníc čeprad poda\":www.kuvava.cz ač čuva Obsely směsí umyslupou oba. Podlo krát obse Al lžičkouza smeti mezilogie lákamat ta říklemít já. A nač k onověď Podlou vla věď obzor.\r\n'),
(2,	'Kontakt',	'',	''),
(3,	'Aktuality',	'',	''),
(4,	'Náš tým',	'Lorem ipsum dolor sit amet consectetuer et pede interdum non augue. Faucibus in congue Quisque ac cursus et Vestibulum quis Maecenas pharetra. Curabitur elit fringilla accumsan quis natoque aliquam Maecenas et libero Vestibulum. Augue wisi tincidunt dis est accumsan porttitor tempus nulla Nulla montes. Quis Sed risus Aenean quis pede risus id.\r\n\r\nElit et tortor et parturient **condimentum Vivamus Donec** hendrerit nunc et. Justo Vivamus enim dolor elit ante eget Cum dis eros convallis. Curabitur In facilisi orci pretium Nunc Pellentesque condimentum lorem eros suscipit. Vivamus quis fames ut Sed Ut velit nunc tempus elit Aliquam. Tempus \"pellentesque lacus\":/osobni-promeny-kontakt/ Aenean congue sed tincidunt nisl rhoncus est ut. A mollis justo convallis congue odio dui dui ut Sed.\r\n\r\nSapien turpis ac orci dui ac quis odio pretium malesuada Pellentesque. Purus sed pede dignissim sapien Curabitur sapien eros Pellentesque pretium convallis. Lorem tortor id risus dui Curabitur parturient dolor Quisque nec Aenean. Orci lorem quis sit pellentesque orci id amet id auctor facilisis. Leo at gravida et elit vitae volutpat pretium fames at dictumst. \r\n\r\nTincidunt at metus et Vestibulum id Maecenas Vestibulum eros consequat cursus. Faucibus semper pretium Nam et semper vitae et dui adipiscing id. Fermentum odio eu sodales porttitor nec et ultrices fames quam Nulla. Quis in pretium consequat enim tempor lacinia Pellentesque aliquam congue sem. Elit tincidunt tincidunt egestas senectus Fusce cursus id ut.\r\n',	''),
(5,	'Ukázky',	'',	''),
(6,	'Pro ženy',	'',	''),
(7,	'Pro muže',	'',	'');

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

INSERT INTO `galerie_prirazene_polozky` (`id`, `galerie_skupina_fotek_id`, `vsechny_fotky_id`, `poradi`) VALUES
(1,	1,	4,	0),
(2,	1,	7,	0),
(3,	1,	8,	2),
(4,	1,	6,	0),
(5,	1,	3,	-1);

DROP TABLE IF EXISTS `galerie_skupina_fotek`;
CREATE TABLE `galerie_skupina_fotek` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `poznamka` varchar(255) COLLATE utf8_czech_ci NOT NULL COMMENT 'Slouží pro Tvou orientaci.',
  `googlepopis_automatizovane` varchar(255) COLLATE utf8_czech_ci NOT NULL COMMENT 'Fotografie, které nemají vlastní googlepopis obdrží tento společný.',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

INSERT INTO `galerie_skupina_fotek` (`id`, `poznamka`, `googlepopis_automatizovane`) VALUES
(1,	'Moje první fotogalerie',	'Nádherná fotka z hor');

DROP TABLE IF EXISTS `stranka`;
CREATE TABLE `stranka` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rubrika` varchar(50) COLLATE utf8_czech_ci DEFAULT NULL COMMENT 'neměň',
  `galerie_skupina_fotek_id` int(11) DEFAULT NULL,
  `googletitulek` varchar(100) COLLATE utf8_czech_ci DEFAULT NULL COMMENT 'optimum max 45 znaků (nepiš www.skryta-identita.cz - to se doplňuje samo)',
  `googlepopisek` varchar(160) COLLATE utf8_czech_ci DEFAULT NULL COMMENT 'optimum max 140 znaků',
  `editor_zmeneno` varchar(5) COLLATE utf8_czech_ci NOT NULL DEFAULT 'ne' COMMENT 'ZMĚŇ NA ''ano''',
  `obsah_html_nahore` text COLLATE utf8_czech_ci COMMENT 'neměň - vygeneruje se automaticky podle editoru',
  `obsah_html_dole` text COLLATE utf8_czech_ci COMMENT 'neměň - vygeneruje se automaticky podle editoru',
  `editor_obsahu_stranky_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `editor_obsahu_stranky_id` (`editor_obsahu_stranky_id`),
  KEY `galerie_skupina_fotek_id` (`galerie_skupina_fotek_id`),
  CONSTRAINT `stranka_ibfk_2` FOREIGN KEY (`galerie_skupina_fotek_id`) REFERENCES `galerie_skupina_fotek` (`id`),
  CONSTRAINT `stranka_ibfk_1` FOREIGN KEY (`editor_obsahu_stranky_id`) REFERENCES `editor_obsahu_stranky` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

INSERT INTO `stranka` (`id`, `rubrika`, `galerie_skupina_fotek_id`, `googletitulek`, `googlepopisek`, `editor_zmeneno`, `obsah_html_nahore`, `obsah_html_dole`, `editor_obsahu_stranky_id`) VALUES
(1,	'Úvodní stránka',	NULL,	'Moderní osobní proměny vizáže',	'Navrhneme Vám změny image, odkryjeme Vaše vnitřní touhy. Profesionálně Vás vyfotíme.',	'ne',	'\n<p><strong>Karkulka šla</strong> <a\nhref=\"http://www.lesycr.cz/Stranky/default.aspx\">do lesa</a> a lákamí\nvůněhulás úmyval rohlivý jednovod lek umělý znou sůl posko dopistroj.\nÚmyvad z Jít vůně umělý bý umělý rojskočár zno čajený ček.\nPřední al zako bý ma je kolobicí úmyval čepicí řícipádní obit. Bolo\nmagne málněžná ští podlo zak škoda sou z vůně mený. Poci.</p>\n\n<p>Lorem ipsum dolor sit amet consectetuer Vestibulum pellentesque semper netus\nlaoreet. Dui malesuada quis ut Ut justo felis id pede ligula mauris. Urna Nunc\nneque Praesent a lacinia tortor vel morbi nibh id. At Phasellus In Sed Phasellus\ntristique eget egestas id eros volutpat. At Vestibulum mauris ut nibh\nsollicitudin porttitor Integer.</p>\n',	'\n<p>Závěrem potřebujeme dodat, že <strong>Lákamí vůněhulás úmyval\nrohlivý jednovod lek sůl škověný lžičkodpo úmyvaleka zlem. Rozcuchře\nnuchředos</strong> halekamat umělý úmyvat umělý nuchváled ří ztepický\nradložný tlínům. Málněžná rostrojsk vla bájedpodl pa štínkucen\n<strong>halekamat umraprošt smírní</strong> ka Polivní. Obusí <a\nhref=\"http://www.kuvava.cz\">úmyvadlou čníc čeprad poda</a> ač čuva Obsely\nsměsí umyslupou oba. Podlo krát obse Al lžičkouza smeti mezilogie lákamat\nta říklemít já. A nač k onověď Podlou vla věď obzor.</p>\n',	1),
(2,	'Kontakt',	NULL,	'Vizážový poradce - kontakt',	'bla bla bla - nějaký super popisek... :-)',	'ne',	NULL,	NULL,	2),
(3,	'Aktuality',	NULL,	'Nové informace ke změnám image',	'agůlkjre ůakjdsf ůkjq werůlk jad ůůakjf qwe novinky',	'ne',	NULL,	NULL,	3),
(4,	'Náš tým',	1,	'Tým odborníků na slovo vzatých',	'haf haf haf bů bů bů brum brum brum',	'ne',	'<p>Lorem ipsum dolor sit amet consectetuer et pede interdum non augue. Faucibus\r\nin congue Quisque ac cursus et Vestibulum quis Maecenas pharetra. Curabitur elit\r\nfringilla accumsan quis natoque aliquam Maecenas et libero Vestibulum. Augue\r\nwisi tincidunt dis est accumsan porttitor tempus nulla Nulla montes. Quis Sed\r\nrisus Aenean quis pede risus id.</p>\r\n\r\n<p>Elit et tortor et parturient <strong>condimentum Vivamus Donec</strong>\r\nhendrerit nunc et. Justo Vivamus enim dolor elit ante eget Cum dis eros\r\nconvallis. Curabitur In facilisi orci pretium Nunc Pellentesque condimentum\r\nlorem eros suscipit. Vivamus quis fames ut Sed Ut velit nunc tempus elit\r\nAliquam. Tempus <a href=\"/osobni-promeny-kontakt/\">pellentesque lacus</a> Aenean\r\ncongue sed tincidunt nisl rhoncus est ut. A mollis justo convallis congue odio\r\ndui dui ut Sed.</p>\r\n\r\n<p>Sapien turpis ac orci dui ac quis odio pretium malesuada Pellentesque. Purus\r\nsed pede dignissim sapien Curabitur sapien eros Pellentesque pretium convallis.\r\nLorem tortor id risus dui Curabitur parturient dolor Quisque nec Aenean. Orci\r\nlorem quis sit pellentesque orci id amet id auctor facilisis. Leo at gravida et\r\nelit vitae volutpat pretium fames at dictumst.</p>\r\n\r\n<p>Tincidunt at metus et Vestibulum id Maecenas Vestibulum eros consequat\r\ncursus. Faucibus semper pretium Nam et semper vitae et dui adipiscing id.\r\nFermentum odio eu sodales porttitor nec et ultrices fames quam Nulla. Quis in\r\npretium consequat enim tempor lacinia Pellentesque aliquam congue sem. Elit\r\ntincidunt tincidunt egestas senectus Fusce cursus id ut.</p>\r\n',	'',	4),
(5,	'Ukázky',	NULL,	'nějaký titulek - ukázky',	'nějaký popisek - ukázky',	'ne',	NULL,	NULL,	5),
(6,	'Pro ženy',	NULL,	'Změna ženské vizáže',	'adflkaf aůsldkfj aůlk fd ůask jdf aůsdkj a sůkdjfa ůslkdj aůskl jdf jů',	'ne',	NULL,	NULL,	6),
(7,	'Pro muže',	NULL,	'Super pánská proměna',	'chalalal bla bla blb clc glg mun fuk rum duk sum puk...',	'ne',	NULL,	NULL,	7);

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

INSERT INTO `vsechny_fotky` (`id`, `nahled_posun`, `googlepopis`, `gallery_text`, `size`, `width`, `height`, `html_attr`, `fileextension`, `tvar`, `l_size`, `l_width`, `l_height`, `l_html_attr`, `m_size`, `m_width`, `m_height`, `m_html_attr`, `s_size`, `s_width`, `s_height`, `s_html_attr`) VALUES
(1,	14,	NULL,	NULL,	525695,	1202,	1800,	'width=\"1202\" height=\"1800\"',	'jpg',	'navysku',	100005,	801,	1200,	'width=\"801\" height=\"1200\"',	47809,	534,	800,	'width=\"534\" height=\"800\"',	9761,	200,	300,	'width=\"200\" height=\"300\"'),
(2,	13,	NULL,	NULL,	449221,	1202,	1800,	'width=\"1202\" height=\"1800\"',	'jpg',	'navysku',	85211,	801,	1200,	'width=\"801\" height=\"1200\"',	41353,	534,	800,	'width=\"534\" height=\"800\"',	9132,	200,	300,	'width=\"200\" height=\"300\"'),
(3,	10,	NULL,	NULL,	537822,	1202,	1800,	'width=\"1202\" height=\"1800\"',	'jpg',	'navysku',	110035,	801,	1200,	'width=\"801\" height=\"1200\"',	57911,	534,	800,	'width=\"534\" height=\"800\"',	13098,	200,	300,	'width=\"200\" height=\"300\"'),
(4,	0,	'Krásná čtvercová fotografie',	NULL,	481290,	1202,	1800,	'width=\"1202\" height=\"1800\"',	'jpg',	'ctverec',	89878,	801,	1200,	'width=\"801\" height=\"1200\"',	45851,	534,	800,	'width=\"534\" height=\"800\"',	10860,	200,	300,	'width=\"200\" height=\"300\"'),
(5,	39,	NULL,	NULL,	368777,	1202,	1800,	'width=\"1202\" height=\"1800\"',	'jpg',	'navysku',	69239,	801,	1200,	'width=\"801\" height=\"1200\"',	38149,	534,	800,	'width=\"534\" height=\"800\"',	10157,	200,	300,	'width=\"200\" height=\"300\"'),
(6,	16,	NULL,	NULL,	518635,	1202,	1800,	'width=\"1202\" height=\"1800\"',	'jpg',	'navysku',	86875,	801,	1200,	'width=\"801\" height=\"1200\"',	45329,	534,	800,	'width=\"534\" height=\"800\"',	11376,	200,	300,	'width=\"200\" height=\"300\"'),
(7,	40,	NULL,	NULL,	403554,	1800,	1202,	'width=\"1800\" height=\"1202\"',	'jpg',	'nasirku',	66251,	1200,	801,	'width=\"1200\" height=\"801\"',	34832,	800,	534,	'width=\"800\" height=\"534\"',	8580,	300,	200,	'width=\"300\" height=\"200\"'),
(8,	35,	NULL,	NULL,	436211,	1800,	1202,	'width=\"1800\" height=\"1202\"',	'jpg',	'nasirku',	76003,	1200,	801,	'width=\"1200\" height=\"801\"',	39932,	800,	534,	'width=\"800\" height=\"534\"',	10146,	300,	200,	'width=\"300\" height=\"200\"');

DROP TABLE IF EXISTS `zaloha_obsah`;
CREATE TABLE `zaloha_obsah` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stranka_id` int(11) NOT NULL,
  `texy_nahore` text COLLATE utf8_czech_ci,
  `texy_dole` text COLLATE utf8_czech_ci,
  `html_nahore` text COLLATE utf8_czech_ci,
  `html_dole` text COLLATE utf8_czech_ci,
  PRIMARY KEY (`id`),
  KEY `stranka_id` (`stranka_id`),
  CONSTRAINT `zaloha_obsah_ibfk_1` FOREIGN KEY (`stranka_id`) REFERENCES `stranka` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

INSERT INTO `zaloha_obsah` (`id`, `stranka_id`, `texy_nahore`, `texy_dole`, `html_nahore`, `html_dole`) VALUES
(1,	1,	'**Pohádka o červené karkulce**\r\n\r\nKarkulka šla \"do lesa\":http://www.lesycr.cz/Stranky/default.aspx a lákamí vůněhulás úmyval rohlivý jednovod lek umělý znou sůl posko dopistroj. Úmyvad z Jít vůně umělý bý umělý rojskočár zno čajený ček. Přední al zako bý ma je kolobicí úmyval čepicí řícipádní obit. Bolo magne málněžná ští podlo zak škoda sou z vůně mený. Poci.\r\n\r\nŠkoda ačít Alehlínka úmysl rojskočár alehlínům lžičkolou alehlínům nim umyslupou Smut. Božkat Věný boutný autný úmyslušle ční úmyva krát zlem Matkolek vla. Jít záříkemi lušledně štínům hlínka nasíční hulák srdí nasy lehlý leda. Napně hliv podlo Věný škočajine záprajak poskoubej dobou Umírně jít.\r\n',	'Závěrem potřebujeme dodat, že **Lákamí vůněhulás úmyval rohlivý jednovod lek sůl škověný lžičkodpo úmyvaleka zlem. Rozcuchře nuchředos** halekamat umělý úmyvat umělý nuchváled ří ztepický radložný tlínům. Málněžná rostrojsk vla bájedpodl pa štínkucen **halekamat umraprošt smírní** ka Polivní. Obusí \"úmyvadlou čníc čeprad poda\":www.kuvava.cz ač čuva Obsely směsí umyslupou oba. Podlo krát obse Al lžičkouza smeti mezilogie lákamat ta říklemít já. A nač k onověď Podlou vla věď obzor.\r\n',	'\n<p><strong>Pohádka o červené karkulce</strong></p>\n\n<p>Karkulka šla <a href=\"http://www.lesycr.cz/Stranky/default.aspx\">do lesa</a>\na lákamí vůněhulás úmyval rohlivý jednovod lek umělý znou sůl posko\ndopistroj. Úmyvad z Jít vůně umělý bý umělý rojskočár zno čajený\nček. Přední al zako bý ma je kolobicí úmyval čepicí řícipádní obit.\nBolo magne málněžná ští podlo zak škoda sou z vůně mený. Poci.</p>\n\n<p>Škoda ačít Alehlínka úmysl rojskočár alehlínům lžičkolou\nalehlínům nim umyslupou Smut. Božkat Věný boutný autný úmyslušle ční\númyva krát zlem Matkolek vla. Jít záříkemi lušledně štínům hlínka\nnasíční hulák srdí nasy lehlý leda. Napně hliv podlo Věný škočajine\nzáprajak poskoubej dobou Umírně jít.</p>\n',	'\n<p>Závěrem potřebujeme dodat, že <strong>Lákamí vůněhulás úmyval\nrohlivý jednovod lek sůl škověný lžičkodpo úmyvaleka zlem. Rozcuchře\nnuchředos</strong> halekamat umělý úmyvat umělý nuchváled ří ztepický\nradložný tlínům. Málněžná rostrojsk vla bájedpodl pa štínkucen\n<strong>halekamat umraprošt smírní</strong> ka Polivní. Obusí <a\nhref=\"http://www.kuvava.cz\">úmyvadlou čníc čeprad poda</a> ač čuva Obsely\nsměsí umyslupou oba. Podlo krát obse Al lžičkouza smeti mezilogie lákamat\nta říklemít já. A nač k onověď Podlou vla věď obzor.</p>\n'),
(2,	1,	'**Karkulka šla** \"do lesa\":http://www.lesycr.cz/Stranky/default.aspx a lákamí vůněhulás úmyval rohlivý jednovod lek umělý znou sůl posko dopistroj. Úmyvad z Jít vůně umělý bý umělý rojskočár zno čajený ček. Přední al zako bý ma je kolobicí úmyval čepicí řícipádní obit. Bolo magne málněžná ští podlo zak škoda sou z vůně mený. Poci.\r\n\r\nŠkoda ačít Alehlínka úmysl rojskočár alehlínům lžičkolou alehlínům nim umyslupou Smut. Božkat Věný boutný autný úmyslušle ční úmyva krát zlem Matkolek vla. Jít záříkemi lušledně štínům hlínka nasíční hulák srdí nasy lehlý leda. Napně hliv podlo Věný škočajine záprajak poskoubej dobou Umírně jít.\r\n',	'Závěrem potřebujeme dodat, že **Lákamí vůněhulás úmyval rohlivý jednovod lek sůl škověný lžičkodpo úmyvaleka zlem. Rozcuchře nuchředos** halekamat umělý úmyvat umělý nuchváled ří ztepický radložný tlínům. Málněžná rostrojsk vla bájedpodl pa štínkucen **halekamat umraprošt smírní** ka Polivní. Obusí \"úmyvadlou čníc čeprad poda\":www.kuvava.cz ač čuva Obsely směsí umyslupou oba. Podlo krát obse Al lžičkouza smeti mezilogie lákamat ta říklemít já. A nač k onověď Podlou vla věď obzor.\r\n',	'\n<p><strong>Karkulka šla</strong> <a\nhref=\"http://www.lesycr.cz/Stranky/default.aspx\">do lesa</a> a lákamí\nvůněhulás úmyval rohlivý jednovod lek umělý znou sůl posko dopistroj.\nÚmyvad z Jít vůně umělý bý umělý rojskočár zno čajený ček.\nPřední al zako bý ma je kolobicí úmyval čepicí řícipádní obit. Bolo\nmagne málněžná ští podlo zak škoda sou z vůně mený. Poci.</p>\n\n<p>Škoda ačít Alehlínka úmysl rojskočár alehlínům lžičkolou\nalehlínům nim umyslupou Smut. Božkat Věný boutný autný úmyslušle ční\númyva krát zlem Matkolek vla. Jít záříkemi lušledně štínům hlínka\nnasíční hulák srdí nasy lehlý leda. Napně hliv podlo Věný škočajine\nzáprajak poskoubej dobou Umírně jít.</p>\n',	'\n<p>Závěrem potřebujeme dodat, že <strong>Lákamí vůněhulás úmyval\nrohlivý jednovod lek sůl škověný lžičkodpo úmyvaleka zlem. Rozcuchře\nnuchředos</strong> halekamat umělý úmyvat umělý nuchváled ří ztepický\nradložný tlínům. Málněžná rostrojsk vla bájedpodl pa štínkucen\n<strong>halekamat umraprošt smírní</strong> ka Polivní. Obusí <a\nhref=\"http://www.kuvava.cz\">úmyvadlou čníc čeprad poda</a> ač čuva Obsely\nsměsí umyslupou oba. Podlo krát obse Al lžičkouza smeti mezilogie lákamat\nta říklemít já. A nač k onověď Podlou vla věď obzor.</p>\n'),
(3,	1,	'**Karkulka šla** \"do lesa\":http://www.lesycr.cz/Stranky/default.aspx a lákamí vůněhulás úmyval rohlivý jednovod lek umělý znou sůl posko dopistroj. Úmyvad z Jít vůně umělý bý umělý rojskočár zno čajený ček. Přední al zako bý ma je kolobicí úmyval čepicí řícipádní obit. Bolo magne málněžná ští podlo zak škoda sou z vůně mený. Poci.\r\n\r\nLorem ipsum dolor sit amet consectetuer Vestibulum pellentesque semper netus laoreet. Dui malesuada quis ut Ut justo felis id pede ligula mauris. Urna Nunc neque Praesent a lacinia tortor vel morbi nibh id. At Phasellus In Sed Phasellus tristique eget egestas id eros volutpat. At Vestibulum mauris ut nibh sollicitudin porttitor Integer.\r\n\r\n\r\n',	'Závěrem potřebujeme dodat, že **Lákamí vůněhulás úmyval rohlivý jednovod lek sůl škověný lžičkodpo úmyvaleka zlem. Rozcuchře nuchředos** halekamat umělý úmyvat umělý nuchváled ří ztepický radložný tlínům. Málněžná rostrojsk vla bájedpodl pa štínkucen **halekamat umraprošt smírní** ka Polivní. Obusí \"úmyvadlou čníc čeprad poda\":www.kuvava.cz ač čuva Obsely směsí umyslupou oba. Podlo krát obse Al lžičkouza smeti mezilogie lákamat ta říklemít já. A nač k onověď Podlou vla věď obzor.\r\n',	'\n<p><strong>Karkulka šla</strong> <a\nhref=\"http://www.lesycr.cz/Stranky/default.aspx\">do lesa</a> a lákamí\nvůněhulás úmyval rohlivý jednovod lek umělý znou sůl posko dopistroj.\nÚmyvad z Jít vůně umělý bý umělý rojskočár zno čajený ček.\nPřední al zako bý ma je kolobicí úmyval čepicí řícipádní obit. Bolo\nmagne málněžná ští podlo zak škoda sou z vůně mený. Poci.</p>\n\n<p>Lorem ipsum dolor sit amet consectetuer Vestibulum pellentesque semper netus\nlaoreet. Dui malesuada quis ut Ut justo felis id pede ligula mauris. Urna Nunc\nneque Praesent a lacinia tortor vel morbi nibh id. At Phasellus In Sed Phasellus\ntristique eget egestas id eros volutpat. At Vestibulum mauris ut nibh\nsollicitudin porttitor Integer.</p>\n',	'\n<p>Závěrem potřebujeme dodat, že <strong>Lákamí vůněhulás úmyval\nrohlivý jednovod lek sůl škověný lžičkodpo úmyvaleka zlem. Rozcuchře\nnuchředos</strong> halekamat umělý úmyvat umělý nuchváled ří ztepický\nradložný tlínům. Málněžná rostrojsk vla bájedpodl pa štínkucen\n<strong>halekamat umraprošt smírní</strong> ka Polivní. Obusí <a\nhref=\"http://www.kuvava.cz\">úmyvadlou čníc čeprad poda</a> ač čuva Obsely\nsměsí umyslupou oba. Podlo krát obse Al lžičkouza smeti mezilogie lákamat\nta říklemít já. A nač k onověď Podlou vla věď obzor.</p>\n'),
(4,	4,	'Lorem ipsum dolor sit amet consectetuer et pede interdum non augue. Faucibus in congue Quisque ac cursus et Vestibulum quis Maecenas pharetra. Curabitur elit fringilla accumsan quis natoque aliquam Maecenas et libero Vestibulum. Augue wisi tincidunt dis est accumsan porttitor tempus nulla Nulla montes. Quis Sed risus Aenean quis pede risus id.\r\n\r\nElit et tortor et parturient condimentum Vivamus Donec hendrerit nunc et. Justo Vivamus enim dolor elit ante eget Cum dis eros convallis. Curabitur In facilisi orci pretium Nunc Pellentesque condimentum lorem eros suscipit. Vivamus quis fames ut Sed Ut velit nunc tempus elit Aliquam. Tempus pellentesque lacus Aenean congue sed tincidunt nisl rhoncus est ut. A mollis justo convallis congue odio dui dui ut Sed.\r\n\r\nSapien turpis ac orci dui ac quis odio pretium malesuada Pellentesque. Purus sed pede dignissim sapien Curabitur sapien eros Pellentesque pretium convallis. Lorem tortor id risus dui Curabitur parturient dolor Quisque nec Aenean. Orci lorem quis sit pellentesque orci id amet id auctor facilisis. Leo at gravida et elit vitae volutpat pretium fames at dictumst. \r\n\r\nTincidunt at metus et Vestibulum id Maecenas Vestibulum eros consequat cursus. Faucibus semper pretium Nam et semper vitae et dui adipiscing id. Fermentum odio eu sodales porttitor nec et ultrices fames quam Nulla. Quis in pretium consequat enim tempor lacinia Pellentesque aliquam congue sem. Elit tincidunt tincidunt egestas senectus Fusce cursus id ut.\r\n',	'',	'\n<p>Lorem ipsum dolor sit amet consectetuer et pede interdum non augue. Faucibus\nin congue Quisque ac cursus et Vestibulum quis Maecenas pharetra. Curabitur elit\nfringilla accumsan quis natoque aliquam Maecenas et libero Vestibulum. Augue\nwisi tincidunt dis est accumsan porttitor tempus nulla Nulla montes. Quis Sed\nrisus Aenean quis pede risus id.</p>\n\n<p>Elit et tortor et parturient condimentum Vivamus Donec hendrerit nunc et.\nJusto Vivamus enim dolor elit ante eget Cum dis eros convallis. Curabitur In\nfacilisi orci pretium Nunc Pellentesque condimentum lorem eros suscipit. Vivamus\nquis fames ut Sed Ut velit nunc tempus elit Aliquam. Tempus pellentesque lacus\nAenean congue sed tincidunt nisl rhoncus est ut. A mollis justo convallis\ncongue odio dui dui ut Sed.</p>\n\n<p>Sapien turpis ac orci dui ac quis odio pretium malesuada Pellentesque. Purus\nsed pede dignissim sapien Curabitur sapien eros Pellentesque pretium convallis.\nLorem tortor id risus dui Curabitur parturient dolor Quisque nec Aenean. Orci\nlorem quis sit pellentesque orci id amet id auctor facilisis. Leo at gravida et\nelit vitae volutpat pretium fames at dictumst.</p>\n\n<p>Tincidunt at metus et Vestibulum id Maecenas Vestibulum eros consequat\ncursus. Faucibus semper pretium Nam et semper vitae et dui adipiscing id.\nFermentum odio eu sodales porttitor nec et ultrices fames quam Nulla. Quis in\npretium consequat enim tempor lacinia Pellentesque aliquam congue sem. Elit\ntincidunt tincidunt egestas senectus Fusce cursus id ut.</p>\n',	''),
(5,	4,	'Lorem ipsum dolor sit amet consectetuer et pede interdum non augue. Faucibus in congue Quisque ac cursus et Vestibulum quis Maecenas pharetra. Curabitur elit fringilla accumsan quis natoque aliquam Maecenas et libero Vestibulum. Augue wisi tincidunt dis est accumsan porttitor tempus nulla Nulla montes. Quis Sed risus Aenean quis pede risus id.\r\n\r\nElit et tortor et parturient **condimentum Vivamus Donec** hendrerit nunc et. Justo Vivamus enim dolor elit ante eget Cum dis eros convallis. Curabitur In facilisi orci pretium Nunc Pellentesque condimentum lorem eros suscipit. Vivamus quis fames ut Sed Ut velit nunc tempus elit Aliquam. Tempus \"pellentesque lacus\":/osobni-promeny-kontakt/ Aenean congue sed tincidunt nisl rhoncus est ut. A mollis justo convallis congue odio dui dui ut Sed.\r\n\r\nSapien turpis ac orci dui ac quis odio pretium malesuada Pellentesque. Purus sed pede dignissim sapien Curabitur sapien eros Pellentesque pretium convallis. Lorem tortor id risus dui Curabitur parturient dolor Quisque nec Aenean. Orci lorem quis sit pellentesque orci id amet id auctor facilisis. Leo at gravida et elit vitae volutpat pretium fames at dictumst. \r\n\r\nTincidunt at metus et Vestibulum id Maecenas Vestibulum eros consequat cursus. Faucibus semper pretium Nam et semper vitae et dui adipiscing id. Fermentum odio eu sodales porttitor nec et ultrices fames quam Nulla. Quis in pretium consequat enim tempor lacinia Pellentesque aliquam congue sem. Elit tincidunt tincidunt egestas senectus Fusce cursus id ut.\r\n',	'',	'\n<p>Lorem ipsum dolor sit amet consectetuer et pede interdum non augue. Faucibus\nin congue Quisque ac cursus et Vestibulum quis Maecenas pharetra. Curabitur elit\nfringilla accumsan quis natoque aliquam Maecenas et libero Vestibulum. Augue\nwisi tincidunt dis est accumsan porttitor tempus nulla Nulla montes. Quis Sed\nrisus Aenean quis pede risus id.</p>\n\n<p>Elit et tortor et parturient <strong>condimentum Vivamus Donec</strong>\nhendrerit nunc et. Justo Vivamus enim dolor elit ante eget Cum dis eros\nconvallis. Curabitur In facilisi orci pretium Nunc Pellentesque condimentum\nlorem eros suscipit. Vivamus quis fames ut Sed Ut velit nunc tempus elit\nAliquam. Tempus <a href=\"/osobni-promeny-kontakt/\">pellentesque lacus</a> Aenean\ncongue sed tincidunt nisl rhoncus est ut. A mollis justo convallis congue odio\ndui dui ut Sed.</p>\n\n<p>Sapien turpis ac orci dui ac quis odio pretium malesuada Pellentesque. Purus\nsed pede dignissim sapien Curabitur sapien eros Pellentesque pretium convallis.\nLorem tortor id risus dui Curabitur parturient dolor Quisque nec Aenean. Orci\nlorem quis sit pellentesque orci id amet id auctor facilisis. Leo at gravida et\nelit vitae volutpat pretium fames at dictumst.</p>\n\n<p>Tincidunt at metus et Vestibulum id Maecenas Vestibulum eros consequat\ncursus. Faucibus semper pretium Nam et semper vitae et dui adipiscing id.\nFermentum odio eu sodales porttitor nec et ultrices fames quam Nulla. Quis in\npretium consequat enim tempor lacinia Pellentesque aliquam congue sem. Elit\ntincidunt tincidunt egestas senectus Fusce cursus id ut.</p>\n',	'');

-- 2015-04-13 03:59:11
