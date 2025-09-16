-- HOTELES
INSERT INTO HOTEL (id_hotel, nombre, direccion, telefono, email) VALUES (1, 'Hotel Santiago', 'Av. Libertador 1234, Santiago', '+5622345678', 'contacto@SantiagoHotel.com');
INSERT INTO HOTEL (id_hotel, nombre, direccion, telefono, email) VALUES (2, 'Hotel Viña del Mar', 'Calle Marina 456, Valparaíso', '+5632123456', 'contacto@ViñaHotel.com');

-- SERVICIOS
INSERT INTO SERVICIO (id_servicio, nombre_servicio, descripcion, precio_servicio, id_hotel) VALUES (1, 'WiFi', 'Servicio de wifi', 1500, 1);
INSERT INTO SERVICIO (id_servicio, nombre_servicio, descripcion, precio_servicio, id_hotel) VALUES (2, 'Spa', 'Servicio de spa', 2000, 1);
INSERT INTO SERVICIO (id_servicio, nombre_servicio, descripcion, precio_servicio, id_hotel) VALUES (3, 'Piscina', 'Servicio de piscina', 2500, 1);
INSERT INTO SERVICIO (id_servicio, nombre_servicio, descripcion, precio_servicio, id_hotel) VALUES (4, 'Gimnasio', 'Servicio de gimnasio', 3000, 1);
INSERT INTO SERVICIO (id_servicio, nombre_servicio, descripcion, precio_servicio, id_hotel) VALUES (5, 'Desayuno Buffet', 'Servicio de desayuno buffet', 3500, 1);
INSERT INTO SERVICIO (id_servicio, nombre_servicio, descripcion, precio_servicio, id_hotel) VALUES (6, 'Room Service', 'Servicio de room service', 4000, 1);
INSERT INTO SERVICIO (id_servicio, nombre_servicio, descripcion, precio_servicio, id_hotel) VALUES (7, 'Estacionamiento', 'Servicio de estacionamiento', 4500, 1);
INSERT INTO SERVICIO (id_servicio, nombre_servicio, descripcion, precio_servicio, id_hotel) VALUES (8, 'Lavandería', 'Servicio de lavandería', 5000, 1);
INSERT INTO SERVICIO (id_servicio, nombre_servicio, descripcion, precio_servicio, id_hotel) VALUES (9, 'Bar', 'Servicio de bar', 5500, 1);
INSERT INTO SERVICIO (id_servicio, nombre_servicio, descripcion, precio_servicio, id_hotel) VALUES (10, 'Transporte al Aeropuerto', 'Servicio de transporte al aeropuerto', 6000, 1);
INSERT INTO SERVICIO (id_servicio, nombre_servicio, descripcion, precio_servicio, id_hotel) VALUES (11, 'Sauna', 'Servicio de sauna', 6500, 2);
INSERT INTO SERVICIO (id_servicio, nombre_servicio, descripcion, precio_servicio, id_hotel) VALUES (12, 'Masajes', 'Servicio de masajes', 7000, 2);
INSERT INTO SERVICIO (id_servicio, nombre_servicio, descripcion, precio_servicio, id_hotel) VALUES (13, 'Jacuzzi', 'Servicio de jacuzzi', 7500, 2);
INSERT INTO SERVICIO (id_servicio, nombre_servicio, descripcion, precio_servicio, id_hotel) VALUES (14, 'Cine', 'Servicio de cine', 8000, 2);
INSERT INTO SERVICIO (id_servicio, nombre_servicio, descripcion, precio_servicio, id_hotel) VALUES (15, 'Sala de Juegos', 'Servicio de sala de juegos', 8500, 2);
INSERT INTO SERVICIO (id_servicio, nombre_servicio, descripcion, precio_servicio, id_hotel) VALUES (16, 'Tours Guiados', 'Servicio de tours guiados', 9000, 2);
INSERT INTO SERVICIO (id_servicio, nombre_servicio, descripcion, precio_servicio, id_hotel) VALUES (17, 'Restaurante', 'Servicio de restaurante', 9500, 2);
INSERT INTO SERVICIO (id_servicio, nombre_servicio, descripcion, precio_servicio, id_hotel) VALUES (18, 'Seguridad 24h', 'Servicio de seguridad 24h', 10000, 2);
INSERT INTO SERVICIO (id_servicio, nombre_servicio, descripcion, precio_servicio, id_hotel) VALUES (19, 'Servicio Médico', 'Servicio de servicio médico', 10500, 2);
INSERT INTO SERVICIO (id_servicio, nombre_servicio, descripcion, precio_servicio, id_hotel) VALUES (20, 'Cafetería', 'Servicio de cafetería', 11000, 2);

