-- Muestra los espacios vacios o tipo null
SELECT * FROM users WHERE email is NULL;
-- Muestra los espacios que no esten vacios
SELECT * FROM users WHERE email is NOT NULL;