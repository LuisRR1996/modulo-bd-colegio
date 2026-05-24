-- creamos una base de datos
create database bd_sesion1;
-- usamos la base de datos creada
use bd_sesion1;
-- creamos nuestras primeras tablas
create table if not exists tb_profesores(
	idProfesor char(6) primary key not null,
    nombres varchar(80) not null,
    turno char(2) not null,
    idCurso varchar(80) not null
);
 
create table if not exists tb_curso(
	idCurso char(6) primary key not null,
    nombreCurso varchar(80) not null
);
 
-- Consulta para corregir atributos/campos en una tabla
alter table tb_profesores
modify idCurso char(6) not null;
 
-- Seleccionar(vista) de las tablas
select * from tb_profesores;
 
-- Ver estructura de las tablas
describe tb_profesores;
 
-- Establecer una llave foranea primer metodo
alter table tb_profesores
add constraint fk_curso
foreign key (idCurso) references tb_curso(idCurso);
 
-- Ver llaves existentes en la tabla
show create table tb_profesores;
 
-- Establecer una llave foranea segundo metodo
create table if not exists tb_estudiante(
	idEstudiante char(6) primary key not null,
    nombres varchar(80) not null,
    grado varchar(40) not null,
    seccion char(1) not null,
    edad int not null,
    idCurso char(6),
    constraint fk_curso_estudiante
    foreign key (idCurso)
    references tb_curso(idCurso)
);
 
create table tb_matriculas(
	fecha date not null,
    solicitud varchar(80),
    idEstudiante char(6),
    foreign key (idEstudiante) references tb_estudiante(idEstudiante),
    idCurso char(6),
    foreign key (idCurso) references tb_curso(idCurso)
);

use bd_sesion1;

-- Inserción de datos
insert into tb_estudiante(idEstudiante, nombres,grado,seccion,edad,idCurso)
values("E00001", "Federico Rojas", "primaria", "C",8,"C00002"),
("E00002", "Edgar Salas", "primaria", "A",9,"C00001"),
("E00003", "Carlos Paredes", "primaria", "A",10,"C00003");

insert into tb_curso(idCurso,nombreCurso)
values ("C00001","Matematicas"),
("C00002","Comunicación"),
("C00003","Ingles");

insert into tb_profesores(idProfesor, nombres,turno,idCurso)
values("PR0001","Brando Nava","Mñ","C00001"),
("PR0002","Maria Quispe", "Tr","C00003");

select * from tb_profesores;

select * from tb_curso;

select idCurso, nombreCurso As Curso from tb_curso;

-- Promedio
select AVG(edad) as promedio_Edad from tb_estudiante;

-- Sumatoria
select sum(edad) as total_Edad from tb_estudiante; 

-- Contar
select count(edad) as contar_edades from tb_estudiante;

-- Maximo - Minimo
select max(edad) as maximo_Edad from tb_estudiante;
select min(edad) as minimo_Edad from tb_estudiante;
