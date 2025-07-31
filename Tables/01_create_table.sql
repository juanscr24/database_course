CREATE TABLE persons (
	id int,
    name varchar(50),
    age int,
    email varchar(50),
    created date
);

CREATE TABLE persons2 (
	id int NOT NULL,
    name varchar(50) NOT NULL,
    age int,
    email varchar(50) NOT NULL,
    created date
);

CREATE TABLE persons4 (
	id int NOT NULL,
    name varchar(50) NOT NULL,
    age int,
    email varchar(50) NOT NULL,
    created datetime,
    UNIQUE(id),
    PRIMARY KEY(id)
);

CREATE TABLE persons5 (
	id int NOT NULL,
    name varchar(50) NOT NULL,
    age int,
    email varchar(50) NOT NULL,
    created datetime,
    UNIQUE(id),
    PRIMARY KEY(id),
    CHECK(age>=18)
);

CREATE TABLE persons6 (
	id int NOT NULL,
    name varchar(50) NOT NULL,
    age int,
    email varchar(50),
    created datetime DEFAULT CURRENT_TIMESTAMP(),
    UNIQUE(id),
    PRIMARY KEY(id),
    CHECK(age>=18)
);

CREATE TABLE persons7 (
	id int NOT NULL AUTO_INCREMENT,
    name varchar(50) NOT NULL,
    age int,
    email varchar(50),
    created datetime DEFAULT CURRENT_TIMESTAMP(),
    
    UNIQUE(id),
    PRIMARY KEY(id),
    CHECK(age>=18)
);