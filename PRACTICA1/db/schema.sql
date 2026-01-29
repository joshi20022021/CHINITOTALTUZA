-- Servicio de Autenticación
CREATE SCHEMA IF NOT EXISTS auth;

DROP TYPE IF EXISTS auth.user_role CASCADE;
CREATE TYPE auth.user_role AS ENUM ('CLIENTE', 'RESTAURANTE', 'REPARTIDOR', 'ADMINISTRADOR');

CREATE TABLE auth.usuarios (
    id SERIAL PRIMARY KEY,
    email VARCHAR(255) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    rol auth.user_role NOT NULL,
    nombre_completo VARCHAR(150),
    telefono VARCHAR(20),
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Servicio de Catálogo
CREATE SCHEMA IF NOT EXISTS catalog;

CREATE TABLE catalog.restaurantes (
    id SERIAL PRIMARY KEY,
    usuario_id INT NOT NULL,
    nombre VARCHAR(150) NOT NULL,
    direccion VARCHAR(255) NOT NULL,
    horarios_atencion VARCHAR(100),
    tipo_comida VARCHAR(50),
    telefono VARCHAR(20), 
    calificacion DECIMAL(2,1) DEFAULT 0.0,
    activo BOOLEAN DEFAULT TRUE
);

CREATE TABLE catalog.items_menu (
    id SERIAL PRIMARY KEY,
    restaurante_id INT REFERENCES catalog.restaurantes(id) ON DELETE CASCADE,
    nombre VARCHAR(150) NOT NULL,
    descripcion TEXT,
    precio DECIMAL(10,2) NOT NULL,
    disponible BOOLEAN DEFAULT TRUE
);

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