-- HABITACIONES
INSERT INTO HABITACION (id_habitacion, numero, tipo, precio_por_noche, estado, id_hotel) VALUES (1, '101', 'Doble', 20500, 'O', 1);
INSERT INTO HABITACION (id_habitacion, numero, tipo, precio_por_noche, estado, id_hotel) VALUES (2, '102', 'Suite', 21000, 'A', 1);
INSERT INTO HABITACION (id_habitacion, numero, tipo, precio_por_noche, estado, id_hotel) VALUES (3, '103', 'Matrimonial', 21500, 'A', 1);
INSERT INTO HABITACION (id_habitacion, numero, tipo, precio_por_noche, estado, id_hotel) VALUES (4, '104', 'Matrimonial', 22000, 'O', 1);
INSERT INTO HABITACION (id_habitacion, numero, tipo, precio_por_noche, estado, id_hotel) VALUES (5, '105', 'Matrimonial', 22500, 'A', 1);
INSERT INTO HABITACION (id_habitacion, numero, tipo, precio_por_noche, estado, id_hotel) VALUES (6, '106', 'Matrimonial', 23000, 'A', 1);
INSERT INTO HABITACION (id_habitacion, numero, tipo, precio_por_noche, estado, id_hotel) VALUES (7, '107', 'Matrimonial', 23500, 'O', 1);
INSERT INTO HABITACION (id_habitacion, numero, tipo, precio_por_noche, estado, id_hotel) VALUES (8, '108', 'Doble', 24000, 'A', 1);
INSERT INTO HABITACION (id_habitacion, numero, tipo, precio_por_noche, estado, id_hotel) VALUES (9, '109', 'Individual', 24500, 'A', 1);
INSERT INTO HABITACION (id_habitacion, numero, tipo, precio_por_noche, estado, id_hotel) VALUES (10, '110', 'Matrimonial', 25000, 'O', 1);
INSERT INTO HABITACION (id_habitacion, numero, tipo, precio_por_noche, estado, id_hotel) VALUES (11, '111', 'Matrimonial', 25500, 'A', 2);
INSERT INTO HABITACION (id_habitacion, numero, tipo, precio_por_noche, estado, id_hotel) VALUES (12, '112', 'Individual', 26000, 'O', 2);
INSERT INTO HABITACION (id_habitacion, numero, tipo, precio_por_noche, estado, id_hotel) VALUES (13, '113', 'Suite', 26500, 'A', 2);
INSERT INTO HABITACION (id_habitacion, numero, tipo, precio_por_noche, estado, id_hotel) VALUES (14, '114', 'Doble', 27000, 'O', 2);
INSERT INTO HABITACION (id_habitacion, numero, tipo, precio_por_noche, estado, id_hotel) VALUES (15, '115', 'Matrimonial', 27500, 'A', 2);
INSERT INTO HABITACION (id_habitacion, numero, tipo, precio_por_noche, estado, id_hotel) VALUES (16, '116', 'Matrimonial', 28000, 'O', 2);
INSERT INTO HABITACION (id_habitacion, numero, tipo, precio_por_noche, estado, id_hotel) VALUES (17, '117', 'Individual', 28500, 'A', 2);
INSERT INTO HABITACION (id_habitacion, numero, tipo, precio_por_noche, estado, id_hotel) VALUES (18, '118', 'Individual', 29000, 'O', 2);
INSERT INTO HABITACION (id_habitacion, numero, tipo, precio_por_noche, estado, id_hotel) VALUES (19, '119', 'Doble', 29500, 'A', 2);
INSERT INTO HABITACION (id_habitacion, numero, tipo, precio_por_noche, estado, id_hotel) VALUES (20, '120', 'Doble', 30000, 'O', 2);

