create database BD_Automotriz;

use BD_Automotriz;


/*create table estado
(
est_id int not null constraint pk_est_id primary key,
est_ini datetime not null,
est_ter datetime not null,
est_des varchar(70)not null,
)
go*/

create table perfiles
(
per_id int not null constraint pk_per_id primary key,
per_des varchar(15)not null,
)
go

--Solo se trabajara con 10 marcas
create table marca
(
mar_id int not null constraint pk_mar_id primary key,
mar_des varchar(50)not null,
)
go

create table modelo
(
mod_id int not null constraint pk_mod_id primary key,
mod_des varchar(50)not null,
)
go

create table administrador
(
adm_rut char(12)not null constraint pk_adm_rut primary key,
adm_clave varchar(10)not null,
adm_nom varchar(70)not null,
adm_ape varchar(70)not null,
adm_id int not null constraint fk_adm_id references perfiles(per_id),
)
go

create table mecanico
(
mec_rut char(12)not null constraint pk_mec_rut primary key,
mec_clave varchar(10)not null,
mec_nom varchar(70)not null,
mec_ape varchar(70)not null,
mec_tel char(10)not null,
mec_email varchar(70)not null,
mec_id int not null constraint fk_mec_id references perfiles(per_id),
)
go



create table cliente
(
cli_rut char(12)not null constraint pk_cli_rut primary key,
cli_clave varchar(10)not null,
cli_nom varchar(70)not null,
cli_ape varchar(70)not null,
cli_tel char(10)not null,
cli_email varchar(70)not null,
cli_id int not null constraint fk_cli_id references perfiles(per_id),
)
go

create table vehiculo
(
veh_id int not null constraint pk_veh_id primary key,
veh_mar int not null constraint fk_veh_mar references marca(mar_id),
veh_mod int not null constraint fk_veh_mod references modelo(mod_id),
veh_year char(4)not null,
veh_rut char(12) not null constraint fk_veh_rut references cliente(cli_rut),
--veh_est int not null constraint fk_veh_est references estado(est_id),
)
go


--LISTAR
create procedure LISTAR_MECANICO As 
Select * from mecanico
go

--BUSCAR
create procedure BUSCAR_MECANICO
@rut char(12)
as select * from mecanico where mec_rut=@rut
go

--INSERTAR--
create procedure INSERTAR_MECANICO
@rut_mecanico char(12),@clave_mecanico varchar(10),@nombre_mecanico varchar(70),@apellido_mecanico varchar(70),@tel_mecanico char(10),@email_mecanico varchar(70),@id_mec int 
as
insert into mecanico(mec_rut,mec_clave,mec_nom,mec_ape,mec_tel,mec_email,mec_id) values (@rut_mecanico,@clave_mecanico,@nombre_mecanico,@apellido_mecanico,@tel_mecanico,@email_mecanico,@id_mec)
go

--ACTUALIZAR
create procedure ACTUALIZAR_MECANICO
@rut_mecanico char(12),@clave_mecanico varchar(10),@nombre_mecanico varchar(70),@apellido_mecanico varchar(70),@tel_mecanico char(10),@email_mecanico varchar(70),@id_mec int 
as
update mecanico set mec_clave=@clave_mecanico,mec_nom=@nombre_mecanico,mec_ape=@apellido_mecanico,mec_tel=@tel_mecanico,mec_email=@email_mecanico,mec_id=@id_mec where mec_rut=@rut_mecanico
go

--ELIMINAR
create procedure ELIMINAR_MECANICO
@rut_mecanico char(12)
as 
delete mecanico where mec_rut=@rut_mecanico
go


/*
CREATE TABLE [dbo].[UserProfile] (
    [UserId]   INT            IDENTITY (1, 1) NOT NULL,
    [UserName] NVARCHAR (MAX) NULL,
    PRIMARY KEY CLUSTERED ([UserId] ASC)
);
*/