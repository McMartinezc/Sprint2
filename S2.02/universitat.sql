
/*BASE DE DADES UNIVERSITAT*/
/*1-Retorna un llistat amb el primer cognom, segon cognom i el nom de tots els/les alumnes. El llistat haurà d'estar ordenat alfabèticament de menor a major pel primer cognom, segon cognom i nom.*/
select apellido1, apellido2, nombre from persona
where tipo = 'alumno'
order by apellido1 asc;
/*2-Esbrina el nom i els dos cognoms dels alumnes que no han donat d'alta el seu número de telèfon en la base de dades*/
select nombre, apellido1, apellido2 from persona
where telefono is null and tipo = 'alumno';
/*3-Retorna el llistat dels alumnes que van néixer en 1999.*/
select nombre, apellido1, fecha_nacimiento from persona
where fecha_nacimiento between '1999-01-01' and '1999-12-31' and tipo = 'alumno';
/*4-Retorna el llistat de professors/es que no han donat d'alta el seu número de telèfon en la base de dades i a més el seu NIF acaba en K.*/
select nombre, telefon, nif from persona
where (telefono is null) and (nif like '%k%') and (tipo = 'profesor');
/*5-Retorna el llistat de les assignatures que s'imparteixen en el primer quadrimestre, en el tercer curs del grau que té l'identificador 7.*/
select nombre, id_grado, cuatrimestre from asignatura
where id_grado = 7 and cuatrimestre = 1;
/*6-Retorna un llistat dels professors/es juntament amb el nom del departament al qual estan vinculats. El llistat ha de retornar quatre columnes, primer cognom, segon cognom, nom i nom del departament. El resultat estarà ordenat alfabèticament de menor a major pels cognoms i el nom.*/
select persona.apellido1, persona.apellido2, persona.nombre, departamento.nombre from persona
inner join departamento on persona.id = departamento.id
where tipo ='profesor'
order by apellido1 asc;
/*7-Retorna un llistat amb el nom de les assignatures, any d'inici i any de fi del curs escolar de l'alumne/a amb NIF 26902806M.*/
select persona.nombre, persona.nif, asignatura.nombre, curso_escolar.anyo_inicio, curso_escolar.anyo_fin from persona
inner join asignatura on asignatura.id=persona.id
inner join curso_escolar on curso_escolar.id=asignatura.id
where nif='26902806M';
/*8-Retorna un llistat amb el nom de tots els departaments que tenen professors/es que imparteixen alguna assignatura en el Grau en Enginyeria Informàtica (Pla 2015).*/
select departamento.nombre, grado.nombre from departamento
inner join grado on departamento.id = grado.id
where grado.nombre='Grado en Ingeniería Informática (Plan 2015)';
/*9-Retorna un llistat amb tots els alumnes que s'han matriculat en alguna assignatura durant el curs escolar 2018/2019.*/
select persona.nombre, asignatura.nombre, anyo_inicio, anyo_fin from persona
inner join asignatura on persona.id=asignatura.id
inner join curso_escolar on asignatura.id=curso_escolar.id
where persona.tipo='alumno'and anyo_inicio='2018' and anyo_fin='2019';

/*LEFT JOIN i RIGHT JOIN*/
/*1-Retorna un llistat amb els noms de tots els professors/es i els departaments que tenen vinculats. El llistat també ha de mostrar aquells professors/es que no tenen cap departament associat. El llistat ha de retornar quatre columnes, nom del departament, primer cognom, segon cognom i nom del professor/a. El resultat estarà ordenat alfabèticament de menor a major pel nom del departament, cognoms i el nom.*/
select departamento.nombre, persona.apellido1, persona.apellido2, persona.nombre from persona
left join departamento on persona.id=departamento.id
where tipo='profesor'
order by departamento.nombre asc;
/*2-Retorna un llistat amb els professors/es que no estan associats a un departament.*/
select departamento.nombre as nombre_departamento, persona.nombre from persona
Left  JOIN departamento on persona.id=departamento.id
where tipo='profesor' and departamento.nombre is null;
/*3-Retorna un llistat amb els departaments que no tenen professors/es associats.*/
select departamento.nombre as departamento, profesor.id_profesor from profesor
right join departamento on profesor.id_profesor = departamento.id
where profesor.id_profesor is null;
/*4-Retorna un llistat amb els professors/es que no imparteixen cap assignatura.*/
select asignatura.nombre AS asignatura, persona.nombre from asignatura
inner join profesor on asignatura.id_profesor= profesor.id_profesor
right  join persona on profesor.id_profesor=persona.id
where asignatura.id_profesor is null and persona.tipo='profesor';
/*5-Retorna un llistat amb les assignatures que no tenen un professor/a assignat.*/
select asignatura.nombre, profesor.id_profesor from profesor
right join asignatura on profesor.id_profesor=asignatura.id_profesor
where profesor.id_profesor is null;

/*CONSULTES RESUM*/
/*1-Retorna el nombre total d'alumnes que hi ha.*/
select count(nombre) from persona
where tipo='alumno';
/*2-Calcula quants alumnes van néixer en 1999.*/
select count(nombre) from persona
where fecha_nacimiento between '1999-01-01' and '1999-12-31' and tipo='alumno';
/*3-Calcula quants professors/es hi ha en cada departament. El resultat només ha de mostrar dues columnes, una amb el nom del departament i una altra amb el nombre de professors/es que hi ha en aquest departament. El resultat només ha d'incloure els departaments que tenen professors/es associats i haurà d'estar ordenat de major a menor pel nombre de professors/es.*/
select count(persona.nombre), departamento.nombre from departamento
inner join persona on departamento.id = persona.id
where tipo='profesor'
group by departamento.nombre
order by persona.id asc;
/*4-Retorna un llistat amb tots els departaments i el nombre de professors/es que hi ha en cadascun d'ells. Tingui en compte que poden existir departaments que no tenen professors/es associats. Aquests departaments també han d'aparèixer en el llistat.*/
select departamento.nombre, persona.nombre from departamento;
/*5-Retorna un llistat amb el nom de tots els graus existents en la base de dades i el nombre d'assignatures que té cadascun. Tingues en compte que poden existir graus que no tenen assignatures associades. Aquests graus també han d'aparèixer en el llistat. El resultat haurà d'estar ordenat de major a menor pel nombre d'assignatures.*/
select  grado.nombre, count(asignatura.nombre) from asignatura
left join grado on asignatura.id_grado=grado.id
group by grado.nombre;
/*10-Retorna totes les dades de l'alumne/a més jove.*/
select * from persona where fecha_nacimiento = (select max(fecha_nacimiento) from persona);








