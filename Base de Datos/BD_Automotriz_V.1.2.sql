create database BD_Automotriz
use BD_Automotriz


-- 1. TABLA PERFIL DE USUARIO

create table UserPerfiles
(
PerID int primary key,
PerDes varchar(15)not null,
)
go

insert into UserPerfiles values(1,'Administrador')
insert into UserPerfiles values(2,'Mecanico')
insert into UserPerfiles values(3,'Cliente')


-- 2. TABLA SEGUROS SOAP

create table seguro
(
SegID int not null identity(1,1) primary key,
SegTip char(10)not null,
SedDes int not null,
SegVal int not null,
)
go

insert into seguro values('Nivel 1',15,20000)
insert into seguro values('Nivel 2',25,35000)
insert into seguro values('Nivel 3',45,45000)


-- 3. TABLA MOTOR

create table motor
(
MotID int not null identity(1,1) primary key,
MotDes varchar(15),
)
go

insert into motor values('Motor 900cc');
insert into motor values('Motor 1.0');
insert into motor values('Motor 1.4 ');
insert into motor values('Motor 1.5');
insert into motor values('Motor 1.6');
insert into motor values('Motor 1.8');
insert into motor values('Motor 2.0');
insert into motor values('Motor 2.2');
insert into motor values('Motor 2.5');


-- 4. TABLA MARCAS

create table marcas
(
MarID int not null identity(1,1) primary key,
MarDes varchar(30)not null,
)
go

insert into marcas values('Chevrolet')
insert into marcas values('Toyota')
insert into marcas values('Mazda')
insert into marcas values('Ford')
insert into marcas values('Hyundai')
insert into marcas values('Citroen')
insert into marcas values('Peugeot')
insert into marcas values('Mitsubishi')
insert into marcas values('Nissan')
insert into marcas values('Renault')


-- 5. TABLA MECANICO

create table mecanico
(
MecID int not null identity(1,1) constraint PkMecID primary key,
MecRut char(12)not null,
MecCla varchar(10)not null,
MecClv varchar(10)not null,
MecNom varchar(70)not null,
MecApe varchar(70)not null,
MecFon char(10)not null,
MecCor varchar(70)not null,
MecUid int not null constraint FkMecUid references UserPerfiles(PerID),
)
go


-- 6. TABLA ADMINISTRADOR

create table administrador
(
AdmRut char(12)not null constraint PkAdmRut primary key,
AdmCla varchar(10)not null,
AdmNom varchar(70)not null,
AdmApe varchar(70)not null,
AdmID int not null constraint FkAdmID references UserPerfiles(PerID),
)
go

--El unico administrador ingresado por defecto
insert into administrador values('22333444-5','123456','Juan','Nutella',1)


-- 7. TABLA MODELOS

create table modelos
(
ModID int not null identity(1,1) primary key,
ModMar int not null constraint FKModMar references marcas(MarID),
ModDes varchar(50)not null,
)
go

insert into modelos values(1,'Aveo')
insert into modelos values(1,'Aveo sport')
insert into modelos values(1,'Cruze')
insert into modelos values(1,'Spark')
insert into modelos values(1,'Corvette')
insert into modelos values(2,'Yaris')
insert into modelos values(2,'Rav4')
insert into modelos values(2,'Corolla')
insert into modelos values(2,'Hilux')
insert into modelos values(2,'Land Cruiser')
insert into modelos values(3,'Mazda 2')
insert into modelos values(3,'Mazda 3')
insert into modelos values(3,'Mazda 5')
insert into modelos values(3,'Mazda 6')
insert into modelos values(3,'Mazda 323')
insert into modelos values(4,'Eco Sport')
insert into modelos values(4,'Escape')
insert into modelos values(4,'Fiesta')
insert into modelos values(4,'Focus')
insert into modelos values(4,'Mustang')
insert into modelos values(5,'Accent')
insert into modelos values(5,'i10')
insert into modelos values(5,'Tucson')
insert into modelos values(5,'Santa fe')
insert into modelos values(5,'Forester')
insert into modelos values(6,'C2')
insert into modelos values(6,'C3')
insert into modelos values(6,'C4')
insert into modelos values(6,'C5')
insert into modelos values(6,'C6')
insert into modelos values(7,'106')
insert into modelos values(7,'206')
insert into modelos values(7,'207')
insert into modelos values(7,'208')
insert into modelos values(7,'206 sport')
insert into modelos values(8,'Eclipse')
insert into modelos values(8,'Galant')
insert into modelos values(8,'L2000')
insert into modelos values(8,'Lancer')
insert into modelos values(8,'Mirage')
insert into modelos values(9,'March')
insert into modelos values(9,'Patrol')
insert into modelos values(9,'Qashqai')
insert into modelos values(9,'X-Trail')
insert into modelos values(9,'Murano')
insert into modelos values(10,'Argos')
insert into modelos values(10,'Latitude')
insert into modelos values(10,'Logan')
insert into modelos values(10,'Symbol')
insert into modelos values(10,'Sandero')