-- EMPLEADOS
INSERT INTO EMPLEADO (id_empleado, nombre, apellido, cargo, telefono, email, id_hotel) VALUES (1, 'Cristian', 'Soto', 'Cocinero', 900000001, 'cristian.soto@hotel1.com', 1);
INSERT INTO EMPLEADO (id_empleado, nombre, apellido, cargo, telefono, email, id_hotel) VALUES (2, 'Paula', 'Silva', 'Gerente', 900000002, 'paula.silva@hotel1.com', 1);
INSERT INTO EMPLEADO (id_empleado, nombre, apellido, cargo, telefono, email, id_hotel) VALUES (3, 'Ignacio', 'González', 'Gerente', 900000003, 'ignacio.gonzález@hotel1.com', 1);
INSERT INTO EMPLEADO (id_empleado, nombre, apellido, cargo, telefono, email, id_hotel) VALUES (4, 'Constanza', 'Herrera', 'Cocinero', 900000004, 'constanza.herrera@hotel1.com', 1);
INSERT INTO EMPLEADO (id_empleado, nombre, apellido, cargo, telefono, email, id_hotel) VALUES (5, 'Carolina', 'Silva', 'Botones', 900000005, 'carolina.silva@hotel1.com', 1);
INSERT INTO EMPLEADO (id_empleado, nombre, apellido, cargo, telefono, email, id_hotel) VALUES (6, 'Rodrigo', 'Silva', 'Gerente', 900000006, 'rodrigo.silva@hotel1.com', 1);
INSERT INTO EMPLEADO (id_empleado, nombre, apellido, cargo, telefono, email, id_hotel) VALUES (7, 'Josefa', 'Rojas', 'Administrador', 900000007, 'josefa.rojas@hotel1.com', 1);
INSERT INTO EMPLEADO (id_empleado, nombre, apellido, cargo, telefono, email, id_hotel) VALUES (8, 'Felipe', 'Muñoz', 'Recepcionista', 900000008, 'felipe.muñoz@hotel1.com', 1);
INSERT INTO EMPLEADO (id_empleado, nombre, apellido, cargo, telefono, email, id_hotel) VALUES (9, 'Cristian', 'Reyes', 'Recepcionista', 900000009, 'cristian.reyes@hotel1.com', 1);
INSERT INTO EMPLEADO (id_empleado, nombre, apellido, cargo, telefono, email, id_hotel) VALUES (10, 'Felipe', 'Gutiérrez', 'Gerente', 900000010, 'felipe.gutiérrez@hotel1.com', 1);
INSERT INTO EMPLEADO (id_empleado, nombre, apellido, cargo, telefono, email, id_hotel) VALUES (11, 'Carolina', 'Fuentes', 'Recepcionista', 900000011, 'carolina.fuentes@hotel2.com', 2);
INSERT INTO EMPLEADO (id_empleado, nombre, apellido, cargo, telefono, email, id_hotel) VALUES (12, 'Josefa', 'Reyes', 'Botones', 900000012, 'josefa.reyes@hotel2.com', 2);
INSERT INTO EMPLEADO (id_empleado, nombre, apellido, cargo, telefono, email, id_hotel) VALUES (13, 'Sebastián', 'Soto', 'Conserje', 900000013, 'sebastián.soto@hotel2.com', 2);
INSERT INTO EMPLEADO (id_empleado, nombre, apellido, cargo, telefono, email, id_hotel) VALUES (14, 'Rodrigo', 'Díaz', 'Botones', 900000014, 'rodrigo.díaz@hotel2.com', 2);
INSERT INTO EMPLEADO (id_empleado, nombre, apellido, cargo, telefono, email, id_hotel) VALUES (15, 'Cristian', 'Pérez', 'Gerente', 900000015, 'cristian.pérez@hotel2.com', 2);
INSERT INTO EMPLEADO (id_empleado, nombre, apellido, cargo, telefono, email, id_hotel) VALUES (16, 'Sebastián', 'Herrera', 'Conserje', 900000016, 'sebastián.herrera@hotel2.com', 2);
INSERT INTO EMPLEADO (id_empleado, nombre, apellido, cargo, telefono, email, id_hotel) VALUES (17, 'Andrés', 'Álvarez', 'Botones', 900000017, 'andrés.álvarez@hotel2.com', 2);
INSERT INTO EMPLEADO (id_empleado, nombre, apellido, cargo, telefono, email, id_hotel) VALUES (18, 'Carolina', 'Díaz', 'Camarero', 900000018, 'carolina.díaz@hotel2.com', 2);
INSERT INTO EMPLEADO (id_empleado, nombre, apellido, cargo, telefono, email, id_hotel) VALUES (19, 'Paula', 'Ramírez', 'Gerente', 900000019, 'paula.ramírez@hotel2.com', 2);
INSERT INTO EMPLEADO (id_empleado, nombre, apellido, cargo, telefono, email, id_hotel) VALUES (20, 'Daniela', 'Silva', 'Botones', 900000020, 'daniela.silva@hotel2.com', 2);

