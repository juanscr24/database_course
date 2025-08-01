CREATE TABLE dni (
	dni_id int AUTO_INCREMENT PRIMARY KEY,
    dni_number int NOT NULL,
    id_user int,
    
    UNIQUE(dni_id),
    FOREIGN KEY(id_user) REFERENCES users(id_user)
);
