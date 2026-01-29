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