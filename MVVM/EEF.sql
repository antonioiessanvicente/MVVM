SET NOCOUNT ON
GO

USE master
GO
if exists (select * from sysdatabases where name='EEF')
		drop database EEF
go

DECLARE @device_directory NVARCHAR(520)
SELECT @device_directory = SUBSTRING(filename, 1, CHARINDEX(N'master.mdf', LOWER(filename)) - 1)
FROM master.dbo.sysaltfiles WHERE dbid = 1 AND fileid = 1

EXECUTE (N'CREATE DATABASE EEF
  ON PRIMARY (NAME = N''EEF'', FILENAME = N''' + @device_directory + N'EEF.mdf'')
  LOG ON (NAME = N''EEF_log'',  FILENAME = N''' + @device_directory + N'EEF.ldf'')')
go

set quoted_identifier on
GO

/* Set DATEFORMAT so that the date strings are interpreted correctly regardless of
   the default DATEFORMAT on the server.
*/
SET DATEFORMAT mdy
GO
use "EEF"
go
if exists (select * from sysobjects where id = object_id('dbo.EEF') and sysstat & 0xf = 3)
	drop table "dbo"."EEF"
GO
Create Table telefonos (
	ntelefono VARCHAR (12) PRIMARY KEY NOT NULL,
	nombre VARCHAR (30),
	direccion VARCHAR (30),
	observaciones VARCHAR (240)
)

INSERT "telefonos"("ntelefono","nombre","direccion","observaciones") 
VALUES('912345678','Leticia Aguirre Soriano  ','Triana, Sevilla', 'Ninguna')

INSERT "telefonos"("ntelefono","nombre","direccion","observaciones") 
VALUES('918888888','Pedro Aguado Rodríguez','Alcalá de Henares, Madrid', 'Ninguna')

INSERT "telefonos"("ntelefono","nombre","direccion","observaciones") 
VALUES('933333333','Alfons González Pérez','Argentona, Barcelona', 'Director de desarrollo  ')

INSERT "telefonos"("ntelefono","nombre","direccion","observaciones") 
VALUES('942232323','Miguel López Trujillo   ','Mataporquera, Cantabria', 'Es propietario de la empresa')

INSERT "telefonos"("ntelefono","nombre","direccion","observaciones") 
VALUES('958565656','Sonia Febril Parra','Valdeolivas, Granada', 'Ninguna')

INSERT "telefonos"("ntelefono","nombre","direccion","observaciones") 
VALUES('981425323','Elena Veiguela Suarez','Muxía, La Coruña', 'Ninguna')

INSERT "telefonos"("ntelefono","nombre","direccion","observaciones") 
VALUES('984454545','Ana María Cuesta Suñer','Gijón, Asturias', 'Ninguna')