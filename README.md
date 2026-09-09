# consultaSQL
```
CREATE DATABASE pruebas;

USE pruebas;

CREATE TABLE departamento (
    id_departamento INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL
);

CREATE TABLE empleado (
    id_empleado INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(50) UNIQUE,
    salario DECIMAL(10,2) NOT NULL CHECK (salario >= 0),
    id_departamento INT NOT NULL,
    fecha_contratacion DATE,
    FOREIGN KEY (id_departamento) REFERENCES departamento(id_departamento)
);

CREATE TABLE categoria (
    id_categoria INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL
);

CREATE TABLE productos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    precio DECIMAL(10,2) NOT NULL,
    stock INT NOT NULL,
    id_categoria INT NOT NULL,
    FOREIGN KEY (id_categoria) REFERENCES categoria(id_categoria)
);

CREATE TABLE productos_prueba (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL
);

ALTER TABLE productos_prueba
ADD COLUMN precio DECIMAL(10,2);

DROP TABLE productos_prueba;

INSERT INTO productos (nombre, precio, stock, id_categoria)
VALUES ('Refrigerador Inverter 400L', 1899.90, 15, 3);

UPDATE productos
SET stock = stock - 1
WHERE id = 1;

SELECT * FROM productos;


```
