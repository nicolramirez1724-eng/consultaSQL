CREATE DATABASE IF NOT EXISTS techstore;
USE techstore;

CREATE TABLE productos (
    id_producto  INT AUTO_INCREMENT PRIMARY KEY,
    nombre       VARCHAR(50)   NOT NULL,
    categoria    VARCHAR(50)   NOT NULL,
    precio       DECIMAL(10,2) NOT NULL,
    stock        INT           NOT NULL DEFAULT 0
);

CREATE TABLE clientes (
    id_cliente   INT AUTO_INCREMENT PRIMARY KEY,
    nombre       VARCHAR(100) NOT NULL,
    email        VARCHAR(100) UNIQUE,
    ciudad       VARCHAR(50)  NOT NULL
);

CREATE TABLE ventas (
    id_venta     INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente   INT NOT NULL,
    id_producto  INT NOT NULL,
    cantidad     INT NOT NULL,
    fecha_venta  DATE NOT NULL,
    FOREIGN KEY (id_cliente)  REFERENCES clientes(id_cliente),
    FOREIGN KEY (id_producto) REFERENCES productos(id_producto)
);

ALTER TABLE clientes
    ADD COLUMN telefono VARCHAR(20);

ALTER TABLE productos
    MODIFY COLUMN nombre VARCHAR(150) NOT NULL;

INSERT INTO productos (nombre, categoria, precio, stock) VALUES
    ('Mouse inalambrico',            'Perifericos',     45000.00,  50),
    ('Teclado mecanico RGB',         'Perifericos',    180000.00,  30),
    ('Monitor 24 pulgadas Full HD',  'Monitores',      650000.00,  15),
    ('Monitor 27 pulgadas 4K',       'Monitores',     1200000.00,  10),
    ('Portatil Core i5',             'Computadores',  2800000.00,   8),
    ('PC de escritorio Ryzen 5',     'Computadores',  2500000.00,   6),
    ('Memoria RAM 16GB',             'Componentes',    250000.00,  40),
    ('Disco SSD 1TB',                'Almacenamiento', 320000.00,  25),
    ('Audifonos Bluetooth',          'Audio',           95000.00,  60),
    ('Mochila para portatil',        'Accesorios',      60000.00,  35),
    ('Cable HDMI 2m DUPLICADO',      'Accesorios',      15000.00, 100);

INSERT INTO clientes (nombre, email, ciudad, telefono) VALUES
    ('Carlos Ramirez',  'carlos.ramirez@mail.com',  'Bucaramanga', '3001112233'),
    ('Laura Gomez',      'laura.gomez@mail.com',     'Bogota',      '3002223344'),
    ('Andres Torres',    'andres.torres@mail.com',   'Medellin',    '3003334455'),
    ('Sofia Martinez',   'sofia.martinez@mail.com',  'Cali',        '3004445566'),
    ('Juan Perez',       'juan.perez@mail.com',      'Cucuta',      '3005556677'),
    ('Maria Lopez',      'maria.lopez@mail.com',     'Bucaramanga', '3006667788');

SELECT id_cliente FROM clientes;
SELECT id_producto FROM productos WHERE id_producto <= 10;

INSERT INTO ventas (id_cliente, id_producto, cantidad, fecha_venta) VALUES
    (1, 1, 2, '2026-01-05'),
    (2, 3, 1, '2026-01-06'),
    (3, 5, 1, '2026-01-08'),
    (1, 7, 3, '2026-01-10'),
    (4, 2, 1, '2026-01-12'),
    (5, 9, 2, '2026-01-15'),
    (6, 4, 1, '2026-01-18'),
    (2, 1, 1, '2026-01-20'),
    (3, 8, 2, '2026-01-22'),
    (1, 3, 1, '2026-01-25'),
    (4, 10, 3, '2026-01-28'),
    (6, 6, 1, '2026-02-01'),
    (5, 7, 1, '2026-02-03'),
    (2, 9, 2, '2026-02-05');

SELECT id_producto, nombre, precio FROM productos WHERE id_producto = 9;

UPDATE productos
SET precio = 89000.00
WHERE id_producto = 9;

SELECT id_producto, stock FROM productos WHERE id_producto = 2;

UPDATE productos
SET stock = stock - 1
WHERE id_producto = 2;

SELECT * FROM productos WHERE nombre = 'Cable HDMI 2m DUPLICADO';
SELECT * FROM ventas WHERE id_producto = (
    SELECT id_producto FROM productos WHERE nombre = 'Cable HDMI 2m DUPLICADO'
);

DELETE FROM productos
WHERE nombre = 'Cable HDMI 2m DUPLICADO';

SELECT * FROM productos;

SELECT nombre, precio FROM productos;

SELECT nombre, precio AS precio_unitario FROM productos;

SELECT nombre, precio
FROM productos
WHERE precio > 500000;

SELECT nombre, ciudad
FROM clientes
WHERE ciudad = 'Bucaramanga';

SELECT nombre, categoria
FROM productos
WHERE categoria = 'Monitores';

SELECT nombre, categoria, precio
FROM productos
WHERE categoria = 'Perifericos'
  AND precio < 100000;

SELECT nombre, ciudad
FROM clientes
WHERE ciudad = 'Bogota' OR ciudad = 'Medellin';

SELECT nombre, ciudad
FROM clientes
WHERE ciudad IN ('Bogota', 'Medellin');

SELECT nombre, precio
FROM productos
WHERE precio BETWEEN 50000 AND 300000;

SELECT nombre, categoria
FROM productos
WHERE categoria IN ('Perifericos', 'Accesorios', 'Audio');

SELECT nombre
FROM productos
WHERE nombre LIKE '%Bluetooth%';

SELECT nombre, precio
FROM productos
ORDER BY precio ASC;

SELECT nombre, stock
FROM productos
ORDER BY stock DESC;

SELECT nombre, categoria, precio
FROM productos
WHERE categoria = 'Computadores'
ORDER BY precio DESC;
