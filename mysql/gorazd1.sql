-- Adminer 4.2.1 MySQL dump

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
(1,	0,	1,	1,	NULL,	'Toužíte po změně image? Dopřejte si nevšední zážitek v podobě pánské proměny s profesionály, kteří vyzdvihnou váš vzhled, podtrhnou vaše charizma a pomohou vyladit váš osobitý styl. Dokonalá technika střihu, decentní či extravagantní foto make-up, orginální oblečení s doplňky a neotřele ztvárněné fotografie vám dovolí naplno si užít roli fotomodela.\r\n\r\n[* slepek.jpg *]'),
(10,	0,	1,	7,	NULL,	'V ceně balíčku dostanete:\r\n\r\n**2x trendy účes**\r\n- diagnostika vlasů\r\n- mytí\r\n- masáž hlavy\r\n- střih\r\n- styling\r\n- barvení pro rychlou změnu bez velkých závazků\r\n**2x fotomakeup**\r\n- péče o pleť podle typu pleti (čištění, peeling, sérum, krém)\r\n- dva typy foto make-upu (decentní a extravagantní)\r\n- v případě zájmu odlíčení po skončení focení\r\n**2x originální model**\r\n- autorské modely\r\n- zapůjčení obuvi vhodné velikosti\r\n- designové doplňky a šperky\r\n**2x profesionální focení**\r\n- 10 ks dokonalých fotografií\r\n- originální postrodukce a retuš\r\n- fotky do týdne od proměny\r\n**Cena dvou kompletních proměn je 3900,- Kč**\r\n\r\nJak proměna probíhá:\r\n***********************\r\n- ranní seznámení u kávy s celým týmem v Ateliéru jR\r\n- odvoz a stříhání do salónu Petra\r\n- líčení a vizáž v Ateliéru jR\r\n- focení první proměny\r\n- druhé líčení a vizáž\r\n- druhé focení\r\n\r\nPo celou dobu proměny je k dispozici občerstvení.\r\n'),
(18,	0,	1,	3,	NULL,	'Chcete překvapit či obdarovat svého přítele, muže, bratra či syna? Chcete mu dopřát neotřelý zážitek? Splňte mu tajné přání dárkovým poukazem na změnu image...\r\n\r\nDárkové poukazy jsou k objednání na adrese: info@skryta-identita.cz\r\n\r\n[* poukaz.jpg *]\r\n\r\n'),
(19,	0,	1,	4,	NULL,	'[* tym.jpg .(Tým skryté identity) *]\r\n\r\n[* portret1.jpg <]**Vlasová stylistka Petra Pešinová**\r\n\r\nJiž během studia jsem si uvědomila, že obor kadeřnice byl zvolen správně. Krátce po nástupu do svého prvního zaměstnání lékaři zjistili alergii na amoniak. Nevzdala jsem to a přešla do pánského kadeřnictví. Sny o vlastním salonu v počátcích podnikání v Čechách se rozplynuly po narození dětí. Stále jsem se vzdělávala v oboru a navštěvovala odborné semináře a stáže. V roce 2008 jsem se přihlásila do soutěže Hair Fashion, protože mě zajímalo, jak uspěji v mladší konkurenci. Získané druhé místo bylo odrazovým můstkem do budoucnosti. Více informací najdete na \"www.kaderpetra.cz\":http://www.kaderpetra.cz\r\n\r\n<div class=\"odznova\"></div>\r\n\r\n\r\n[* portret2.jpg <]**Vizážistka Eliška Čejková**\r\n\r\nOd dětství jsem se věnovala kresbě a malbě a postupem času má vášeň přešla od malířského plátna k jinému, ale podobnému druhu umění – k líčení. Pracuji jako vizážistka a mým cílem je krásná pleť a vyšší sebevědomí všech klientů, kteří se svěří do mých rukou. Věnuji se především líčení na svatby, společenské události a foto make-upu. Nedílnou součástí mé práce je samozřejmě poradenství v oblasti péče o pleť a v líčení. Již během studia na vysoké škole jsem absolvovala řadu kurzů k různým typům líčení a po dostudování jsem si doplnila vzdělání v oboru dermálně aplikační kosmetiky a absolvovala kurz prodlužování řas, abych mohla poskytovat své služby v co nejvyšší kvalitě a s co nejširším zaměřením.\r\n\r\n<div class=\"odznova\"></div>\r\n\r\n\r\n[* portret3.jpg <]**Módní návrhářka Jitka Šedová**\r\n\r\nAutorská modelová tvorba značky jR.\r\n Originální doplňky a autorské šperky.\r\n Zakázková tvorba oděvů, zakázkové krejčovství.\r\n\r\n<div class=\"odznova\"></div>\r\n\r\n\r\n[* portret4.jpg <]**Fotograf Lukáš Urban**\r\n\r\nFocení je mojí vášní, koníčkem i profesí. Přivedl mě k němu můj táta, kterému jsem jako školák pomáhal ve fotokomoře. Naplno jsem začal fotit s nástupem digitální techniky. Výbava se rozrůstala, zkušenosti přibývaly a přišel první milník. V roce 2009 mě kamarádka poprosila o focení svatby. Novomanželé byli z fotek nadšení a já z focení taky. Od té doby jsem svatby fotil všem známým, postupně i neznámým. Přibylo focení portrétů, reportáží ... doplnil jsem vzdělání a v roce 2014 přišel další milník. Začal jsem fotit pro noviny. Témata si vynutila přezbrojení na profi techniku, ale ty zkušenosti jsou k nezaplacení.\r\nMé portfólio najdete na webu \"fotourban.cz\":http://fotourban.cz'),
(22,	0,	1,	2,	NULL,	'[* kontakt.jpg .(Tým skryté identity) *]\r\n- město: Hradec Králové\r\n- telefon: 732 883 091\r\n- email: info@skryta-identita.cz\r\n- facebook: \"Skrytá identita\":https://www.facebook.com/pages/Skrytá-identita/1390054944650716?pnref=lhc'),
(24,	0,	1,	5,	NULL,	'Objev, co v tobě je!\r\n*******************\r\n**Martinovy skryté identity:**'),
(25,	0,	1,	5,	1,	''),
(26,	0,	1,	7,	2,	''),
(27,	0,	1,	7,	NULL,	'Volné termíny k rezervaci:\r\n****************************\r\n- neděle 24. května\r\n- neděle 21. června\r\n- neděle 19. července');

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
(1,	1,	10,	0),
(2,	1,	9,	0),
(3,	1,	11,	0),
(4,	1,	12,	0),
(5,	1,	16,	0),
(7,	2,	6,	0),
(8,	2,	15,	0),
(9,	2,	8,	0),
(14,	2,	7,	0),
(15,	2,	13,	0),
(16,	2,	14,	0),
(17,	1,	20,	0),
(18,	1,	24,	0),
(19,	1,	25,	0),
(20,	1,	28,	0),
(21,	1,	17,	0);

