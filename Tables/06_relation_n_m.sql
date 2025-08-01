CREATE TABLE lenguages(
	language_id int AUTO_INCREMENT PRIMARY KEY,
    name varchar(100) NOT NULL
);


CREATE TABLE users_lenguage(
    users_lenguage_id int AUTO_INCREMENT PRIMARY KEY,
    user_id int,
    language_id int,
    FOREIGN KEY(user_id) REFERENCES users(user_id),
    FOREIGN KEY(language_id) REFERENCES users(language_id),
    UNIQUE(user_id, language_id)
)

