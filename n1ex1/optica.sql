use mydb;

/*TAULA CLIENT*/
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;

/*DADES TAULA CLIENT*/
INSERT INTO `` (`idClient`,`Nom`,`Adreça`,`Telefon`,`Correu_electronic`,`Data_registre`,`Empleat`,`recomenat`) VALUES (1,'nom1','a1','12','a','2022-07-14','empleat1',0);
INSERT INTO `` (`idClient`,`Nom`,`Adreça`,`Telefon`,`Correu_electronic`,`Data_registre`,`Empleat`,`recomenat`) VALUES (2,'nom2','a2','13','b','2022-07-15','empleat2',0);
INSERT INTO `` (`idClient`,`Nom`,`Adreça`,`Telefon`,`Correu_electronic`,`Data_registre`,`Empleat`,`recomenat`) VALUES (3,'nom3','a3','14','c','2022-07-16','empleat1',1);
INSERT INTO `` (`idClient`,`Nom`,`Adreça`,`Telefon`,`Correu_electronic`,`Data_registre`,`Empleat`,`recomenat`) VALUES (4,'nom4','a4','15','d','2022-07-17','empleat2',1);
INSERT INTO `` (`idClient`,`Nom`,`Adreça`,`Telefon`,`Correu_electronic`,`Data_registre`,`Empleat`,`recomenat`) VALUES (5,'nom5','a5','16','e','2022-07-18','empleat1',0);

/*TAULA CLIENT_VENTA_ULLERES*/
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

/*DADES CLIENT_VENTA_ULLERES*/
INSERT INTO `` (`Client_idClient`,`Ulleres_idUlleres`,`Data_venta`,`num_factura`) VALUES (1, 1,'2022-07-14',1);
INSERT INTO `` (`Client_idClient`,`Ulleres_idUlleres`,`Data_venta`,`num_factura`) VALUES (2, 2,'2021-06-12',2);
INSERT INTO `` (`Client_idClient`,`Ulleres_idUlleres`,`Data_venta`,`num_factura`) VALUES (3, 3,'2022-05-02',3);
INSERT INTO `` (`Client_idClient`,`Ulleres_idUlleres`,`Data_venta`,`num_factura`) VALUES (4, 1,'2022-04-24',4);

/*TAULA PROVEIDOR*/
CREATE TABLE `proveidor` (
  `idProveidor` int NOT NULL AUTO_INCREMENT,
  `Nom` varchar(45) DEFAULT NULL,
  `Adreça` varchar(45) DEFAULT NULL,
  `Telefon` varchar(45) DEFAULT NULL,
  `Fax` varchar(45) DEFAULT NULL,
  `NIF` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idProveidor`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

/*DADES PROVEIDOR*/
INSERT INTO `` (`idProveidor`,`Nom`,`Adreça`,`Telefon`,`Fax`,`NIF`) VALUES (1,'nom1','a1','12','12','1');
INSERT INTO `` (`idProveidor`,`Nom`,`Adreça`,`Telefon`,`Fax`,`NIF`) VALUES (2,'nom2','a2','13','13','2');
INSERT INTO `` (`idProveidor`,`Nom`,`Adreça`,`Telefon`,`Fax`,`NIF`) VALUES (3,'nom3','a3','14','14','3');

/*TAULA ULLERES*/
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

/*DADES TAULA ULLERES*/
INSERT INTO `` (`idUlleres`,`Marca`,`Graduacio_vidre_dret`,`Graduacio_vidre_esquerra`,`Tipus_Muntura`,`Color_vidre`,`Color_Muntura`,`Preu`,`Proveidor_idProveidor`) VALUES (1,'marca1',1,1,'flotant','negre','negre',50,1);
INSERT INTO `` (`idUlleres`,`Marca`,`Graduacio_vidre_dret`,`Graduacio_vidre_esquerra`,`Tipus_Muntura`,`Color_vidre`,`Color_Muntura`,`Preu`,`Proveidor_idProveidor`) VALUES (2,'marca2',1,1,'metalica','verd','marro',60,2);
INSERT INTO `` (`idUlleres`,`Marca`,`Graduacio_vidre_dret`,`Graduacio_vidre_esquerra`,`Tipus_Muntura`,`Color_vidre`,`Color_Muntura`,`Preu`,`Proveidor_idProveidor`) VALUES (3,'marca3',1,0,'pasta','blau','negre',70,3);

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
group by proveidor.nom;