DROP TABLE IF EXISTS `galerie_skupina_fotek`;
CREATE TABLE `galerie_skupina_fotek` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `poznamka` varchar(255) COLLATE utf8_czech_ci NOT NULL COMMENT 'Slouží pro Tvou orientaci.',
  `googlepopis_automatizovane` varchar(255) COLLATE utf8_czech_ci NOT NULL COMMENT 'Fotografie, které nemají vlastní googlepopis obdrží tento společný.',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

INSERT INTO `galerie_skupina_fotek` (`id`, `poznamka`, `googlepopis_automatizovane`) VALUES
(1,	'Proměna Martina',	'Fotky pánské proměny Martina v Hradci Králové.'),
(2,	'Pánské proměny',	'fotogalerie pánských proměn');

DROP TABLE IF EXISTS `stranka`;
CREATE TABLE `stranka` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rubrika` varchar(50) COLLATE utf8_czech_ci NOT NULL COMMENT 'vyplň standardní označení v menu',
  `url` varchar(150) COLLATE utf8_czech_ci NOT NULL COMMENT 'pečlivě vyplň adresu stránky, vynech úvod: www.mojedomena.cz/',
  `googletitulek` varchar(100) COLLATE utf8_czech_ci DEFAULT NULL COMMENT 'optimum max 45 znaků (nepiš www.skryta-identita.cz - to se doplňuje samo)',
  `googlepopisek` varchar(160) COLLATE utf8_czech_ci DEFAULT NULL COMMENT 'optimum max 140 znaků',
  `editor_zmeneno` varchar(5) COLLATE utf8_czech_ci NOT NULL DEFAULT 'ne' COMMENT 'neměň - použij tlačítko na webu na adrese /_nastroje/',
  `obsah_html_nahore` text COLLATE utf8_czech_ci COMMENT 'neměň - vygeneruje se automaticky podle editoru',
  `obsah_html_dole` text COLLATE utf8_czech_ci COMMENT 'neměň - vygeneruje se automaticky podle editoru',
  `obsahuje_galerii` varchar(5) COLLATE utf8_czech_ci NOT NULL DEFAULT 'ne' COMMENT 'neměň - vygeneruje se automaticky',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

INSERT INTO `stranka` (`id`, `rubrika`, `url`, `googletitulek`, `googlepopisek`, `editor_zmeneno`, `obsah_html_nahore`, `obsah_html_dole`, `obsahuje_galerii`) VALUES
(1,	'Úvodní stránka',	'',	'Moderní pánské proměny vizáže',	'Dvě kompletní proměny vizáže. Trendy účes, fotomakeup, originální modely, profesionální fotky.',	'ne',	'<div class=\"col1\">\n\n<p>Toužíte po změně image? Dopřejte si nevšední zážitek v podobě\npánské proměny s profesionály, kteří vyzdvihnou váš vzhled, podtrhnou\nvaše charizma a pomohou vyladit váš osobitý styl. Dokonalá technika\nstřihu, decentní či extravagantní foto make-up, orginální oblečení\ns doplňky a neotřele ztvárněné fotografie vám dovolí naplno si užít\nroli fotomodela.</p>\n\n<div><img src=\"/images/main-content/slepek.jpg\" alt=\"\" width=\"3700\"\nheight=\"1800\" style=\"max-width:3700px;max-height:1800px\" class=\"texy\" /></div>\n\n</div>\n',	NULL,	'ne'),
(2,	'Kontakt',	'osobni-promeny-kontakt',	'Kontakt skryté identity',	'Telefon, email a facebook týmu Skryté identity, která provádí pánské proměny vizáže v Hradci Králové.',	'ne',	'<div class=\"col1\">\n\n<div><img src=\"/images/main-content/kontakt.jpg\" alt=\"Tým skryté identity\"\nwidth=\"1200\" height=\"466\" style=\"max-width:1200px;max-height:466px\" class=\"texy\"\n/></div>\n\n<ul>\n	<li>město: Hradec Králové</li>\n\n	<li>telefon: 732 883 091</li>\n\n	<li>email: <a\n	href=\"mailto:info&#64;skryta-identita.cz\">info&#64;<!-- -->skryta-identita.cz</a></li>\n\n	<li>facebook: <a\n	href=\"https://www.facebook.com/pages/Skrytá-identita/1390054944650716?pnref=lhc\">Skrytá\n	identita</a></li>\n</ul>\n\n</div>\n',	NULL,	'ne'),
(3,	'Poukazy',	'moderni-promena-vizaze',	'Dárkové poukazy - pánské proměny',	'Dárkový pokaz pánské proměny k objednání.',	'ne',	'<div class=\"col1\">\n\n<p>Chcete překvapit či obdarovat svého přítele, muže, bratra či syna?\nChcete mu dopřát neotřelý zážitek? Splňte mu tajné přání dárkovým\npoukazem na změnu image…</p>\n\n<p>Dárkové poukazy jsou k objednání na adrese: <a\nhref=\"mailto:info&#64;skryta-identita.cz\">info&#64;<!-- -->skryta-identita.cz</a></p>\n\n<div><img src=\"/images/main-content/poukaz.jpg\" alt=\"\" width=\"1800\" height=\"848\"\nstyle=\"max-width:1800px;max-height:848px\" class=\"texy\" /></div>\n\n</div>\n',	NULL,	'ne'),
(4,	'Náš tým',	'team-vizaz-foceni',	'Profesionální tým pánských proměn',	'Představuje se Vám tým Skryté identity, který stojí za výjimečnými pánskými proměnami.',	'ne',	'<div class=\"col1\">\n\n<div><img src=\"/images/main-content/tym.jpg\" alt=\"Tým skryté identity\"\nwidth=\"1200\" height=\"444\" style=\"max-width:1200px;max-height:444px\" class=\"texy\"\n/></div>\n\n<p><img src=\"/images/main-content/portret1.jpg\" alt=\"\" class=\"tifl texy\"\nwidth=\"167\" height=\"250\" style=\"max-width:167px;max-height:250px\"\n/><strong>Vlasová stylistka Petra Pešinová</strong></p>\n\n<p>Již během studia jsem si uvědomila, že obor kadeřnice byl zvolen\nsprávně. Krátce po nástupu do svého prvního zaměstnání lékaři\nzjistili alergii na amoniak. Nevzdala jsem to a přešla do pánského\nkadeřnictví. Sny o vlastním salonu v počátcích podnikání v Čechách\nse rozplynuly po narození dětí. Stále jsem se vzdělávala v oboru a\nnavštěvovala odborné semináře a stáže. V roce 2008 jsem se přihlásila\ndo soutěže Hair Fashion, protože mě zajímalo, jak uspěji v mladší\nkonkurenci. Získané druhé místo bylo odrazovým můstkem do budoucnosti.\nVíce informací najdete na <a\nhref=\"http://www.kaderpetra.cz\">www.kaderpetra.cz</a></p>\n\n<div class=\"odznova\"></div>\n\n<p><img src=\"/images/main-content/portret2.jpg\" alt=\"\" class=\"tifl texy\"\nwidth=\"167\" height=\"250\" style=\"max-width:167px;max-height:250px\"\n/><strong>Vizážistka Eliška Čejková</strong></p>\n\n<p>Od dětství jsem se věnovala kresbě a malbě a postupem času má vášeň\npřešla od malířského plátna k jinému, ale podobnému druhu umění –\nk líčení. Pracuji jako vizážistka a mým cílem je krásná pleť a\nvyšší sebevědomí všech klientů, kteří se svěří do mých rukou.\nVěnuji se především líčení na svatby, společenské události a foto\nmake-upu. Nedílnou součástí mé práce je samozřejmě poradenství\nv oblasti péče o pleť a v líčení. Již během studia na vysoké škole\njsem absolvovala řadu kurzů k různým typům líčení a po dostudování\njsem si doplnila vzdělání v oboru dermálně aplikační kosmetiky a\nabsolvovala kurz prodlužování řas, abych mohla poskytovat své služby v co\nnejvyšší kvalitě a s co nejširším zaměřením.</p>\n\n<div class=\"odznova\"></div>\n\n<p><img src=\"/images/main-content/portret3.jpg\" alt=\"\" class=\"tifl texy\"\nwidth=\"167\" height=\"250\" style=\"max-width:167px;max-height:250px\"\n/><strong>Módní návrhářka Jitka Šedová</strong></p>\n\n<p>Autorská modelová tvorba značky jR.<br />\nOriginální doplňky a autorské šperky.<br />\nZakázková tvorba oděvů, zakázkové krejčovství.</p>\n\n<div class=\"odznova\"></div>\n\n<p><img src=\"/images/main-content/portret4.jpg\" alt=\"\" class=\"tifl texy\"\nwidth=\"167\" height=\"250\" style=\"max-width:167px;max-height:250px\"\n/><strong>Fotograf Lukáš Urban</strong></p>\n\n<p>Focení je mojí vášní, koníčkem i profesí. Přivedl mě k němu můj\ntáta, kterému jsem jako školák pomáhal ve fotokomoře. Naplno jsem začal\nfotit s nástupem digitální techniky. Výbava se rozrůstala, zkušenosti\npřibývaly a přišel první milník. V roce 2009 mě kamarádka poprosila\no focení svatby. Novomanželé byli z fotek nadšení a já z focení taky.\nOd té doby jsem svatby fotil všem známým, postupně i neznámým. Přibylo\nfocení portrétů, reportáží … doplnil jsem vzdělání a v roce\n2014 přišel další milník. Začal jsem fotit pro noviny. Témata si\nvynutila přezbrojení na profi techniku, ale ty zkušenosti jsou\nk nezaplacení. Mé portfólio najdete na webu <a\nhref=\"http://fotourban.cz\">fotourban.cz</a></p>\n\n</div>\n',	NULL,	'ne'),
(5,	'Galerie',	'promena-vzhledu',	'Fotky pánských proměn',	'Fotogalerie s realizovanými pánskými proměnami.',	'ne',	'<div class=\"col1\">\n\n<h2>Objev, co v tobě je!</h2>\n\n<p><strong>Martinovy skryté identity:</strong></p>\n\n</div>\n<ul class=\"galul\" data-gallulid=\"1\">\n	<a href=\"/images/gallery/all/10.jpg\" target=\"_blank\" class=\"gala\" title=\"\" data-xlsize=\"1202x1800\" data-lsize=\"801x1200\" data-msize=\"534x800\" data-ssize=\"200x300\" data-sizecat=\"xl\" data-filename=\"10.jpg\" data-gallId=\"1\">\n		<li>\n<div class=\"prev\"><img src=\"/images/gallery/all/thumbs/s/10.jpg\" class=\"navysku\"style=\"bottom: 25%\"></div>		</li>\n	</a>\n	<a href=\"/images/gallery/all/9.jpg\" target=\"_blank\" class=\"gala\" title=\"\" data-xlsize=\"1202x1800\" data-lsize=\"801x1200\" data-msize=\"534x800\" data-ssize=\"200x300\" data-sizecat=\"xl\" data-filename=\"9.jpg\" data-gallId=\"2\">\n		<li>\n<div class=\"prev\"><img src=\"/images/gallery/all/thumbs/s/9.jpg\" class=\"navysku\"style=\"bottom: 4%\"></div>		</li>\n	</a>\n	<a href=\"/images/gallery/all/11.jpg\" target=\"_blank\" class=\"gala\" title=\"\" data-xlsize=\"1202x1800\" data-lsize=\"801x1200\" data-msize=\"534x800\" data-ssize=\"200x300\" data-sizecat=\"xl\" data-filename=\"11.jpg\" data-gallId=\"3\">\n		<li>\n<div class=\"prev\"><img src=\"/images/gallery/all/thumbs/s/11.jpg\" class=\"navysku\"style=\"bottom: 1%\"></div>		</li>\n	</a>\n	<a href=\"/images/gallery/all/12.jpg\" target=\"_blank\" class=\"gala\" title=\"\" data-xlsize=\"1800x1202\" data-lsize=\"1200x801\" data-msize=\"800x534\" data-ssize=\"300x200\" data-sizecat=\"xl\" data-filename=\"12.jpg\" data-gallId=\"4\">\n		<li>\n<div class=\"prev\"><img src=\"/images/gallery/all/thumbs/s/12.jpg\" class=\"nasirku\"style=\"right: 7%\"></div>		</li>\n	</a>\n	<a href=\"/images/gallery/all/16.jpg\" target=\"_blank\" class=\"gala\" title=\"\" data-xlsize=\"1202x1800\" data-lsize=\"801x1200\" data-msize=\"534x800\" data-ssize=\"200x300\" data-sizecat=\"xl\" data-filename=\"16.jpg\" data-gallId=\"5\">\n		<li>\n<div class=\"prev\"><img src=\"/images/gallery/all/thumbs/s/16.jpg\" class=\"navysku\"style=\"bottom: 13%\"></div>		</li>\n	</a>\n	<a href=\"/images/gallery/all/20.jpg\" target=\"_blank\" class=\"gala\" title=\"\" data-xlsize=\"1202x1800\" data-lsize=\"801x1200\" data-msize=\"534x800\" data-ssize=\"200x300\" data-sizecat=\"xl\" data-filename=\"20.jpg\" data-gallId=\"6\">\n		<li>\n<div class=\"prev\"><img src=\"/images/gallery/all/thumbs/s/20.jpg\" class=\"navysku\"style=\"bottom: 14%\"></div>		</li>\n	</a>\n	<a href=\"/images/gallery/all/24.jpg\" target=\"_blank\" class=\"gala\" title=\"\" data-xlsize=\"1800x1202\" data-lsize=\"1200x801\" data-msize=\"800x534\" data-ssize=\"300x200\" data-sizecat=\"xl\" data-filename=\"24.jpg\" data-gallId=\"7\">\n		<li>\n<div class=\"prev\"><img src=\"/images/gallery/all/thumbs/s/24.jpg\" class=\"nasirku\"style=\"right: 22%\"></div>		</li>\n	</a>\n	<a href=\"/images/gallery/all/25.jpg\" target=\"_blank\" class=\"gala\" title=\"\" data-xlsize=\"1202x1800\" data-lsize=\"801x1200\" data-msize=\"534x800\" data-ssize=\"200x300\" data-sizecat=\"xl\" data-filename=\"25.jpg\" data-gallId=\"8\">\n		<li>\n<div class=\"prev\"><img src=\"/images/gallery/all/thumbs/s/25.jpg\" class=\"navysku\"style=\"bottom: 10%\"></div>		</li>\n	</a>\n	<a href=\"/images/gallery/all/28.jpg\" target=\"_blank\" class=\"gala\" title=\"\" data-xlsize=\"1800x1202\" data-lsize=\"1200x801\" data-msize=\"800x534\" data-ssize=\"300x200\" data-sizecat=\"xl\" data-filename=\"28.jpg\" data-gallId=\"9\">\n		<li>\n<div class=\"prev\"><img src=\"/images/gallery/all/thumbs/s/28.jpg\" class=\"nasirku\"style=\"right: 22%\"></div>		</li>\n	</a>\n	<a href=\"/images/gallery/all/17.jpg\" target=\"_blank\" class=\"gala\" title=\"\" data-xlsize=\"1202x1800\" data-lsize=\"801x1200\" data-msize=\"534x800\" data-ssize=\"200x300\" data-sizecat=\"xl\" data-filename=\"17.jpg\" data-gallId=\"10\">\n		<li>\n<div class=\"prev\"><img src=\"/images/gallery/all/thumbs/s/17.jpg\" class=\"navysku\"style=\"bottom: 9%\"></div>		</li>\n	</a>\n</ul>',	NULL,	'ano'),
(7,	'Ceník',	'zmena-image-muze',	'Cena a termíny proměn',	'Ceník proměny se všemi službami a termíny pánských proměn.',	'ne',	'<div class=\"col1\">\n\n<p>V ceně balíčku dostanete:</p>\n\n<p><strong>2× trendy účes</strong></p>\n\n<ul>\n	<li>diagnostika vlasů</li>\n\n	<li>mytí</li>\n\n	<li>masáž hlavy</li>\n\n	<li>střih</li>\n\n	<li>styling</li>\n\n	<li>barvení pro rychlou změnu bez velkých závazků</li>\n</ul>\n\n<p><strong>2× fotomakeup</strong></p>\n\n<ul>\n	<li>péče o pleť podle typu pleti (čištění, peeling, sérum, krém)</li>\n\n	<li>dva typy foto make-upu (decentní a extravagantní)</li>\n\n	<li>v případě zájmu odlíčení po skončení focení</li>\n</ul>\n\n<p><strong>2× originální model</strong></p>\n\n<ul>\n	<li>autorské modely</li>\n\n	<li>zapůjčení obuvi vhodné velikosti</li>\n\n	<li>designové doplňky a šperky</li>\n</ul>\n\n<p><strong>2× profesionální focení</strong></p>\n\n<ul>\n	<li>10 ks dokonalých fotografií</li>\n\n	<li>originální postrodukce a retuš</li>\n\n	<li>fotky do týdne od proměny</li>\n</ul>\n\n<p><strong>Cena dvou kompletních proměn je 3900,– Kč</strong></p>\n\n<h2>Jak proměna probíhá:</h2>\n\n<ul>\n	<li>ranní seznámení u kávy s celým týmem v Ateliéru jR</li>\n\n	<li>odvoz a stříhání do salónu Petra</li>\n\n	<li>líčení a vizáž v Ateliéru jR</li>\n\n	<li>focení první proměny</li>\n\n	<li>druhé líčení a vizáž</li>\n\n	<li>druhé focení</li>\n</ul>\n\n<p>Po celou dobu proměny je k dispozici občerstvení.</p>\n\n</div>\n<ul class=\"galul\" data-gallulid=\"1\">\n	<a href=\"/images/gallery/all/6.jpg\" target=\"_blank\" class=\"gala\" title=\"úprava účesu\" data-xlsize=\"1202x1800\" data-lsize=\"801x1200\" data-msize=\"534x800\" data-ssize=\"200x300\" data-sizecat=\"xl\" data-filename=\"6.jpg\" data-gallId=\"1\">\n		<li>\n<div class=\"prev\"><img src=\"/images/gallery/all/thumbs/s/6.jpg\" class=\"navysku\"style=\"bottom: 7%\"></div>		</li>\n	</a>\n	<a href=\"/images/gallery/all/15.jpg\" target=\"_blank\" class=\"gala\" title=\"\" data-xlsize=\"1202x1800\" data-lsize=\"801x1200\" data-msize=\"534x800\" data-ssize=\"200x300\" data-sizecat=\"xl\" data-filename=\"15.jpg\" data-gallId=\"2\">\n		<li>\n<div class=\"prev\"><img src=\"/images/gallery/all/thumbs/s/15.jpg\" class=\"navysku\"style=\"bottom: 25%\"></div>		</li>\n	</a>\n	<a href=\"/images/gallery/all/8.jpg\" target=\"_blank\" class=\"gala\" title=\"\" data-xlsize=\"1800x1202\" data-lsize=\"1200x801\" data-msize=\"800x534\" data-ssize=\"300x200\" data-sizecat=\"xl\" data-filename=\"8.jpg\" data-gallId=\"3\">\n		<li>\n<div class=\"prev\"><img src=\"/images/gallery/all/thumbs/s/8.jpg\" class=\"nasirku\"style=\"right: 21%\"></div>		</li>\n	</a>\n	<a href=\"/images/gallery/all/7.jpg\" target=\"_blank\" class=\"gala\" title=\"\" data-xlsize=\"1202x1800\" data-lsize=\"801x1200\" data-msize=\"534x800\" data-ssize=\"200x300\" data-sizecat=\"xl\" data-filename=\"7.jpg\" data-gallId=\"4\">\n		<li>\n<div class=\"prev\"><img src=\"/images/gallery/all/thumbs/s/7.jpg\" class=\"navysku\"style=\"bottom: 20%\"></div>		</li>\n	</a>\n	<a href=\"/images/gallery/all/13.jpg\" target=\"_blank\" class=\"gala\" title=\"\" data-xlsize=\"1800x1202\" data-lsize=\"1200x801\" data-msize=\"800x534\" data-ssize=\"300x200\" data-sizecat=\"xl\" data-filename=\"13.jpg\" data-gallId=\"5\">\n		<li>\n<div class=\"prev\"><img src=\"/images/gallery/all/thumbs/s/13.jpg\" class=\"nasirku\"style=\"right: 25%\"></div>		</li>\n	</a>\n	<a href=\"/images/gallery/all/14.jpg\" target=\"_blank\" class=\"gala\" title=\"\" data-xlsize=\"1800x1202\" data-lsize=\"1200x801\" data-msize=\"800x534\" data-ssize=\"300x200\" data-sizecat=\"xl\" data-filename=\"14.jpg\" data-gallId=\"6\">\n		<li>\n<div class=\"prev\"><img src=\"/images/gallery/all/thumbs/s/14.jpg\" class=\"nasirku\"style=\"right: 16%\"></div>		</li>\n	</a>\n</ul><div class=\"col1\">\n\n<h2>Volné termíny k rezervaci:</h2>\n\n<ul>\n	<li>neděle 24. května</li>\n\n	<li>neděle 21. června</li>\n\n	<li>neděle 19. července</li>\n</ul>\n\n</div>\n',	NULL,	'ano');

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
(5,	7,	NULL,	NULL,	449221,	1202,	1800,	'width=\"1202\" height=\"1800\"',	'jpg',	'navysku',	85100,	801,	1200,	'width=\"801\" height=\"1200\"',	41216,	534,	800,	'width=\"534\" height=\"800\"',	9116,	200,	300,	'width=\"200\" height=\"300\"'),
(6,	7,	NULL,	'úprava účesu',	537822,	1202,	1800,	'width=\"1202\" height=\"1800\"',	'jpg',	'navysku',	109936,	801,	1200,	'width=\"801\" height=\"1200\"',	57747,	534,	800,	'width=\"534\" height=\"800\"',	13044,	200,	300,	'width=\"200\" height=\"300\"'),
(7,	20,	NULL,	NULL,	518635,	1202,	1800,	'width=\"1202\" height=\"1800\"',	'jpg',	'navysku',	86794,	801,	1200,	'width=\"801\" height=\"1200\"',	45223,	534,	800,	'width=\"534\" height=\"800\"',	11370,	200,	300,	'width=\"200\" height=\"300\"'),
(8,	21,	NULL,	NULL,	436211,	1800,	1202,	'width=\"1800\" height=\"1202\"',	'jpg',	'nasirku',	75936,	1200,	801,	'width=\"1200\" height=\"801\"',	39806,	800,	534,	'width=\"800\" height=\"534\"',	10113,	300,	200,	'width=\"300\" height=\"200\"'),
(9,	4,	NULL,	NULL,	585564,	1202,	1800,	'width=\"1202\" height=\"1800\"',	'jpg',	'navysku',	130863,	801,	1200,	'width=\"801\" height=\"1200\"',	68739,	534,	800,	'width=\"534\" height=\"800\"',	15320,	200,	300,	'width=\"200\" height=\"300\"'),
(10,	25,	NULL,	NULL,	480856,	1202,	1800,	'width=\"1202\" height=\"1800\"',	'jpg',	'navysku',	95756,	801,	1200,	'width=\"801\" height=\"1200\"',	48959,	534,	800,	'width=\"534\" height=\"800\"',	11413,	200,	300,	'width=\"200\" height=\"300\"'),
(11,	1,	NULL,	NULL,	500718,	1202,	1800,	'width=\"1202\" height=\"1800\"',	'jpg',	'navysku',	102546,	801,	1200,	'width=\"801\" height=\"1200\"',	51789,	534,	800,	'width=\"534\" height=\"800\"',	11786,	200,	300,	'width=\"200\" height=\"300\"'),
(12,	7,	NULL,	NULL,	530956,	1800,	1202,	'width=\"1800\" height=\"1202\"',	'jpg',	'nasirku',	107460,	1200,	801,	'width=\"1200\" height=\"801\"',	54383,	800,	534,	'width=\"800\" height=\"534\"',	11513,	300,	200,	'width=\"300\" height=\"200\"'),
(13,	25,	NULL,	NULL,	493689,	1800,	1202,	'width=\"1800\" height=\"1202\"',	'jpg',	'nasirku',	92935,	1200,	801,	'width=\"1200\" height=\"801\"',	49846,	800,	534,	'width=\"800\" height=\"534\"',	12664,	300,	200,	'width=\"300\" height=\"200\"'),
(14,	16,	NULL,	NULL,	643285,	1800,	1202,	'width=\"1800\" height=\"1202\"',	'jpg',	'nasirku',	130234,	1200,	801,	'width=\"1200\" height=\"801\"',	67479,	800,	534,	'width=\"800\" height=\"534\"',	14880,	300,	200,	'width=\"300\" height=\"200\"'),
(15,	25,	NULL,	NULL,	485910,	1202,	1800,	'width=\"1202\" height=\"1800\"',	'jpg',	'navysku',	90429,	801,	1200,	'width=\"801\" height=\"1200\"',	49106,	534,	800,	'width=\"534\" height=\"800\"',	12754,	200,	300,	'width=\"200\" height=\"300\"'),
(16,	13,	NULL,	NULL,	870661,	1202,	1800,	'width=\"1202\" height=\"1800\"',	'jpg',	'navysku',	181042,	801,	1200,	'width=\"801\" height=\"1200\"',	87669,	534,	800,	'width=\"534\" height=\"800\"',	15302,	200,	300,	'width=\"200\" height=\"300\"'),
(17,	9,	NULL,	NULL,	744259,	1202,	1800,	'width=\"1202\" height=\"1800\"',	'jpg',	'navysku',	167416,	801,	1200,	'width=\"801\" height=\"1200\"',	84576,	534,	800,	'width=\"534\" height=\"800\"',	16464,	200,	300,	'width=\"200\" height=\"300\"'),
(18,	6,	NULL,	NULL,	573364,	1202,	1800,	'width=\"1202\" height=\"1800\"',	'jpg',	'navysku',	131471,	801,	1200,	'width=\"801\" height=\"1200\"',	63886,	534,	800,	'width=\"534\" height=\"800\"',	12492,	200,	300,	'width=\"200\" height=\"300\"'),
(19,	0,	NULL,	NULL,	1043005,	1202,	1800,	'width=\"1202\" height=\"1800\"',	'jpg',	'navysku',	222990,	801,	1200,	'width=\"801\" height=\"1200\"',	103119,	534,	800,	'width=\"534\" height=\"800\"',	18099,	200,	300,	'width=\"200\" height=\"300\"'),
(20,	14,	NULL,	NULL,	955023,	1202,	1800,	'width=\"1202\" height=\"1800\"',	'jpg',	'navysku',	213348,	801,	1200,	'width=\"801\" height=\"1200\"',	100097,	534,	800,	'width=\"534\" height=\"800\"',	17484,	200,	300,	'width=\"200\" height=\"300\"'),
(21,	7,	NULL,	NULL,	863716,	1202,	1800,	'width=\"1202\" height=\"1800\"',	'jpg',	'navysku',	206011,	801,	1200,	'width=\"801\" height=\"1200\"',	100504,	534,	800,	'width=\"534\" height=\"800\"',	18096,	200,	300,	'width=\"200\" height=\"300\"'),
(22,	6,	NULL,	NULL,	591502,	1202,	1800,	'width=\"1202\" height=\"1800\"',	'jpg',	'navysku',	138842,	801,	1200,	'width=\"801\" height=\"1200\"',	68009,	534,	800,	'width=\"534\" height=\"800\"',	12613,	200,	300,	'width=\"200\" height=\"300\"'),
(23,	14,	NULL,	NULL,	942179,	1800,	1202,	'width=\"1800\" height=\"1202\"',	'jpg',	'nasirku',	201066,	1200,	801,	'width=\"1200\" height=\"801\"',	96716,	800,	534,	'width=\"800\" height=\"534\"',	16052,	300,	200,	'width=\"300\" height=\"200\"'),
(24,	22,	NULL,	NULL,	904565,	1800,	1202,	'width=\"1800\" height=\"1202\"',	'jpg',	'nasirku',	193681,	1200,	801,	'width=\"1200\" height=\"801\"',	92481,	800,	534,	'width=\"800\" height=\"534\"',	15254,	300,	200,	'width=\"300\" height=\"200\"'),
(25,	10,	NULL,	NULL,	541095,	1202,	1800,	'width=\"1202\" height=\"1800\"',	'jpg',	'navysku',	120453,	801,	1200,	'width=\"801\" height=\"1200\"',	62081,	534,	800,	'width=\"534\" height=\"800\"',	13454,	200,	300,	'width=\"200\" height=\"300\"'),
(26,	5,	NULL,	NULL,	685825,	1202,	1800,	'width=\"1202\" height=\"1800\"',	'jpg',	'navysku',	143113,	801,	1200,	'width=\"801\" height=\"1200\"',	70672,	534,	800,	'width=\"534\" height=\"800\"',	14143,	200,	300,	'width=\"200\" height=\"300\"'),
(27,	13,	NULL,	NULL,	652298,	1202,	1800,	'width=\"1202\" height=\"1800\"',	'jpg',	'navysku',	157222,	801,	1200,	'width=\"801\" height=\"1200\"',	82941,	534,	800,	'width=\"534\" height=\"800\"',	17759,	200,	300,	'width=\"200\" height=\"300\"'),
(28,	22,	NULL,	NULL,	629649,	1800,	1202,	'width=\"1800\" height=\"1202\"',	'jpg',	'nasirku',	148328,	1200,	801,	'width=\"1200\" height=\"801\"',	78282,	800,	534,	'width=\"800\" height=\"534\"',	17225,	300,	200,	'width=\"300\" height=\"200\"');

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


-- 2015-08-02 10:58:26
