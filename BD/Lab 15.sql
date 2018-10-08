select * from materiales

/*	
1000	Varilla 3/16	100.00
1010	Varilla 4/32	115.00
1020	Varilla 3/17	130.00

45 rows
*/

select * from materiales 
where clave=1000 

/*
1000	Varilla 3/16	100.00

1 row
*/

select clave,rfc,fecha from entregan 

/*
1000	AAAA800101   	1998-07-08 00:00:00.000
1000	AAAA800101   	1999-08-08 00:00:00.000
1000	AAAA800101   	2000-04-06 00:00:00.000

132 rows
*/

select * from materiales,entregan 
where materiales.clave = entregan.clave

/*
1000	Varilla 3/16	100.00	1000	AAAA800101   	5000	1998-07-08 00:00:00.000	165.00
1000	Varilla 3/16	100.00	1000	AAAA800101   	5019	1999-08-08 00:00:00.000	254.00
1000	Varilla 3/16	100.00	1000	AAAA800101   	5019	2000-04-06 00:00:00.000	7.00

132 rows

Si algún material no ha se ha entregado ¿Aparecería en el resultado de esta consulta?

No, pues la tabla entregan relacionan los materales a los clientes y para que esto 
suceda, el material debe haber sido entregado.
*/

select * from entregan,proyectos 
where entregan.numero < = proyectos.numero 

/*
1000	AAAA800101   	5000	1998-07-08 00:00:00.000	165.00	5000	Vamos Mexico
1200	EEEE800101   	5000	2000-03-05 00:00:00.000	177.00	5000	Vamos Mexico
1400	AAAA800101   	5000	2002-03-12 00:00:00.000	382.00	5000	Vamos Mexico

1188 rows
*/

(select * from entregan where clave=1450 or clave=1300) 

/*
1300	GGGG800101   	5005	2002-06-10 00:00:00.000	521.00
1300	GGGG800101   	5005	2003-02-02 00:00:00.000	457.00
1300	GGGG800101   	5010	2003-01-08 00:00:00.000	119.00

3 rows
*/

select * from entregan,materiales 

/*
1000	AAAA800101   	5000	1998-07-08 00:00:00.000	165.00	1000	Varilla 3/16	100.00
1000	AAAA800101   	5019	1999-08-08 00:00:00.000	254.00	1000	Varilla 3/16	100.00
1000	AAAA800101   	5019	2000-04-06 00:00:00.000	7.00	1000	Varilla 3/16	100.00

5940 rows

¿Cómo está definido el número de tuplas de este resultado en términos del número de tuplas de
 entregan y de materiales? 

Es el producto = filas de materiales * filas de entregan
*/

-- Plantea ahora una consulta para obtener las descripciones de los materiales entregados en el año 2000. 

set dateformat dmy

SELECT Descripcion
FROM Entregan e, Materiales m
WHERE e.Clave = m.Clave AND (e.Fecha > '31/12/99' AND e.Fecha < '01/01/01')

/*
Varilla 3/16
Varilla 4/32
Varilla 4/32

28 rows

¿Por qué aparecen varias veces algunas descripciones de material? 

Porque se entregaron mas de una vez.
*/

SELECT DISTINCT Descripcion
FROM Entregan e, Materiales m
WHERE e.Clave = m.Clave AND (e.Fecha > '31/12/99' AND e.Fecha < '01/01/01')

/*
Arena
Block
Cantera rosa

22 rows

¿Qué resultado obtienes en esta ocasión? 

Se observa que ya no se repiten los materiales
*/
select * from proyectos

SELECT p.Numero, Denominacion, Fecha, Cantidad
FROM Entregan e, Proyectos p
WHERE e.Numero = p.Numero
ORDER BY p.Numero ASC, Fecha ASC

/*
5000	Vamos Mexico	1998-07-08 00:00:00.000	165.00
5000	Vamos Mexico	2000-03-05 00:00:00.000	177.00
5000	Vamos Mexico	2002-03-12 00:00:00.000	382.00

132 rows
*/

SELECT * FROM Materiales where Descripcion LIKE 'Si%' 

/*
1120	Sillar rosa	100.00
1130	Sillar gris	110.00

2 rows

El simbolo % sirve como el * en otros lenguajes, lo que permite traer todas las palabras, en este
caso, que empiecen por 'Si'.
*/
SELECT * FROM Materiales where Descripcion LIKE 'Si' 
/*
0 rows

No se tienen resultados porque no hay registros que se llamen 'Si"
*/

SELECT (Apellido + ', ' + Nombre) as Nombre FROM Personas; 

DECLARE @foo varchar(40); 
DECLARE @bar varchar(40); 
SET @foo = '¿Que resultado'; 
SET @bar = ' ¿¿¿??? '; 
SET @foo += ' obtienes?'; 
PRINT @foo + @bar; 

SELECT RFC FROM Entregan WHERE RFC LIKE '[A-D]%';