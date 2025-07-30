-- Consultar algo que no sabes el valor exacto

SELECT * FROM usuarios WHERE correo LIKE '%riwi.com'

SELECT * FROM usuarios WHERE correo LIKE 'ana%'

SELECT * FROM usuarios WHERE correo LIKE '%@%'