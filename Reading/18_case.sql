SELECT *,
CASE
	WHEN age >= 18 THEN 'Es mayor de edad'
    ELSE 'Es menor de edad'
END AS agetext
FROM users; 

SELECT *,
CASE
	WHEN age > 18 THEN 'Es mayor de edad'
    WHEN age = 18 THEN 'Acaba de cumplir 18'
    ELSE 'Es menor de edad'
END AS agetext
FROM users; 