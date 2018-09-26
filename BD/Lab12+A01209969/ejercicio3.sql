SELECT * FROM Materiales;
SELECT * FROM Proveedores;
SELECT * FROM Proyectos;
SELECT * FROM Entregan;

INSERT INTO entregan values (0, 'xxx', 0, '1-jan-02', 0);
-- Los valores son diferentes a los registros anteriores (integridad).
-- El sistema acepta la insercion del registro
DELETE FROM Entregan WHERE Clave = 0;

ALTER TABLE Entregan ADD CONSTRAINT cfentreganclave FOREIGN KEY (clave) REFERENCES Materiales (clave);
INSERT INTO entregan values (0, 'xxx', 0, '1-jan-02', 0);
-- The INSERT statement conflicted with the FOREIGN KEY constraint "cfentreganclave". The conflict occurred in database "a1209969", table "a1209969.Materiales", column 'Clave'.
-- Lo que hace la sentencia es que establece la regla de integridad declarando cual es la llave foranea y a que atributo llave de que tabla hace referencia
ALTER TABLE Entregan ADD CONSTRAINT cfentregannumero FOREIGN KEY (numero) REFERENCES Proyectos (numero);
ALTER TABLE Entregan ADD CONSTRAINT cfentreganrfc FOREIGN KEY (rfc) REFERENCES Proveedores (rfc);
sp_helpconstraint Entregan;
sp_helpconstraint Proveedores;
sp_helpconstraint Proyectos;
sp_helpconstraint Materiales;
-- En el primer recuadro sale el nombre de la tabla.
-- En el segundo, aparece una tabla donde sobrsalen las columnas con el tipo de constraint (si es primary key, si es foreign...), el nombre de la constraint, el campo al que la constante aplica (si es una constraint de llave foranea, debajo sale a la tabla que hace referencia).
-- En el tercero, aparece informacion de a que llave foranea de que tabla hace referencia

