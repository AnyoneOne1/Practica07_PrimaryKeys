comment on schema public is 'Esquema de la Base de Batos Default de postgres';
--- Creacion del Esquema
DROP SCHEMA IF EXISTS public CASCADE;
CREATE SCHEMA public;

-- Tabla Entrenador
CREATE TABLE Entrenador(
	IDentrenador SERIAL8,
	Nombre VARCHAR(50),
	Primer_Apellido VARCHAR(50),
	Segundo_Apellido VARCHAR(50),
	Pais_Origen VARCHAR(50),
	Nacimiento DATE
);

comment on table Entrenador is 'Tabla que contiene la informacion de los entrenadores';
comment on column Entrenador.IDentrenador is 'Identificador unico del entrenador';
comment on column Entrenador.Nombre is 'Nombre del entrenador, no puede ser nulo';
comment on column Entrenador.Primer_Apellido is 'Primer apellido del entrenador, no puede ser nulo';
comment on column Entrenador.Segundo_Apellido is 'Segundo apellido (si existe) del entrenador, puede ser nulo';
comment on column Entrenador.Pais_Origen is 'Pais origen del entrenador, no puede ser nulo';
comment on column Entrenador.Nacimiento is 'Fecha de nacimiento del entrenador, no puede ser nulo';

-- Restricciones de Entidad Entrenador
ALTER TABLE Entrenador ADD CONSTRAINT PK_Entrenador PRIMARY KEY (IDentrenador);
comment on constraint PK_Entrenador on Entrenador is 'Llave primaria de la tabla Entrenador';

-- Restricciones de Dominio Entrenador
ALTER TABLE Entrenador ALTER COLUMN Nombre SET NOT NULL;
ALTER TABLE Entrenador ALTER COLUMN Primer_Apellido SET NOT NULL;
ALTER TABLE Entrenador ALTER COLUMN Pais_Origen SET NOT NULL;
ALTER TABLE Entrenador ALTER COLUMN Nacimiento SET NOT NULL;
ALTER TABLE Entrenador ADD CONSTRAINT entrenador_d2 CHECK (Nombre <> '');
ALTER TABLE Entrenador ADD CONSTRAINT entrenador_d3 CHECK (Primer_Apellido <> '');
ALTER TABLE Entrenador ADD CONSTRAINT entrenador_d4 CHECK (Segundo_Apellido <> '');
ALTER TABLE Entrenador ADD CONSTRAINT entrenador_d5 CHECK (Pais_Origen <> '');
ALTER TABLE Entrenador ADD CONSTRAINT entrenador_d6 CHECK (Nacimiento BETWEEN '1930-01-01' AND '2010-01-01'); 

comment on constraint entrenador_d2 on Entrenador is 'Restriccion check que asegura que Nombre no sea la cadena vacia';
comment on constraint entrenador_d3 on Entrenador is 'Restriccion check que asegura que Primer_Apellido no sea la cadena vacia';
comment on constraint entrenador_d4 on Entrenador is 'Restriccion check que asegura que Segundo_Apellido no sea la cadena vacia';
comment on constraint entrenador_d5 on Entrenador is 'Restriccion check que asegura que Pais_Origen no sea la cadena vacia';
comment on constraint entrenador_d6 on Entrenador is 'Restriccion check que asegura que Nacimiento se encuentre entre 1930 y 2010';


-- Tabla Arbitro
CREATE TABLE Arbitro(
	IDarbitro SERIAL8,
	Nombre VARCHAR(50),
	Primer_Apellido VARCHAR(50),
	Segundo_Apellido VARCHAR(50),
	Pais_Origen VARCHAR(50),
	Nacimiento DATE
);

comment on table Arbitro is 'Tabla que contiene la informacion de los árbitros';
comment on column Arbitro.IDarbitro is 'Identificador unico del arbitro';
comment on column Arbitro.Nombre is 'Nombre del arbitro, no puede ser nulo';
comment on column Arbitro.Primer_Apellido is 'Primer apellido del arbitro, no puede ser nulo';
comment on column Arbitro.Segundo_Apellido is 'Segundo apellido (si existe) del arbitro, puede ser nulo';
comment on column Arbitro.Pais_Origen is 'Pais origen del arbitro, no puede ser nulo';
comment on column Arbitro.Nacimiento is 'Fecha de nacimiento del arbitro, no puede ser nulo';

-- Restricciones de Entidad Arbitro
ALTER TABLE Arbitro ADD CONSTRAINT PK_Arbitro PRIMARY KEY (IDarbitro);
comment on constraint PK_Arbitro on Arbitro is 'Llave primaria de la tabla Arbitro';

-- Restricciones de Dominio Arbitro
ALTER TABLE Arbitro ALTER COLUMN Nombre SET NOT NULL;
ALTER TABLE Arbitro ALTER COLUMN Primer_Apellido SET NOT NULL;
ALTER TABLE Arbitro ALTER COLUMN Pais_Origen SET NOT NULL;
ALTER TABLE Arbitro ALTER COLUMN Nacimiento SET NOT NULL;
ALTER TABLE Arbitro ADD CONSTRAINT arbitro_d2 CHECK (Nombre <> '');
ALTER TABLE Arbitro ADD CONSTRAINT arbitro_d3 CHECK (Primer_Apellido <> '');
ALTER TABLE Arbitro ADD CONSTRAINT arbitro_d4 CHECK (Segundo_Apellido <> '');
ALTER TABLE Arbitro ADD CONSTRAINT arbitro_d5 CHECK (Pais_Origen <> '');
ALTER TABLE Arbitro ADD CONSTRAINT arbitro_d6 CHECK (Nacimiento BETWEEN '1930-01-01' AND '2010-01-01'); 

