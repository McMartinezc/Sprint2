DROP DATABASE IF EXISTS tienda;
CREATE DATABASE tienda CHARACTER SET utf8mb4;
USE tienda;

CREATE TABLE fabricante (
  codigo INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL
);

CREATE TABLE producto (
  codigo INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  precio DOUBLE NOT NULL,
  codigo_fabricante INT UNSIGNED NOT NULL,
  FOREIGN KEY (codigo_fabricante) REFERENCES fabricante(codigo)
);

INSERT INTO fabricante VALUES(1, 'Asus');
INSERT INTO fabricante VALUES(2, 'Lenovo');
INSERT INTO fabricante VALUES(3, 'Hewlett-Packard');
INSERT INTO fabricante VALUES(4, 'Samsung');
INSERT INTO fabricante VALUES(5, 'Seagate');
INSERT INTO fabricante VALUES(6, 'Crucial');
INSERT INTO fabricante VALUES(7, 'Gigabyte');
INSERT INTO fabricante VALUES(8, 'Huawei');
INSERT INTO fabricante VALUES(9, 'Xiaomi');

INSERT INTO producto VALUES(1, 'Disco duro SATA3 1TB', 86.99, 5);
INSERT INTO producto VALUES(2, 'Memoria RAM DDR4 8GB', 120, 6);
INSERT INTO producto VALUES(3, 'Disco SSD 1 TB', 150.99, 4);
INSERT INTO producto VALUES(4, 'GeForce GTX 1050Ti', 185, 7);
INSERT INTO producto VALUES(5, 'GeForce GTX 1080 Xtreme', 755, 6);
INSERT INTO producto VALUES(6, 'Monitor 24 LED Full HD', 202, 1);
INSERT INTO producto VALUES(7, 'Monitor 27 LED Full HD', 245.99, 1);
INSERT INTO producto VALUES(8, 'Portátil Yoga 520', 559, 2);
INSERT INTO producto VALUES(9, 'Portátil Ideapd 320', 444, 2);
INSERT INTO producto VALUES(10, 'Impresora HP Deskjet 3720', 59.99, 3);
INSERT INTO producto VALUES(11, 'Impresora HP Laserjet Pro M26nw', 180, 3);

/*Llista el nom de tots els productes que hi ha en la taula producto*/
SELECT nombre FROM producto;
/*Llista els noms i els preus de tots els productes de la taula producto.*/
SELECT nombre, precio FROM producto;
/*Llista totes les columnes de la taula producto.*/
SELECT * FROM producto;
/*Llista el nom dels productes, el preu en euros i el preu en dòlars estatunidencs (USD).*/
SELECT CONCAT(precio,"€") AS precio_euros,(precio * 1) precio_dolares FROM producto;
/*Llista el nom dels productes, el preu en euros i el preu en dòlars estatunidencs (USD). Utilitza els següents àlies per a les columnes: nom de producto, euros, dòlars.*/
SELECT nombre AS producto, CONCAT(precio,"€") AS precio_euros,(precio * 1) precio_dolares FROM producto;
/*Llista els noms i els preus de tots els productes de la taula producto, convertint els noms a majúscula.*/
select Upper (nombre) AS Nombre, precio from producto;
/*Llista els noms i els preus de tots els productes de la taula producto, convertint els noms a minúscula.*/
select lower (nombre) as nombre, precio from producto;
/*Llista el nom de tots els fabricants en una columna, i en una altra columna obtingui en majúscules els dos primers caràcters del nom del fabricant.*/
select nombre, upper(substring(nombre,1,2)) from fabricante;
/*Llista els noms i els preus de tots els productes de la taula producto, arrodonint el valor del preu.*/
select nombre, round(precio,2) from producto;
/*Llista els noms i els preus de tots els productes de la taula producto, truncant el valor del preu per a mostrar-lo sense cap xifra decimal.*/
select nombre, round(precio,0) from producto;
/*Llista el codi dels fabricants que tenen productes en la taula producto.*/
select fabricante.codigo, producto.nombre from fabricante
inner join producto on fabricante.codigo = producto.codigo;
/*Llista el codi dels fabricants que tenen productes en la taula producto, eliminant els codis que apareixen repetits.*/
select distinct producto.codigo_fabricante, fabricante.codigo from fabricante
inner join producto on fabricante.codigo=producto.codigo_fabricante;
/*Llista els noms dels fabricants ordenats de manera ascendent.*/
select nombre from fabricante order by nombre asc;
/*Llista els noms dels fabricants ordenats de manera descendent.*/
select nombre from fabricante order by nombre desc;
/*Llista els noms dels productes ordenats, en primer lloc, pel nom de manera ascendent i, en segon lloc, pel preu de manera descendent.*/
select nombre,precio from producto 
order by nombre asc;
select nombre,precio from producto 
order by precio desc;
/*Retorna una llista amb les 5 primeres files de la taula fabricante.*/
select nombre from fabricante limit 5;
/*Retorna una llista amb 2 files a partir de la quarta fila de la taula fabricante. La quarta fila també s'ha d'incloure en la resposta.*/
select nombre from fabricante limit 3,2;
/*Llista el nom i el preu del producte més barat. (Utilitza solament les clàusules ORDER BY i LIMIT). NOTA: Aquí no podria usar MIN(preu), necessitaria GROUP BY.*/
select nombre, precio from producto 
order by precio asc limit 1; 
/*Llista el nom i el preu del producte més car. (Utilitza solament les clàusules ORDER BY i LIMIT). NOTA: Aquí no podria usar MAX(preu), necessitaria GROUP BY.*/
select nombre, precio from producto 
order by precio desc limit 1; 
/*Llista el nom de tots els productes del fabricant el codi de fabricant del qual és igual a 2.*/
select nombre, codigo_fabricante from producto where codigo_fabricante = 2;
