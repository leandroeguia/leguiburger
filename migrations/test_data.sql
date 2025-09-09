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

