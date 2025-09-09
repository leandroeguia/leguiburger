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
    id           BIGINT AUTO_INCREMENT PRIMARY KEY,
    name         VARCHAR(100) NOT NULL,
    last_name    VARCHAR(100) NOT NULL,
    email        VARCHAR(100) UNIQUE,
    address      VARCHAR(150),
    phone_number VARCHAR(30),
    dni          BIGINT       NOT NULL,
    birth_date   DATE,
    created_at   TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at   TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
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
    available   BOOLEAN DEFAULT TRUE,
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
CREATE TABLE IF NOT EXISTS delivery
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
