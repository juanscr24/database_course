-- Buscas todo de las tablas que tenga igual algo

SELECT * FROM cursos WHERE nombre = "Desarrollo Web";

SELECT * FROM cursos WHERE id_curso = 1;

SELECT nombre FROM cursos WHERE id_curso = 1;

SELECT DISTINCT nombre FROM cursos WHERE id_curso = 1;
