-- ORDER BY: Organiza de forma ascendente y Descendiente 

-- Busca todo lo que este en la tala cursos y los ordena por nombre
SELECT * FROM cursos ORDER BY nombre;
-- Busca todo lo que este en la tala cursos y los ordena por nombre de forma descendiente
SELECT * FROM cursos ORDER BY nombre DESC;
-- Ordena si tiene el mismo nombre 
SELECT * FROM cursos WHERE nombre = 'Habilidades blandas' ORDER BY id_curso DESC;