CREATE DATABASE IF NOT EXISTS tienda;
USE tienda;

CREATE TABLE IF NOT EXISTS clientes (
    id INT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    edad INT,
    ciudad VARCHAR(50),
    fecha_registro DATE
);

INSERT IGNORE INTO clientes (id, nombre, apellido, edad, ciudad, fecha_registro) VALUES
(1, 'geraldo', 'colchado', 20, 'Lima', '2026-01-15'),
(2, 'juan', 'salas', 15, 'Arequipa', '2026-02-03'),
(3, 'pedro', 'gamarra', 35, 'Cusco', '2026-02-20'),
(4, 'maria', 'quispe', 28, 'Lima', '2026-03-11'),
(5, 'lucia', 'fernandez', 22, 'Trujillo', '2026-04-02'),
(6, 'carlos', 'mendoza', 41, 'Piura', '2026-04-18'),
(7, 'ana', 'rojas', 30, 'Lima', '2026-05-07'),
(8, 'jorge', 'vargas', 19, 'Chiclayo', '2026-06-25'),
(9, 'sofia', 'huaman', 26, 'Huancayo', '2026-07-14'),
(10, 'diego', 'torres', 33, 'Lima', '2026-08-30');
