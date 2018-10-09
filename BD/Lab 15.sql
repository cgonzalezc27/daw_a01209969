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



DECLARE @foo varchar(40); 
DECLARE @bar varchar(40); 
SET @foo = '¿Que resultado'; 
SET @bar = ' ¿¿¿??? '; 
SET @foo += ' obtienes?'; 
PRINT @foo + @bar; 

/*
¿Qué resultado obtienes de ejecutar el siguiente código? 

¿Que resultado obtienes? ¿¿¿??? 

¿Para qué sirve DECLARE? 

Sirve para declarar variables.

¿Cuál es la función de @foo? 

Es una variable.

¿Que realiza el operador SET? 

Asigna un valor a la variable.	
*/

SELECT RFC FROM Entregan WHERE RFC LIKE '[A-D]%';

/*
AAAA800101   
AAAA800101   
AAAA800101   

72 rows

Esta mostrando todos los RFCs que empiecen por las letras de la A a la D.
*/
SELECT RFC FROM Entregan WHERE RFC LIKE '[^A]%'; 
/*
BBBB800101   
BBBB800101   
BBBB800101   

114 rows

Esta mostrando todos los RFCs que no empiezan por A.
*/

SELECT Numero FROM Entregan WHERE Numero LIKE '___6'; 
/*
5016
5016
5006

14 rows

Esta mostrando los numeros de 4 posiciones que su ultima posicion sea 6.
*/

SELECT Clave,RFC,Numero,Fecha,Cantidad 
FROM Entregan 
WHERE Numero Between 5000 and 5010; 

/*
1000	AAAA800101   	5000	1998-07-08 00:00:00.000	165.00
1010	BBBB800101   	5001	2000-05-03 00:00:00.000	528.00
1020	CCCC800101   	5002	2001-07-29 00:00:00.000	582.00

60 rows
*/

-- ¿Cómo filtrarías rangos de fechas?

set dateformat dmy
SELECT Clave,RFC,Numero,Fecha,Cantidad 
FROM Entregan 
WHERE Fecha Between '01/01/00' and '31/12/00';

/*
1000	AAAA800101   	5019	2000-04-06 00:00:00.000	7.00
1010	BBBB800101   	5001	2000-05-03 00:00:00.000	528.00
1010	BBBB800101   	5018	2000-11-10 00:00:00.000	667.00

28 rows
*/

SELECT RFC,Cantidad, Fecha,Numero 
FROM [Entregan] 
WHERE [Numero] Between 5000 and 5010 AND 
Exists ( SELECT [RFC] 
FROM [Proveedores] 
WHERE RazonSocial LIKE 'La%' and [Entregan].[RFC] = [Proveedores].[RFC] ); 

/*
AAAA800101   	165.00	1998-07-08 00:00:00.000	5000
CCCC800101   	582.00	2001-07-29 00:00:00.000	5002
AAAA800101   	86.00	1999-01-12 00:00:00.000	5008

16 rows

¿Qué hace la consulta? 

Muestra el RFC, cantidad, fecha y numero de las entregas cuyo numero de proyecto este entre 5000 y 5010
y cuyos proveedores tengan una razon social que empiece por 'La'.

¿Qué función tiene el paréntesis ( ) después de EXISTS? 

Limita el espacio en que se encuentra la subconsulta
*/

SELECT RFC,Cantidad, Fecha,Numero 
FROM [Entregan] 
WHERE [Numero] Between 5000 and 5010 AND 
[RFC] IN ( SELECT [RFC] 
FROM [Proveedores] 
WHERE RazonSocial LIKE 'La%' and [Entregan].[RFC] = [Proveedores].[RFC] ); 

/*
AAAA800101   	165.00	1998-07-08 00:00:00.000	5000
CCCC800101   	582.00	2001-07-29 00:00:00.000	5002
AAAA800101   	86.00	1999-01-12 00:00:00.000	5008

16 rows
*/
SELECT RFC,Cantidad, Fecha,Numero 
FROM [Entregan] 
WHERE [Numero] Between 5000 and 5010 AND 
[RFC] NOT IN ( SELECT [RFC] 
FROM [Proveedores] 
WHERE RazonSocial NOT LIKE 'La%' and [Entregan].[RFC] = [Proveedores].[RFC] );