-- CLIENTES
INSERT INTO CLIENTE (id_cliente, nombre, apellido, run, telefono, email, direccion) VALUES (1, 'Sebastián', 'Pérez', '00000001-9', '+56990000001', 'sebastián.pérez@mail.com', 'Pasaje Central 10');
INSERT INTO CLIENTE (id_cliente, nombre, apellido, run, telefono, email, direccion) VALUES (2, 'Sebastián', 'Gutiérrez', '00000002-1', '+56990000002', 'sebastián.gutiérrez@mail.com', 'Pasaje Central 20');
INSERT INTO CLIENTE (id_cliente, nombre, apellido, run, telefono, email, direccion) VALUES (3, 'Juan', 'Morales', '00000003-8', '+56990000003', 'juan.morales@mail.com', 'Calle Falsa 30');
INSERT INTO CLIENTE (id_cliente, nombre, apellido, run, telefono, email, direccion) VALUES (4, 'Diego', 'Cáceres', '00000004-4', '+56990000004', 'diego.cáceres@mail.com', 'Pasaje Central 40');
INSERT INTO CLIENTE (id_cliente, nombre, apellido, run, telefono, email, direccion) VALUES (5, 'María', 'Herrera', '00000005-8', '+56990000005', 'maría.herrera@mail.com', 'Av. Providencia 50');
INSERT INTO CLIENTE (id_cliente, nombre, apellido, run, telefono, email, direccion) VALUES (6, 'Rodrigo', 'Castillo', '00000006-5', '+56990000006', 'rodrigo.castillo@mail.com', 'Calle Sur 60');
INSERT INTO CLIENTE (id_cliente, nombre, apellido, run, telefono, email, direccion) VALUES (7, 'Camila', 'Pérez', '00000007-2', '+56990000007', 'camila.pérez@mail.com', 'Av. Providencia 70');
INSERT INTO CLIENTE (id_cliente, nombre, apellido, run, telefono, email, direccion) VALUES (8, 'Carolina', 'Torres', '00000008-4', '+56990000008', 'carolina.torres@mail.com', 'Camino Real 80');
INSERT INTO CLIENTE (id_cliente, nombre, apellido, run, telefono, email, direccion) VALUES (9, 'Valentina', 'González', '00000009-0', '+56990000009', 'valentina.gonzález@mail.com', 'Av. Providencia 90');
INSERT INTO CLIENTE (id_cliente, nombre, apellido, run, telefono, email, direccion) VALUES (10, 'Carolina', 'Pérez', '00000010-8', '+56990000010', 'carolina.pérez@mail.com', 'Av. Providencia 100');
INSERT INTO CLIENTE (id_cliente, nombre, apellido, run, telefono, email, direccion) VALUES (11, 'Josefa', 'Ramírez', '00000011-5', '+56990000011', 'josefa.ramírez@mail.com', 'Av. Los Leones 110');
INSERT INTO CLIENTE (id_cliente, nombre, apellido, run, telefono, email, direccion) VALUES (12, 'Valentina', 'Álvarez', '00000012-7', '+56990000012', 'valentina.álvarez@mail.com', 'Av. Libertador 120');
INSERT INTO CLIENTE (id_cliente, nombre, apellido, run, telefono, email, direccion) VALUES (13, 'Francisca', 'Pérez', '00000013-8', '+56990000013', 'francisca.pérez@mail.com', 'Calle Norte 130');
INSERT INTO CLIENTE (id_cliente, nombre, apellido, run, telefono, email, direccion) VALUES (14, 'Francisca', 'Herrera', '00000014-3', '+56990000014', 'francisca.herrera@mail.com', 'Calle Norte 140');
INSERT INTO CLIENTE (id_cliente, nombre, apellido, run, telefono, email, direccion) VALUES (15, 'Rodrigo', 'Molina', '00000015-0', '+56990000015', 'rodrigo.molina@mail.com', 'Calle Falsa 150');
INSERT INTO CLIENTE (id_cliente, nombre, apellido, run, telefono, email, direccion) VALUES (16, 'Carolina', 'Cáceres', '00000016-8', '+56990000016', 'carolina.cáceres@mail.com', 'Av. Los Leones 160');
INSERT INTO CLIENTE (id_cliente, nombre, apellido, run, telefono, email, direccion) VALUES (17, 'Paula', 'Díaz', '00000017-2', '+56990000017', 'paula.díaz@mail.com', 'Av. Los Leones 170');
INSERT INTO CLIENTE (id_cliente, nombre, apellido, run, telefono, email, direccion) VALUES (18, 'Valentina', 'Herrera', '00000018-0', '+56990000018', 'valentina.herrera@mail.com', 'Pasaje Central 180');
INSERT INTO CLIENTE (id_cliente, nombre, apellido, run, telefono, email, direccion) VALUES (19, 'Cristian', 'Álvarez', '00000019-2', '+56990000019', 'cristian.álvarez@mail.com', 'Av. Libertador 190');
INSERT INTO CLIENTE (id_cliente, nombre, apellido, run, telefono, email, direccion) VALUES (20, 'Constanza', 'Pérez', '00000020-4', '+56990000020', 'constanza.pérez@mail.com', 'Av. Libertador 200');

