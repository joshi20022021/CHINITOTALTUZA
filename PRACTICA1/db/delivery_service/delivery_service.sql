-- Servicio de Delivery
CREATE SCHEMA IF NOT EXISTS delivery;

DROP TYPE IF EXISTS delivery.delivery_status CASCADE;
CREATE TYPE delivery.delivery_status AS ENUM ('PENDIENTE', 'ASIGNADA', 'EN_CAMINO', 'ENTREGADO', 'CANCELADO');

CREATE TABLE delivery.entregas (
    id SERIAL PRIMARY KEY,
    orden_id INT NOT NULL UNIQUE,
    repartidor_id INT,
    nombre_repartidor VARCHAR(150),
    estado delivery.delivery_status DEFAULT 'PENDIENTE',
    fecha_asignacion TIMESTAMP,
    fecha_entrega TIMESTAMP
);

INSERT INTO delivery.entregas (orden_id, repartidor_id, nombre_repartidor, estado, fecha_asignacion, fecha_entrega) VALUES 
(1, 5, 'Carlos Veloz', 'ENTREGADO', NOW(), NOW()),
(2, 5, 'Carlos Veloz', 'EN_CAMINO', NOW(), NULL),
(3, 5, 'Carlos Veloz', 'PENDIENTE', NULL, NULL), 
(4, NULL, NULL, 'PENDIENTE', NULL, NULL),
(5, NULL, NULL, 'CANCELADO', NULL, NULL),
(6, NULL, NULL, 'CANCELADO', NULL, NULL),
(7, 5, 'Carlos Veloz', 'ASIGNADA', NOW(), NULL),
(8, NULL, NULL, 'PENDIENTE', NULL, NULL),
(9, 5, 'Carlos Veloz', 'ENTREGADO', NOW(), NOW()),
(10, NULL, NULL, 'PENDIENTE', NULL, NULL);