-- Crear base de datos
CREATE DATABASE Tienda;

-- Usar la base de datos
USE Tienda;

-- Crear tabla de roles
CREATE TABLE roles (
    idRol INT AUTO_INCREMENT PRIMARY KEY,
    nombre_rol VARCHAR(50) NOT NULL
);

-- Crear tabla de usuarios
CREATE TABLE usuarios (
    idUsuario INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    correo VARCHAR(100) NOT NULL UNIQUE,
    contrasena VARCHAR(255) NOT NULL,
    idRol INT,
    estatus ENUM('1', '2') DEFAULT '1',
    FOREIGN KEY (idRol) REFERENCES roles(idRol)
);

-- Crear tabla de productos
drop table productos;
CREATE TABLE productos (
    id_producto INT AUTO_INCREMENT PRIMARY KEY,
    nombre_producto VARCHAR(100) NOT NULL,
    precio INT not null,
    cantidad int not null,
    estatus_producto ENUM('1', '2') DEFAULT '1'
);

-- Crear tabla de movimientos de inventario
CREATE TABLE historico (
    id_movimiento INT AUTO_INCREMENT PRIMARY KEY,
    id_producto INT,
    idUsuario INT,
    tipo_movimiento ENUM('Entrada', 'Salida') NOT NULL,
    cantidad INT NOT NULL,
    fecha_hora TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_producto) REFERENCES productos(id_producto),
    FOREIGN KEY (idUsuario) REFERENCES usuarios(idUsuario)
);

insert into roles(nombre_rol) values ("admin"),("almacenista");
select * from roles;

insert into usuarios(nombre,correo,contrasena,idRol) values ("Edgar","admin@gmail.com","admin",1),("Juan","almacen@gmail.com","123456",2);
select * from usuarios;

INSERT INTO productos (nombre_producto, precio, cantidad) VALUES
('Tablet', 100, 50),
('Telefono', 200, 30),
('Television', 150, 20),
('Mouse', 300, 40),
('Camara', 250, 10);

select * from productos;