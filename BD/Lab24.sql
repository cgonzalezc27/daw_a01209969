CREATE TABLE CLIENTES_BANCA (
	NoCuenta varchar(5) NOT NULL PRIMARY KEY,
	Nombre varchar (30),
	Saldo numeric (10,2)

);

CREATE TABLE MOVIMIENTOS (
	NoCuenta varchar(5) NOT NULL,
	ClaveM varchar(2) NOT NULL,
	Fecha datetime NOT NULL,
	Monto numeric (10,2),
	PRIMARY KEY (NoCuenta, ClaveM, Fecha),
	FOREIGN KEY (NoCuenta) REFERENCES Clientes_Banca (NoCuenta),
	FOREIGN KEY (ClaveM) REFERENCES Tipos_Movimiento (ClaveM)

);

CREATE TABLE TIPOS_MOVIMIENTO (
	ClaveM varchar (2) NOT NULL PRIMARY KEY,
	Descripcion varchar (30)
);

BEGIN TRANSACTION PRUEBA1 
INSERT INTO CLIENTES_BANCA VALUES('001', 'Manuel Rios Maldonado', 9000); 
INSERT INTO CLIENTES_BANCA VALUES('002', 'Pablo Perez Ortiz', 5000); 
INSERT INTO CLIENTES_BANCA VALUES('003', 'Luis Flores Alvarado', 8000); 
COMMIT TRANSACTION PRUEBA1 

exec sp_rename 'equipo06.Movimientos', 'MOVIMIENTOS';

SELECT * FROM CLIENTES_BANCA;

-- ¿Que pasa cuando deseas realizar esta consulta? 
-- Se ejecuta sin problema.

BEGIN TRANSACTION PRUEBA2 
INSERT INTO CLIENTES_BANCA VALUES('004','Ricardo Rios Maldonado',19000); 
INSERT INTO CLIENTES_BANCA VALUES('005','Pablo Ortiz Arana',15000); 
INSERT INTO CLIENTES_BANCA VALUES('006','Luis Manuel Alvarado',18000); 

SELECT * FROM CLIENTES_BANCA;

-- ¿Qué pasa cuando deseas realizar esta consulta? 
-- No permite hacer la consulta desde la sesion que no esta editando la tabla

SELECT * FROM CLIENTES_BANCA where NoCuenta='001';

-- Explica por qué ocurre dicho evento
-- Ahora si permite, pues ese registro no se esta editando.

ROLLBACK TRANSACTION PRUEBA2;

SELECT * FROM CLIENTES_BANCA

-- ¿Qué ocurrió y por qué? 
-- La base de datos vuelve al estado anterior al inicio de la transaccion.

BEGIN TRANSACTION PRUEBA3 
INSERT INTO TIPOS_MOVIMIENTO VALUES('A','Retiro Cajero Automatico'); 
INSERT INTO TIPOS_MOVIMIENTO VALUES('B','Deposito Ventanilla'); 
COMMIT TRANSACTION PRUEBA3 

BEGIN TRANSACTION PRUEBA4 
INSERT INTO MOVIMIENTOS VALUES('001','A',GETDATE(),500); 
UPDATE CLIENTES_BANCA SET SALDO = SALDO -500 
WHERE NoCuenta='001' 
COMMIT TRANSACTION PRUEBA4 

SELECT * FROM CLIENTES_BANCA;
SELECT * FROM MOVIMIENTOS;

BEGIN TRANSACTION PRUEBA5 
INSERT INTO CLIENTES_BANCA VALUES('005','Rosa Ruiz Maldonado',9000); 
INSERT INTO CLIENTES_BANCA VALUES('006','Luis Camino Ortiz',5000); 
INSERT INTO CLIENTES_BANCA VALUES('001','Oscar Perez Alvarado',8000); 


IF @@ERROR = 0 
COMMIT TRANSACTION PRUEBA5 
ELSE 
BEGIN 
PRINT 'A transaction needs to be rolled back' 
ROLLBACK TRANSACTION PRUEBA5 
END 

--¿Para qué sirve el comando @@ERROR revisa la ayuda en línea? 
--Devuelve un TRUE en el caso de que el gestor haya detectado cualquier error al ejecutar el query
--¿Qué hace la transacción? 
-- La transaccion revisa si hubo un problema y si existe problema, genera un ROLLBACK
--¿Hubo alguna modificación en la tabla? Explica qué pasó y por qué. 
-- No, ninguna, pues se estaba duplicando primary keys.

CREATE PROCEDURE REGISTRAR_RETIRO_CAJERO
                @NoCuenta varchar(5),
                @Monto numeric(10,2)
            AS
                BEGIN TRANSACTION Retiro 
				INSERT INTO MOVIMIENTOS VALUES(@NoCuenta,'A',GETDATE(),@Monto); 
				UPDATE CLIENTES_BANCA SET SALDO = SALDO - @Monto 
				WHERE NoCuenta= @NoCuenta 


				IF @@ERROR = 0 
				COMMIT TRANSACTION Retiro 
				ELSE 
				BEGIN 
				PRINT 'Hubo un problema al registrar el retiro de efectvio' 
				ROLLBACK TRANSACTION Retiro 
				END 
            GO
EXECUTE REGISTRAR_RETIRO_CAJERO '001', 100; 

CREATE PROCEDURE REGISTRAR_DEPOSITO_VENTANILLA
                @NoCuenta varchar(5),
                @Monto numeric(10,2)
            AS
                BEGIN TRANSACTION Retiro 
				INSERT INTO MOVIMIENTOS VALUES(@NoCuenta,'B',GETDATE(),@Monto); 
				UPDATE CLIENTES_BANCA SET SALDO = SALDO + @Monto 
				WHERE NoCuenta= @NoCuenta 


				IF @@ERROR = 0 
				COMMIT TRANSACTION Retiro 
				ELSE 
				BEGIN 
				PRINT 'Hubo un problema al registrar el retiro de efectvio' 
				ROLLBACK TRANSACTION Retiro 
				END 
            GO

EXECUTE REGISTRAR_DEPOSITO_VENTANILLA '002', 800; 

SELECT * FROM CLIENTES_BANCA;
SELECT * FROM MOVIMIENTOS;