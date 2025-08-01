-- Creacion de tablas 
CREATE TABLE estudiantes (
	id_estudiante int AUTO_INCREMENT PRIMARY KEY,
	nombre varchar(45) NOT NULL,
    segundo_nombre varchar(45),
    apellido varchar(45) NOT NULL,
    segundo_apellido varchar(45) NOT NULL,
    correo varchar(100), 
    id_genero int,
    id_carrera int,
    identificacion int,
    fecha_nacimiento date,
    fecha_ingreso datetime DEFAULT CURRENT_TIMESTAMP(),
    UNIQUE(correo, identificacion)
);

CREATE TABLE generos (
	id_genero int AUTO_INCREMENT PRIMARY KEY, 
    genero varchar(20) NOT NULL,
    abreviacion_genero varchar(2) NOT NULL
);

ALTER TABLE estudiantes
ADD CONSTRAINT fk_genero
FOREIGN KEY(id_genero) REFERENCES generos(id_genero);

CREATE TABLE departamentos(
	id_departamento int AUTO_iNCREMENT PRIMARY KEY,
	nombre_departamento varchar(50),
    UNIQUE(id_departamento, nombre_departamento)
);

CREATE TABLE docentes (
	id_docentes int AUTO_iNCREMENT PRIMARY KEY,
    nombre varchar(45) NOT NULL,
    segundo_nombre varchar(45),
    apellido varchar(45) NOT NULL,
    segundo_apellido varchar(45) NOT NULL,
    correo varchar(100), 
    id_departamento int,
    anios_experiencia int,
    FOREIGN KEY(id_departamento) REFERENCES departamentos(id_departamento),
	UNIQUE(id_docentes, correo, id_departamento)
);

ALTER TABLE docentes 
RENAME COLUMN id_docentes TO id_docente;

ALTER TABLE docentes
ADD edad int
CHECK(edad > 18)
; 

CREATE TABLE carreras(
	id_carrera int AUTO_iNCREMENT PRIMARY KEY,
	nombre_carrera varchar(50) NOT NULL,
    id_departamento int,
    FOREIGN KEY(id_departamento) REFERENCES departamentos(id_departamento),
    UNIQUE(id_carrera, nombre_carrera)
);

ALTER TABLE estudiantes
ADD CONSTRAINT fk_carrera
FOREIGN KEY(id_carrera) REFERENCES carreras(id_carrera);

CREATE TABLE calificacion(
	id_calificacion int AUTO_INCREMENT PRIMARY KEY,
    calificacion int,
    CHECK(calificacion >= 0 AND calificacion <= 100)
);

RENAME TABLE calificacion TO calificaciones;

CREATE TABLE cursos (
	id_curse int AUTO_INCREMENT PRIMARY KEY,
    nombre varchar(100) NOT NULL,
    codigo int NOT NULL,
    creditos int NOT NULL,
    semestre int NOT NULL,
    id_docente int,
    FOREIGN KEY(id_docente) REFERENCES docentes(id_docente),
    UNIQUE(nombre, codigo)
);

ALTER TABLE cursos
RENAME COLUMN id_curse TO id_curso;

CREATE TABLE inscripciones (
	id_inscripcion int AUTO_INCREMENT PRIMARY KEY,
    id_estudiante int,
    id_curso int,
    fecha_inscripcion datetime DEFAULT CURRENT_TIMESTAMP(),
    id_calificacion int,
    anios_experiencia int
);

ALTER TABLE inscripciones 
DROP COLUMN anios_experiencia;

ALTER TABLE inscripciones
ADD CONSTRAINT fk_estudiante
FOREIGN KEY(id_estudiante) REFERENCES estudiantes(id_estudiante);

ALTER TABLE inscripciones
ADD CONSTRAINT fk_curso
FOREIGN KEY(id_curso) REFERENCES cursos(id_curso);

ALTER TABLE inscripciones
ADD CONSTRAINT fk_calificacion
FOREIGN KEY(id_calificacion) REFERENCES calificaciones(id_calificacion);

-- Insertar 5 estudiantes, 3 docentes y 4 cursos
-- Genera 8 inscripciones distribuidas entre los cursos y estudiantes 

