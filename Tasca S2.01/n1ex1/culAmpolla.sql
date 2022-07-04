CREATE DATABASE Optica
USE Optica

NIF/*Tabla Ulleres*/
CREATE TABLE ulleres(
id_Ulleres INT(20) NOT NULL AUTO_INCREMENT,
Marca VARCHAR(50) NOT NULL,
Preu float(20),
Color_vidre VARCHAR(50),
Color_muntura VARCHAR(50),
Muntura VARCHAR(50),
Graduacio VARCHAR(100),
primary Key (id_Ulleres)
);

/*Tabla Proveïdor*/
CREATE TABLE proveidor(
NIF INT(20) NOT NULL,
Nom VARCHAR(150) NOT NULL,
Telefon INT(20) NOT NULL,
Fax INT(20),
Adreça VARCHAR(150),
id_Ulleres_p INT(20) NOT NULL,
primary Key (NIF),
foreign key (id_Ulleres_p)
);proveidorulleresclientsulleres