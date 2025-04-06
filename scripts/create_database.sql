 -- Crear la base de datos
CREATE DATABASE GestionGastos;
GO

-- Usar la base de datos
USE GestionGastos;
GO

-- Tabla: Usuarios
CREATE TABLE Usuarios (
    Id INT PRIMARY KEY IDENTITY,
    Nombre NVARCHAR(100) NOT NULL,
    Email NVARCHAR(100) NOT NULL UNIQUE,
    PasswordHash NVARCHAR(MAX) NOT NULL,
    FechaRegistro DATETIME NOT NULL
);
GO

-- Tabla: Categorías
CREATE TABLE Categorias (
    Id INT PRIMARY KEY IDENTITY,
    Nombre NVARCHAR(100) NOT NULL,
    Descripcion NVARCHAR(255)
);
GO

-- Tabla: Monedas
CREATE TABLE Monedas (
    Id INT PRIMARY KEY IDENTITY,
    Codigo NVARCHAR(10) NOT NULL,
    Nombre NVARCHAR(50) NOT NULL,
    Simbolo NVARCHAR(10)
);
GO

-- Tabla: Gastos
CREATE TABLE Gastos (
    Id INT PRIMARY KEY IDENTITY,
    UsuarioId INT NOT NULL,
    CategoriaId INT NOT NULL,
    MonedaId INT NOT NULL,
    Monto DECIMAL(18, 2) NOT NULL,
    Fecha DATETIME NOT NULL,
    Descripcion NVARCHAR(255),

    CONSTRAINT FK_Gastos_Usuarios FOREIGN KEY (UsuarioId) REFERENCES Usuarios(Id),
    CONSTRAINT FK_Gastos_Categorias FOREIGN KEY (CategoriaId) REFERENCES Categorias(Id),
    CONSTRAINT FK_Gastos_Monedas FOREIGN KEY (MonedaId) REFERENCES Monedas(Id)
);
GO

-- Tabla: Presupuestos
CREATE TABLE Presupuestos (
    Id INT PRIMARY KEY IDENTITY,
    UsuarioId INT NOT NULL,
    CategoriaId INT NOT NULL,
    MonedaId INT NOT NULL,
    Limite DECIMAL(18, 2) NOT NULL,
    FechaInicio DATETIME NOT NULL,
    FechaFin DATETIME NOT NULL,

    CONSTRAINT FK_Presupuestos_Usuarios FOREIGN KEY (UsuarioId) REFERENCES Usuarios(Id),
    CONSTRAINT FK_Presupuestos_Categorias FOREIGN KEY (CategoriaId) REFERENCES Categorias(Id),
    CONSTRAINT FK_Presupuestos_Monedas FOREIGN KEY (MonedaId) REFERENCES Monedas(Id)
);
GO

-- Índices en claves foráneas
CREATE INDEX IX_Gastos_UsuarioId ON Gastos(UsuarioId);
CREATE INDEX IX_Gastos_CategoriaId ON Gastos(CategoriaId);
CREATE INDEX IX_Gastos_MonedaId ON Gastos(MonedaId);

CREATE INDEX IX_Presupuestos_UsuarioId ON Presupuestos(UsuarioId);
CREATE INDEX IX_Presupuestos_CategoriaId ON Presupuestos(CategoriaId);
CREATE INDEX IX_Presupuestos_MonedaId ON Presupuestos(MonedaId);
GO