-- Generos
INSERT INTO generos(genero, abreviacion_genero) 
VALUES 
('Masculino','M'), ('Femenino','F');

-- Departamentos
INSERT INTO departamentos(nombre_departamento) 
VALUES
('Ingenieria'), ('Diseño'), ('Salud'); 

-- Docentes
INSERT INTO docentes(nombre, apellido, segundo_apellido, correo, id_departamento, anios_experiencia, edad) 
VALUES 
('Javier', 'Combita', 'Florez', 'javier@riwi.com', 1, 5,28),
('Naydeth', 'De la hoz', 'Florez', 'naydeth@riwi.com', 1, 12,28),
('Moises', 'Cantillo', 'Fluminense', 'moises@riwi.com', 1, 7,28);

-- Cursos
INSERT INTO cursos(nombre, codigo, creditos, semestre, id_docente) 
VALUES 
('Desarrollo Web', 1001, 5, 3, 1),
('Fundamentos de base de datos', 1002, 5, 3, 1),
('Backend', 1003, 5, 3, 1);

-- Carreras
INSERT INTO carreras(nombre_carrera, id_departamento) 
VALUES 
('Ingenieria de sistema', 1),
('Arquitectura', 2),
('Medicina', 3);

-- Estudiantes
INSERT INTO estudiantes(nombre, apellido, segundo_apellido, correo, id_genero, id_carrera, identificacion, fecha_nacimiento) 
VALUES
('Juan','Cardona','Rengifo', 'juan@gmail.com', 1, 2, 11400000, '1998-10-24'),
('María','Pérez','González', 'maria.perez@gmail.com', 2, 3, 11500001, '1999-05-10'),
('Carlos','Rodríguez','Martínez', 'carlos@gmail.com', 1, 1, 11600002, '1997-08-15'),
('Lucía','López','Hernández', 'lucia.lopez@gmail.com', 2, 2, 11700003, '2000-12-05'),
('Gabriela','Yanes','Pardo', 'yanes@gmail.com', 2, 2, 11400000, '2022-09-19');

-- Calificaciones
INSERT INTO calificaciones(calificacion) VALUES
(95),(80),(70),(50),(75);

-- Inscripciones 
INSERT INTO inscripciones(id_estudiante, id_curso, id_calificacion) 
VALUES
(1, 1, 1),(2, 2, 2),(3, 1, 3),(4, 3, 4),(5,1,5);

-- CONSULTAS BASICAS
-- Obtener el listado de todos los estudiantes junto con sus inscripciones y cursos (JOIN).
SELECT 
    e.id_estudiante, e.nombre, e.apellido, e.correo, 
    c.nombre AS curso_nombre, i.fecha_inscripcion
FROM 
    estudiantes e
JOIN 
    inscripciones i ON e.id_estudiante = i.id_estudiante
JOIN 
    cursos c ON i.id_curso = c.id_curso;

-- Listar los cursos dictados por docentes con más de 5 años de experiencia.

SELECT 
    c.nombre AS curso, d.nombre AS docente, d.anios_experiencia
FROM 
    cursos c
JOIN 
    docentes d ON c.id_docente = d.id_docente
WHERE 
    d.anios_experiencia > 5;

-- Obtener el promedio de calificaciones por curso (GROUP BY + AVG).

SELECT 
    c.nombre AS curso, AVG(cal.calificacion) AS promedio_calificacion
FROM 
    calificaciones cal
JOIN 
    inscripciones i ON cal.id_calificacion = i.id_calificacion
JOIN 
    cursos c ON i.id_curso = c.id_curso
GROUP BY 
    c.id_curso;

-- Mostrar los estudiantes que están inscritos en más de un curso (HAVING COUNT(*) > 1).
SELECT 
    e.id_estudiante, e.nombre, e.apellido, COUNT(i.id_curso) AS num_cursos
FROM 
    estudiantes e
JOIN 
    inscripciones i ON e.id_estudiante = i.id_estudiante
GROUP BY 
    e.id_estudiante
HAVING 
    COUNT(i.id_curso) > 1;

-- Agregar una nueva columna estado_academico a la tabla estudiantes (ALTER TABLE).
ALTER TABLE estudiantes 
ADD estado_academico VARCHAR(20);

