-- Agregar a una columna
ALTER TABLE persons7
ADD surname varchar(50);
-- Renombrar una columna
ALTER TABLE persons7
RENAME COLUMN surname TO description;
-- Modificar una columna
ALTER TABLE persons7
MODIFY COLUMN description varchar(150);
-- Eliminar una columna
ALTER TABLE persons7
DROP COLUMN description;
