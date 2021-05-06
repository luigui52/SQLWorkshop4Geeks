-- CREAR UNA BASE DE DATOS
CREATE DATABASE intro_to_sql;

-- USE INDICA EL NOMBRE DE LA BASE DE DATOS
USE intro_to_sql;

SHOW tables;

--PONER NOMBRE CLARO Y CONCISO A LAS TABLAS QUE CREEMOS
CREATE TABLE users(
    id INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(50) NULL,
    apellido VARCHAR(50) NULL,
    email VARCHAR(50) NOT NULL,
    biografia MEDIUMTEXT NULL,
    PRIMARY KEY (id),
    UNIQUE KEY(email)
);

CREATE TABLE telefonos(
    id INT NOT NULL AUTO_INCREMENT,
    numero_telefono VARCHAR(100) NOT NULL,
    users_id INT NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY(users_id) REFERENCES users(id)
);

INSERT INTO users(nombre,apellido,email,biografia)VALUES('Luis','Hidalgo','luigui52@gmail.com',"Compliance Analyst and Full Stack Software Developer");
INSERT INTO users(nombre,apellido,email,biografia)VALUES('Jose','Perez','josetest@gmail.com',"Full Stack Software Developer");

SELECT nombre, apellido FROM users;
SELECT * FROM users;

UPDATE users SET biografia="Instructor 4Geeks / Fullstack Developer" WHERE id=1;

INSERT INTO telefonos (numero_telefono, users_id)VALUES('555-55-55',(SELECT id FROM users WHERE email='luigui52@gmail.com'));
DELETE FROM telefonos WHERE users_id=2;