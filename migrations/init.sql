-- Crear schema si no existe
CREATE SCHEMA IF NOT EXISTS leguiburger;
USE leguiburger;

-- Tabla Roles (para el staff: cajero, cocinero, admin, etc.)
CREATE TABLE IF NOT EXISTS role (
                                    id BIGINT AUTO_INCREMENT PRIMARY KEY,
                                    name VARCHAR(50) NOT NULL UNIQUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
    );

-- Tabla Staff
CREATE TABLE IF NOT EXISTS staff (
                                     id BIGINT AUTO_INCREMENT PRIMARY KEY,
                                     name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    address VARCHAR(100),
    phone VARCHAR(30),
    role_id BIGINT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (role_id) REFERENCES role(id)
    );

-- Tabla Clientes
CREATE TABLE IF NOT EXISTS customer (
                                        id BIGINT AUTO_INCREMENT PRIMARY KEY,
                                        name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    address VARCHAR(150),
    phone VARCHAR(30),
    dni VARCHAR(20),
    birthdate DATE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
    );

-- Tabla Proveedores
CREATE TABLE IF NOT EXISTS supplier (
                                        id BIGINT AUTO_INCREMENT PRIMARY KEY,
                                        name VARCHAR(100) NOT NULL,
    contact_name VARCHAR(100),
    phone VARCHAR(30),
    email VARCHAR(100),
    address VARCHAR(150),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
    );

-- Tabla Ingredientes
CREATE TABLE IF NOT EXISTS ingredient (
                                          id BIGINT AUTO_INCREMENT PRIMARY KEY,
                                          name VARCHAR(100) NOT NULL UNIQUE,
    unit VARCHAR(20) NOT NULL, -- gramos, unidades, ml, etc.
    stock DECIMAL(10,2) DEFAULT 0,
    supplier_id BIGINT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (supplier_id) REFERENCES supplier(id)
    );

-- Tabla Hamburguesas
CREATE TABLE IF NOT EXISTS burger (
                                      id BIGINT AUTO_INCREMENT PRIMARY KEY,
                                      name VARCHAR(100) NOT NULL,
    description TEXT,
    price DECIMAL(10,2) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
    );

-- Relación Hamburguesa - Ingredientes (N a N)
CREATE TABLE IF NOT EXISTS burger_ingredient (
                                                 burger_id BIGINT NOT NULL,
                                                 ingredient_id BIGINT NOT NULL,
                                                 quantity DECIMAL(10,2) NOT NULL, -- ej: 150 (gramos de carne, 1 unidad de pan, etc.)
    PRIMARY KEY (burger_id, ingredient_id),
    FOREIGN KEY (burger_id) REFERENCES burger(id),
    FOREIGN KEY (ingredient_id) REFERENCES ingredient(id)
    );

-- Tabla Pedidos
CREATE TABLE IF NOT EXISTS order_ (
                                      id BIGINT AUTO_INCREMENT PRIMARY KEY,
                                      customer_id BIGINT,
                                      staff_id BIGINT, -- quien tomó el pedido
                                      order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                                      status VARCHAR(50) DEFAULT 'pending', -- pending, in_progress, delivered, cancelled
    total DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customer(id),
    FOREIGN KEY (staff_id) REFERENCES staff(id)
    );

-- Detalle de Pedidos (N a N: pedido - hamburguesa)
CREATE TABLE IF NOT EXISTS order_item (
                                          id BIGINT AUTO_INCREMENT PRIMARY KEY,
                                          order_id BIGINT NOT NULL,
                                          burger_id BIGINT NOT NULL,
                                          quantity INT NOT NULL,
                                          price DECIMAL(10,2) NOT NULL, -- precio unitario en el momento del pedido
    FOREIGN KEY (order_id) REFERENCES order_(id),
    FOREIGN KEY (burger_id) REFERENCES burger(id)
    );

-- Tabla Cupones
CREATE TABLE IF NOT EXISTS coupon (
                                      id BIGINT AUTO_INCREMENT PRIMARY KEY,
                                      code VARCHAR(50) NOT NULL UNIQUE,
    discount_type ENUM('percentage','fixed') NOT NULL,
    discount_value DECIMAL(10,2) NOT NULL,
    valid_from DATE,
    valid_until DATE,
    active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
    );

-- Relación Pedido - Cupon (un pedido puede tener un cupón aplicado)
CREATE TABLE IF NOT EXISTS order_coupon (
                                            order_id BIGINT NOT NULL,
                                            coupon_id BIGINT NOT NULL,
                                            PRIMARY KEY (order_id, coupon_id),
    FOREIGN KEY (order_id) REFERENCES order_(id),
    FOREIGN KEY (coupon_id) REFERENCES coupon(id)
    );

-- Tabla Pagos
CREATE TABLE IF NOT EXISTS payment (
                                       id BIGINT AUTO_INCREMENT PRIMARY KEY,
                                       order_id BIGINT NOT NULL,
                                       amount DECIMAL(10,2) NOT NULL,
    payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    method VARCHAR(50), -- efectivo, tarjeta, etc.
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (order_id) REFERENCES order_(id)
    );
