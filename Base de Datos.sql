create database tarea;

use tarea;

drop table usuarios;

create table usuarios(correo varchar(50) primary key , contra varchar(30), nombre varchar(30), apellido varchar(30));

insert into usuarios(correo,contra,nombre,apellido) values ("correo1@hotmail.com","contraseña1" , "Erick" ,"Cano"), 
("correo2@hotmail.com","contraseña2" ,"Nombre1" , "Apellido1"),("correo3@hotmail.com","contraseña3" , "Nombre2", "Apellido2");

select * from usuarios;

