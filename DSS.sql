create database bancoDSS;

use bancoDSS;

create table tipoUsuario(
	id int auto_increment primary key,
	tipoUsuario varchar(50) not null unique
);

create table usuario(
	id int auto_increment primary key,
	nombre varchar(75) not null,
	email varchar(50) not null unique,
	direccion varchar(75) unique not null,
	contrasenya varchar(50) not null,
	edad int not null,
	sexo char(1) check(sexo = 'M' OR sexo = 'H'),
	DUI char(10) unique,
	tipoUsuario int,
	NIT char(17) unique not null,
	foreign key (tipoUsuario) references tipoUsuario(id)
);

create table cuenta(
	id int auto_increment primary key,
    nCuenta char(19) not null,
    idCliente int not null,
    saldo float not null,
    nOpera int,
    nOperaSinRecargo int,
    interes float,
    interesR float,
    interesD float,
    interesC float,
    foreign key (idCliente) references usuario(id)
);

create table modalidad(
	id int auto_increment primary key,
    modalidad varchar(25) not null
);

insert into modalidad(modalidad) values ('Efectivo'),('Cheque');


create table tipoTransaccion(
    id int auto_increment primary key,
    tipoTransaccion varchar(30)
);

insert into tipoTransaccion values ('Deposito'),('Retiro'),('Consulta');

create table transacciones(
    id int auto_increment primary key,
    idCuenta int not null,
    monto float not null,
    modalidad int not null
    fecha datetime,
    tipoTransaccion int,
    foreign key (tipoTransaccion) references tipoTransaccion(id),
    foreign key (idCuenta) references cuenta(id),
    foreign key (modalidad) references modalidad(id);
);