comment on constraint arbitro_d2 on Arbitro is 'Restriccion check que asegura que Nombre no sea la cadena vacia';
comment on constraint arbitro_d3 on Arbitro is 'Restriccion check que asegura que Primer_Apellido no sea la cadena vacia';
comment on constraint arbitro_d4 on Arbitro is 'Restriccion check que asegura que Segundo_Apellido no sea la cadena vacia';
comment on constraint arbitro_d5 on Arbitro is 'Restriccion check que asegura que Pais_Origen no sea la cadena vacia';
comment on constraint arbitro_d6 on Arbitro is 'Restriccion check que asegura que Nacimiento se encuentre entre 1930 y 2010';

-- Tabla Atleta
CREATE TABLE Atleta(
	IDatleta SERIAL8,
	IDentrenador SERIAL8,
	Nombre VARCHAR(50),
	Primer_Apellido VARCHAR(50),
	Segundo_Apellido VARCHAR(50),
	Pais_Origen VARCHAR(50),
	Nacimiento DATE,
	Representar_Pais VARCHAR(50),
	Genero CHAR(1),
	Agno VARCHAR(4)
);
comment on table Atleta is 'Tabla que contiene la informacion de los atletas';
comment on column Atleta.IDatleta is 'Identificador unico del atleta';
comment on column Atleta.IDentrenador is 'Identificador del entrenador, no puede ser nulo';
comment on column Atleta.Nombre is 'Nombre del atleta, no puede ser nulo';
comment on column Atleta.Primer_Apellido is 'Primer apellido del atleta, no puede ser nulo';
comment on column Atleta.Segundo_Apellido is 'Segundo apellido (si existe) del atleta, puede ser nulo';
comment on column Atleta.Pais_Origen is 'Pais origen del atleta, no puede ser nulo';
comment on column Atleta.Nacimiento is 'Fecha de nacimiento del atleta, no puede ser nulo';
comment on column Atleta.Representar_Pais is 'Pais que representa el atleta, no puede ser nulo';
comment on column Atleta.Genero is 'Genero del atleta, no puede ser nulo';
comment on column Atleta.Agno is 'Año en el que participa el atleta en los juegos olimpicos, no puede ser nulo';

-- Restricciones de Entidad Atleta
ALTER TABLE Atleta ADD CONSTRAINT PK_Atleta PRIMARY KEY (IDatleta);
comment on constraint PK_Atleta on Atleta is 'Llave primaria de la tabla Atleta';

-- Restricciones de Dominio Atleta
ALTER TABLE Atleta ALTER COLUMN IDentrenador SET NOT NULL;
ALTER TABLE Atleta ALTER COLUMN Nombre SET NOT NULL;
ALTER TABLE Atleta ALTER COLUMN Primer_Apellido SET NOT NULL;
ALTER TABLE Atleta ALTER COLUMN Pais_Origen SET NOT NULL;
ALTER TABLE Atleta ALTER COLUMN Nacimiento SET NOT NULL;
ALTER TABLE Atleta ALTER COLUMN Representar_Pais SET NOT NULL;
ALTER TABLE Atleta ALTER COLUMN Genero SET NOT NULL;
ALTER TABLE Atleta ALTER COLUMN Agno SET NOT NULL;
ALTER TABLE Atleta ADD CONSTRAINT atleta_d2 CHECK (Nombre <> '');
ALTER TABLE Atleta ADD CONSTRAINT atleta_d3 CHECK (Primer_Apellido <> '');
ALTER TABLE Atleta ADD CONSTRAINT atleta_d4 CHECK (Segundo_Apellido <> '');
ALTER TABLE Atleta ADD CONSTRAINT atleta_d5 CHECK (Pais_Origen <> '');
ALTER TABLE Atleta ADD CONSTRAINT atleta_d6 CHECK (Nacimiento BETWEEN '1930-01-01' AND '2010-01-01');
ALTER TABLE Atleta ADD CONSTRAINT atleta_d7 CHECK (Representar_Pais <> '');
ALTER TABLE Atleta ADD CONSTRAINT atleta_d8 CHECK (Genero IN ('M', 'F'));
ALTER TABLE Atleta ADD CONSTRAINT atleta_d9 CHECK (Agno SIMILAR TO '[0-9]{4}');

comment on constraint atleta_d2 on Atleta is 'Restriccion check que asegura que Nombre no sea la cadena vacia';
comment on constraint atleta_d3 on Atleta is 'Restriccion check que asegura que Primer_Apellido no sea la cadena vacia';
comment on constraint atleta_d4 on Atleta is 'Restriccion check que asegura que Segundo_Apellido no sea la cadena vacia';
comment on constraint atleta_d5 on Atleta is 'Restriccion check que asegura que Pais_Origen no sea la cadena vacia';
comment on constraint atleta_d6 on Atleta is 'Restriccion check que asegura que Nacimiento se encuentre entre 1930 y 2010';
comment on constraint atleta_d7 on Atleta is 'Restriccion check que asegura que Genero sea F (femenino) o M (masculino)';
comment on constraint atleta_d8 on Atleta is 'Restriccion check que asegura que Representar_Pais no sea la cadena vacia';
comment on constraint atleta_d9 on Atleta is 'Restriccion check que asegura que Agno sea de un numero de cuatro digitos';

