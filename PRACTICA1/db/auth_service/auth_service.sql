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

INSERT INTO auth.usuarios (email, password_hash, rol, nombre_completo, telefono) VALUES 
('admin@delivereats.com', '$2b$12$hashAdmin', 'ADMINISTRADOR', 'Super Admin', '5555-0000'),
('juan.cliente@mail.com', '$2b$12$hashClient1', 'CLIENTE', 'Juan Pérez', '5555-1111'),
('maria.cliente@mail.com', '$2b$12$hashClient2', 'CLIENTE', 'María López', '5555-2222'),
('pizza.owner@mail.com', '$2b$12$hashRest1', 'RESTAURANTE', 'Mario Rossi', '5555-3333'),
('repartidor.veloz@mail.com', '$2b$12$hashRep1', 'REPARTIDOR', 'Carlos Veloz', '5555-4444');