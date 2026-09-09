# consultaSQL
```
CREATE TABLE empleado(
id_empleado INT PRIMARY KEY AUTO_INCREMENT,
nombre varchar(100) NOT NULL,
email varchar(100) UNIQUE,
salario decimal (200,2) NOT NULL CHECK (salario>=0),
id_DEPARTAMENTO INT NOT NULL,
FECHA_CONTRATACION DATE,
FOREIGN KEY(ID_DEPARTAMENTO) REFERENCES DEPARTAMENTO(ID_DEPARTAMENTO)
);

CREATE TABLE departamento(
id_departamento INT PRIMARY KEY AUTO_INCREMENT
nombre varchar (80)NOT NULL
);

creaate TABLE productos_prueba(
id INT PRIMARY KEY AUTO_INCREMENT
nombre varchar(100) NOT NULL
);

ALTER TABLE producto_prueba ADD COLUMN precio decimal(10,2)
DROP TABLE productos_prueba;
```