-- Tabla Participar
-- Relacion de Muchos a Muchos
CREATE TABLE Participar(
	IDatleta serial8,
	IDevento serial8
);
comment on table Participar is 'Tabla que contiene a los atletas y el evento en el que participa';
comment on column Participar.IDatleta is 'Identificador del atleta, no puede ser nulo';
comment on column Participar.IDevento is 'Identificador del evento, no puede ser nulo';

-- Restricciones de Dominio Participar
ALTER TABLE Participar ALTER COLUMN IDatleta SET NOT NULL;
ALTER TABLE Participar ALTER COLUMN IDevento SET NOT NULL;

-- Tabla TelefonoAtleta
CREATE TABLE TelefonoAtleta(
	IDatleta SERIAL8,
	TelefonoAtleta CHAR(10)
);

comment on table TelefonoAtleta is 'Tabla que contiene los números de telefono del atleta';
comment on column TelefonoAtleta.IDatleta is 'Identificador del atleta, no puede ser nulo';
comment on column TelefonoAtleta.TelefonoAtleta is 'Numero de telefono del atleta, no puede ser nulo';

-- Restricciones de Dominio TelefonoAtleta
ALTER TABLE TelefonoAtleta ALTER COLUMN IDatleta SET NOT NULL;
ALTER TABLE TelefonoAtleta ALTER COLUMN TelefonoAtleta SET NOT NULL;
ALTER TABLE TelefonoAtleta ADD CONSTRAINT Atleta_Telefono CHECK (TelefonoAtleta SIMILAR TO '[0-9]{10}');
comment on constraint Atleta_Telefono on TelefonoAtleta is 'Restriccion check que asegura que Telefono solo tenga caracteres numericos';

-- Restricciones de Entidad TelefonoAtleta
ALTER TABLE TelefonoAtleta ADD CONSTRAINT PK_TelefonoAtleta PRIMARY KEY (IDatleta, TelefonoAtleta);
comment on constraint PK_TelefonoAtleta on TelefonoAtleta is 'Llave primaria de la tabla TelefonoAtleta';

-- Tabla CorreoAtleta
CREATE TABLE CorreoAtleta(
	IDatleta SERIAL8,
	CorreoAtleta VARCHAR(50)
);
comment on table CorreoAtleta is 'Tabla que contiene los correos electrónicos del atleta';
comment on column CorreoAtleta.IDatleta is 'Identificador del atleta, no puede ser nulo';
comment on column CorreoAtleta.CorreoAtleta is 'Correo electronico del atleta, no puede ser nulo';

-- Restricciones de Dominio CorreoAtleta
ALTER TABLE CorreoAtleta ALTER COLUMN IDatleta SET NOT NULL;
ALTER TABLE CorreoAtleta ALTER COLUMN CorreoAtleta SET NOT NULL;
ALTER TABLE CorreoAtleta ADD CONSTRAINT Atleta_Correo CHECK (CorreoAtleta LIKE '_%@_%._%');
comment on constraint Atleta_Correo on CorreoAtleta is 'Restriccion check que asegura que sea un correo valido';

-- Restricciones de Entidad CorreoAtleta
ALTER TABLE CorreoAtleta ADD CONSTRAINT PK_CorreoAtleta PRIMARY KEY (IDatleta, CorreoAtleta);
comment on constraint PK_CorreoAtleta on CorreoAtleta is 'Llave primaria de la tabla CorreoAtleta';

-- Tabla TelefonoEntrenador
CREATE TABLE TelefonoEntrenador(
	IDentrenador SERIAL8,
	TelefonoEntrenador CHAR(10)
);
comment on table TelefonoEntrenador is 'Tabla que contiene los números de telefono de los entrenadores';
comment on column TelefonoEntrenador.IDentrenador is 'Identificador del entrenador, no puede ser nulo';
comment on column TelefonoEntrenador.TelefonoEntrenador is 'Numero de telefono del entrenador, no puede ser nulo';

-- Restricciones de Dominio TelefonoEntrenador
ALTER TABLE TelefonoEntrenador ALTER COLUMN IDentrenador SET NOT NULL;
ALTER TABLE TelefonoEntrenador ALTER COLUMN TelefonoEntrenador SET NOT NULL;
ALTER TABLE TelefonoEntrenador ADD CONSTRAINT Entrenador_Telefono CHECK (TelefonoEntrenador SIMILAR TO '[0-9]{10}');
comment on constraint Entrenador_Telefono on TelefonoEntrenador is 'Restriccion check que asegura que Telefono solo tenga caracteres numericos';

-- Restricciones de Entidad TelefonoEntrenador
ALTER TABLE TelefonoEntrenador ADD CONSTRAINT PK_TelefonoEntrenador PRIMARY KEY (IDentrenador, TelefonoEntrenador);
comment on constraint PK_TelefonoEntrenador on TelefonoEntrenador is 'Llave primaria de la tabla TelefonoEntrenador';

