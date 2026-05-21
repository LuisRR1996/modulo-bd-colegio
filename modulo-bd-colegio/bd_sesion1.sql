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