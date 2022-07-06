use optica

/*Per consultar determinats atributs de diferents taules*/
select empleat, Muntura /*posem atributs a buscar*/
from clients /*taula origen*/
inner join ulleres on clients.id_Ulleres_c = ulleres.id_Ulleres; /*taula desti on seleccionem el atribut de la taula origen amb la id que la relaciona i la marquem el atribut de la taula desti que el relaciona*/