-- Tabla CorreoEntrenador
CREATE TABLE CorreoEntrenador(
	IDentrenador SERIAL8,
	CorreoEntrenador VARCHAR(50)
);
comment on table CorreoEntrenador is 'Tabla que contiene los correos electrónicos del entrenador';
comment on column CorreoEntrenador.IDentrenador is 'Identificador del entrenador, no puede ser nulo';
comment on column CorreoEntrenador.CorreoEntrenador is 'Correo electronico del entrenador, no puede ser nulo';

-- Restricciones de Dominio CorreoEntrenador
ALTER TABLE CorreoEntrenador ALTER COLUMN IDentrenador SET NOT NULL;
ALTER TABLE CorreoEntrenador ALTER COLUMN CorreoEntrenador SET NOT NULL;
ALTER TABLE CorreoEntrenador ADD CONSTRAINT Entrenador_Correo CHECK (CorreoEntrenador LIKE '_%@_%._%');
comment on constraint Entrenador_Correo on CorreoEntrenador is 'Restriccion check que asegura que sea un correo valido';

-- Restricciones de Entidad CorreoEntrenador
ALTER TABLE CorreoEntrenador ADD CONSTRAINT PK_CorreoEntrenador PRIMARY KEY (IDentrenador, CorreoEntrenador);
comment on constraint PK_CorreoEntrenador on CorreoEntrenador is 'Llave primaria de la tabla CorreoEntrenador';

-- Tabla TelefonoArbitro
CREATE TABLE TelefonoArbitro(
	IDarbitro SERIAL8,
	TelefonoArbitro CHAR(10)
);
comment on table TelefonoArbitro is 'Tabla que contiene los números de telefono de los arbitros';
comment on column TelefonoArbitro.IDarbitro is 'Identificador del arbitro, no puede ser nulo';
comment on column TelefonoArbitro.TelefonoArbitro is 'Numero de telefono del arbitro, no puede ser nulo';

-- Restricciones de Dominio TelefonoArbitro
ALTER TABLE TelefonoArbitro ALTER COLUMN IDarbitro SET NOT NULL;
ALTER TABLE TelefonoArbitro ALTER COLUMN TelefonoArbitro SET NOT NULL;
ALTER TABLE TelefonoArbitro ADD CONSTRAINT Arbitro_Telefono CHECK (TelefonoArbitro SIMILAR TO '[0-9]{10}');
comment on constraint Arbitro_Telefono on TelefonoArbitro is 'Restriccion check que asegura que Telefono solo tenga caracteres numericos';

-- Restricciones de Entidad TelefonoArbitro
ALTER TABLE TelefonoArbitro ADD CONSTRAINT PK_TelefonoArbitro PRIMARY KEY (IDarbitro, TelefonoArbitro);
comment on constraint PK_TelefonoArbitro on TelefonoArbitro is 'Llave primaria de la tabla TelefonoArbitro';

-- Tabla CorreoArbitro
CREATE TABLE CorreoArbitro(
	IDarbitro SERIAL8,
	CorreoArbitro VARCHAR(50)
);
comment on table CorreoArbitro is 'Tabla que contiene los correos electrónicos del arbitro';
comment on column CorreoArbitro.IDarbitro is 'Identificador del arbitro, no puede ser nulo';
comment on column CorreoArbitro.CorreoArbitro is 'Correo electronico del arbitro, no puede ser nulo';


-- Restricciones de Dominio CorreoArbitro
ALTER TABLE CorreoArbitro ALTER COLUMN IDarbitro SET NOT NULL;
ALTER TABLE CorreoArbitro ALTER COLUMN CorreoArbitro SET NOT NULL;
ALTER TABLE CorreoArbitro ADD CONSTRAINT Arbitro_Correo CHECK (CorreoArbitro LIKE '_%@_%._%');
comment on constraint Arbitro_Correo on CorreoArbitro is 'Restriccion check que asegura que sea un correo valido';

-- Restricciones de Entidad CorreoArbitro
ALTER TABLE CorreoArbitro ADD CONSTRAINT PK_CorreoArbitro PRIMARY KEY (IDarbitro, CorreoArbitro);
comment on constraint PK_CorreoArbitro on CorreoArbitro is 'Llave primaria de la tabla CorreoArbitro';

-- Tabla Medalla
CREATE TABLE Medalla(
	IDmedalla SERIAL8,
	IDevento SERIAL8,
	IDatleta SERIAL8,
	Tipo VARCHAR(50)
);
comment on table Medalla is 'Tabla que contiene la informacion de las medallas entregadas';
comment on column Medalla.IDmedalla is 'Identificador unico de la medalla';
comment on column Medalla.IDevento is 'Identificador del evento, no puede ser nulo';
comment on column Medalla.IDatleta is 'Identificador del atleta, no puede ser nulo';
comment on column Medalla.Tipo is 'Tipo de medalla, no puede ser nulo';

-- Restricciones de Entidad Medalla
ALTER TABLE Medalla ADD CONSTRAINT PK_Medalla PRIMARY KEY (IDmedalla, IDevento);
comment on constraint PK_Medalla on Medalla is 'Llaves primarias de la tabla Medalla';

-- Restricciones de Dominio Medalla
ALTER TABLE Medalla ALTER COLUMN IDevento SET NOT NULL;
ALTER TABLE Medalla ALTER COLUMN IDatleta SET NOT NULL;
ALTER TABLE Medalla ALTER COLUMN Tipo SET NOT NULL;

