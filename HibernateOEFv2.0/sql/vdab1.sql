-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.5.8


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema vdab1
--

CREATE DATABASE IF NOT EXISTS vdab1;
USE vdab1;

--
-- Definition of table `boeken`
--

DROP TABLE IF EXISTS `boeken`;
CREATE TABLE `boeken` (
  `ISBNNr` varchar(45) NOT NULL,
  `Titel` varchar(45) NOT NULL,
  PRIMARY KEY (`ISBNNr`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `boeken`
--

/*!40000 ALTER TABLE `boeken` DISABLE KEYS */;
INSERT INTO `boeken` (`ISBNNr`,`Titel`) VALUES 
 ('978 90 430 0276 9','Frans voor dummies'),
 ('978 90 430 0648 4','Duits voor dummies'),
 ('978 90 430 0795 5','Engels voor dummies');
/*!40000 ALTER TABLE `boeken` ENABLE KEYS */;


--
-- Definition of table `campussen`
--

DROP TABLE IF EXISTS `campussen`;
CREATE TABLE `campussen` (
  `CampusNr` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Naam` varchar(45) NOT NULL,
  `Straat` varchar(45) NOT NULL,
  `HuisNr` varchar(45) NOT NULL,
  `PostCode` varchar(45) NOT NULL,
  `Gemeente` varchar(45) NOT NULL,
  PRIMARY KEY (`CampusNr`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `campussen`
--

/*!40000 ALTER TABLE `campussen` DISABLE KEYS */;
INSERT INTO `campussen` (`CampusNr`,`Naam`,`Straat`,`HuisNr`,`PostCode`,`Gemeente`) VALUES 
 (1,'Andros','Somersstraat','22','2018','Antwerpen'),
 (2,'Delos','Oude Vest','17','9200','Dendermonde'),
 (3,'Gavdos','Europalaan','37','3600','Genk'),
 (4,'Hydra','Interleuvenlaan','2','3001','Heverlee'),
 (5,'Ikaria','Vlamingstraat','10','8560','Wevelgem'),
 (6,'Paros','Keizerslaan','11','1000','Brussel');
/*!40000 ALTER TABLE `campussen` ENABLE KEYS */;


--
-- Definition of table `campussentelefoonnrs`
--

DROP TABLE IF EXISTS `campussentelefoonnrs`;
CREATE TABLE `campussentelefoonnrs` (
  `Nummer` varchar(50) NOT NULL,
  `Opmerking` varchar(50) DEFAULT NULL,
  `CampusNr` int(10) unsigned NOT NULL,
  `Fax` bit(1) NOT NULL,
  KEY `FK_campussentelefoonnrs_campussen` (`CampusNr`),
  CONSTRAINT `FK_campussentelefoonnrs_campussen` FOREIGN KEY (`CampusNr`) REFERENCES `campussen` (`CampusNr`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `campussentelefoonnrs`
--

/*!40000 ALTER TABLE `campussentelefoonnrs` DISABLE KEYS */;
INSERT INTO `campussentelefoonnrs` (`Nummer`,`Opmerking`,`CampusNr`,`Fax`) VALUES 
 ('02 506 04 01',NULL,6,0x00),
 ('02 506 04 30',NULL,6,0x01),
 ('0800 30 700','gratis',6,0x00),
 ('03 202 17 11',NULL,1,0x00),
 ('03 202 17 00',NULL,1,0x01),
 ('052 46 97 40',NULL,2,0x00),
 ('052 46 97 69',NULL,2,0x01),
 ('089 30 14 11',NULL,3,0x00),
 ('089 36 40 84',NULL,3,0x01),
 ('016 38 00 00',NULL,4,0x00),
 ('016 40 02 29',NULL,4,0x01),
 ('056 43 80 80',NULL,5,0x00),
 ('056 42 13 43',NULL,5,0x01);
/*!40000 ALTER TABLE `campussentelefoonnrs` ENABLE KEYS */;


--
-- Definition of table `docenten`
--

DROP TABLE IF EXISTS `docenten`;
CREATE TABLE `docenten` (
  `DocentNr` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Voornaam` varchar(30) DEFAULT NULL,
  `Familienaam` varchar(30) DEFAULT NULL,
  `Wedde` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`DocentNr`)
) ENGINE=InnoDB AUTO_INCREMENT=315 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `docenten`
--

/*!40000 ALTER TABLE `docenten` DISABLE KEYS */;
INSERT INTO `docenten` (`DocentNr`,`Voornaam`,`Familienaam`,`Wedde`) VALUES 
 (1,'Willy','Abbeloos','1400.00'),
 (2,'Marianne','Vos','1800.00'),
 (3,'Joseph','Achten','1300.00'),
 (4,'Jeanine','Longo','1700.00'),
 (5,'Jan','Adriaensens','2100.00'),
 (6,'Grace','Verbeke','1600.00'),
 (7,'Frans','Aerenhouts','1300.00'),
 (8,'Brigitta','Roos','1700.00'),
 (9,'Jean','Aerts','1200.00'),
 (10,'Sanne','Verhart','1600.00'),
 (11,'Paul','Aerts','2000.00'),
 (12,'Stefan','Aerts','1500.00'),
 (13,'François','Alexander','1900.00'),
 (14,'Henri','Allard','1600.00'),
 (15,'Albert','Anciaux','1100.00'),
 (16,'Urbain','Anseeuw','1500.00'),
 (17,'Etienne','Antheunis','1900.00'),
 (18,'Jacques','Arlet','1400.00'),
 (19,'Wim','Arras','1800.00'),
 (20,'Roger','Baens','2200.00'),
 (21,'Dirk','Baert','1000.00'),
 (22,'Hubert','Baert','1400.00'),
 (23,'Jean-Pierre','Baert','1800.00'),
 (24,'Armand','Baeyens','1300.00'),
 (25,'Jan','Baeyens','1700.00'),
 (26,'Roger','Baguet','2100.00'),
 (27,'Serge','Baguet','1600.00'),
 (28,'Gérard','Balducq','1300.00'),
 (29,'Koen','Barbé','1700.00'),
 (30,'Georges','Barras','1200.00'),
 (31,'Auguste','Baumans','1600.00'),
 (32,'Arsène','Bauwens','2000.00'),
 (33,'Henri','Bauwens','1500.00'),
 (34,'Jules','Bayens','1900.00'),
 (35,'Albert','Beckaert','1600.00'),
 (36,'Marcel','Beckaert','1100.00'),
 (37,'Koen','Beeckman','1500.00'),
 (38,'Kamiel','Beeckman','1900.00'),
 (39,'Theophile','Beeckman','1400.00'),
 (40,'Benoni','Beheyt','1800.00'),
 (41,'Albert','Beirnaert','2200.00'),
 (42,'Jean','Belvaux','1000.00'),
 (43,'Adelin','Benoit','1400.00'),
 (44,'Auguste','Benoit','1800.00'),
 (45,'Jef','Berben','1300.00'),
 (46,'Jean-Pierre','Berckmans','1700.00'),
 (47,'Albert','Berton','2100.00'),
 (48,'Frans','Beths','1600.00'),
 (49,'René','Beyens','1300.00'),
 (50,'Herman','Beyssens','1700.00'),
 (51,'Albert','Billiet','1200.00'),
 (52,'Hector','Billiet','1600.00'),
 (53,'Marcel','Blavier','2000.00'),
 (54,'Roger','Blockx','1500.00'),
 (55,'Maurice','Blomme','1900.00'),
 (56,'Willy','Bocklandt','1600.00'),
 (57,'Emile','Bodart','1100.00'),
 (58,'Alfons','Boekaerts','1500.00'),
 (59,'Cesar','Bogaert','1900.00'),
 (60,'Jan','Bogaert','1400.00'),
 (61,'Jean','Bogaerts','1800.00'),
 (62,'Frans','Bonduel','2200.00'),
 (63,'Tom','Boonen','1000.00'),
 (64,'Jozef','Boons','1400.00'),
 (65,'Gabriel','Borra','1800.00'),
 (66,'Joseph','Bosmans','1300.00'),
 (67,'Walter','Boucquet','1700.00'),
 (68,'Marcel','Boumon','2100.00'),
 (69,'Ferdinand','Bracke','1600.00'),
 (70,'Adolphe','Braeckeveldt','1300.00'),
 (71,'Omer','Braekevelt','1700.00'),
 (72,'Frans','Brands','1200.00'),
 (73,'Jean','Brankart','1600.00'),
 (74,'Emile','Brichard','2000.00'),
 (75,'Georges','Brosteaux','1500.00'),
 (76,'Emile','Bruneau','1900.00'),
 (77,'Jean-Marie','Bruyère','1600.00'),
 (78,'Joseph','Bruyere','1100.00'),
 (79,'Dave','Bruylandts','1500.00'),
 (80,'Johan','Bruyneel','1900.00'),
 (81,'Lucien','Buysse','1400.00'),
 (82,'Christophe','Brandt','1800.00'),
 (83,'Norbert','Callens','2200.00'),
 (84,'Johan','Capiot','1000.00'),
 (85,'Pino','Cerami','1400.00'),
 (86,'Georges','Christiaens','1800.00'),
 (87,'Georges','Claes','1300.00'),
 (88,'Karel','Clerckx','1700.00'),
 (89,'Alex','Close','2100.00'),
 (90,'Yvan','Corbusier','1600.00'),
 (91,'Hilaire','Couvreur','1300.00'),
 (92,'Wilfried','Cretskens','1700.00'),
 (93,'Claude','Criquielion','1200.00'),
 (94,'Emile','Daems','1600.00'),
 (95,'Gustave','Danneels','2000.00'),
 (96,'Fred','De Bruyne','1500.00'),
 (97,'Arthur','Decabooter','1900.00'),
 (98,'Hans','De Clerq','1600.00'),
 (99,'Roger','Decock','1100.00'),
 (100,'Georges','Decraeye','1500.00'),
 (101,'Odiel','Defraeye','1900.00'),
 (102,'Albert','De Jonghe','1400.00'),
 (103,'Julien','Delbecque','1800.00'),
 (104,'Alfons','Deloor','2200.00'),
 (105,'Gustaaf','Deloor','1000.00'),
 (106,'Hubert','Deltour','1400.00'),
 (107,'Paul','Deman','1800.00'),
 (108,'Marc','Demeyer','1300.00'),
 (109,'Frans','De Mulder','1700.00'),
 (110,'Johan','De Muynck','2100.00'),
 (111,'Jef','Demuysere','1600.00'),
 (112,'Jules','Depoorter','1300.00'),
 (113,'Richard','Depoorter','1700.00'),
 (114,'Prosper','Depredomme','1200.00'),
 (115,'Willy','Derboven','1600.00'),
 (116,'Germain','Derijcke','2000.00'),
 (117,'Michel','Dernies','1500.00'),
 (118,'Charles','Deruyter','1900.00'),
 (119,'Maurice','Desimpelaere','1600.00'),
 (120,'Gilbert','Desmet','1100.00'),
 (121,'Georges','Desplenter','1500.00'),
 (122,'Léon','Despontin','1900.00'),
 (123,'Eric','De Vlaeminck','1400.00'),
 (124,'Roger','De Vlaeminck','1800.00'),
 (125,'Stijn','Devolder','2200.00'),
 (126,'Maurice','Dewaele','1000.00'),
 (127,'Alfons','De Wolf','1400.00'),
 (128,'Rudy','Dhaenens','1800.00'),
 (129,'Michel','D\'Hooghe','1300.00'),
 (130,'Ludo','Dierckxsens','1700.00'),
 (131,'Frans','Dictus','2100.00'),
 (132,'Lomme','Driessens','1600.00'),
 (133,'Gustave','Drioul','1300.00'),
 (134,'Marcel','Dupont','1700.00'),
 (135,'Niko','Eeckhout','1200.00'),
 (136,'Nico','Emonds','1600.00'),
 (137,'Peter','Farazijn','2000.00'),
 (138,'Herman','Frison','1500.00'),
 (139,'Henri','Garnier','1900.00'),
 (140,'Frans','Gielen','1600.00'),
 (141,'Romain','Gijssels','1100.00'),
 (142,'Walter','Godefroot','1500.00'),
 (143,'Dries','Govaerts','1900.00'),
 (144,'Sylvain','Grysolle','1400.00'),
 (145,'Roger','Gyselinck','1800.00'),
 (146,'Paul','Haghedooren','2200.00'),
 (147,'Alfred','Hamerlinck','1000.00'),
 (148,'Louis','Hardiquest','1400.00'),
 (149,'Emile','Hardy','1800.00'),
 (150,'Marcel','Hendrikx','1300.00'),
 (151,'Joseph','Hoevenaers','1700.00'),
 (152,'Kevin','Hulsmans','2100.00'),
 (153,'Raymond','Impanis','1600.00'),
 (154,'Paul','In\'t','1300.00'),
 (155,'Willy','In\'t','1700.00'),
 (156,'Marcel','Janssens','1200.00'),
 (157,'Benjamin','Javaux','1600.00'),
 (158,'Karel','Kaers','2000.00'),
 (159,'Francis','Kemplaire','1500.00'),
 (160,'Norbert','Kerckhove','1900.00'),
 (161,'Désiré','Keteleer','1600.00'),
 (162,'Marcel','Kint','1100.00'),
 (163,'Firmin','Lambot','1500.00'),
 (164,'Roger','Lambrecht','1900.00'),
 (165,'Eric','Leman','1400.00'),
 (166,'Camille','Leroy','1800.00'),
 (167,'Roland','Liboton','2200.00'),
 (168,'Jules','Lowie','1000.00'),
 (169,'André','Lurquin','1400.00'),
 (170,'Henri','\'Rik\'','1800.00'),
 (171,'Pierrot','Machiels','1300.00'),
 (172,'André','Maelbrancke','1700.00'),
 (173,'Freddy','Maertens','2100.00'),
 (174,'Romain','Maes','1600.00'),
 (175,'Sylvère','Maes','1300.00'),
 (176,'Joseph','Marchand','1700.00'),
 (177,'René','Martens','1200.00'),
 (178,'Jacques','Martin','1600.00'),
 (179,'Emile','père','2000.00'),
 (180,'Florent','Mathieu','1500.00'),
 (181,'Nico','Mattan','1900.00'),
 (182,'Filip','Meirhaeghe','1600.00'),
 (183,'Axel','Merckx','1100.00'),
 (184,'Eddy','Merckx','1500.00'),
 (185,'André','Messelis','1900.00'),
 (186,'Maurice','Meuleman','1400.00'),
 (187,'Eloi','Meulenberg','1800.00'),
 (188,'Frans','Mintjens','2200.00'),
 (189,'Yvo','Molenaers','1000.00'),
 (190,'Maurice','Mollin','1400.00'),
 (191,'Arthur','Mommerency','1800.00'),
 (192,'Jean-Pierre','Monséré','1300.00'),
 (193,'Willy','Monty','1700.00'),
 (194,'Sammie','Moreels','2100.00'),
 (195,'Alfred','Mottard','1600.00'),
 (196,'Ernest','Mottart','1300.00'),
 (197,'Louis','Mottiat','1700.00'),
 (198,'Johan','Museeuw','1200.00'),
 (199,'Wilfried','Nelissen','1600.00'),
 (200,'François','Neuville','2000.00'),
 (201,'André','Noyelle','1500.00'),
 (202,'Guy','Nulens','1900.00'),
 (203,'Nick','Nuyens','1600.00'),
 (204,'Sven','Nys','1100.00'),
 (205,'Stan','Ockers','1500.00'),
 (206,'Petrus','Oellibrandt','1900.00'),
 (207,'Valère','Ollivier','1400.00'),
 (208,'Eddy','Peelman','1800.00'),
 (209,'Edward','Peeters','2200.00'),
 (210,'Luc','Petitjean','1000.00'),
 (211,'Victor','\'Louis\'','1400.00'),
 (212,'Georges','Pintens','1800.00'),
 (213,'Théodore','Pirmez','1300.00'),
 (214,'Eddy','Planckaert','1700.00'),
 (215,'Jo','Planckaert','2100.00'),
 (216,'Walter','Planckaert','1600.00'),
 (217,'Willy','Planckaert','1300.00'),
 (218,'Michel','Pollentier','1700.00'),
 (219,'Léon','Poncelet','1200.00'),
 (220,'Louis','Proost','1600.00'),
 (221,'Robert','Protin','2000.00'),
 (222,'Albert','Ramon','1500.00'),
 (223,'Gaston','Rebry','1900.00'),
 (224,'Jens','Renders','1600.00'),
 (225,'Guido','Reybrouck','1100.00'),
 (226,'Marcel','Rijckaert','1500.00'),
 (227,'Albert','Ritserveldt','1900.00'),
 (228,'Bert','Roesems','1400.00'),
 (229,'Louis','Rolus','1800.00'),
 (230,'Georges','Ronsse','2200.00'),
 (231,'André','Rosseel','1000.00'),
 (232,'Félicien','Salmon','1400.00'),
 (233,'Léopold','Schaeken','1800.00'),
 (234,'Willy','Scheers','1300.00'),
 (235,'Alfons','Schepers','1700.00'),
 (236,'Joseph','Scherens','2100.00'),
 (237,'Jef','Scherens','1600.00'),
 (238,'Briek','Schotte','1300.00'),
 (239,'Frans','Schoubben','1700.00'),
 (240,'Léon','Scieur','1200.00'),
 (241,'Félix','Sellier','1600.00'),
 (242,'Edward','Sels','2000.00'),
 (243,'Albert','Sercu','1500.00'),
 (244,'Patrick','Sercu','1900.00'),
 (245,'Andy','de Smet','1600.00'),
 (246,'Joseph','Somers','1100.00'),
 (247,'Tom','Steels','1500.00'),
 (248,'Ernest','Sterckx','1900.00'),
 (249,'Lucien','Storme','1400.00'),
 (250,'Tom','Stubbe','1800.00'),
 (251,'Roger','Swerts','2200.00'),
 (252,'Arthur','Targez','1000.00'),
 (253,'Andrei','Tchmil','1400.00'),
 (254,'Emmanuel','Thoma','1800.00'),
 (255,'Philippe','Thys','1300.00'),
 (256,'Hector','Tiberghien','1700.00'),
 (257,'Léon','Tommies','2100.00'),
 (258,'Lode','Troonbeeckx','1600.00'),
 (259,'Greg','Van Avermaet','1300.00'),
 (260,'Armand','Van Bruaene','1700.00'),
 (261,'Georges','Vanconingsloo','1200.00'),
 (262,'Léon','Van Daele','1600.00'),
 (263,'Charles','Van Den Born','2000.00'),
 (264,'Frank','Vandenbroucke','1500.00'),
 (265,'Odiel','Vanden Meerschaut','1900.00'),
 (266,'Eric','Vanderaerden','1600.00'),
 (267,'Kurt','Van de Wouwer','1100.00'),
 (268,'Richard','Van Genechten','1500.00'),
 (269,'Martin','Van Geneugden','1900.00'),
 (270,'Cyrille','Van Hauwaert','1400.00'),
 (271,'Maurice','Van Herzele','1800.00'),
 (272,'Jules','Van Hevel','2200.00'),
 (273,'Edwig','Van Hooydonck','1000.00'),
 (274,'Lucien','Van Impe','1400.00'),
 (275,'Henri','Van Kerkhove','1800.00'),
 (276,'Rik','Van Linden','1300.00'),
 (277,'Rik','Van Looy','1700.00'),
 (278,'Willy','Vannitsen','2100.00'),
 (279,'Peter','Van Petegem','1600.00'),
 (280,'Peter','Van Santvliet','1300.00'),
 (281,'Victor','Van Schil','1700.00'),
 (282,'Herman','van Springel','1200.00'),
 (283,'Rik','Van Steenbergen','1600.00'),
 (284,'Guillaume','Van Tongerloo','2000.00'),
 (285,'Noël','Vantyghem','1500.00'),
 (286,'Rik','Verbrugghe','1900.00'),
 (287,'Auguste','Verdyck','1600.00'),
 (288,'Jozef','Verhaert','1100.00'),
 (289,'René','Vermandel','1500.00'),
 (290,'Stive','Vermaut','1900.00'),
 (291,'Adolf','Verschueren','1400.00'),
 (292,'Constant','Verschueren','1800.00'),
 (293,'Johan','Verstrepen','2200.00'),
 (294,'Félicien','Vervaecke','1000.00'),
 (295,'Julien','Vervaecke','1400.00'),
 (296,'Edward','Vissers','1800.00'),
 (297,'Lucien','Vlaemynck','1300.00'),
 (298,'André','Vlaeyen','1700.00'),
 (299,'Jean','Vliegen','2100.00'),
 (300,'Luc','Wallays','1600.00'),
 (301,'René','Walschot','1300.00'),
 (302,'Jean-Marie','Wampers','1700.00'),
 (303,'Robert','Wancour','1200.00'),
 (304,'Bart','Wellens','1600.00'),
 (305,'Wilfried','Wesemael','2000.00'),
 (306,'Wouter','Weylandt','1500.00'),
 (307,'Marc','Wauters','1900.00'),
 (308,'Daniel','Willems','1600.00'),
 (309,'Joseph','Abelshausen','1800.00'),
 (310,'François','Adam','1700.00'),
 (311,'René','Adriaensens','1600.00'),
 (312,'Emile','Aerts','1700.00'),
 (313,'Mario','Aerts','1600.00'),
 (314,'Jozef','Wouters','1100.00');
/*!40000 ALTER TABLE `docenten` ENABLE KEYS */;


--
-- Definition of table `docentenbijnamen`
--

DROP TABLE IF EXISTS `docentenbijnamen`;
CREATE TABLE `docentenbijnamen` (
  `DocentNr` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Bijnaam` varchar(45) NOT NULL,
  UNIQUE KEY `docentenbijnamenDocentNrBijnaam` (`DocentNr`,`Bijnaam`),
  CONSTRAINT `FK_docentenbijnamen_docenten` FOREIGN KEY (`DocentNr`) REFERENCES `docenten` (`DocentNr`)
) ENGINE=InnoDB AUTO_INCREMENT=314 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `docentenbijnamen`
--

/*!40000 ALTER TABLE `docentenbijnamen` DISABLE KEYS */;
INSERT INTO `docentenbijnamen` (`DocentNr`,`Bijnaam`) VALUES 
 (63,'Bom van Baelen'),
 (63,'Tommeke'),
 (63,'Tornado Tom'),
 (124,'Le gitan'),
 (124,'Tsjéte'),
 (125,'Volderke'),
 (181,'Monsieur P'),
 (184,'De Beethoven van de ronde'),
 (184,'De beul van de fiets'),
 (184,'De kannibaal'),
 (184,'De zwarte van Tervuren'),
 (198,'De leeuw van Vlaanderen'),
 (205,'Le Rusé'),
 (259,'Avi'),
 (274,'De kleine van Meere'),
 (279,'De peet'),
 (279,'De zwarte van Brakel'),
 (304,'Bartmans'),
 (307,'De soldaat'),
 (313,'Le beau Mario'),
 (313,'Super Mario');
/*!40000 ALTER TABLE `docentenbijnamen` ENABLE KEYS */;


--
-- Definition of table `docentenverantwoordelijkheden`
--

DROP TABLE IF EXISTS `docentenverantwoordelijkheden`;
CREATE TABLE `docentenverantwoordelijkheden` (
  `DocentNr` int(10) unsigned NOT NULL,
  `VerantwoordelijkheidNr` int(10) unsigned NOT NULL,
  PRIMARY KEY (`DocentNr`,`VerantwoordelijkheidNr`),
  KEY `FK_verant_docenten` (`VerantwoordelijkheidNr`),
  CONSTRAINT `FK_docenten_veran` FOREIGN KEY (`DocentNr`) REFERENCES `docenten` (`DocentNr`) ON DELETE CASCADE,
  CONSTRAINT `FK_verant_docenten` FOREIGN KEY (`VerantwoordelijkheidNr`) REFERENCES `verantwoordelijkheden` (`VerantwoordelijkheidNr`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `docentenverantwoordelijkheden`
--

/*!40000 ALTER TABLE `docentenverantwoordelijkheden` DISABLE KEYS */;
INSERT INTO `docentenverantwoordelijkheden` (`DocentNr`,`VerantwoordelijkheidNr`) VALUES 
 (3,1),
 (6,1),
 (9,1),
 (12,1),
 (15,1),
 (18,1),
 (21,1),
 (24,1),
 (27,1),
 (30,1),
 (33,1),
 (36,1),
 (39,1),
 (42,1),
 (45,1),
 (48,1),
 (51,1),
 (54,1),
 (57,1),
 (60,1),
 (63,1),
 (66,1),
 (69,1),
 (72,1),
 (75,1),
 (78,1),
 (81,1),
 (84,1),
 (87,1),
 (90,1),
 (93,1),
 (96,1),
 (99,1),
 (102,1),
 (105,1),
 (108,1),
 (111,1),
 (114,1),
 (117,1),
 (120,1),
 (123,1),
 (126,1),
 (129,1),
 (132,1),
 (135,1),
 (138,1),
 (141,1),
 (144,1),
 (147,1),
 (150,1),
 (153,1),
 (156,1),
 (159,1),
 (162,1),
 (165,1),
 (168,1),
 (171,1),
 (174,1),
 (177,1),
 (180,1),
 (183,1),
 (186,1),
 (189,1),
 (192,1),
 (195,1),
 (198,1),
 (201,1),
 (204,1),
 (207,1),
 (210,1),
 (213,1),
 (216,1),
 (219,1),
 (222,1),
 (225,1),
 (228,1),
 (231,1),
 (234,1),
 (237,1),
 (240,1),
 (243,1),
 (246,1),
 (249,1),
 (252,1),
 (255,1),
 (258,1),
 (261,1),
 (264,1),
 (267,1),
 (270,1),
 (273,1),
 (276,1),
 (279,1),
 (282,1),
 (285,1),
 (288,1),
 (291,1),
 (294,1),
 (297,1),
 (300,1),
 (303,1),
 (306,1),
 (309,1),
 (312,1),
 (1,2),
 (4,2),
 (7,2),
 (10,2),
 (13,2),
 (16,2),
 (19,2),
 (22,2),
 (25,2),
 (28,2),
 (31,2),
 (34,2),
 (37,2),
 (40,2),
 (43,2),
 (46,2),
 (49,2),
 (52,2),
 (55,2),
 (58,2),
 (61,2),
 (64,2),
 (67,2),
 (70,2),
 (73,2),
 (76,2),
 (79,2),
 (82,2),
 (85,2),
 (88,2),
 (91,2),
 (94,2),
 (97,2),
 (100,2),
 (103,2),
 (106,2),
 (109,2),
 (112,2),
 (115,2),
 (118,2),
 (121,2),
 (124,2),
 (127,2),
 (130,2),
 (133,2),
 (136,2),
 (139,2),
 (142,2),
 (145,2),
 (148,2),
 (151,2),
 (154,2),
 (157,2),
 (160,2),
 (163,2),
 (166,2),
 (169,2),
 (172,2),
 (175,2),
 (178,2),
 (181,2),
 (184,2),
 (187,2),
 (190,2),
 (193,2),
 (196,2),
 (199,2),
 (202,2),
 (205,2),
 (208,2),
 (211,2),
 (214,2),
 (217,2),
 (220,2),
 (223,2),
 (226,2),
 (229,2),
 (232,2),
 (235,2),
 (238,2),
 (241,2),
 (244,2),
 (247,2),
 (250,2),
 (253,2),
 (256,2),
 (259,2),
 (262,2),
 (265,2),
 (268,2),
 (271,2),
 (274,2),
 (277,2),
 (280,2),
 (283,2),
 (286,2),
 (289,2),
 (292,2),
 (295,2),
 (298,2),
 (301,2),
 (304,2),
 (307,2),
 (310,2),
 (313,2),
 (2,3),
 (5,3),
 (8,3),
 (11,3),
 (14,3),
 (17,3),
 (20,3),
 (23,3),
 (26,3),
 (29,3),
 (32,3),
 (35,3),
 (38,3),
 (41,3),
 (44,3),
 (47,3),
 (50,3),
 (53,3),
 (56,3),
 (59,3),
 (62,3),
 (65,3),
 (68,3),
 (71,3),
 (74,3),
 (77,3),
 (80,3),
 (83,3),
 (86,3),
 (89,3),
 (92,3),
 (95,3),
 (98,3),
 (101,3),
 (104,3),
 (107,3),
 (110,3),
 (113,3),
 (116,3),
 (119,3),
 (122,3),
 (125,3),
 (128,3),
 (131,3),
 (134,3),
 (137,3),
 (140,3),
 (143,3),
 (146,3),
 (149,3),
 (152,3),
 (155,3),
 (158,3),
 (161,3),
 (164,3),
 (167,3),
 (170,3),
 (173,3),
 (176,3),
 (179,3),
 (182,3),
 (185,3),
 (188,3),
 (191,3),
 (194,3),
 (197,3),
 (200,3),
 (203,3),
 (206,3),
 (209,3),
 (212,3),
 (215,3),
 (218,3),
 (221,3),
 (224,3),
 (227,3),
 (230,3),
 (233,3),
 (236,3),
 (239,3),
 (242,3),
 (245,3),
 (248,3),
 (251,3),
 (254,3),
 (257,3),
 (260,3),
 (263,3),
 (266,3),
 (269,3),
 (272,3),
 (275,3),
 (278,3),
 (281,3),
 (284,3),
 (287,3),
 (290,3),
 (293,3),
 (296,3),
 (299,3),
 (302,3),
 (305,3),
 (308,3),
 (311,3),
 (314,3),
 (1,4),
 (3,4),
 (5,4),
 (7,4),
 (9,4),
 (11,4),
 (13,4),
 (15,4),
 (17,4),
 (19,4),
 (21,4),
 (23,4),
 (25,4),
 (27,4),
 (29,4),
 (31,4),
 (33,4),
 (35,4),
 (37,4),
 (39,4),
 (41,4),
 (43,4),
 (45,4),
 (47,4),
 (49,4),
 (51,4),
 (53,4),
 (55,4),
 (57,4),
 (59,4),
 (61,4),
 (63,4),
 (65,4),
 (67,4),
 (69,4),
 (71,4),
 (73,4),
 (75,4),
 (77,4),
 (79,4),
 (81,4),
 (83,4),
 (85,4),
 (87,4),
 (89,4),
 (91,4),
 (93,4),
 (95,4),
 (97,4),
 (99,4),
 (101,4),
 (103,4),
 (105,4),
 (107,4),
 (109,4),
 (111,4),
 (113,4),
 (115,4),
 (117,4),
 (119,4),
 (121,4),
 (123,4),
 (125,4),
 (127,4),
 (129,4),
 (131,4),
 (133,4),
 (135,4),
 (137,4),
 (139,4),
 (141,4),
 (143,4),
 (145,4),
 (147,4),
 (149,4),
 (151,4),
 (153,4),
 (155,4),
 (157,4),
 (159,4),
 (161,4),
 (163,4),
 (165,4),
 (167,4),
 (169,4),
 (171,4),
 (173,4),
 (175,4),
 (177,4),
 (179,4),
 (181,4),
 (183,4),
 (185,4),
 (187,4),
 (189,4),
 (191,4),
 (193,4),
 (195,4),
 (197,4),
 (199,4),
 (201,4),
 (203,4),
 (205,4),
 (207,4),
 (209,4),
 (211,4),
 (213,4),
 (215,4),
 (217,4),
 (219,4),
 (221,4),
 (223,4),
 (225,4),
 (227,4),
 (229,4),
 (231,4),
 (233,4),
 (235,4),
 (237,4),
 (239,4),
 (241,4),
 (243,4),
 (245,4),
 (247,4),
 (249,4),
 (251,4),
 (253,4),
 (255,4),
 (257,4),
 (259,4),
 (261,4),
 (263,4),
 (265,4),
 (267,4),
 (269,4),
 (271,4),
 (273,4),
 (275,4),
 (277,4),
 (279,4),
 (281,4),
 (283,4),
 (285,4),
 (287,4),
 (289,4),
 (291,4),
 (293,4),
 (295,4),
 (297,4),
 (299,4),
 (301,4),
 (303,4),
 (305,4),
 (307,4),
 (309,4),
 (311,4),
 (313,4);
/*!40000 ALTER TABLE `docentenverantwoordelijkheden` ENABLE KEYS */;


--
-- Definition of table `evenementen`
--

DROP TABLE IF EXISTS `evenementen`;
CREATE TABLE `evenementen` (
  `ID` bigint(20) unsigned NOT NULL,
  `Datum` date NOT NULL,
  `Titel` varchar(45) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `evenementen`
--

/*!40000 ALTER TABLE `evenementen` DISABLE KEYS */;
INSERT INTO `evenementen` (`ID`,`Datum`,`Titel`) VALUES 
 (1,'2007-02-12','Receptie voor cursisten'),
 (2,'2007-07-02','Opendeurdag');
/*!40000 ALTER TABLE `evenementen` ENABLE KEYS */;


--
-- Definition of table `hoogstevolgnrs`
--

DROP TABLE IF EXISTS `hoogstevolgnrs`;
CREATE TABLE `hoogstevolgnrs` (
  `Naam` varchar(50) NOT NULL,
  `HoogsteVolgNr` int(10) unsigned NOT NULL,
  PRIMARY KEY (`Naam`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hoogstevolgnrs`
--

/*!40000 ALTER TABLE `hoogstevolgnrs` DISABLE KEYS */;
INSERT INTO `hoogstevolgnrs` (`Naam`,`HoogsteVolgNr`) VALUES 
 ('cursussenNr',0),
 ('evenementenNr',0);
/*!40000 ALTER TABLE `hoogstevolgnrs` ENABLE KEYS */;


--
-- Definition of table `managers`
--

DROP TABLE IF EXISTS `managers`;
CREATE TABLE `managers` (
  `ManagerNr` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Voornaam` varchar(45) NOT NULL,
  `Familienaam` varchar(45) NOT NULL,
  PRIMARY KEY (`ManagerNr`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `managers`
--

/*!40000 ALTER TABLE `managers` DISABLE KEYS */;
INSERT INTO `managers` (`ManagerNr`,`Voornaam`,`Familienaam`) VALUES 
 (1,'Lomme','Driesens'),
 (2,'Florent','Van Vaerenbergh'),
 (3,'Walter','Dalgal'),
 (4,'Kees','Priem'),
 (5,'Guido','Van Calster'),
 (6,'Dirk','Wayenbergh');
/*!40000 ALTER TABLE `managers` ENABLE KEYS */;


--
-- Definition of table `talenperland`
--

DROP TABLE IF EXISTS `talenperland`;
CREATE TABLE `talenperland` (
  `LandCode` varchar(3) NOT NULL,
  `TaalCode` varchar(3) NOT NULL,
  `AantalSprekers` int(11) NOT NULL,
  PRIMARY KEY (`LandCode`,`TaalCode`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `talenperland`
--

/*!40000 ALTER TABLE `talenperland` DISABLE KEYS */;
INSERT INTO `talenperland` (`LandCode`,`TaalCode`,`AantalSprekers`) VALUES 
 ('BE','DE',74000),
 ('BE','FR',4402808),
 ('BE','NL',6604212),
 ('NL','NL',16669112);
/*!40000 ALTER TABLE `talenperland` ENABLE KEYS */;


--
-- Definition of table `verantwoordelijkheden`
--

DROP TABLE IF EXISTS `verantwoordelijkheden`;
CREATE TABLE `verantwoordelijkheden` (
  `VerantwoordelijkheidNr` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Naam` varchar(45) NOT NULL,
  PRIMARY KEY (`VerantwoordelijkheidNr`),
  UNIQUE KEY `naam` (`Naam`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `verantwoordelijkheden`
--

/*!40000 ALTER TABLE `verantwoordelijkheden` DISABLE KEYS */;
INSERT INTO `verantwoordelijkheden` (`VerantwoordelijkheidNr`,`Naam`) VALUES 
 (2,'Brandbestrijding'),
 (3,'Defectenbeheer'),
 (1,'EHBO'),
 (4,'Uitleen boeken');
/*!40000 ALTER TABLE `verantwoordelijkheden` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
