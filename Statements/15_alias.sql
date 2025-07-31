SELECT name, init_date AS 'fecha de inicio' FROM users WHERE age  BETWEEN 25 AND 30

SELECT CONCAT('Nombre: ', name, ' Apellido: ', last_name) as 'Nombre completo' FROM users;
