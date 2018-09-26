IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Materiales')

DROP TABLE Materiales 

CREATE TABLE Materiales 
( 
  Clave numeric(5) not null, 
  Descripcion varchar(50), 
  Costo numeric (8,2) 
) 

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Proveedores')

DROP TABLE Proveedores 

CREATE TABLE Proveedores 
( 
RFC char(13) not null,
RazonSocial varchar(50) 
) 


IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Proyectos')

DROP TABLE Proyectos 

CREATE TABLE Proyectos 
( 
Numero numeric(5) not null,
Denominacion varchar(50) 
) 

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Entregan')

DROP TABLE Entregan 

CREATE TABLE Entregan 
( 
Clave numeric(5) not null,
RFC char(13),
Numero numeric (5),
Fecha datetime,
Cantidad numeric (8,2) 
) 

BULK INSERT a1209969.a1209969.[Materiales] 
  FROM 'e:\wwwroot\rcortese\materiales.csv' 
  WITH 
  ( 
    CODEPAGE = 'ACP', 
    FIELDTERMINATOR = ',', 
    ROWTERMINATOR = '\n' 
  ) 

BULK INSERT a1209969.a1209969.[Proyectos] 
  FROM 'e:\wwwroot\rcortese\Proyectos.csv' 
  WITH 
  ( 
    CODEPAGE = 'ACP', 
    FIELDTERMINATOR = ',', 
    ROWTERMINATOR = '\n' 
  ) 

BULK INSERT a1209969.a1209969.[Proveedores] 
  FROM 'e:\wwwroot\rcortese\Proveedores.csv' 
  WITH 
  ( 
    CODEPAGE = 'ACP', 
    FIELDTERMINATOR = ',', 
    ROWTERMINATOR = '\n' 
  ) 

SET DATEFORMAT dmy

BULK INSERT a1209969.a1209969.[Entregan] 
  FROM 'e:\wwwroot\rcortese\Entregan.csv' 
  WITH 
  ( 
    CODEPAGE = 'ACP', 
    FIELDTERMINATOR = ',', 
    ROWTERMINATOR = '\n' 
  ) 
  select * from Proyectos