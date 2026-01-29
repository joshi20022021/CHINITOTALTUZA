-- Servicio de Notificaciones
CREATE SCHEMA IF NOT EXISTS notifications;

CREATE TABLE notifications.log_correos (
    id SERIAL PRIMARY KEY,
    usuario_id INT NOT NULL,
    orden_id INT NOT NULL,
    tipo_notificacion VARCHAR(50),
    contenido_mensaje TEXT NOT NULL,
    fecha_envio TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

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