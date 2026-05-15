CREATE DATABASE placement_portal;

USE placement_portal;

CREATE TABLE users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    email VARCHAR(100),
    password VARCHAR(100),
    role VARCHAR(20)
);

INSERT INTO users(name,email,password,role)
VALUES('Admin','admin@gmail.com','admin123','admin');
