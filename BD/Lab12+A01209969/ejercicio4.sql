INSERT INTO entregan VALUES (1000,'AAAA800101',5000,GETDATE(),0);
SELECT * FROM Entregan WHERE Clave = 1000;
-- GETDATE () hace que se registre la fecha y hora actual.
-- El valor de cantidad en el registro no tiene mucho sentido, pues fue cero.
DELETE FROM Entregan WHERE Cantidad = 0;
ALTER TABLE Entregan ADD CONSTRAINT cantidad CHECK (cantidad > 0);
INSERT INTO entregan VALUES (1000,'AAAA800101',5000,GETDATE(),0);
-- The INSERT statement conflicted with the CHECK constraint "cantidad". The conflict occurred in database "a1209969", table "a1209969.Entregan", column 'Cantidad'.
-- El mensaje dice que hubo un conflicto, pues se esta violando la constraint de la cantidad

