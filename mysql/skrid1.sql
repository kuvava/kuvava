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
(4,	'Náš tým',	'',	''),
(5,	'Ukázky',	'',	''),
(6,	'Pro ženy',	'',	''),
(7,	'Pro muže',	'',	'');

DROP TABLE IF EXISTS `stranka`;
CREATE TABLE `stranka` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rubrika` varchar(50) COLLATE utf8_czech_ci DEFAULT NULL COMMENT 'neměň',
  `googletitulek` varchar(100) COLLATE utf8_czech_ci DEFAULT NULL COMMENT 'optimum max 45 znaků (nepiš www.skryta-identita.cz - to se doplňuje samo)',
  `googlepopisek` varchar(160) COLLATE utf8_czech_ci DEFAULT NULL COMMENT 'optimum max 140 znaků',
  `editor_zmeneno` varchar(5) COLLATE utf8_czech_ci NOT NULL DEFAULT 'ne' COMMENT 'ZMĚŇ NA ''ano''',
  `obsah_html_nahore` text COLLATE utf8_czech_ci COMMENT 'neměň - vygeneruje se automaticky podle editoru',
  `obsah_html_dole` text COLLATE utf8_czech_ci COMMENT 'neměň - vygeneruje se automaticky podle editoru',
  `editor_obsahu_stranky_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `editor_obsahu_stranky_id` (`editor_obsahu_stranky_id`),
  CONSTRAINT `stranka_ibfk_1` FOREIGN KEY (`editor_obsahu_stranky_id`) REFERENCES `editor_obsahu_stranky` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

