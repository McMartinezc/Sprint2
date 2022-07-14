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