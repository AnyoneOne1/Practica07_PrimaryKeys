-- Consulta i
-- Atletas cuyo nombre empiece con la letra R.
SELECT * FROM Atleta WHERE Nombre LIKE 'R%';

-- Consulta ii
-- Entrenadores que hayan nacido en el mes de junio
select * from Entrenador where extract(month from nacimiento) = 6;

-- Consulta iii
-- Eventos que hayan ocurrido entre el 1 de enero del 2024 y del 14 de abril del 2024.
select * from Evento where Fecha between '2024-01-01' and '2024-04-14';

-- Consulta iv
-- Localidades cuyo aforo sean mayor a 400 personas.
select * from Localidad where Aforo >= 400;

-- Consulta v
-- Todos los Patrocinadores que se tengan registrados en los Juegos Olimpicos.
select * from patrocinador; 