-- Eliminar un docente y observar el efecto en la tabla cursos (uso de ON DELETE en FK).
ALTER TABLE cursos
ADD CONSTRAINT fk_docente
FOREIGN KEY(id_docente) REFERENCES docentes(id_docente)
ON DELETE CASCADE;

-- Consultar los cursos en los que se han inscrito más de 2 estudiantes (GROUP BY + COUNT + HAVING).
SELECT 
    c.nombre AS curso, COUNT(i.id_estudiante) AS num_estudiantes
FROM 
    cursos c
JOIN 
    inscripciones i ON c.id_curso = i.id_curso
GROUP BY 
    c.id_curso
HAVING 
    COUNT(i.id_estudiante) > 2;

-- SUBCONSULTAS
-- Obtener los estudiantes cuya calificación promedio es superior al promedio general (AVG() + subconsulta).
SELECT 
    e.nombre, e.apellido,
    (SELECT AVG(cal.calificacion) 
     FROM calificaciones cal 
     JOIN inscripciones i ON cal.id_calificacion = i.id_calificacion 
     WHERE i.id_estudiante = e.id_estudiante) AS promedio_estudiante
FROM 
    estudiantes e
WHERE  
    (SELECT AVG(cal.calificacion) 
     FROM calificaciones cal 
     JOIN inscripciones i ON cal.id_calificacion = i.id_calificacion 
     WHERE i.id_estudiante = e.id_estudiante) > 
    (SELECT AVG(cal.calificacion) 
     FROM calificaciones cal);

-- Mostrar los nombres de las carreras con estudiantes inscritos en cursos del semestre 2 o posterior (IN o EXISTS).
SELECT 
    c.nombre_carrera
FROM 
    carreras c
WHERE 
    EXISTS (
        SELECT 1 
        FROM inscripciones i
        JOIN cursos cu ON i.id_curso = cu.id_curso
        WHERE cu.id_docente = c.id_departamento 
        AND cu.semestre >= 2
    );

-- Utiliza funciones como ROUND, SUM, MAX, MIN y COUNT para explorar distintos indicadores del sistema.
SELECT 
    COUNT(*) AS num_estudiantes,
    ROUND(AVG(cal.calificacion), 2) AS promedio_calificaciones,
    MAX(cal.calificacion) AS max_calificacion,
    MIN(cal.calificacion) AS min_calificacion,
    SUM(cal.calificacion) AS suma_calificaciones
FROM 
    calificaciones cal;

-- CREAR UNA VISTA
-- Crea una vista llamada vista_historial_academico que muestre:
-- Nombre del estudiante
-- Nombre del curso
-- Nombre del docente
-- Semestre
-- Calificación final
CREATE VIEW vista_historial_academico AS
SELECT 
    e.nombre AS nombre_estudiante,
    e.apellido AS apellido_estudiante,
    cu.nombre AS nombre_curso,  
    d.nombre AS nombre_docente,
    cu.semestre AS semestre,
    cal.calificacion AS calificacion_final
FROM 
    estudiantes e
JOIN 
    inscripciones i ON e.id_estudiante = i.id_estudiante
JOIN 
    cursos cu ON i.id_curso = cu.id_curso  
JOIN 
    docentes d ON cu.id_docente = d.id_docente
JOIN 
    calificaciones cal ON i.id_calificacion = cal.id_calificacion;

-- CONTROL DE ACCESO Y TRANSACCIONES 
CREATE ROLE revisor_academico;
GRANT SELECT ON vista_historial_academico TO revisor_academico;

-- Revoca los permisos de modificación de datos sobre la tabla inscripciones a este rol (REVOKE).
GRANT SELECT, INSERT, UPDATE, DELETE ON inscripciones TO revisor_academico;
REVOKE INSERT, UPDATE, DELETE ON inscripciones FROM revisor_academico;
SHOW GRANTS FOR revisor_academico;

-- Simula una operación de actualización de calificaciones usando BEGIN, SAVEPOINT, ROLLBACK y COMMIT.
BEGIN;

SAVEPOINT antes_de_actualizar;

UPDATE calificaciones
SET calificacion = 85
WHERE id_calificacion = 1;

COMMIT;
