-- Crear schema si no existe
CREATE SCHEMA IF NOT EXISTS leguiburger;
USE leguiburger;

-- ========================================
-- Roles
-- ========================================
CREATE TABLE IF NOT EXISTS role
(
    id         BIGINT AUTO_INCREMENT PRIMARY KEY,
    name       VARCHAR(50) NOT NULL UNIQUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- ========================================
-- Miembros del Staff
-- ========================================
CREATE TABLE IF NOT EXISTS staff
(
    id         BIGINT AUTO_INCREMENT PRIMARY KEY,
    name       VARCHAR(100) NOT NULL,
    last_name  VARCHAR(100) NOT NULL,
    email      VARCHAR(100) UNIQUE,
    address    VARCHAR(100),
    phone      VARCHAR(30),
    role_id    BIGINT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (role_id) REFERENCES role (id)
);

-- ========================================
-- Clientes
-- ========================================
CREATE TABLE IF NOT EXISTS customer
(
    id         BIGINT AUTO_INCREMENT PRIMARY KEY,
    name       VARCHAR(100) NOT NULL,
    last_name  VARCHAR(100) NOT NULL,
    email      VARCHAR(100) UNIQUE,
    address    VARCHAR(150),
    phone      VARCHAR(30),
    dni        VARCHAR(20),
    birthdate  DATE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- ========================================
-- Proveedores
-- ========================================
CREATE TABLE IF NOT EXISTS supplier
(
    id           BIGINT AUTO_INCREMENT PRIMARY KEY,
    name         VARCHAR(100) NOT NULL,
    contact_name VARCHAR(100),
    note         VARCHAR(100),
    phone        VARCHAR(30),
    email        VARCHAR(100),
    address      VARCHAR(150),
    role_id      BIGINT,
    created_at   TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at   TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (role_id) REFERENCES role (id)

);

-- ========================================
-- Hamburguesas
-- ========================================
CREATE TABLE IF NOT EXISTS burger
(
    id          BIGINT AUTO_INCREMENT PRIMARY KEY,
    name        VARCHAR(100)   NOT NULL,
    description TEXT,
    ingredients TEXT,
    base_price  DECIMAL(10, 2) NOT NULL,
    created_at  TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at  TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- ========================================
-- Pedidos
-- ========================================
CREATE TABLE IF NOT EXISTS `order`
(
    id            BIGINT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(100),
    delivery_type ENUM('salon','take_away','delivery') NOT NULL DEFAULT 'salon',
    order_date    TIMESTAMP                                              DEFAULT CURRENT_TIMESTAMP,
    status        ENUM ('pending','in_progress','completed','cancelled') DEFAULT 'pending',
    total         DECIMAL(10, 2)                                         DEFAULT 0,
    created_at    TIMESTAMP                                              DEFAULT CURRENT_TIMESTAMP,
    updated_at    TIMESTAMP                                              DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- ========================================
-- Items dentro del pedido
-- ========================================
CREATE TABLE IF NOT EXISTS order_item
(
    id        BIGINT AUTO_INCREMENT PRIMARY KEY,
    order_id  BIGINT         NOT NULL,
    burger_id BIGINT         NOT NULL,
    quantity  INT            NOT NULL DEFAULT 1,
    price     DECIMAL(10, 2) NOT NULL, -- precio unitario al momento del pedido
    FOREIGN KEY (order_id) REFERENCES `order` (id),
    FOREIGN KEY (burger_id) REFERENCES burger (id)
);

-- ========================================
-- Delivery
-- ========================================
CREATE TABLE IF NOT EXISTS order_delivery
(
    id            BIGINT AUTO_INCREMENT PRIMARY KEY,
    order_id      BIGINT       NOT NULL,
    address       VARCHAR(150) NOT NULL,
    phone         VARCHAR(30),
    delivery_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    notes         TEXT,
    delivery_boy  BIGINT       NOT NULL,
    created_at    TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at    TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (order_id) REFERENCES `order` (id),
    FOREIGN KEY (delivery_boy) REFERENCES `staff` (id)
);


-- ========================================
-- INSERTS de Prueba
-- ========================================
INSERT INTO role (name)
VALUES ('Admin'),
       ('Cajero'),
       ('Cocinero'),
       ('Delivery');


INSERT INTO staff (name, last_name, email, address, phone, role_id)
VALUES ('Juan', 'Perez', 'juan.perez@email.com', 'Calle Falsa 123', '1122334455', 1),
       ('Maria', 'Gomez', 'maria.gomez@email.com', 'Av. Siempreviva 456', '1166778899', 2),
       ('Brian', 'Sanchez', 'brian.sanchez@email.com', 'Calle falsa 123', '11215848936', 4),
       ('Carlos', 'Lopez', 'carlos.lopez@email.com', 'Calle Luna 789', '1177889900', 3);




INSERT INTO customer (name, last_name, email, address, phone, dni, birthdate)
VALUES ('Luis', 'Martinez', 'luis.martinez@email.com', 'Calle Sol 111', '1155667788', '12345678', '1990-05-12'),
       ('Ana', 'Fernandez', 'ana.fernandez@email.com', 'Av. Mar 222', '1166443322', '87654321', '1995-09-08');


INSERT INTO supplier (name, contact_name, note, phone, email, address, role_id)
VALUES ('Proveedor Carnes S.A.', 'Pedro Sanchez', 'Carnes premium', '1144556677', 'carnes@proveedor.com',
        'Parque Industrial 12', 3),
       ('Proveedor Panificados', 'Laura Diaz', 'Panes y bollería', '1199887766', 'pan@proveedor.com', 'Ruta 5 km 10',
        3);


INSERT INTO burger (name, description, ingredients, base_price)
VALUES ('Doble Cheddar', 'Doble carne, doble queso cheddar, pan brioche, lechuga, tomate',
        'Carne 150g, Queso Cheddar 2 fetas, Pan brioche, Lechuga, Tomate', 4500.00),
       ('Big Mac', 'Carne 2 medallones, pan especial, queso, lechuga, salsa especial',
        'Carne 2x100g, Queso 1 feta, Pan especial, Lechuga, Salsa especial', 5000.00),
       ('Veggie Burger', 'Hamburguesa de vegetales, pan integral, lechuga, tomate',
        'Hamburguesa vegetal, Pan integral, Lechuga, Tomate', 4200.00);


INSERT INTO `order` (customer_name, status, total, delivery_type)
VALUES ('Luis Martinez', 'pending', 14000.00, 'take_away'),
       ('John connor', 'pending', 20000.00, 'delivery');

INSERT INTO order_delivery (order_id, address, delivery_boy)
VALUES (2, 14000.00, 3);


INSERT INTO order_item (order_id, burger_id, quantity, price)
VALUES (1, 1, 2, 4500.00),
       (1, 2, 1, 5000.00);

