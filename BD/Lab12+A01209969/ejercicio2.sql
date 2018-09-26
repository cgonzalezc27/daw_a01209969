INSERT INTO Materiales values(1000, 'xxx', 1000)

-- select * from Materiales
-- La inconsistencia seria que la llave primaria se esta pudiendo repetir

Delete from Materiales where Clave = 1000 and Costo = 1000 

ALTER TABLE Materiales add constraint llaveMateriales PRIMARY KEY (Clave)

INSERT INTO Materiales values(1000, 'xxx', 1000)

-- No me deja agregar el registro pues rompe con la regla de integridad.

sp_helpconstraint materiales 

-- Aparece la constraint con su nombre y dice el tipo (primary key) y cual es el campo que es la llave.

ALTER TABLE Proveedores add constraint llaveProveedores PRIMARY KEY (RFC)
sp_helpconstraint Proveedores
ALTER TABLE Proyectos add constraint llaveProyectos PRIMARY KEY (Numero)
sp_helpconstraint Proyectos
ALTER TABLE Entregan add constraint llaveEntregan PRIMARY KEY (Clave,RFC,Numero,Fecha)
sp_helpconstraint Entregan

-- Para borrar constraints: ALTER TABLE tableName drop constraint ConstraintName