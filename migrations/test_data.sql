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




INSERT INTO customer (name, last_name, email, address, phone_number, dni, birth_date)
VALUES ('Luis', 'Martinez', 'luis.martinez@email.com', 'Calle Sol 111', '1155667788', '12345678', '1990-05-12'),
       ('Ana', 'Fernandez', 'ana.fernandez@email.com', 'Av. Mar 222', '1166443322', '87654321', '1995-09-08');


INSERT INTO supplier (name, contact_name, note, phone, email, address, role_id)
VALUES ('Proveedor Carnes S.A.', 'Pedro Sanchez', 'Carnes premium', '1144556677', 'carnes@proveedor.com',
        'Parque Industrial 12', 3),
       ('Proveedor Panificados', 'Laura Diaz', 'Panes y bollería', '1199887766', 'pan@proveedor.com', 'Ruta 5 km 10',
        3);


INSERT INTO burger (name, description, ingredients, base_price)
VALUES ('CheeseBurger', 'La clásica del local, tu hamburguesa favorita',
        'Pan, Medallón 120grs, Cheddar x2', 10000.00),
       ('Bacon CheeseBurger', 'La hamburguesa clásica con agregado de Bacon',
        'Pan, Medallón 120grs, Cheddar x2, Bacon x2', 13500.00),
       ('La Golosa', 'La úica con mucha cebollita caramelizada',
        'Pan, Medallón 120grs, Cheddar x2, Cebolla caramelizada', 14000.00),
       ('La 4 Quesos', 'Selección de 4 quesos, porque solo cheddar no te alcanza',
        'Pan, Medallón 120grs, Cheddar x2, Queso Azul, Tybo y Fontina', 14000.00),
        ('Ankara Messi', 'La hamburguesa del campeón del mundo, con la salsa ankara',
        'Pan, Medallón 120grs, Cheddar x2, Bacon x2, Salsa Ankara', 13500.00),
       ('Crispy 2.0', 'La burger que viene con una banda de cebollita crispy',
        'Pan, Medallón 120grs, Cheddar x2, Cebolla Cripspy', 14000.00);


INSERT INTO `order` (customer_name, status, total, delivery_type)
VALUES ('Luis Martinez', 'pending', 14000.00, 'take_away'),
       ('John connor', 'pending', 20000.00, 'delivery');

INSERT INTO delivery (order_id, address, delivery_boy)
VALUES (2, 14000.00, 3);


INSERT INTO order_item (order_id, burger_id, quantity, price)
VALUES (1, 1, 1, 10000.00),
       (1, 2, 1, 13500.00);

