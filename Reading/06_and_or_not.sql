-- Negacion
SELECT * FROM users WHERE NOT email = 'juanscr@gmail.com';

SELECT * FROM users WHERE NOT email = 'juanscr@gmail.com' AND age = 21;

SELECT * FROM users WHERE NOT email = 'juanscr@gmail.com' OR age = 21;
