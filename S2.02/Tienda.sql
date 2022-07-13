
/*1- Llista el nom de tots els productes que hi ha en la taula producto*/
SELECT nombre FROM producto;
/*2-Llista els noms i els preus de tots els productes de la taula producto.*/
SELECT nombre, precio FROM producto;
/*3-Llista totes les columnes de la taula producto.*/
SELECT * FROM producto;
/*4-Llista el nom dels productes, el preu en euros i el preu en dòlars estatunidencs (USD).*/
SELECT CONCAT(precio,"€") AS precio_euros,(precio * 1) precio_dolares FROM producto;
/*5-Llista el nom dels productes, el preu en euros i el preu en dòlars estatunidencs (USD). Utilitza els següents àlies per a les columnes: nom de producto, euros, dòlars.*/
SELECT nombre AS producto, CONCAT(precio,"€") AS precio_euros,(precio * 1) precio_dolares FROM producto;
/*6-Llista els noms i els preus de tots els productes de la taula producto, convertint els noms a majúscula.*/
select Upper (nombre) AS Nombre, precio from producto;
/*7-Llista els noms i els preus de tots els productes de la taula producto, convertint els noms a minúscula.*/
select lower (nombre) as nombre, precio from producto;
/*8-Llista el nom de tots els fabricants en una columna, i en una altra columna obtingui en majúscules els dos primers caràcters del nom del fabricant.*/
select nombre, upper(substring(nombre,1,2)) from fabricante;
/*9-Llista els noms i els preus de tots els productes de la taula producto, arrodonint el valor del preu.*/
select nombre, round(precio,2) from producto;
/*10-Llista els noms i els preus de tots els productes de la taula producto, truncant el valor del preu per a mostrar-lo sense cap xifra decimal.*/
select nombre, round(precio,0) from producto;
/*11-Llista el codi dels fabricants que tenen productes en la taula producto.*/
select fabricante.codigo, producto.nombre from fabricante
inner join producto on fabricante.codigo = producto.codigo;
/*12-Llista el codi dels fabricants que tenen productes en la taula producto, eliminant els codis que apareixen repetits.*/
select distinct producto.codigo_fabricante, fabricante.codigo from fabricante
inner join producto on fabricante.codigo=producto.codigo_fabricante;
/*13-Llista els noms dels fabricants ordenats de manera ascendent.*/
select nombre from fabricante order by nombre asc;
/*14-Llista els noms dels fabricants ordenats de manera descendent.*/
select nombre from fabricante order by nombre desc;
/*15-Llista els noms dels productes ordenats, en primer lloc, pel nom de manera ascendent i, en segon lloc, pel preu de manera descendent.*/
select nombre,precio from producto 
order by nombre asc;
select nombre,precio from producto 
order by precio desc;
/*16-Retorna una llista amb les 5 primeres files de la taula fabricante.*/
select nombre from fabricante limit 5;
/*17-Retorna una llista amb 2 files a partir de la quarta fila de la taula fabricante. La quarta fila també s'ha d'incloure en la resposta.*/
select nombre from fabricante limit 3,2;
/*18-Llista el nom i el preu del producte més barat. (Utilitza solament les clàusules ORDER BY i LIMIT). NOTA: Aquí no podria usar MIN(preu), necessitaria GROUP BY.*/
select nombre, precio from producto 
order by precio asc limit 1; 
/*19-Llista el nom i el preu del producte més car. (Utilitza solament les clàusules ORDER BY i LIMIT). NOTA: Aquí no podria usar MAX(preu), necessitaria GROUP BY.*/
select nombre, precio from producto 
order by precio desc limit 1; 
/*20-Llista el nom de tots els productes del fabricant el codi de fabricant del qual és igual a 2.*/
select nombre, codigo_fabricante from producto where codigo_fabricante = 2;
/*21-Retorna una llista amb el nom del producte, preu i nom de fabricant de tots els productes de la base de dades.*/
select producto.nombre, producto.precio, fabricante.nombre as nombre_fabricante from fabricante inner join producto on fabricante.codigo=producto.codigo_fabricante;
/*22-Retorna una llista amb el nom del producte, preu i nom de fabricant de tots els productes de la base de dades. Ordena el resultat pel nom del fabricant, per ordre alfabètic.*/
select producto.nombre, producto.precio, fabricante.nombre as nombre_fabricante from producto 
inner join fabricante on producto.codigo_fabricante  = fabricante.codigo
order by fabricante.nombre asc;
/*23-Retorna una llista amb el codi del producte, nom del producte, codi del fabricador i nom del fabricador, de tots els productes de la base de dades.*/
select producto.codigo, producto.nombre, fabricante.codigo, fabricante.nombre from producto inner join fabricante on producto.codigo_fabricante=fabricante.codigo;
/*24-Retorna el nom del producte, el seu preu i el nom del seu fabricant, del producte més barat.*/
select  producto.nombre, producto.precio, fabricante.nombre from producto inner join fabricante on producto.codigo_fabricante=fabricante.codigo where producto.precio=(select min(producto.precio) from producto);
/*25-Retorna el nom del producte, el seu preu i el nom del seu fabricant, del producte més car.*/
select  producto.nombre, producto.precio, fabricante.nombre from producto inner join fabricante on producto.codigo_fabricante=fabricante.codigo where producto.precio=(select max(producto.precio) from producto);
/*26-Llista el nom del producte més car del fabricant Lenovo.*/
select producto.nombre,max(producto.precio), fabricante.nombre as nombre_fabricante from producto 
inner join fabricante on producto.codigo_fabricante  = fabricante.codigo where fabricante.nombre='Lenovo'; 
/*39-Llista el nom del producte més barat del fabricant Hewlett-Packard.*/
select producto.nombre,min(producto.precio), fabricante.nombre as nombre_fabricante from producto 
inner join fabricante on producto.codigo_fabricante  = fabricante.codigo where fabricante.nombre='Hewlett-Packard'; 

