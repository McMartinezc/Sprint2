CREATE TABLE `client` (
  `idClient` int NOT NULL AUTO_INCREMENT,
  `Nom` varchar(45) DEFAULT NULL,
  `Adreça` varchar(45) DEFAULT NULL,
  `Telefon` varchar(45) DEFAULT NULL,
  `Correu_electronic` varchar(45) DEFAULT NULL,
  `Data_registre` date DEFAULT NULL,
  `Empleat` varchar(45) DEFAULT NULL,
  `recomenat` int DEFAULT NULL,
  PRIMARY KEY (`idClient`),
  KEY `fk_Client_Client1_idx` (`recomenat`),
  CONSTRAINT `fk_Client_Client1` FOREIGN KEY (`recomenat`) REFERENCES `client` (`idClient`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3

CREATE TABLE `client_venta_ulleres` (
  `Client_idClient` int NOT NULL,
  `Ulleres_idUlleres` int NOT NULL,
  `Data_venta` date DEFAULT NULL,
  `num_factura` int DEFAULT NULL,
  PRIMARY KEY (`Client_idClient`,`Ulleres_idUlleres`),
  KEY `fk_Client_has_Ulleres_Ulleres1_idx` (`Ulleres_idUlleres`),
  KEY `fk_Client_has_Ulleres_Client1_idx` (`Client_idClient`),
  CONSTRAINT `fk_Client_has_Ulleres_Client1` FOREIGN KEY (`Client_idClient`) REFERENCES `client` (`idClient`),
  CONSTRAINT `fk_Client_has_Ulleres_Ulleres1` FOREIGN KEY (`Ulleres_idUlleres`) REFERENCES `ulleres` (`idUlleres`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3

CREATE TABLE `proveidor` (
  `idProveidor` int NOT NULL AUTO_INCREMENT,
  `Nom` varchar(45) DEFAULT NULL,
  `Adreça` varchar(45) DEFAULT NULL,
  `Telefon` varchar(45) DEFAULT NULL,
  `Fax` varchar(45) DEFAULT NULL,
  `NIF` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idProveidor`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3

CREATE TABLE `ulleres` (
  `idUlleres` int NOT NULL AUTO_INCREMENT,
  `Marca` varchar(45) NOT NULL,
  `Graduacio_vidre_dret` decimal(10,0) DEFAULT NULL,
  `Graduacio_vidre_esquerra` decimal(10,0) DEFAULT NULL,
  `Tipus_Muntura` enum('flotant','pasta','metalica') DEFAULT NULL,
  `Color_vidre` varchar(45) DEFAULT NULL,
  `Color_Muntura` varchar(45) DEFAULT NULL,
  `Preu` float DEFAULT NULL,
  `Proveidor_idProveidor` int NOT NULL,
  PRIMARY KEY (`idUlleres`),
  KEY `fk_Ulleres_Proveidor_idx` (`Proveidor_idProveidor`),
  CONSTRAINT `fk_Ulleres_Proveidor` FOREIGN KEY (`Proveidor_idProveidor`) REFERENCES `proveidor` (`idProveidor`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3



/*Llista el total de factures d'un client/a en un període determinat.*/
select * from client_venta_ulleres
where client_venta_ulleres.Client_idClient=1 and client_venta_ulleres.Data_venta between '2022-05-01' and '2022-08-01';
/*Llista els diferents models d'ulleres que ha venut un empleat/da durant un any.*/
select client.empleat, ulleres.marca from client
inner join ulleres on client.idClient=ulleres.idUlleres
where client.empleat='empleat1';
/*Llista els diferents proveïdors que han subministrat ulleres venudes amb èxit per l'òptica.*/
select count(client_venta_ulleres.Ulleres_idUlleres) as total_Ulleres,  ulleres.Proveidor_idProveidor as idProveidor, proveidor.nom from client_venta_ulleres
inner join ulleres on client_venta_ulleres.Ulleres_idUlleres=ulleres.Proveidor_idProveidor
inner join proveidor on ulleres.Proveidor_idProveidor=proveidor.idProveidor
group by proveidor.nom;client