ALTER TABLE Medalla add constraint tipo_Medalla CHECK (Tipo IN ('Oro', 'Plata', 'Bronce'));
comment on constraint tipo_Medalla on Medalla is 'Restriccion check que asegura que Tipo sea Oro, Plata o Bronce';

-- Tabla Asignar
-- Relacion de Uno a Uno
CREATE TABLE Asignar(
	IDdisciplina VARCHAR(50),
	IDlocalidad SERIAL8
);
comment on table Asignar is 'Tabla que contiene las localidades donde se realizan las disciplinas ';
comment on column Asignar.IDdisciplina is 'Nombre de la disciplina, no puede ser nulo';
comment on column Asignar.IDlocalidad is 'Identificador de la localidad, no puede ser nulo';

-- Restricciones de Dominio Asignar
ALTER TABLE Asignar ALTER COLUMN IDdisciplina SET NOT NULL;
ALTER TABLE Asignar ALTER COLUMN IDlocalidad SET NOT NULL;

-- Tabla Localidad
CREATE TABLE Localidad(
	IDlocalidad SERIAL8,
	Nombre_Localidad VARCHAR(50),
	Tipo_Localidad VARCHAR(50),
	Aforo INT,
	Ciudad VARCHAR(50),
	Numero INT,
	Pais VARCHAR(50),
	Calle VARCHAR(50)
 );
comment on table Localidad is 'Tabla que contiene informacion de las localidades';
comment on column Localidad.IDlocalidad is 'Identificador unico de la localidad';
comment on column Localidad.Nombre_Localidad is 'Nombre de la localidad, no puede ser nulo';
comment on column Localidad.Tipo_Localidad is 'Tipo de localidad, no puede ser nulo';
comment on column Localidad.Aforo is 'Aforo de la localidad, no puede ser nulo';
comment on column Localidad.Ciudad is 'Ciudad donde se encuentra la localidad, no puede ser nulo';
comment on column Localidad.Numero is 'Numero donde se encuentra la localidad, no puede ser nulo';
comment on column Localidad.Pais is 'Pais donde se encuentra la localidad, no puede ser nulo';
comment on column Localidad.Calle is 'Calle donde se encuentra la localidad, no puede ser nulo';

-- Restricciones de Entidad Localidad
ALTER TABLE Localidad ADD CONSTRAINT PK_Localidad PRIMARY KEY (IDlocalidad);
comment on constraint PK_Localidad on Localidad is 'Llave primaria de la tabla Localidad';

-- Restricciones de Dominio Localidad
ALTER TABLE Localidad ALTER COLUMN Nombre_Localidad SET NOT NULL;
ALTER TABLE Localidad ALTER COLUMN Tipo_Localidad SET NOT NULL;
ALTER TABLE Localidad ALTER COLUMN Aforo SET NOT NULL;
ALTER TABLE Localidad ALTER COLUMN Ciudad SET NOT NULL;
ALTER TABLE Localidad ALTER COLUMN Numero SET NOT NULL;
ALTER TABLE Localidad ALTER COLUMN Pais SET NOT NULL;
ALTER TABLE Localidad ALTER COLUMN Calle SET NOT NULL;

-- Tabla Evento
CREATE TABLE Evento(
	IDevento SERIAL8,
	IDdisciplina VARCHAR(50),
	Fase VARCHAR(50),
	Precio MONEY,
	Fecha DATE,
	Hora_Inicio TIMETZ,
	Hora_Fin TIMETZ,
	Entradas_Vendidas INT
);
comment on table Evento is 'Tabla que contiene los eventos';
comment on column Evento.IDevento is 'Identificador unico del evento';
comment on column Evento.IDdisciplina is 'Nombre de la disciplina, no puede ser nulo';
comment on column Evento.Fase is 'Fase del evento, no puede ser nulo';
comment on column Evento.Precio is 'Precio de entrada al evento, no puede ser nulo';
comment on column Evento.Fecha is 'Fecha del evento, no puede ser nulo';
comment on column Evento.Hora_Inicio is 'Hora de inicio del evento, no puede ser nulo';
comment on column Evento.Hora_Fin is 'Hora de termino del evento, no puede ser nulo';
comment on column Evento.Entradas_Vendidas is 'Cantidad de entradas vendidas al evento, no puede ser nulo';


-- Restricciones de Entidad Evento
ALTER TABLE Evento ADD CONSTRAINT PK_Evento PRIMARY KEY (IDevento);
comment on constraint PK_Evento on Evento is 'Llave primaria de la tabla Evento';

-- Restricciones de Dominio Evento
ALTER TABLE Evento ALTER COLUMN IDdisciplina SET NOT NULL;
ALTER TABLE Evento ALTER COLUMN Fase SET NOT NULL;
ALTER TABLE Evento ALTER COLUMN Precio SET NOT NULL;
ALTER TABLE Evento ALTER COLUMN Fecha SET NOT NULL;
ALTER TABLE Evento ALTER COLUMN Hora_Inicio SET NOT NULL;
ALTER TABLE Evento ALTER COLUMN Hora_Fin SET NOT NULL;
ALTER TABLE Evento ALTER COLUMN Entradas_Vendidas SET NOT NULL;

