CREATE TABLE roles (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50)
);

CREATE TABLE usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(255),
    contraseña VARCHAR(255),
    nombre VARCHAR(100),
    apellido VARCHAR(100),
    telefono VARCHAR(15),
    fecha_nacimiento DATE,
    direccion VARCHAR(255),
    rol_id INT,
    FOREIGN KEY (rol_id) REFERENCES roles(id)
);

CREATE TABLE productos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    stock INT,
    precio DECIMAL(10, 2)
);

CREATE TABLE proveedores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    contacto VARCHAR(100)
);

CREATE TABLE inventario_proveedores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    producto_id INT,
    proveedor_id INT,
    cantidad INT,
    FOREIGN KEY (producto_id) REFERENCES productos(id),
    FOREIGN KEY (proveedor_id) REFERENCES proveedores(id)
);

CREATE TABLE pedidos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT,
    total DECIMAL(10, 2),
    estado VARCHAR(50),
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id)
);

CREATE TABLE detalle_pedidos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    pedido_id INT,
    producto_ID INT,
    cantidad INT,
    precio_unitario DECIMAL(10, 2),
    FOREIGN KEY (pedido_id) REFERENCES pedidos(id),
    FOREIGN KEY (producto_id) REFERENCES productos(id)
);

CREATE TABLE pagos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    pedido_id INT,
    monto DECIMAL(10, 2),
    estado VARCHAR(50),
    metodo_pago VARCHAR(50),
    fecha_pago TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (pedido_id) REFERENCES pedidos(id)
);

CREATE TABLE repartidores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    estado VARCHAR(50),
    matricula_vehiculo VARCHAR(50)
);

CREATE TABLE entregas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    pedido_id INT,
    repartidor_id INT,
    estado VARCHAR(50),
    FOREIGN KEY (pedido_id) REFERENCES pedidos(id),
    FOREIGN KEY (repartidor_id) REFERENCES repartidores(id)
);