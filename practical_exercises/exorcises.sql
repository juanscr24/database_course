-- 1 Selecciona todos los clientes registrados en Medellín.
SELECT * FROM clientes;
-- 2 Muestra los nombres y apellidos de los clientes que tienen entre 20 y 30 años.
SELECT nombre, apellido FROM clientes WHERE edad BETWEEN 20 AND 30;
-- 3 Lista las compras realizadas con el método de pago "Tarjeta".
SELECT * FROM compras WHERE metodo_pago = 'Tarjeta';
-- 4 Muestra los productos cuyo nombre contiene la palabra "Celular".
SELECT * FROM compras WHERE producto LIKE '%Celular%';
-- 5 Selecciona los clientes que aún no han registrado un correo electrónico.
SELECT * FROM clientes WHERE email IS NULL;
-- 6 Obtén los primeros 5 clientes registrados más recientemente.
SELECT * FROM clientes ORDER BY fecha_registro DESC LIMIT 5;
-- 7 Muestra las ciudades distintas en las que hay clientes.
SELECT DISTINCT ciudad FROM clientes;
-- 8 Filtra las compras que tuvieron una calificación de 5.
SELECT * FROM compras WHERE calificacion_compra = 5
-- 9 Muestra las compras realizadas en 2025.
SELECT * FROM compras WHERE fecha_compra BETWEEN '2025-01-01' AND '2025-12-31';
SELECT * FROM compras WHERE YEAR(fecha_compra) = 2025;
-- 10 Cuenta cuántas compras han sido pagadas por PSE.
SELECT COUNT(*) AS total_compras_pse FROM compras WHERE metodo_pago = 'PSE';
-- 11 Muestra cuántos clientes hay por ciudad.
SELECT ciudad, COUNT(*) AS total_clientes FROM clientes GROUP BY ciudad;