-- RESERVAS
INSERT INTO RESERVA (id_reserva, fecha_inicio, fecha_fin, estado, id_cliente, id_habitacion, id_empleado) VALUES (1, TO_DATE('2023-11-02', 'YYYY-MM-DD'), TO_DATE('2023-11-04', 'YYYY-MM-DD'), 'A', 1, 1, 1);
INSERT INTO RESERVA (id_reserva, fecha_inicio, fecha_fin, estado, id_cliente, id_habitacion, id_empleado) VALUES (2, TO_DATE('2023-11-03', 'YYYY-MM-DD'), TO_DATE('2023-11-05', 'YYYY-MM-DD'), 'A', 2, 2, 2);
INSERT INTO RESERVA (id_reserva, fecha_inicio, fecha_fin, estado, id_cliente, id_habitacion, id_empleado) VALUES (3, TO_DATE('2023-11-04', 'YYYY-MM-DD'), TO_DATE('2023-11-06', 'YYYY-MM-DD'), 'A', 3, 3, 3);
INSERT INTO RESERVA (id_reserva, fecha_inicio, fecha_fin, estado, id_cliente, id_habitacion, id_empleado) VALUES (4, TO_DATE('2023-11-05', 'YYYY-MM-DD'), TO_DATE('2023-11-07', 'YYYY-MM-DD'), 'A', 4, 4, 4);
INSERT INTO RESERVA (id_reserva, fecha_inicio, fecha_fin, estado, id_cliente, id_habitacion, id_empleado) VALUES (5, TO_DATE('2023-11-06', 'YYYY-MM-DD'), TO_DATE('2023-11-08', 'YYYY-MM-DD'), 'A', 5, 5, 5);
INSERT INTO RESERVA (id_reserva, fecha_inicio, fecha_fin, estado, id_cliente, id_habitacion, id_empleado) VALUES (6, TO_DATE('2023-11-07', 'YYYY-MM-DD'), TO_DATE('2023-11-09', 'YYYY-MM-DD'), 'A', 6, 6, 6);
INSERT INTO RESERVA (id_reserva, fecha_inicio, fecha_fin, estado, id_cliente, id_habitacion, id_empleado) VALUES (7, TO_DATE('2023-11-08', 'YYYY-MM-DD'), TO_DATE('2023-11-10', 'YYYY-MM-DD'), 'A', 7, 7, 7);
INSERT INTO RESERVA (id_reserva, fecha_inicio, fecha_fin, estado, id_cliente, id_habitacion, id_empleado) VALUES (8, TO_DATE('2023-11-09', 'YYYY-MM-DD'), TO_DATE('2023-11-11', 'YYYY-MM-DD'), 'A', 8, 8, 8);
INSERT INTO RESERVA (id_reserva, fecha_inicio, fecha_fin, estado, id_cliente, id_habitacion, id_empleado) VALUES (9, TO_DATE('2023-11-10', 'YYYY-MM-DD'), TO_DATE('2023-11-12', 'YYYY-MM-DD'), 'A', 9, 9, 9);
INSERT INTO RESERVA (id_reserva, fecha_inicio, fecha_fin, estado, id_cliente, id_habitacion, id_empleado) VALUES (10, TO_DATE('2023-11-11', 'YYYY-MM-DD'), TO_DATE('2023-11-13', 'YYYY-MM-DD'), 'A', 10, 10, 10);
INSERT INTO RESERVA (id_reserva, fecha_inicio, fecha_fin, estado, id_cliente, id_habitacion, id_empleado) VALUES (11, TO_DATE('2023-11-12', 'YYYY-MM-DD'), TO_DATE('2023-11-14', 'YYYY-MM-DD'), 'A', 11, 11, 11);
INSERT INTO RESERVA (id_reserva, fecha_inicio, fecha_fin, estado, id_cliente, id_habitacion, id_empleado) VALUES (12, TO_DATE('2023-11-13', 'YYYY-MM-DD'), TO_DATE('2023-11-15', 'YYYY-MM-DD'), 'A', 12, 12, 12);
INSERT INTO RESERVA (id_reserva, fecha_inicio, fecha_fin, estado, id_cliente, id_habitacion, id_empleado) VALUES (13, TO_DATE('2023-11-14', 'YYYY-MM-DD'), TO_DATE('2023-11-16', 'YYYY-MM-DD'), 'A', 13, 13, 13);
INSERT INTO RESERVA (id_reserva, fecha_inicio, fecha_fin, estado, id_cliente, id_habitacion, id_empleado) VALUES (14, TO_DATE('2023-11-15', 'YYYY-MM-DD'), TO_DATE('2023-11-17', 'YYYY-MM-DD'), 'A', 14, 14, 14);
INSERT INTO RESERVA (id_reserva, fecha_inicio, fecha_fin, estado, id_cliente, id_habitacion, id_empleado) VALUES (15, TO_DATE('2023-11-16', 'YYYY-MM-DD'), TO_DATE('2023-11-18', 'YYYY-MM-DD'), 'A', 15, 15, 15);
INSERT INTO RESERVA (id_reserva, fecha_inicio, fecha_fin, estado, id_cliente, id_habitacion, id_empleado) VALUES (16, TO_DATE('2023-11-17', 'YYYY-MM-DD'), TO_DATE('2023-11-19', 'YYYY-MM-DD'), 'A', 16, 16, 16);
INSERT INTO RESERVA (id_reserva, fecha_inicio, fecha_fin, estado, id_cliente, id_habitacion, id_empleado) VALUES (17, TO_DATE('2023-11-18', 'YYYY-MM-DD'), TO_DATE('2023-11-20', 'YYYY-MM-DD'), 'A', 17, 17, 17);
INSERT INTO RESERVA (id_reserva, fecha_inicio, fecha_fin, estado, id_cliente, id_habitacion, id_empleado) VALUES (18, TO_DATE('2023-11-19', 'YYYY-MM-DD'), TO_DATE('2023-11-21', 'YYYY-MM-DD'), 'A', 18, 18, 18);
INSERT INTO RESERVA (id_reserva, fecha_inicio, fecha_fin, estado, id_cliente, id_habitacion, id_empleado) VALUES (19, TO_DATE('2023-11-20', 'YYYY-MM-DD'), TO_DATE('2023-11-22', 'YYYY-MM-DD'), 'A', 19, 19, 19);
INSERT INTO RESERVA (id_reserva, fecha_inicio, fecha_fin, estado, id_cliente, id_habitacion, id_empleado) VALUES (20, TO_DATE('2023-11-21', 'YYYY-MM-DD'), TO_DATE('2023-11-23', 'YYYY-MM-DD'), 'A', 20, 20, 20);

