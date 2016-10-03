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


