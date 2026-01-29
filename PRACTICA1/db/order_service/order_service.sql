-- Servicio de Órdenes
CREATE SCHEMA IF NOT EXISTS orders;

DROP TYPE IF EXISTS orders.order_status CASCADE;
CREATE TYPE orders.order_status AS ENUM ('CREADA', 'EN_PROCESO', 'LISTA', 'FINALIZADA', 'RECHAZADA', 'CANCELADA');

CREATE TABLE orders.ordenes (
    id SERIAL PRIMARY KEY,
    numero_orden VARCHAR(50) NOT NULL UNIQUE,
    cliente_id INT NOT NULL,
    restaurante_id INT NOT NULL,
    estado orders.order_status NOT NULL DEFAULT 'CREADA',
    monto_total DECIMAL(10,2) NOT NULL,
    direccion_entrega TEXT NOT NULL,
    razon_rechazo TEXT,
    razon_cancelacion TEXT,
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    fecha_actualizacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP 
);

CREATE TABLE orders.detalle_orden (
    id SERIAL PRIMARY KEY,
    orden_id INT REFERENCES orders.ordenes(id),
    item_menu_id INT NOT NULL,
    nombre_producto VARCHAR(150),
    cantidad INT NOT NULL,
    precio_unitario DECIMAL(10,2) NOT NULL
);

INSERT INTO orders.ordenes (numero_orden, cliente_id, restaurante_id, estado, monto_total, direccion_entrega, fecha_actualizacion) VALUES 
('ORD-101', 2, 1, 'FINALIZADA', 85.00, 'Zona 10', NOW()),
('ORD-102', 3, 2, 'EN_PROCESO', 55.00, 'Zona 4', NOW()),
('ORD-103', 2, 3, 'LISTA', 35.00, 'Zona 1', NOW()),
('ORD-104', 3, 4, 'CREADA', 60.00, 'Zona 16', NOW()),
('ORD-105', 2, 5, 'CANCELADA', 45.00, 'Zona 9', NOW()),
('ORD-106', 3, 6, 'RECHAZADA', 70.00, 'Antigua', NOW()),
('ORD-107', 2, 7, 'EN_PROCESO', 50.00, 'Zona 14', NOW()),
('ORD-108', 3, 8, 'CREADA', 25.00, 'Mixco', NOW()),
('ORD-109', 2, 9, 'FINALIZADA', 40.00, 'Zona 11', NOW()),
('ORD-110', 3, 10, 'CREADA', 125.00, 'Carr. Salvador', NOW());

INSERT INTO orders.detalle_orden (orden_id, item_menu_id, nombre_producto, cantidad, precio_unitario) VALUES 
(1, 1, 'Pizza Margherita', 1, 85.00),
(2, 2, 'Doble Queso Burger', 1, 55.00),
(3, 3, 'Tacos al Pastor', 1, 35.00),
(4, 4, 'California Roll', 1, 60.00),
(5, 5, 'Menú Super Campero', 1, 45.00),
(6, 6, 'Lasaña Boloñesa', 1, 70.00),
(7, 7, 'Ensalada César', 1, 50.00),
(8, 8, 'Pastel de Chocolate', 1, 25.00),
(9, 9, 'Arroz Frito', 1, 40.00),
(10, 10, 'Puyazo Importado', 1, 125.00);