-- CONSUMO_SERVICIO
INSERT INTO CONSUMO_SERVICIO (id_consumo, cantidad, total, id_reserva, id_servicio) VALUES (1, 1, 1500, 1, 1);
INSERT INTO CONSUMO_SERVICIO (id_consumo, cantidad, total, id_reserva, id_servicio) VALUES (2, 2, 4000, 2, 2);
INSERT INTO CONSUMO_SERVICIO (id_consumo, cantidad, total, id_reserva, id_servicio) VALUES (3, 1, 2500, 3, 3);
INSERT INTO CONSUMO_SERVICIO (id_consumo, cantidad, total, id_reserva, id_servicio) VALUES (4, 2, 6000, 4, 4);
INSERT INTO CONSUMO_SERVICIO (id_consumo, cantidad, total, id_reserva, id_servicio) VALUES (5, 1, 3500, 5, 5);
INSERT INTO CONSUMO_SERVICIO (id_consumo, cantidad, total, id_reserva, id_servicio) VALUES (6, 3, 12000, 6, 6);
INSERT INTO CONSUMO_SERVICIO (id_consumo, cantidad, total, id_reserva, id_servicio) VALUES (7, 2, 9000, 7, 7);
INSERT INTO CONSUMO_SERVICIO (id_consumo, cantidad, total, id_reserva, id_servicio) VALUES (8, 2, 10000, 8, 8);
INSERT INTO CONSUMO_SERVICIO (id_consumo, cantidad, total, id_reserva, id_servicio) VALUES (9, 3, 16500, 9, 9);
INSERT INTO CONSUMO_SERVICIO (id_consumo, cantidad, total, id_reserva, id_servicio) VALUES (10, 1, 6000, 10, 10);

