create database BDPT;
GO
USE BDPT;
GO
CREATE TABLE TRABAJADOR(
Dni_trabajador int primary key not null,
TipoDeTrabajador varchar(100) not null,
Nombre varchar(100) not null,
Apellidos varchar(100) not null,
Telefono char(9) not null,
Direccion varchar(100) not null,
FechaNacimiento varchar(100) not null,
IdNivel int not null,
IdHorario int not null
);
GO
CREATE TABLE NIVELDETRABAJADOR(
idNivel int primary key not null,
Sueldo float not null
);
GO
CREATE TABLE USUARIO(
IdUsuario int primary key identity not null,
DniTrabajador int not null,
Clave varchar(100) not null
);
GO
CREATE TABLE MARCACION(
NROREGISTRO int primary key identity not null,
DniTrabajador int not null,
FechadeMarcacion Date not null,
MarcacionEntrada time not null,
MarcacionSalida time not null,
EstadoDeTrabajador varchar(300) not null,
TardanzasMin float not null,
SalidasAnticipadasMin float not null
);
GO
CREATE TABLE BOLETA(
IdBoleta int primary key identity not null,
DniTrabajador int not null,
TotalDescuento float,
TotalBonificacion float not null,
SueldoNeto float not null,
SueldoBruto int not null,
MesPago varchar(100) not null,
annoPago int not null
);
GO
CREATE TABLE HORARIOFIJO(
IdHorario int primary key identity not null, 
HoraDeEntrada time not null,
HoraDeSalida time not null
);
GO
CREATE TABLE RECORDASISTENCIAS(
Id_RecordTrabajador int identity not null,
Dni_Trabajador int not null,
Nro_Registro int not null,
IdHorario int not null,
TotalDeTardanzas int not null,
TotalDeSalidasAnticipadas int not null
);
GO
--FOREING KEY
ALTER TABLE TRABAJADOR
ADD CONSTRAINT FK_Trabajador_Nivel FOREIGN KEY (IdNivel)
REFERENCES NIVELDETRABAJADOR(idNivel);
GO
ALTER TABLE TRABAJADOR
ADD CONSTRAINT FK_TRABAJADOR_HORARIO FOREIGN KEY(IdHorario)
REFERENCES HORARIOFIJO(IdHorario);
GO
ALTER TABLE RECORDASISTENCIAS
ADD CONSTRAINT FK_RECORD_TRABAJADOR FOREIGN KEY(Dni_Trabajador)
REFERENCES TRABAJADOR(Dni_Trabajador);
GO
ALTER TABLE RECORDASISTENCIAS
ADD CONSTRAINT FK_RECORD_MARCACION FOREIGN KEY(Nro_Registro)
REFERENCES MARCACION(NROREGISTRO);
GO
ALTER TABLE RECORDASISTENCIAS
ADD CONSTRAINT FK_RECORD_HORARIOFIJO FOREIGN KEY(IdHorario)
REFERENCES HORARIOFIJO(IdHorario);
GO
alter TABLE MARCACION
ADD CONSTRAINT FK_MARCACION_TRABAJADOR FOREIGN KEY(DniTrabajador)
REFERENCES TRABAJADOR(Dni_Trabajador);
GO
ALTER TABLE USUARIO
ADD CONSTRAINT FK_USUARIO_TRABAJADOR FOREIGN KEY(DniTrabajador)
REFERENCES TRABAJADOR(Dni_Trabajador);
GO
ALTER TABLE BOLETA 
ADD CONSTRAINT FK_BOLETA_TRABAJADOR FOREIGN KEY(DniTrabajador)
REFERENCES TRABAJADOR(Dni_Trabajador);
GO
CREATE PROCEDURE Sp_InsertarMarcacion
@DniTrabajador int,
@MarcacionEntrada time,
@MarcacionSalida time,
@EstadoDeTrabajador varchar(100),
@FechaDeMarcacion Date,
@TardanzasMin int,
@SalidasAnticipadasMin int
as
INSERT INTO MARCACION(DniTrabajador,FechadeMarcacion,MarcacionEntrada,MarcacionSalida,EstadoDeTrabajador,TardanzasMin,SalidasAnticipadasMin)
VALUES(@DniTrabajador,@FechaDeMarcacion,@MarcacionEntrada,@MarcacionSalida,@EstadoDeTrabajador,@TardanzasMin,@SalidasAnticipadasMin);
GO
--Selecciona tabla marcacion--
CREATE PROCEDURE Sp_BuscarEstado
@DniTrabajador int,
@fechabuscada date
as
select * From MARCACION 
where DniTrabajador = @DniTrabajador AND FechadeMarcacion = @fechabuscada;
GO
--BUSCAR UN HORARIO
CREATE PROCEDURE Sp_Buscar_Horario
@idHorario int
AS
SELECT * from HORARIOFIJO WHERE IdHorario=@idHorario;
GO
--calcular minutos de tardanza
CREATE PROCEDURE Sp_CALCULAR_TARDANZA
@horaEntrada time,
@marcacionEntrada time
AS
SELECT DATEDIFF(MINUTE,@horaEntrada,@marcacionEntrada) AS 'MINUTOS';
GO
--calcular minutos de sa
CREATE PROCEDURE Sp_CALCULAR_SALIDA_ANTICIPADA
@horaSalida time,
@marcacionSalida time
AS
SELECT DATEDIFF(MINUTE,@marcacionSalida,@horaSalida) AS 'MINUTOS';
GO
--Registar boleta
CREATE PROCEDURE [dbo].[Sp_InsertBoleta]
@DniTrabajador int,
@TotalDescuento int,
@TotalBonificacion int,
@SueldoNeto int,
@SueldoBruto int,
@MesPago varchar(100),
@añoPago int
as
insert into BOLETA(DniTrabajador,TotalDescuento,TotalBonificacion,SueldoNeto,SueldoBruto,MesPago,annoPago)
VALUES(@DniTrabajador,@TotalDescuento,@TotalBonificacion,@SueldoNeto,@SueldoBruto,@MesPago,@añoPago);
GO
--Suma minutos de tardanzas y salidas anticipadas
CREATE PROCEDURE Sp_TardanzasSA
@DniTrabajador int,
@fechaInicio date, 
@fechaFinal date
as
select ISNULL(SUM(TardanzasMin),0) as 'TotalTardanzas', ISNULL(SUM(SalidasAnticipadasMin),0) as 'SalidasAnticipadas'
From MARCACION  
where DniTrabajador=@DniTrabajador AND (TardanzasMin > 0 OR SalidasAnticipadasMin > 0)
AND (FechadeMarcacion BETWEEN @fechaInicio AND @fechaFinal);
GO 
--Recoge boleta de un mes de un determinado dni
CREATE PROCEDURE [dbo].[Sp_ListarPlanilla]
@MesPago varchar(200),
@DniTrabajador int,
@añoPago int
AS
SELECT * FROM BOLETA WHERE MesPago = @MesPago AND DniTrabajador=@DniTrabajador and annoPago=@añoPago;
GO
--Trae el total dias de bonificacion
CREATE PROCEDURE [dbo].[Sp_Bonificacion]
@DniTrabajador int,
@fechaInicio date, 
@fechaFinal date
as
select COUNT(M.FechadeMarcacion) as 'DIAS DE BONIFICACION', T.Apellidos + ' ' + t.Nombre as Nombre
From MARCACION M INNER JOIN TRABAJADOR T
ON M.DniTrabajador = T.Dni_trabajador
where M.DniTrabajador = @DniTrabajador AND M.TardanzasMin = 0 and m.SalidasAnticipadasMin = 0 AND (M.FechadeMarcacion BETWEEN @fechaInicio AND @fechaFinal)
GROUP BY T.Apellidos, T.Nombre;
GO
/*---------------------------------------------------------------*/
CREATE PROCEDURE Sp_Buscar_Trabajador
@DniTrabajador int
AS
SELECT * FROM TRABAJADOR where Dni_trabajador = @DniTrabajador;
/*---------------------------------------------------------------*/
GO
CREATE PROCEDURE Sp_Buscar_Nombre
@buscar varchar(100)
AS
SELECT * FROM TRABAJADOR WHERE Nombre like '%'+@buscar+'%' OR Apellidos like '%'+@buscar+'%';
/*---------------------------------------------------------------*/
go
CREATE PROCEDURE Sp_Eliminar
@DniTrabajador int
AS
DELETE  TRABAJADOR where Dni_trabajador = @DniTrabajador;
/*---------------------------------------------------------------*/
GO
CREATE PROCEDURE Sp_Actualizar
@DniTrabajador int ,
@TipoDeTrabajador varchar(50),
@Nombre varchar(50),
@Apellidos varchar (100),
@Telefono varchar(100),
@Direccion varchar(100),
@FechaNacimiento varchar(20),
@IdNivel int ,
@IdHorario int
AS
UPDATE TRABAJADOR set TipoDeTrabajador=@TipoDeTrabajador,Nombre=@Nombre,Apellidos=@Apellidos,Telefono=@Telefono,
Direccion=@Direccion, FechaNacimiento=@FechaNacimiento, IdNivel=@IdNivel, IdHorario=@IdHorario where Dni_Trabajador=@DniTrabajador;
/*---------------------------------------------------------------*/
GO
CREATE PROCEDURE Sp_Agregar
@DniTrabajador int ,
@TipoDeTrabajador varchar(50),
@Nombre varchar(50),
@Apellidos varchar (100),
@Telefono varchar(100),
@Direccion varchar(100),
@FechaNacimiento varchar(20),
@IdNivel int,
@IdHorario int
as
insert into TRABAJADOR (Dni_trabajador, TipoDeTrabajador,Nombre,Apellidos,Telefono, Direccion, FechaNacimiento, IdNivel,IdHorario)
values (@DniTrabajador,@TipoDeTrabajador,@Nombre,@Apellidos,@Telefono, @Direccion, @FechaNacimiento, @IdNivel,@IdHorario);
/*---------------------------------------------------------------*/
GO
---Actualizar horario
CREATE procedure Sp_ActualizarHorario
@HoraDeEntrada time,
@HoraDeSalida time
as
insert into HORARIOFIJO values (@HoraDeEntrada, @HoraDeSalida);
GO
/*---------------------------------------------------------------------------------------*/
--Listar horarios
CREATE PROCEDURE Sp_SelectHorario
as
SELECT * FROM HORARIOFIJO;
GO
/*----------------------------------------------------------------------------------------*/
CREATE PROCEDURE SP_RETORNAR_NEWID_HORARIO
@HoraDeEntrada time,
@HoraDeSalida time
AS
select max(IdHorario) as newId from HORARIOFIJO where HoraDeEntrada = @HoraDeEntrada and HoraDeSalida = @HoraDeSalida;
GO
/*-----------------------USUARIO----------------------------------------------------------*/
--BUSCAR USUARIO X DNI
CREATE PROCEDURE Sp_Buscar_Usuario_xDni
@DniTrabajador int
AS
SELECT * FROM USUARIO where DniTrabajador = @DniTrabajador;
/*------------------------------------------------------------------------------*/
GO
--ACTUALIZAR USUARIO
CREATE PROCEDURE Sp_Actualizar_Usuario
@IdUsuario int ,
@DniTrabajador int,
@Clave varchar(50)
AS
UPDATE USUARIO set DniTrabajador=@DniTrabajador,Clave=@Clave where IdUsuario=@IdUsuario;
/*-------------------------------------------------------------------------------------------*/
GO
CREATE PROCEDURE Sp_Eliminar_Usuario
@IdUsuario int
AS
DELETE USUARIO where IdUsuario = @IdUsuario;
GO
/*-------------------------------------------------------------------------------------------*/
CREATE Procedure Sp_Login
@DniTrabajador int,
@Clave varchar(50)
as select USUARIO.DniTrabajador, USUARIO.Clave, TRABAJADOR.TipoDeTrabajador
from USUARIO inner join TRABAJADOR 
ON USUARIO.DniTrabajador = TRABAJADOR.Dni_trabajador
where DniTrabajador=@DniTrabajador and Clave=@Clave;
GO
/*-----------------------------------------------------------------------------------------------*/
--- Procedure bucar por Fecha
CREATE procedure listarMarcacionFecha
@fechaMarcacion varchar (25)
as
select m.NROREGISTRO, m.DniTrabajador, concat( t.Nombre, ' ',t.Apellidos ) as 'Nombre Completo', 
m.FechadeMarcacion, m.MarcacionEntrada, m.MarcacionSalida, m.EstadoDeTrabajador, m.TardanzasMin, m.SalidasAnticipadasMin 
from MARCACION as m inner join TRABAJADOR as t on m.DniTrabajador = t.Dni_trabajador where FechaDeMarcacion = @fechaMarcacion;
GO
/*----------------------------------------------------------------------------------------------------------*/
---Procedure buscar por mes
CREATE procedure listarMarcacionMes
@mes varchar (20)
as
select m.NROREGISTRO, m.DniTrabajador, concat( t.Nombre, ' ',t.Apellidos ) as 'Nombre Completo', 
m.FechadeMarcacion, m.MarcacionEntrada, m.MarcacionSalida, m.EstadoDeTrabajador, m.TardanzasMin, m.SalidasAnticipadasMin 
from MARCACION as m inner join TRABAJADOR as t on m.DniTrabajador = t.Dni_trabajador where FechaDeMarcacion like '%-' + @mes + '-%';