INSERT INTO auth.usuarios (email, password_hash, rol, nombre_completo, telefono) VALUES 
('admin@delivereats.com', '$2b$12$hashAdmin', 'ADMINISTRADOR', 'Super Admin', '5555-0000'),
('juan.cliente@mail.com', '$2b$12$hashClient1', 'CLIENTE', 'Juan Pérez', '5555-1111'),
('maria.cliente@mail.com', '$2b$12$hashClient2', 'CLIENTE', 'María López', '5555-2222'),
('pizza.owner@mail.com', '$2b$12$hashRest1', 'RESTAURANTE', 'Mario Rossi', '5555-3333'),
('repartidor.veloz@mail.com', '$2b$12$hashRep1', 'REPARTIDOR', 'Carlos Veloz', '5555-4444');

INSERT INTO catalog.restaurantes (usuario_id, nombre, direccion, horarios_atencion, tipo_comida, telefono, calificacion) VALUES 
(4, 'Pizza Nostra', 'Zona 10, Ciudad', '10:00 - 22:00', 'Italiana', '2222-0001', 4.5),
(4, 'Burger King-Dom', 'Zona 4, Ciudad', '09:00 - 23:00', 'Hamburguesas', '2222-0002', 4.2),
(4, 'Tacos El Pastor', 'Zona 1, Ciudad', '11:00 - 22:00', 'Mexicana', '2222-0003', 4.8),
(4, 'Sushi Roll', 'Cayalá, Zona 16', '12:00 - 22:00', 'Japonesa', '2222-0004', 4.7),
(4, 'Pollo Campero', 'Zona 9, Ciudad', '07:00 - 21:00', 'Pollo', '2222-0005', 4.6),
(4, 'La Pasta Loca', 'Antigua Guatemala', '12:00 - 21:00', 'Pasta', '2222-0006', 4.0),
(4, 'Ensaladas Green', 'Zona 14, Ciudad', '08:00 - 18:00', 'Saludable', '2222-0007', 4.9),
(4, 'Postres Doña Mary', 'Mixco, Zona 1', '09:00 - 19:00', 'Postres', '2222-0008', 4.3),
(4, 'Chino Express', 'Roosevelt, Zona 11', '10:00 - 20:00', 'Asiática', '2222-0009', 3.8),
(4, 'Asados La Parrilla', 'Carretera a El Salvador', '12:00 - 23:00', 'Carnes', '2222-0010', 4.5);

INSERT INTO catalog.items_menu (restaurante_id, nombre, descripcion, precio, disponible) VALUES 
(1, 'Pizza Margherita', 'Clásica italiana', 85.00, TRUE),
(2, 'Doble Queso Burger', 'Carne Angus', 55.00, TRUE),
(3, 'Tacos al Pastor (3)', 'Con piña y salsa', 35.00, TRUE),
(4, 'California Roll', 'Cangrejo y aguacate', 60.00, TRUE),
(5, 'Menú Super Campero', 'Pollo frito y papas', 45.00, TRUE),
(6, 'Lasaña Boloñesa', 'Salsa de carne', 70.00, TRUE),
(7, 'Ensalada César', 'Pollo a la plancha', 50.00, TRUE),
(8, 'Pastel de Chocolate', 'Porción grande', 25.00, TRUE),
(9, 'Arroz Frito', 'Con camarones', 40.00, TRUE),
(10, 'Puyazo Importado', '12 onzas', 125.00, TRUE);

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

INSERT INTO notifications.log_correos (usuario_id, orden_id, tipo_notificacion, contenido_mensaje) VALUES 
(2, 1, 'ORDEN_ENTREGADA', 'Su pedido ha sido entregado en Zona 10.'),
(3, 2, 'ORDEN_EN_CAMINO', 'Carlos Veloz lleva su pedido a Zona 4.'),
(2, 3, 'ORDEN_LISTA', 'Su pedido está listo para ser recogido por el repartidor.'),
(3, 4, 'ORDEN_CREADA', 'Hemos recibido su orden para Sushi Roll.'),
(2, 5, 'ORDEN_CANCELADA', 'Su orden fue cancelada. Razón: Cambio de opinión.'),
(3, 6, 'ORDEN_RECHAZADA', 'El restaurante rechazó su orden por falta de ingredientes.'),
(2, 7, 'ORDEN_EN_CAMINO', 'Su pedido va en camino a Zona 14.'),
(3, 8, 'ORDEN_CREADA', 'Orden confirmada para Postres Doña Mary.'),
(2, 9, 'ORDEN_ENTREGADA', 'Su comida asiática fue entregada en Zona 11.'),
(3, 10, 'ORDEN_CREADA', 'Orden recibida para Asados La Parrilla.');

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