-- METODOS DE PAGO
INSERT INTO METODO_PAGO VALUES (1, 'Efectivo', 'Pago en efectivo en recepción');
INSERT INTO METODO_PAGO VALUES (2, 'Tarjeta Débito', 'Pago con tarjeta de débito');
INSERT INTO METODO_PAGO VALUES (3, 'Tarjeta Crédito', 'Pago con tarjeta de crédito');
INSERT INTO METODO_PAGO VALUES (4, 'Transferencia', 'Pago por transferencia bancaria');
INSERT INTO METODO_PAGO VALUES (5, 'Pago Online', 'Pago mediante plataforma online');

-- PAGOS
INSERT INTO PAGO (id_pago, id_reserva, monto, fecha_de_pago, id_metodo_pago, estado) VALUES (1, 1, 51000, TO_DATE('2023-12-02', 'YYYY-MM-DD'), 3, 'A');
INSERT INTO PAGO (id_pago, id_reserva, monto, fecha_de_pago, id_metodo_pago, estado) VALUES (2, 2, 52000, TO_DATE('2023-12-03', 'YYYY-MM-DD'), 5, 'A');
INSERT INTO PAGO (id_pago, id_reserva, monto, fecha_de_pago, id_metodo_pago, estado) VALUES (3, 3, 53000, TO_DATE('2023-12-04', 'YYYY-MM-DD'), 1, 'A');
INSERT INTO PAGO (id_pago, id_reserva, monto, fecha_de_pago, id_metodo_pago, estado) VALUES (4, 4, 54000, TO_DATE('2023-12-05', 'YYYY-MM-DD'), 2, 'A');
INSERT INTO PAGO (id_pago, id_reserva, monto, fecha_de_pago, id_metodo_pago, estado) VALUES (5, 5, 55000, TO_DATE('2023-12-06', 'YYYY-MM-DD'), 3, 'A');
INSERT INTO PAGO (id_pago, id_reserva, monto, fecha_de_pago, id_metodo_pago, estado) VALUES (6, 6, 56000, TO_DATE('2023-12-07', 'YYYY-MM-DD'), 2, 'A');
INSERT INTO PAGO (id_pago, id_reserva, monto, fecha_de_pago, id_metodo_pago, estado) VALUES (7, 7, 57000, TO_DATE('2023-12-08', 'YYYY-MM-DD'), 5, 'A');
INSERT INTO PAGO (id_pago, id_reserva, monto, fecha_de_pago, id_metodo_pago, estado) VALUES (8, 8, 58000, TO_DATE('2023-12-09', 'YYYY-MM-DD'), 1, 'A');
INSERT INTO PAGO (id_pago, id_reserva, monto, fecha_de_pago, id_metodo_pago, estado) VALUES (9, 9, 59000, TO_DATE('2023-12-10', 'YYYY-MM-DD'), 2, 'A');
INSERT INTO PAGO (id_pago, id_reserva, monto, fecha_de_pago, id_metodo_pago, estado) VALUES (10, 10, 60000, TO_DATE('2023-12-11', 'YYYY-MM-DD'), 2, 'A');
INSERT INTO PAGO (id_pago, id_reserva, monto, fecha_de_pago, id_metodo_pago, estado) VALUES (11, 11, 61000, TO_DATE('2023-12-12', 'YYYY-MM-DD'), 3, 'A');
INSERT INTO PAGO (id_pago, id_reserva, monto, fecha_de_pago, id_metodo_pago, estado) VALUES (12, 12, 62000, TO_DATE('2023-12-13', 'YYYY-MM-DD'), 4, 'A');
INSERT INTO PAGO (id_pago, id_reserva, monto, fecha_de_pago, id_metodo_pago, estado) VALUES (13, 13, 63000, TO_DATE('2023-12-14', 'YYYY-MM-DD'), 2, 'A');
INSERT INTO PAGO (id_pago, id_reserva, monto, fecha_de_pago, id_metodo_pago, estado) VALUES (14, 14, 64000, TO_DATE('2023-12-15', 'YYYY-MM-DD'), 4, 'A');
INSERT INTO PAGO (id_pago, id_reserva, monto, fecha_de_pago, id_metodo_pago, estado) VALUES (15, 15, 65000, TO_DATE('2023-12-16', 'YYYY-MM-DD'), 4, 'A');
INSERT INTO PAGO (id_pago, id_reserva, monto, fecha_de_pago, id_metodo_pago, estado) VALUES (16, 16, 66000, TO_DATE('2023-12-17', 'YYYY-MM-DD'), 5, 'A');
INSERT INTO PAGO (id_pago, id_reserva, monto, fecha_de_pago, id_metodo_pago, estado) VALUES (17, 17, 67000, TO_DATE('2023-12-18', 'YYYY-MM-DD'), 2, 'A');
INSERT INTO PAGO (id_pago, id_reserva, monto, fecha_de_pago, id_metodo_pago, estado) VALUES (18, 18, 68000, TO_DATE('2023-12-19', 'YYYY-MM-DD'), 3, 'A');
INSERT INTO PAGO (id_pago, id_reserva, monto, fecha_de_pago, id_metodo_pago, estado) VALUES (19, 19, 69000, TO_DATE('2023-12-20', 'YYYY-MM-DD'), 4, 'A');
INSERT INTO PAGO (id_pago, id_reserva, monto, fecha_de_pago, id_metodo_pago, estado) VALUES (20, 20, 70000, TO_DATE('2023-12-21', 'YYYY-MM-DD'), 2, 'A');