ALTER TABLE Evento add constraint EntradasV CHECK (Entradas_Vendidas > 0);
ALTER TABLE Evento ADD CONSTRAINT Fase CHECK (Fase <> '');
ALTER TABLE Evento ADD CONSTRAINT HoraFin CHECK (Hora_Fin > Hora_Inicio);
comment on constraint EntradasV on Evento is 'Restriccion check que asegura que el número de entradas vendidas sea mayor a 0';
comment on constraint Fase on Evento is 'Restriccion check que asegura que la Fase no sea la cadena vacia';
comment on constraint HoraFin on Evento is 'Restriccion check que asegura la Hora de Inicio sea menor que la Hora de Termino';

-- Tabla Supervisar
-- Relacion de Muchos a Muchos
CREATE TABLE Supervisar(
	IDarbitro SERIAL8, 
	IDevento SERIAL8
);
comment on table Supervisar is 'Tabla que indica quienes son los arbitros que supervisan a un evento';
comment on column Supervisar.IDarbitro is 'Identificador del arbitro, no puede ser nulo';
comment on column Supervisar.IDevento is 'Identificador del evento, no puede ser nulo';

-- Restricciones de Dominio Supervisar
ALTER TABLE Supervisar ALTER COLUMN IDarbitro SET NOT NULL;
ALTER TABLE Supervisar ALTER COLUMN IDevento SET NOT NULL;

-- Tabla Disciplina
CREATE TABLE Disciplina(
	IDdisciplina VARCHAR(50),
	Equipo BOOL,
    Individual BOOL,
    Num_Participantes_Equipo INT
);
comment on table Disciplina is 'Tabla que contiene la informacion de las disciplinas';
comment on column Disciplina.IDdisciplina is 'Nombre unico de la disciplina';
comment on column Disciplina.Equipo is 'Determina si la disciplina es en equipo, no puede ser nulo y por omision es False';
comment on column Disciplina.Individual is 'Determina si la disciplina es individual, no puede ser nulo y por omision es True';
comment on column Disciplina.Num_Participantes_Equipo is 'Numero de participantes en el equipo, no puede ser nulo y por omision es 1';

-- Restricciones de Dominio Disciplina
ALTER TABLE Disciplina ALTER COLUMN IDdisciplina SET NOT NULL;
ALTER TABLE Disciplina ALTER COLUMN Equipo SET NOT NULL;
ALTER TABLE Disciplina ALTER COLUMN Individual SET NOT NULL;
ALTER TABLE Disciplina ALTER COLUMN Num_Participantes_Equipo SET NOT NULL;

ALTER TABLE Disciplina ALTER COLUMN Equipo SET DEFAULT FALSE; 
ALTER TABLE Disciplina ALTER COLUMN Individual SET DEFAULT TRUE;
ALTER TABLE Disciplina ALTER COLUMN Num_Participantes_Equipo SET DEFAULT 1;

ALTER TABLE Disciplina add constraint ParticipantesEquipo CHECK (Num_Participantes_Equipo > 0);
comment on constraint ParticipantesEquipo on Disciplina is 'Restriccion check que asegura que el número de participantes por equipo sea mayor a 0';

ALTER TABLE Disciplina add constraint Participantes CHECK (Equipo <> Individual);
comment on constraint ParticipantesEquipo on Disciplina is 'Restriccion check que evita que una misma disciplina sea en Equipo e Individual a la vez';

-- Restricciones de Entidad Disciplina
ALTER TABLE Disciplina ADD CONSTRAINT PK_Disciplina PRIMARY KEY (IDdisciplina);
comment on constraint PK_Disciplina on Disciplina is 'Llave primaria de la tabla Disciplina';

-- Tabla Patrocinador
CREATE TABLE Patrocinador(
	IDdisciplina VARCHAR(50),
	Patrocinador VARCHAR(100)
);
comment on table Patrocinador is 'Tabla que contiene los patrocinadores de las disciplinas';
comment on column Patrocinador.IDdisciplina is 'Nombre de la disciplina, no puede ser nulo';
comment on column Patrocinador.Patrocinador is 'Nombre del patrocinador, no puede ser nulo';

-- Restricciones de Dominio Patrocinador
ALTER TABLE Patrocinador ALTER COLUMN IDdisciplina SET NOT NULL;
ALTER TABLE Patrocinador ALTER COLUMN Patrocinador SET NOT NULL;

ALTER TABLE Patrocinador ADD CONSTRAINT patrocinador_fkey CHECK(Patrocinador <> '');
comment on constraint patrocinador_fkey on Patrocinador is 'Restriccion check que asegura que el nombre del patrocinador no sea la cadena vacia';

-- Restricciones de Entidad Patrocinador
ALTER TABLE Patrocinador ADD CONSTRAINT PK_Patrocinador PRIMARY KEY (IDdisciplina, Patrocinador);
comment on constraint PK_Patrocinador on Patrocinador is 'Llave primaria de la tabla Patrocinador';


-- Tabla AtletaTener
create table AtletaTener(
	IDatleta SERIAL8,
	IDdisciplina VARCHAR(50)
);
comment on table AtletaTener is 'Tabla que contiene a los atletas y las disciplinas en las que participan';
comment on column AtletaTener.IDatleta is 'Identificador del atleta, no puede ser nulo';
comment on column AtletaTener.IDdisciplina is 'Nombre de la disciplina, no puede ser nulo';


-- Restricciones de Dominio AtletaTener
ALTER TABLE AtletaTener ALTER COLUMN IDatleta SET NOT NULL;
ALTER TABLE AtletaTener ALTER COLUMN IDdisciplina SET NOT NULL;

