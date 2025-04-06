-- Usar la base de datos
USE GestionGastos;
GO

-- Insertar datos en la tabla Monedas
INSERT INTO Monedas (Codigo, Nombre, Simbolo) VALUES
('COP', 'Peso colombiano', '$'),
('USD', 'Dólar estadounidense', '$'),
('EUR', 'Euro', '€'),
('GBP', 'Libra esterlina', '£'),
('JPY', 'Yen japonés', '¥'),
('MXN', 'Peso mexicano', '$');
GO

-- Insertar datos base en la tabla Categorías
INSERT INTO Categorias (Nombre, Descripcion) VALUES
('Alimentación', 'Gastos relacionados con comida y supermercado'),
('Transporte', 'Costos de movilidad: buses, gasolina, taxis, etc.'),
('Entretenimiento', 'Cine, salidas, juegos, suscripciones'),
('Salud', 'Medicinas, consultas médicas, seguros'),
('Educación', 'Libros, cursos, matrícula'),
('Vivienda', 'Arriendo, servicios públicos, mantenimiento'),
('Ropa', 'Vestimenta, calzado y accesorios'),
('Otros', 'Gastos que no entran en ninguna categoría anterior');
GO