INSERT INTO `stranka` (`id`, `rubrika`, `googletitulek`, `googlepopisek`, `editor_zmeneno`, `obsah_html_nahore`, `obsah_html_dole`, `editor_obsahu_stranky_id`) VALUES
(1,	'Úvodní stránka',	'Moderní osobní proměny vizáže',	'Navrhneme Vám změny image, odkryjeme Vaše vnitřní touhy. Profesionálně Vás vyfotíme.',	'ne',	'\n<p><strong>Karkulka šla</strong> <a\nhref=\"http://www.lesycr.cz/Stranky/default.aspx\">do lesa</a> a lákamí\nvůněhulás úmyval rohlivý jednovod lek umělý znou sůl posko dopistroj.\nÚmyvad z Jít vůně umělý bý umělý rojskočár zno čajený ček.\nPřední al zako bý ma je kolobicí úmyval čepicí řícipádní obit. Bolo\nmagne málněžná ští podlo zak škoda sou z vůně mený. Poci.</p>\n\n<p>Lorem ipsum dolor sit amet consectetuer Vestibulum pellentesque semper netus\nlaoreet. Dui malesuada quis ut Ut justo felis id pede ligula mauris. Urna Nunc\nneque Praesent a lacinia tortor vel morbi nibh id. At Phasellus In Sed Phasellus\ntristique eget egestas id eros volutpat. At Vestibulum mauris ut nibh\nsollicitudin porttitor Integer.</p>\n',	'\n<p>Závěrem potřebujeme dodat, že <strong>Lákamí vůněhulás úmyval\nrohlivý jednovod lek sůl škověný lžičkodpo úmyvaleka zlem. Rozcuchře\nnuchředos</strong> halekamat umělý úmyvat umělý nuchváled ří ztepický\nradložný tlínům. Málněžná rostrojsk vla bájedpodl pa štínkucen\n<strong>halekamat umraprošt smírní</strong> ka Polivní. Obusí <a\nhref=\"http://www.kuvava.cz\">úmyvadlou čníc čeprad poda</a> ač čuva Obsely\nsměsí umyslupou oba. Podlo krát obse Al lžičkouza smeti mezilogie lákamat\nta říklemít já. A nač k onověď Podlou vla věď obzor.</p>\n',	1),
(2,	'Kontakt',	'Vizážový poradce - kontakt',	'bla bla bla - nějaký super popisek... :-)',	'ne',	NULL,	NULL,	2),
(3,	'Aktuality',	'Nové informace ke změnám image',	'agůlkjre ůakjdsf ůkjq werůlk jad ůůakjf qwe novinky',	'ne',	NULL,	NULL,	3),
(4,	'Náš tým',	'Tým odborníků na slovo vzatých',	'haf haf haf bů bů bů brum brum brum',	'ne',	NULL,	NULL,	4),
(5,	'Ukázky',	'nějaký titulek - ukázky',	'nějaký popisek - ukázky',	'ne',	NULL,	NULL,	5),
(6,	'Pro ženy',	'Změna ženské vizáže',	'adflkaf aůsldkfj aůlk fd ůask jdf aůsdkj a sůkdjfa ůslkdj aůskl jdf jů',	'ne',	NULL,	NULL,	6),
(7,	'Pro muže',	'Super pánská proměna',	'chalalal bla bla blb clc glg mun fuk rum duk sum puk...',	'ne',	NULL,	NULL,	7);

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
(3,	1,	'**Karkulka šla** \"do lesa\":http://www.lesycr.cz/Stranky/default.aspx a lákamí vůněhulás úmyval rohlivý jednovod lek umělý znou sůl posko dopistroj. Úmyvad z Jít vůně umělý bý umělý rojskočár zno čajený ček. Přední al zako bý ma je kolobicí úmyval čepicí řícipádní obit. Bolo magne málněžná ští podlo zak škoda sou z vůně mený. Poci.\r\n\r\nLorem ipsum dolor sit amet consectetuer Vestibulum pellentesque semper netus laoreet. Dui malesuada quis ut Ut justo felis id pede ligula mauris. Urna Nunc neque Praesent a lacinia tortor vel morbi nibh id. At Phasellus In Sed Phasellus tristique eget egestas id eros volutpat. At Vestibulum mauris ut nibh sollicitudin porttitor Integer.\r\n\r\n\r\n',	'Závěrem potřebujeme dodat, že **Lákamí vůněhulás úmyval rohlivý jednovod lek sůl škověný lžičkodpo úmyvaleka zlem. Rozcuchře nuchředos** halekamat umělý úmyvat umělý nuchváled ří ztepický radložný tlínům. Málněžná rostrojsk vla bájedpodl pa štínkucen **halekamat umraprošt smírní** ka Polivní. Obusí \"úmyvadlou čníc čeprad poda\":www.kuvava.cz ač čuva Obsely směsí umyslupou oba. Podlo krát obse Al lžičkouza smeti mezilogie lákamat ta říklemít já. A nač k onověď Podlou vla věď obzor.\r\n',	'\n<p><strong>Karkulka šla</strong> <a\nhref=\"http://www.lesycr.cz/Stranky/default.aspx\">do lesa</a> a lákamí\nvůněhulás úmyval rohlivý jednovod lek umělý znou sůl posko dopistroj.\nÚmyvad z Jít vůně umělý bý umělý rojskočár zno čajený ček.\nPřední al zako bý ma je kolobicí úmyval čepicí řícipádní obit. Bolo\nmagne málněžná ští podlo zak škoda sou z vůně mený. Poci.</p>\n\n<p>Lorem ipsum dolor sit amet consectetuer Vestibulum pellentesque semper netus\nlaoreet. Dui malesuada quis ut Ut justo felis id pede ligula mauris. Urna Nunc\nneque Praesent a lacinia tortor vel morbi nibh id. At Phasellus In Sed Phasellus\ntristique eget egestas id eros volutpat. At Vestibulum mauris ut nibh\nsollicitudin porttitor Integer.</p>\n',	'\n<p>Závěrem potřebujeme dodat, že <strong>Lákamí vůněhulás úmyval\nrohlivý jednovod lek sůl škověný lžičkodpo úmyvaleka zlem. Rozcuchře\nnuchředos</strong> halekamat umělý úmyvat umělý nuchváled ří ztepický\nradložný tlínům. Málněžná rostrojsk vla bájedpodl pa štínkucen\n<strong>halekamat umraprošt smírní</strong> ka Polivní. Obusí <a\nhref=\"http://www.kuvava.cz\">úmyvadlou čníc čeprad poda</a> ač čuva Obsely\nsměsí umyslupou oba. Podlo krát obse Al lžičkouza smeti mezilogie lákamat\nta říklemít já. A nač k onověď Podlou vla věď obzor.</p>\n');

-- 2015-04-09 10:20:57