-- Restricciones de Integridad Referencial AtletaTener
ALTER TABLE AtletaTener ADD CONSTRAINT FKAtletaTener_atleta FOREIGN KEY(IDatleta) REFERENCES Atleta(IDatleta)
on UPDATE cascade on delete CASCADE;
ALTER TABLE AtletaTener ADD CONSTRAINT FKAtletaTener_disciplina FOREIGN KEY(IDdisciplina) REFERENCES Disciplina(IDdisciplina) 
on UPDATE cascade on delete CASCADE;

comment on constraint FKAtletaTener_atleta on AtletaTener is 'Llave foranea del Atleta en la tabla AtletaTener';
comment on constraint FKAtletaTener_disciplina on AtletaTener is 'Llave foranea de la Disciplina en la tabla AtletaTener';

-- Tabla ArbitroTener
create table ArbitroTener(
	IDarbitro SERIAL8,
	IDdisciplina VARCHAR(50)
);
comment on table ArbitroTener is 'Tabla que contiene a los arbitros y las disciplinas a las que supervisan';
comment on column ArbitroTener.IDarbitro is 'Identificador del arbitro, no puede ser nulo';
comment on column ArbitroTener.IDdisciplina is 'Nombre de la disciplina, no puede ser nulo';

-- Restricciones de Dominio ArbitroTener
ALTER TABLE ArbitroTener ALTER COLUMN IDarbitro SET NOT NULL;
ALTER TABLE ArbitroTener ALTER COLUMN IDdisciplina SET NOT NULL;

-- Restricciones de Integridad Referencial ArbitroTener
ALTER TABLE ArbitroTener ADD CONSTRAINT FKArbitroTener_arbitro FOREIGN KEY(IDarbitro) REFERENCES Arbitro(IDarbitro)
on UPDATE cascade on delete CASCADE;
ALTER TABLE ArbitroTener ADD CONSTRAINT FKArbitroTener_disciplina FOREIGN KEY(IDdisciplina) REFERENCES Disciplina(IDdisciplina)
on UPDATE cascade on delete CASCADE;

comment on constraint FKArbitroTener_arbitro on ArbitroTener is 'Llave foranea del Arbitro en la tabla ArbitroTener';
comment on constraint FKArbitroTener_disciplina on ArbitroTener is 'Llave foranea de la Disciplina en la tabla ArbitroTener';

-- Tabla EntrenadorTener
create table EntrenadorTener(
	IDentrenador SERIAL8,
	IDdisciplina VARCHAR(50)
);
comment on table EntrenadorTener is 'Tabla que contiene a los entrenadores y las disciplinas a las que supervisan';
comment on column EntrenadorTener.IDentrenador is 'Identificador del entrenador, no puede ser nulo';
comment on column EntrenadorTener.IDdisciplina is 'Nombre de la disciplina, no puede ser nulo';

-- Restricciones de Dominio ArbitroTener
ALTER TABLE EntrenadorTener ALTER COLUMN IDentrenador SET NOT NULL;
ALTER TABLE EntrenadorTener ALTER COLUMN IDdisciplina SET NOT NULL;

-- Restricciones de Integridad Referencial EntrenadorTener
ALTER TABLE EntrenadorTener ADD CONSTRAINT FKEntrenadorTener_entrenador FOREIGN KEY(IDentrenador) REFERENCES Entrenador(IDentrenador)
on UPDATE cascade on delete CASCADE;
ALTER TABLE EntrenadorTener ADD CONSTRAINT FKEntrenadorTener_disciplina FOREIGN KEY(IDdisciplina) REFERENCES Disciplina(IDdisciplina)
on UPDATE cascade on delete CASCADE;

comment on constraint FKEntrenadorTener_entrenador on EntrenadorTener is 'Llave foranea del Entrenador en la tabla EntrenadorTener';
comment on constraint FKEntrenadorTener_disciplina on EntrenadorTener is 'Llave foranea de la Disciplina en la tabla EntrenadorTener';

-- Restricciones de Integridad Referencial Atleta
ALTER TABLE Atleta ADD CONSTRAINT FKAtleta_entrenador FOREIGN KEY(IDentrenador) REFERENCES Entrenador(IDentrenador)
on UPDATE cascade on delete CASCADE;
comment on constraint FKAtleta_entrenador on Atleta is 'Llave foranea del Entrenador en la tabla Atleta';

-- Restricciones de Integridad Referencial Participar
ALTER TABLE Participar ADD CONSTRAINT FKParticipar_evento FOREIGN KEY(IDevento) REFERENCES Evento(IDevento)
on UPDATE cascade on delete CASCADE;
ALTER TABLE Participar ADD CONSTRAINT FKParticipar_atleta FOREIGN KEY(IDatleta) REFERENCES Atleta(IDatleta)
on UPDATE cascade on delete CASCADE;

comment on constraint FKParticipar_evento on Participar is 'Llave foranea del Evento en la tabla Participar';
comment on constraint FKParticipar_atleta on Participar is 'Llave foranea del Atleta en la tabla Participar';

-- Restricciones de Integridad Referencial TelefonoAtleta
ALTER TABLE TelefonoAtleta ADD CONSTRAINT FKTel_IDatleta FOREIGN KEY(IDatleta) REFERENCES Atleta(IDatleta)
on UPDATE cascade on delete CASCADE;
comment on constraint FKTel_IDatleta on TelefonoAtleta is 'Llave foranea del Atleta en la tabla TelefonoAtleta';

