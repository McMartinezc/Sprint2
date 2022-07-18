use mydb;
/*TAULA BOTIGA*/
CREATE TABLE `botiga` (
  `idbotiga` int NOT NULL AUTO_INCREMENT,
  `adreça` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idbotiga`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;

/*DADES TAULA BOTIGA*/
INSERT INTO `` (`idbotiga`,`adreça`) VALUES (1,'valencia');
INSERT INTO `` (`idbotiga`,`adreça`) VALUES (2,'mallorca');
INSERT INTO `` (`idbotiga`,`adreça`) VALUES (3,'muntaner');
INSERT INTO `` (`idbotiga`,`adreça`) VALUES (4,'marina');
INSERT INTO `` (`idbotiga`,`adreça`) VALUES (5,'meridiana');

/*TAULA CATEGORIA_PIZZA*/
CREATE TABLE `categoria_pizza` (
  `idpizza` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idpizza`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;

/*DADES TAULA CATEGORIA_PIZZA*/
INSERT INTO `` (`idpizza`,`nom`) VALUES (1,'margarita');
INSERT INTO `` (`idpizza`,`nom`) VALUES (2,'vegetal');
INSERT INTO `` (`idpizza`,`nom`) VALUES (3,'tonyina');
INSERT INTO `` (`idpizza`,`nom`) VALUES (4,'pernil');
INSERT INTO `` (`idpizza`,`nom`) VALUES (5,'4 estacions');

/*TAULA CLIENT*/
CREATE TABLE `client` (
  `idClient` int NOT NULL AUTO_INCREMENT,
  `Nom` varchar(45) DEFAULT NULL,
  `Cognom` varchar(45) DEFAULT NULL,
  `codi_postal` varchar(45) DEFAULT NULL,
  `Telefon` varchar(45) DEFAULT NULL,
  `Localitat_idLocalitat` int NOT NULL,
  PRIMARY KEY (`idClient`),
  KEY `fk_Client_Localitat1_idx` (`Localitat_idLocalitat`),
  CONSTRAINT `fk_Client_Localitat1` FOREIGN KEY (`Localitat_idLocalitat`) REFERENCES `localitat` (`idLocalitat`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;

/*DADES TAULA CLIENT*/
INSERT INTO `` (`idClient`,`Nom`,`Cognom`,`codi_postal`,`Telefon`,`Localitat_idLocalitat`) VALUES (1,'nom1',NULL,'1','1',1);
INSERT INTO `` (`idClient`,`Nom`,`Cognom`,`codi_postal`,`Telefon`,`Localitat_idLocalitat`) VALUES (2,'nom2',NULL,'2','2',2);
INSERT INTO `` (`idClient`,`Nom`,`Cognom`,`codi_postal`,`Telefon`,`Localitat_idLocalitat`) VALUES (3,'nom3',NULL,'3','3',3);
INSERT INTO `` (`idClient`,`Nom`,`Cognom`,`codi_postal`,`Telefon`,`Localitat_idLocalitat`) VALUES (4,'nom4',NULL,'4','4',4);
INSERT INTO `` (`idClient`,`Nom`,`Cognom`,`codi_postal`,`Telefon`,`Localitat_idLocalitat`) VALUES (5,'nom5',NULL,'5','5',1);

/*TAULA COMANDA*/
CREATE TABLE `comanda` (
  `idComanda` int NOT NULL AUTO_INCREMENT,
  `Nom` varchar(45) DEFAULT NULL,
  `data/hora` datetime DEFAULT NULL,
  `entrega` enum('domicili','botiga') DEFAULT NULL,
  `quantitat_productes` int DEFAULT NULL,
  `preu` double DEFAULT NULL,
  `Client_idClient` int NOT NULL,
  `botiga_idbotiga` int NOT NULL,
  PRIMARY KEY (`idComanda`),
  KEY `fk_comanda_Client1_idx` (`Client_idClient`),
  KEY `fk_comanda_botiga1_idx` (`botiga_idbotiga`),
  CONSTRAINT `fk_comanda_botiga1` FOREIGN KEY (`botiga_idbotiga`) REFERENCES `botiga` (`idbotiga`),
  CONSTRAINT `fk_comanda_Client1` FOREIGN KEY (`Client_idClient`) REFERENCES `client` (`idClient`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;

/*DADES TAULA COMANDA*/
INSERT INTO `` (`idComanda`,`Nom`,`data/hora`,`entrega`,`quantitat_productes`,`preu`,`Client_idClient`,`botiga_idbotiga`) VALUES (1,'comanda1','2022-04-01 13:00:00','domicili',5,30,1,1);
INSERT INTO `` (`idComanda`,`Nom`,`data/hora`,`entrega`,`quantitat_productes`,`preu`,`Client_idClient`,`botiga_idbotiga`) VALUES (2,'comanda2','2022-06-01 13:00:00','botiga',6,35,2,2);
INSERT INTO `` (`idComanda`,`Nom`,`data/hora`,`entrega`,`quantitat_productes`,`preu`,`Client_idClient`,`botiga_idbotiga`) VALUES (3,'comanda3','2022-05-05 13:30:00','domicili',7,40,3,3);
INSERT INTO `` (`idComanda`,`Nom`,`data/hora`,`entrega`,`quantitat_productes`,`preu`,`Client_idClient`,`botiga_idbotiga`) VALUES (4,'comanda4','2022-06-24 14:00:00','botiga',8,50,4,4);
INSERT INTO `` (`idComanda`,`Nom`,`data/hora`,`entrega`,`quantitat_productes`,`preu`,`Client_idClient`,`botiga_idbotiga`) VALUES (5,'comanda5','2022-07-05 21:00:00','domicili',9,55,5,5);
INSERT INTO `` (`idComanda`,`Nom`,`data/hora`,`entrega`,`quantitat_productes`,`preu`,`Client_idClient`,`botiga_idbotiga`) VALUES (6,'comanda6','2022-07-02 22:00:00','botiga',10,60,1,2);

/*TAULA COMANDA_PRODUCTE*/
CREATE TABLE `comanda_producte` (
  `comanda_idComanda` int NOT NULL,
  `producte_idproductes` int NOT NULL,
  PRIMARY KEY (`comanda_idComanda`,`producte_idproductes`),
  KEY `fk_comanda_producte_producte1_idx` (`producte_idproductes`),
  KEY `fk_comanda_producte_comanda1_idx` (`comanda_idComanda`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

/*DADES TAULA COMANDA_PRODUCTE*/
INSERT INTO `` (`comanda_idComanda`,`producte_idproductes`) VALUES (1,1);
INSERT INTO `` (`comanda_idComanda`,`producte_idproductes`) VALUES (4,1);
INSERT INTO `` (`comanda_idComanda`,`producte_idproductes`) VALUES (2,2);
INSERT INTO `` (`comanda_idComanda`,`producte_idproductes`) VALUES (3,3);
INSERT INTO `` (`comanda_idComanda`,`producte_idproductes`) VALUES (6,4);
INSERT INTO `` (`comanda_idComanda`,`producte_idproductes`) VALUES (4,5);
INSERT INTO `` (`comanda_idComanda`,`producte_idproductes`) VALUES (5,6);

/*TAULA EMPLEAT*/
CREATE TABLE `empleat` (
  `idempleat` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(45) DEFAULT NULL,
  `cognoms` varchar(45) DEFAULT NULL,
  `nif` varchar(45) DEFAULT NULL,
  `telefon` varchar(45) DEFAULT NULL,
  `tpus_empleat` enum('cuiner','repartidor') DEFAULT NULL,
  PRIMARY KEY (`idempleat`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;

/*DADES TAULA EMPLEAT*/
INSERT INTO `` (`idempleat`,`nom`,`cognoms`,`nif`,`telefon`,`tpus_empleat`) VALUES (1,'nom1','cognom1','1','1','cuiner');
INSERT INTO `` (`idempleat`,`nom`,`cognoms`,`nif`,`telefon`,`tpus_empleat`) VALUES (2,'nom2','cognom2','2','2','cuiner');
INSERT INTO `` (`idempleat`,`nom`,`cognoms`,`nif`,`telefon`,`tpus_empleat`) VALUES (3,'nom3','cognom3','3','3','cuiner');
INSERT INTO `` (`idempleat`,`nom`,`cognoms`,`nif`,`telefon`,`tpus_empleat`) VALUES (4,'nom4','cognom4','4','4','repartidor');
INSERT INTO `` (`idempleat`,`nom`,`cognoms`,`nif`,`telefon`,`tpus_empleat`) VALUES (5,'nom5','cognom5','5','5','repartidor');
INSERT INTO `` (`idempleat`,`nom`,`cognoms`,`nif`,`telefon`,`tpus_empleat`) VALUES (6,'nom6','cognom6','6','6','repartidor');

/*TAULA LOCALITAT*/
CREATE TABLE `localitat` (
  `idLocalitat` int NOT NULL AUTO_INCREMENT,
  `Nom` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idLocalitat`),
  CONSTRAINT `fk_Localitat_botiga1` FOREIGN KEY (`idLocalitat`) REFERENCES `botiga` (`idbotiga`),
  CONSTRAINT `fk_Localitat_Provincia` FOREIGN KEY (`idLocalitat`) REFERENCES `provincia` (`idProvincia`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;

/*TAULA PRODUCTE*/
CREATE TABLE `producte` (
  `idproducte` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(45) DEFAULT NULL,
  `descripcio` varchar(45) DEFAULT NULL,
  `imatge` blob,
  `preu` double DEFAULT NULL,
  `tipus_pizza` varchar(50) DEFAULT NULL,
  `tipus_producte` enum('hamburguesa','beguda') DEFAULT NULL,
  PRIMARY KEY (`idproducte`),
  KEY `fk_producte_Categoria_pizza1_idx` (`tipus_pizza`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;

/*DADES TAULA PRODUCTE*/
INSERT INTO `` (`idproducte`,`nom`,`descripcio`,`imatge`,`preu`,`tipus_pizza`,`tipus_producte`) VALUES (1,'pizza',NULL,NULL,11,'3',NULL);
INSERT INTO `` (`idproducte`,`nom`,`descripcio`,`imatge`,`preu`,`tipus_pizza`,`tipus_producte`) VALUES (2,'pizza',NULL,NULL,13,'5',NULL);
INSERT INTO `` (`idproducte`,`nom`,`descripcio`,`imatge`,`preu`,`tipus_pizza`,`tipus_producte`) VALUES (3,'beguda',NULL,NULL,2,NULL,'beguda');
INSERT INTO `` (`idproducte`,`nom`,`descripcio`,`imatge`,`preu`,`tipus_pizza`,`tipus_producte`) VALUES (4,'beguda',NULL,NULL,2,NULL,'beguda');
INSERT INTO `` (`idproducte`,`nom`,`descripcio`,`imatge`,`preu`,`tipus_pizza`,`tipus_producte`) VALUES (5,'hamburguesa',NULL,NULL,12,NULL,'hamburguesa');
INSERT INTO `` (`idproducte`,`nom`,`descripcio`,`imatge`,`preu`,`tipus_pizza`,`tipus_producte`) VALUES (6,'hamburguesa',NULL,NULL,15,NULL,'hamburguesa');

/*TAULA PROVINCIA*/
CREATE TABLE `provincia` (
  `idProvincia` int NOT NULL AUTO_INCREMENT,
  `Nom` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idProvincia`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;

/*TAULA DADES PROVINCIA*/
INSERT INTO `` (`idProvincia`,`Nom`) VALUES (1,'Girona');
INSERT INTO `` (`idProvincia`,`Nom`) VALUES (2,'Barcelona');
INSERT INTO `` (`idProvincia`,`Nom`) VALUES (3,'Tarragona');
INSERT INTO `` (`idProvincia`,`Nom`) VALUES (4,'Lleida');

/*Llista quants productes de categoria 'Begudes' s'han venut en una determinada localitat.*/
select count(producte.tipus_producte), botiga.idbotiga, localitat.nom from producte
inner join comanda on producte.idproducte=comanda.idComanda
inner join botiga on comanda.idComanda=botiga.idbotiga
inner join localitat on botiga.idbotiga=localitat.idLocalitat
where producte.tipus_producte='beguda' and localitat.nom='barcelona'
group by producte.tipus_producte;

/*Llista quantes comandes ha efectuat un determinat empleat/da*/
select empleat.nom, botiga.idbotiga, count(comanda.idComanda) from empleat
inner join botiga on empleat.idempleat = botiga.idbotiga
inner join comanda on botiga.idbotiga=comanda.botiga_idbotiga
where empleat.nom='nom1'
group by comanda.idComanda;

