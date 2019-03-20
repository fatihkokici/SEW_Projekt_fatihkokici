CREATE TABLE IF NOT EXISTS `fahrzeug` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Modell` varchar(50) DEFAULT NULL,
  `Farbe` varchar(50) DEFAULT NULL,
  `PreisProTag` int(11) DEFAULT NULL,
  `Hersteller` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`)
);

--
-- Daten für Tabelle `fahrzeug`
--

INSERT INTO `fahrzeug` (`ID`, `Modell`, `Farbe`, `PreisProTag`, `Hersteller`) VALUES
(1, 'Benz', 'Schwarz', 1000, 'MercedezBenz'),
(2, 'BMW', 'Rot', 1000, 'BMW'),
(3, 'Audi', 'Blau', 1000, 'Audi'),
(4, 'Porsche', 'Weiss', 1000, 'Porsche'),
(5, 'Lamborghini', 'Gelb', 1000, 'Lamborghini');

CREATE TABLE IF NOT EXISTS `fahrzeuglog` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `alt_preis` double DEFAULT NULL,
  `new_preis` double DEFAULT NULL,
  `zeitpunkt` datetime DEFAULT NULL,
  `benutzer` varchar(50) DEFAULT NULL,
  `fahrzeugID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_fahrzeugID` (`fahrzeugID`)
);

CREATE TABLE IF NOT EXISTS `person` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Vname` varchar(50) DEFAULT NULL,
  `Nname` varchar(50) DEFAULT NULL,
  `TelNr` varchar(50) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `DoB` date NOT NULL,
  PRIMARY KEY (`ID`)
) ;

INSERT INTO `person` (`ID`, `Vname`, `Nname`, `TelNr`, `Email`, `DoB`) VALUES
(1, 'Samet', 'Gjatoja', '+355673254234', 'SamGja14@htl-shkoder.com', '2001-08-16'),
(2, 'Erald', 'Radashku', '+355673254234', 'EraRad14@htl-shkoder.com', '2001-09-15'),
(3, 'Benard', 'Marashi', '+355673254234', 'BenMar14@htl-shkoder.com', '2001-04-15'),
(4, 'Meklind', 'Faci', '+355673254234', 'MekFac14@htl-shkoder.com', '2001-03-04'),
(5, 'Gledis', 'Spada', '+355673254234', 'GleSpa14@htl-shkoder.com', '2001-07-23'),
(6, 'a', 'b', '+34123413243', 'Samet@asd.com', '0000-00-00'),
(7, 'a', 'b', '+34123413243', 'Samet@asd.com', '2001-05-01'),
(8, 'New', 'User', '+134123412', 'a@b.com', '2000-01-01');


CREATE TABLE IF NOT EXISTS `verleih` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `VBeginn` date NOT NULL,
  `VEnde` date NOT NULL,
  `ID_Person` int(11) NOT NULL,
  `ID_Fahrzeug` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ID_Person` (`ID_Person`),
  KEY `ID_Fahrzeug` (`ID_Fahrzeug`)
) ;

INSERT INTO `verleih` (`ID`, `VBeginn`, `VEnde`, `ID_Person`, `ID_Fahrzeug`) VALUES
(1, '2018-08-04', '2018-09-04', 1, 1),
(2, '2018-07-05', '2018-09-00', 2, 3),
(3, '2018-05-04', '2018-06-06', 4, 1),
(4, '2018-06-04', '2018-07-07', 2, 2),
(5, '2018-04-04', '2018-06-08', 1, 3),
(6, '2018-03-04', '2018-05-09', 5, 1),
(7, '2018-08-04', '2018-09-05', 4, 1),
(8, '2018-02-04', '2018-03-06', 1, 4),
(9, '2018-08-04', '2018-08-08', 3, 1),
(10, '2018-08-04', '2018-09-07', 1, 2);

ALTER TABLE `fahrzeuglog`
  ADD CONSTRAINT `fk_fahrzeugID` FOREIGN KEY (`fahrzeugID`) REFERENCES `verleih` (`ID_Fahrzeug`);
ALTER TABLE `verleih`
  ADD CONSTRAINT `verleih_ibfk_1` FOREIGN KEY (`ID_Person`) REFERENCES `person` (`ID`),
  ADD CONSTRAINT `verleih_ibfk_2` FOREIGN KEY (`ID_Fahrzeug`) REFERENCES `fahrzeug` (`ID`);