-- Restricciones de Integridad Referencial CorreoAtleta
ALTER TABLE CorreoAtleta ADD CONSTRAINT FKCorreo_IDatleta FOREIGN KEY(IDatleta) REFERENCES Atleta(IDatleta)
on UPDATE cascade on delete CASCADE;
comment on constraint FKCorreo_IDatleta on CorreoAtleta is 'Llave foranea del Atleta en la tabla CorreoAtleta';

-- Restricciones de Integridad Referencial TelefonoEntrenador
ALTER TABLE TelefonoEntrenador ADD CONSTRAINT FKTel_IDentrenador FOREIGN KEY(IDentrenador) REFERENCES Entrenador(IDentrenador)
on UPDATE cascade on delete CASCADE;
comment on constraint FKTel_IDentrenador on TelefonoEntrenador is 'Llave foranea del Entrenador en la tabla TelefonoEntrenador';

-- Restricciones de Integridad Referencial CorreoEntrenador
ALTER TABLE CorreoEntrenador ADD CONSTRAINT FKCorreo_IDentrenador FOREIGN KEY(IDentrenador) REFERENCES Entrenador(IDentrenador)
on UPDATE cascade on delete CASCADE;
comment on constraint FKCorreo_IDentrenador on CorreoEntrenador is 'Llave foranea del Entrenador en la tabla CorreoEntrenador';

-- Restricciones de Integridad Referencial TelefonoArbitro
ALTER TABLE TelefonoArbitro ADD CONSTRAINT FKTel_IDarbitro FOREIGN KEY(IDarbitro) REFERENCES Arbitro(IDarbitro)
on UPDATE cascade on delete CASCADE;
comment on constraint FKTel_IDarbitro on TelefonoArbitro is 'Llave foranea del Arbitro en la tabla TelefonoArbitro';

-- Restricciones de Integridad Referencial CorreoArbitro
ALTER TABLE CorreoArbitro ADD CONSTRAINT FKCorreo_IDarbitro FOREIGN KEY(IDarbitro) references Arbitro(IDarbitro)
on UPDATE cascade on delete CASCADE;
comment on constraint FKCorreo_IDarbitro on CorreoArbitro is 'Llave foranea del Arbitro en la tabla CorreoArbitro';

-- Restricciones de Integridad Referencial Medalla
ALTER TABLE Medalla ADD CONSTRAINT FKMedalla_atleta FOREIGN KEY(IDatleta) REFERENCES Atleta(IDatleta) 
on UPDATE cascade on delete CASCADE;
ALTER TABLE Medalla ADD CONSTRAINT FKMedalla_evento FOREIGN KEY(IDevento) REFERENCES Evento(IDevento) 
on UPDATE cascade on delete CASCADE;
comment on constraint FKMedalla_atleta on Medalla is 'Llave foranea del Atleta en la tabla Medalla';
comment on constraint FKMedalla_evento on Medalla is 'Llave foranea del Evento en la tabla Medalla';

-- Restricciones de Integridad Referencial Asignar
ALTER TABLE Asignar ADD CONSTRAINT FKAsignar_localidad FOREIGN KEY(IDlocalidad) REFERENCES Localidad(IDlocalidad)
on UPDATE cascade on delete CASCADE;
ALTER TABLE Asignar ADD CONSTRAINT FKAsignar_disciplina FOREIGN KEY(IDdisciplina) REFERENCES Disciplina(IDdisciplina)
on UPDATE cascade on delete CASCADE;
comment on constraint FKAsignar_localidad on Asignar is 'Llave foranea de la Localidad en la tabla Asignar';
comment on constraint FKAsignar_disciplina on Asignar is 'Llave foranea de la Disciplina en la tabla Asignar';

-- Restricciones de Integridad Referencial Supervisar
ALTER TABLE Supervisar ADD CONSTRAINT FKSupervisar_arbitro FOREIGN KEY(IDarbitro) REFERENCES Arbitro(IDarbitro)
on UPDATE cascade on delete CASCADE;
ALTER TABLE Supervisar ADD CONSTRAINT FKSupervisar_evento FOREIGN KEY(IDevento) REFERENCES Evento(IDevento)
on UPDATE cascade on delete CASCADE;
comment on constraint FKSupervisar_arbitro on Supervisar is 'Llave foranea del Arbitro en la tabla Supervisar';
comment on constraint FKSupervisar_evento on Supervisar is 'Llave foranea del Evento en la tabla Supervisar';

-- Restricciones de Integridad Referencial Evento
ALTER TABLE Evento ADD CONSTRAINT FKEvento_disciplina FOREIGN KEY(IDdisciplina) REFERENCES Disciplina(IDdisciplina)
on UPDATE cascade on delete CASCADE;
comment on constraint FKEvento_disciplina on Evento is 'Llave foranea de la Disciplina en la tabla Evento';

-- Restricciones de Integridad Referencial Patrocinador
ALTER TABLE Patrocinador ADD CONSTRAINT FKPatrocinador_disciplina FOREIGN KEY(IDdisciplina) REFERENCES Disciplina(IDdisciplina)
on UPDATE cascade on delete CASCADE;
comment on constraint FKPatrocinador_disciplina on Patrocinador is 'Llave foranea de la Disciplina en la tabla Patrocinador';
