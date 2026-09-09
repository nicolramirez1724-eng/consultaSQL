# consultaSQL
```
CREATE TABLE empleado(
id_empleado INT PRIMARY KEY AUTO_INCREMENT,
nombre varchar(100) NOT NULL,
email varchar(100) UNIQUE,
salario decimal (10,2) NOT NULL CHECK (salario>=0),
id_DEPARTAMENTO INT NOT NULL,
FECHA_CONTRATACION DATE,
FOREIGN KEY(ID_DEPARTAMENTO) REFERENCES DEPARTAMENTO(ID_DEPARTAMENTO)
);

CREATE TABLE productos(
id INT PRIMARY KEY AUTO_INCREMENT,
nombre varchar(80) NOT NULL,
precio decimal(10,2) NOT NULL,
stock int NOT NULL,
id_categoria int NOT NULL
);


CREATE TABLE departamento(
id_departamento INT PRIMARY KEY AUTO_INCREMENT,
nombre varchar (80)NOT NULL
);

creaate TABLE productos_prueba(
id INT PRIMARY KEY AUTO_INCREMENT,
nombre varchar(100) NOT NULL
);

ALTER TABLE producto_prueba ADD COLUMN precio decimal(10,2)
DROP TABLE productos_prueba;

INSERT INTO productos (nombre, precio, stock, id_categoria)
VALUES

('Refrigerador Inverter 400L', 1899.90, 15, 3);

UPDATE productos SET stock = stock - 1
WHERE id = 1;

```