/*
AAAA800101   	165.00	1998-07-08 00:00:00.000	5000
CCCC800101   	582.00	2001-07-29 00:00:00.000	5002
AAAA800101   	86.00	1999-01-12 00:00:00.000	5008

16 rows
*/

SELECT RFC,Cantidad, Fecha,Numero
FROM Entregan
WHERE 2 = ALL (SELECT Cantidad FROM Entregan);

/*
0 rows
*/

SELECT RFC,Cantidad, Fecha,Numero
FROM Entregan
WHERE 2 = ALL (SELECT Cantidad FROM Entregan WHERE Cantidad = 2);

/*
AAAA800101   	165.00	1998-07-08 00:00:00.000	5000
AAAA800101   	254.00	1999-08-08 00:00:00.000	5019
AAAA800101   	7.00	2000-04-06 00:00:00.000	5019

rows 132
*/

SELECT TOP 2 * FROM Proyectos;

/*
5000	Vamos Mexico
5001	Aztecón

2 rows

Muestra los 2 proyectos con el numero menor, pues esta ordenado de menor a mayor.
*/

SELECT TOP Numero FROM Proyectos;

-- Arroja un error pues el gestor espera un valor y no una columna.

ALTER TABLE materiales ADD PorcentajeImpuesto NUMERIC(6,2); 

UPDATE materiales SET PorcentajeImpuesto = 2*clave/1000; 

SELECT * FROM Materiales;


Create view VMateriales (Clave, Descripcion, Costo, Porcentajeimpuesto) as SELECT * FROM Materiales;

SELECT * FROM VMateriales;

Create view VEntregan (Clave, RFC, Numero, Fecha, Cantidad) as SELECT * FROM Entregan;

SELECT * FROM VEntregan;

Create view VProveedores (RFC, RazonSocial) as SELECT * FROM Proveedores;

SELECT * FROM VProveedores;

Create view VProyectos (Numero, Denominacion) as SELECT * FROM Proyectos;

SELECT * FROM VProyectos;

Create view Vista1 as SELECT TOP 2 * FROM Proyectos;

SELECT * FROM Vista1;

Create view Vista2 as SELECT RFC,Cantidad, Fecha,Numero
FROM Entregan
WHERE 2 = ALL (SELECT Cantidad FROM Entregan WHERE Cantidad = 2);

SELECT * FROM Vista2;

Create view Vista3 as SELECT RFC,Cantidad, Fecha,Numero 
FROM [Entregan] 
WHERE [Numero] Between 5000 and 5010 AND 
[RFC] NOT IN ( SELECT [RFC] 
FROM [Proveedores] 
WHERE RazonSocial NOT LIKE 'La%' and [Entregan].[RFC] = [Proveedores].[RFC] );

SELECT * FROM Vista3;

Create view Vista4 as SELECT Clave,RFC,Numero,Fecha,Cantidad 
FROM Entregan 
WHERE Numero Between 5000 and 5010;

SELECT * FROM Vista4;

Create view Vista5 as SELECT Numero FROM Entregan WHERE Numero LIKE '___6'; 

SELECT * FROM Vista5;

--  Los materiales (clave y descripción) entregados al proyecto "México sin ti no estamos completos"

SELECT M.Clave, M.Descripcion
FROM Materiales M, Entregan E, Proyectos P
WHERE M.Clave = E.Clave AND E.Numero = P.Numero AND P.Denominacion = 'Mexico sin ti no estamos completos';

/*
1030	Varilla 4/33
1230	Cemento 
1430	Pintura B1022

rows 3
*/

-- Los materiales (clave y descripción) que han sido proporcionados por el proveedor "Acme tools". 

SELECT M.Clave, M.Descripcion
FROM Materiales M, Entregan E, Proveedores P
WHERE M.Clave = E.Clave AND E.RFC = P.RFC AND P.RazonSocial = 'Acme tools';

/*
rows 0

El proveedor no existe
*/

--  El RFC de los proveedores que durante el 2000 entregaron en promedio cuando menos 300 materiales.
set dateformat dmy
SELECT P.RFC, AVG(E.Cantidad) AS CantidadPromedio
FROM Proveedores P, Entregan E
WHERE P.RFC = E.RFC AND E.Fecha > '31/12/99' AND E.Fecha < '01/01/01'
GROUP BY P.RFC
HAVING AVG(E.Cantidad) < 300

/*
AAAA800101   	237.000000

rows 1
*/