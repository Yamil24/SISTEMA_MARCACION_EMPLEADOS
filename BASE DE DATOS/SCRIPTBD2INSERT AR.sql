GO
use BDPT
GO
INSERT INTO NIVELDETRABAJADOR(idNivel,Sueldo)VALUES(1,'2500')
GO
INSERT INTO NIVELDETRABAJADOR(idNivel,Sueldo)VALUES(2,'2000')
GO
INSERT INTO NIVELDETRABAJADOR(idNivel,Sueldo)VALUES(3,'1500')
GO
INSERT INTO HORARIOFIJO(HoraDeEntrada,HoraDeSalida)VALUES('07:00','15:00')
GO
INSERT INTO HORARIOFIJO(HoraDeEntrada,HoraDeSalida)VALUES('08:00','16:00')
GO
INSERT INTO HORARIOFIJO(HoraDeEntrada,HoraDeSalida)VALUES('13:00','21:00')
GO
INSERT INTO TRABAJADOR(Dni_trabajador,TipoDeTrabajador,Nombre,Apellidos,Telefono,Direccion,
FechaNacimiento,IdNivel,IdHorario)VALUES(74494478,'Administrador','Eliezer','Navarro','977596100','Mz.187.Lt30-San Juan De Lurigancho',
'17/07/2000',1,1)
GO
INSERT INTO TRABAJADOR(Dni_trabajador,TipoDeTrabajador,Nombre,Apellidos,Telefono,Direccion,
FechaNacimiento,IdNivel,IdHorario)VALUES(58749658,'Trabajador','Luis','Coyocosi','974856325','Mz.187.Lt12-Los olivos',
'20/06/2000',2,2)
GO
INSERT INTO TRABAJADOR(Dni_trabajador,TipoDeTrabajador,Nombre,Apellidos,Telefono,Direccion,
FechaNacimiento,IdNivel,IdHorario)VALUES(75502637,'Trabajador','Sebastian','Garcia','965841525','Mz.187.Lt30-San Martin de Porres',
'12/05/2000',3,3)
GO
INSERT INTO TRABAJADOR(Dni_trabajador,TipoDeTrabajador,Nombre,Apellidos,Telefono,Direccion,
FechaNacimiento,IdNivel,IdHorario)VALUES(74596812,'Administrador','Moises','Garcia','965841525','Mz.187.Lt30-San Martin de Porres',
'20/06/2001',2,2)
GO
INSERT INTO USUARIO(DniTrabajador,Clave)VALUES(75502637,'coyocosi')
GO
INSERT INTO USUARIO(DniTrabajador,Clave)VALUES(74494478,'navarro')
go
INSERT INTO MARCACION(DniTrabajador,FechadeMarcacion,MarcacionEntrada,MarcacionSalida,EstadoDeTrabajador,TardanzasMin,SalidasAnticipadasMin)
VALUES(75502637,'2020/07/25','12:00:30','20:55:12','INACTIVO',0,5);
GO
INSERT INTO MARCACION(DniTrabajador,FechadeMarcacion,MarcacionEntrada,MarcacionSalida,EstadoDeTrabajador,TardanzasMin,SalidasAnticipadasMin)
VALUES(75502637,'2020/07/26','13:00:00','21:12:12','INACTIVO',0,0);
GO
INSERT INTO MARCACION(DniTrabajador,FechadeMarcacion,MarcacionEntrada,MarcacionSalida,EstadoDeTrabajador,TardanzasMin,SalidasAnticipadasMin)
VALUES(75502637,'2020/07/27','12:00:30','20:55:12','INACTIVO',0,5);
GO
INSERT INTO MARCACION(DniTrabajador,FechadeMarcacion,MarcacionEntrada,MarcacionSalida,EstadoDeTrabajador,TardanzasMin,SalidasAnticipadasMin)
VALUES(75502637,'2020/07/28','12:00:30','20:55:12','INACTIVO',0,5);
GO
INSERT INTO MARCACION(DniTrabajador,FechadeMarcacion,MarcacionEntrada,MarcacionSalida,EstadoDeTrabajador,TardanzasMin,SalidasAnticipadasMin)
VALUES(75502637,'2020/07/29','12:00:30','20:55:12','INACTIVO',0,5);
GO
INSERT INTO MARCACION(DniTrabajador,FechadeMarcacion,MarcacionEntrada,MarcacionSalida,EstadoDeTrabajador,TardanzasMin,SalidasAnticipadasMin)
VALUES(75502637,'2020/07/30','12:00:30','20:55:12','INACTIVO',0,5);
GO
INSERT INTO MARCACION(DniTrabajador,FechadeMarcacion,MarcacionEntrada,MarcacionSalida,EstadoDeTrabajador,TardanzasMin,SalidasAnticipadasMin)
VALUES(75502637,'2020/07/31','12:00:30','21:12:12','INACTIVO',0,0);
GO
INSERT INTO MARCACION(DniTrabajador,FechadeMarcacion,MarcacionEntrada,MarcacionSalida,EstadoDeTrabajador,TardanzasMin,SalidasAnticipadasMin)
VALUES(75502637,'2020/08/01','12:00:30','20:55:12','INACTIVO',0,5);
GO
INSERT INTO MARCACION(DniTrabajador,FechadeMarcacion,MarcacionEntrada,MarcacionSalida,EstadoDeTrabajador,TardanzasMin,SalidasAnticipadasMin)
VALUES(75502637,'2020/08/02','12:00:30','21:12:12','INACTIVO',0,0);
GO
INSERT INTO MARCACION(DniTrabajador,FechadeMarcacion,MarcacionEntrada,MarcacionSalida,EstadoDeTrabajador,TardanzasMin,SalidasAnticipadasMin)
VALUES(75502637,'2020/08/03','12:00:30','21:12:12','INACTIVO',0,0);
go
INSERT INTO MARCACION(DniTrabajador,FechadeMarcacion,MarcacionEntrada,MarcacionSalida,EstadoDeTrabajador,TardanzasMin,SalidasAnticipadasMin)
VALUES(58749658,'2020/07/25','07:40:30','15:55:12','INACTIVO',0,5);
GO
INSERT INTO MARCACION(DniTrabajador,FechadeMarcacion,MarcacionEntrada,MarcacionSalida,EstadoDeTrabajador,TardanzasMin,SalidasAnticipadasMin)
VALUES(58749658,'2020/07/26','07:40:30','16:55:12','INACTIVO',0,0);
GO
INSERT INTO MARCACION(DniTrabajador,FechadeMarcacion,MarcacionEntrada,MarcacionSalida,EstadoDeTrabajador,TardanzasMin,SalidasAnticipadasMin)
VALUES(58749658,'2020/07/27','07:40:30','15:55:12','INACTIVO',0,5);
GO
INSERT INTO MARCACION(DniTrabajador,FechadeMarcacion,MarcacionEntrada,MarcacionSalida,EstadoDeTrabajador,TardanzasMin,SalidasAnticipadasMin)
VALUES(58749658,'2020/07/28','07:40:30','15:55:12','INACTIVO',0,5);
GO
INSERT INTO MARCACION(DniTrabajador,FechadeMarcacion,MarcacionEntrada,MarcacionSalida,EstadoDeTrabajador,TardanzasMin,SalidasAnticipadasMin)
VALUES(58749658,'2020/07/29','07:40:30','15:55:12','INACTIVO',0,5);
GO
INSERT INTO MARCACION(DniTrabajador,FechadeMarcacion,MarcacionEntrada,MarcacionSalida,EstadoDeTrabajador,TardanzasMin,SalidasAnticipadasMin)
VALUES(58749658,'2020/07/30','07:40:30','15:55:12','INACTIVO',0,5);
GO
INSERT INTO MARCACION(DniTrabajador,FechadeMarcacion,MarcacionEntrada,MarcacionSalida,EstadoDeTrabajador,TardanzasMin,SalidasAnticipadasMin)
VALUES(58749658,'2020/07/31','07:40:30','16:55:12','INACTIVO',0,0);
GO
INSERT INTO MARCACION(DniTrabajador,FechadeMarcacion,MarcacionEntrada,MarcacionSalida,EstadoDeTrabajador,TardanzasMin,SalidasAnticipadasMin)
VALUES(58749658,'2020/08/01','07:40:30','15:55:12','INACTIVO',0,5);
GO
INSERT INTO MARCACION(DniTrabajador,FechadeMarcacion,MarcacionEntrada,MarcacionSalida,EstadoDeTrabajador,TardanzasMin,SalidasAnticipadasMin)
VALUES(58749658,'2020/08/02','07:40:30','16:55:12','INACTIVO',0,0);
GO
INSERT INTO MARCACION(DniTrabajador,FechadeMarcacion,MarcacionEntrada,MarcacionSalida,EstadoDeTrabajador,TardanzasMin,SalidasAnticipadasMin)
VALUES(58749658,'2020/08/03','07:40:30','16:55:12','INACTIVO',0,0);
GO
INSERT INTO MARCACION(DniTrabajador,FechadeMarcacion,MarcacionEntrada,MarcacionSalida,EstadoDeTrabajador,TardanzasMin,SalidasAnticipadasMin)
VALUES(74494478,'2020/07/25','06:40:30','14:55:12','INACTIVO',0,5);
GO
INSERT INTO MARCACION(DniTrabajador,FechadeMarcacion,MarcacionEntrada,MarcacionSalida,EstadoDeTrabajador,TardanzasMin,SalidasAnticipadasMin)
VALUES(74494478,'2020/07/26','06:40:30','15:55:12','INACTIVO',0,0);
GO
INSERT INTO MARCACION(DniTrabajador,FechadeMarcacion,MarcacionEntrada,MarcacionSalida,EstadoDeTrabajador,TardanzasMin,SalidasAnticipadasMin)
VALUES(74494478,'2020/07/27','06:40:30','14:55:12','INACTIVO',0,5);
GO
INSERT INTO MARCACION(DniTrabajador,FechadeMarcacion,MarcacionEntrada,MarcacionSalida,EstadoDeTrabajador,TardanzasMin,SalidasAnticipadasMin)
VALUES(74494478,'2020/07/28','06:40:30','14:55:12','INACTIVO',0,5);
GO
INSERT INTO MARCACION(DniTrabajador,FechadeMarcacion,MarcacionEntrada,MarcacionSalida,EstadoDeTrabajador,TardanzasMin,SalidasAnticipadasMin)
VALUES(74494478,'2020/07/29','06:40:30','14:55:12','INACTIVO',0,5);
GO
INSERT INTO MARCACION(DniTrabajador,FechadeMarcacion,MarcacionEntrada,MarcacionSalida,EstadoDeTrabajador,TardanzasMin,SalidasAnticipadasMin)
VALUES(74494478,'2020/07/30','06:40:30','14:55:12','INACTIVO',0,5);
GO
INSERT INTO MARCACION(DniTrabajador,FechadeMarcacion,MarcacionEntrada,MarcacionSalida,EstadoDeTrabajador,TardanzasMin,SalidasAnticipadasMin)
VALUES(74494478,'2020/07/31','06:40:30','15:55:12','INACTIVO',0,0);
GO
INSERT INTO MARCACION(DniTrabajador,FechadeMarcacion,MarcacionEntrada,MarcacionSalida,EstadoDeTrabajador,TardanzasMin,SalidasAnticipadasMin)
VALUES(74494478,'2020/08/01','06:40:30','14:55:12','INACTIVO',0,5);
GO
INSERT INTO MARCACION(DniTrabajador,FechadeMarcacion,MarcacionEntrada,MarcacionSalida,EstadoDeTrabajador,TardanzasMin,SalidasAnticipadasMin)
VALUES(74494478,'2020/08/02','06:40:30','15:55:12','INACTIVO',0,0);
GO
INSERT INTO MARCACION(DniTrabajador,FechadeMarcacion,MarcacionEntrada,MarcacionSalida,EstadoDeTrabajador,TardanzasMin,SalidasAnticipadasMin)
VALUES(74596812,'2020/08/03','06:40:30','15:55:12','INACTIVO',0,0);
GO
INSERT INTO MARCACION(DniTrabajador,FechadeMarcacion,MarcacionEntrada,MarcacionSalida,EstadoDeTrabajador,TardanzasMin,SalidasAnticipadasMin)
VALUES(74596812,'2020/07/25','06:40:30','14:55:12','INACTIVO',0,5);
GO
INSERT INTO MARCACION(DniTrabajador,FechadeMarcacion,MarcacionEntrada,MarcacionSalida,EstadoDeTrabajador,TardanzasMin,SalidasAnticipadasMin)
VALUES(74596812,'2020/07/26','06:40:30','15:55:12','INACTIVO',0,0);
GO
INSERT INTO MARCACION(DniTrabajador,FechadeMarcacion,MarcacionEntrada,MarcacionSalida,EstadoDeTrabajador,TardanzasMin,SalidasAnticipadasMin)
VALUES(74596812,'2020/07/27','06:40:30','14:55:12','INACTIVO',0,5);
GO
INSERT INTO MARCACION(DniTrabajador,FechadeMarcacion,MarcacionEntrada,MarcacionSalida,EstadoDeTrabajador,TardanzasMin,SalidasAnticipadasMin)
VALUES(74596812,'2020/07/28','06:40:30','14:55:12','INACTIVO',0,5);
GO
INSERT INTO MARCACION(DniTrabajador,FechadeMarcacion,MarcacionEntrada,MarcacionSalida,EstadoDeTrabajador,TardanzasMin,SalidasAnticipadasMin)
VALUES(74596812,'2020/07/29','06:40:30','14:55:12','INACTIVO',0,5);
GO
INSERT INTO MARCACION(DniTrabajador,FechadeMarcacion,MarcacionEntrada,MarcacionSalida,EstadoDeTrabajador,TardanzasMin,SalidasAnticipadasMin)
VALUES(74596812,'2020/07/30','06:40:30','14:55:12','INACTIVO',0,5);
GO
INSERT INTO MARCACION(DniTrabajador,FechadeMarcacion,MarcacionEntrada,MarcacionSalida,EstadoDeTrabajador,TardanzasMin,SalidasAnticipadasMin)
VALUES(74596812,'2020/07/31','06:40:30','15:55:12','INACTIVO',0,0);
GO
INSERT INTO MARCACION(DniTrabajador,FechadeMarcacion,MarcacionEntrada,MarcacionSalida,EstadoDeTrabajador,TardanzasMin,SalidasAnticipadasMin)
VALUES(74596812,'2020/08/01','06:40:30','14:55:12','INACTIVO',0,5);
GO
INSERT INTO MARCACION(DniTrabajador,FechadeMarcacion,MarcacionEntrada,MarcacionSalida,EstadoDeTrabajador,TardanzasMin,SalidasAnticipadasMin)
VALUES(74596812,'2020/08/02','06:40:30','15:55:12','INACTIVO',0,0);
GO
INSERT INTO MARCACION(DniTrabajador,FechadeMarcacion,MarcacionEntrada,MarcacionSalida,EstadoDeTrabajador,TardanzasMin,SalidasAnticipadasMin)
VALUES(74596812,'2020/08/03','06:40:30','15:55:12','INACTIVO',0,0);