-- 8. TABLA CLIENTES

create table cliente
(
--CliID int not null constraint PkCliID identity(1,1)primary key,
CliRut char(12)constraint PkCliRut primary key,
CliNom varchar(70)not null,
CliApe varchar(70)not null,
CliTel varchar(10)not null,
CliEma varchar(70)not null,
CliCla varchar(10)not null,
CliClv varchar(10)not null,
CliSeg int  constraint FkCliSeg references seguro(SegID), -- se refiere al nivel del seguro para poder relizar el dcto.
CliPer int  constraint FkCliPer references UserPerfiles(PerID),-- se refiere al tipo de perfil cliente =3
)
go


-- 9. TABLA VEHICULOS

create table vehiculo
(
VehID int not null identity(1,1)primary key,
VerRut char(12)not null constraint FkVerRut references cliente(CliRut),
VehAno char(4) not null,
VehPat char(10)not null,
VehMot int not null constraint FkVehMot references motor(MotID),
VehMar int not null constraint FkVehMar references marcas(MarID),
--VehMod int not null constraint FkVehMod references modelos(ModID),
)
go




--PROCEDIMEINTOS ALMACENADOS MECANICO

--LISTAR MECANICO
create procedure LISTAR_MECANICO As 
select MecRut,MecCla,MecClv,MecNom,MecApe,MecFon,MecCor from mecanico
go


--INSERTAR MECANICO
create procedure INSERTAR_MECANICO
@RutM char(12),@Clave1M varchar(10),@Clave2M varchar(10),@NombreM varchar(70),@ApellidoM varchar(70),@FonoM char(10),@CorreoM varchar(70),@IdM int
as
set @IdM=2
insert into mecanico(MecRut,MecCla,MecClv,MecNom,MecApe,MecFon,MecCor,MecUid)values(@RutM,@Clave1M,@Clave2M,@NombreM,@ApellidoM,@FonoM,@CorreoM,@IdM)
go


--EDITAR MECANICO

--ELIMINAR MECANICO
create procedure ELIMINAR_MECANICO
@rut_mecanico int
as 
delete mecanico where MecID=@rut_mecanico
go

--BUSCAR MECANICO
create procedure BUSCAR_MECANICO
@rut int
as select * from mecanico where MecID=@rut
go


--PROCEDIMEINTOS ALMACENADOS CLIENTE

--LISTAR CLIENTE

create procedure LISTAR_CLIENTE As 
SELECT cliente.CliRut, cliente.CliNom, cliente.CliApe, cliente.CliTel, cliente.CliEma, cliente.CliCla, cliente.CliClv, seguro.SegTip
FROM cliente INNER JOIN
     seguro ON cliente.CliSeg = seguro.SegID
go

--INSERTAR CLIENTE
create procedure INSERTAR_CLIENTE
@RutC char(12),@NombreC varchar(70),@ApellidoC varchar(70),@FonoC varchar(10),@EmailC varchar(70),@Clave1C varchar(10),@Clave2C varchar(10),@SeguroC int,@IdC int
as
set @IdC=3
insert into cliente(CliRut,CliNom,CliApe,CliTel,CliEma,CliCla,CliClv,CliSeg,CliPer)values(@RutC,@NombreC,@ApellidoC,@FonoC,@EmailC,@Clave1C,@Clave2C,@SeguroC,@IdC)
go


--PROCEDIMEINTOS ALMACENADOS CLIENTE-VEHICULO

--LISTAR VEHICULO
create procedure LISTAR_VEHICULO As 
SELECT vehiculo.VerRut, vehiculo.VehAno, vehiculo.VehPat, motor.MotDes, marcas.MarDes, modelos.ModDes
FROM   vehiculo INNER JOIN
       motor ON vehiculo.VehMot = motor.MotID INNER JOIN
       marcas ON vehiculo.VehMar = marcas.MarID INNER JOIN
       modelos ON marcas.MarID = modelos.ModMar
go

--INSERTAR VEHICULO
create procedure INSERTAR_VEHICULO
@RutV char(12),@AnoV char(4),@PatV char(10),@MotV int,@MarV int
as
insert into vehiculo(VerRut,VehAno,VehPat,VehMot,VehMar)values(@RutV,@AnoV,@PatV,@MotV,@MarV)
go

											