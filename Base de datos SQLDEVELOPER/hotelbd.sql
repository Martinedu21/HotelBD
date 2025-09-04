-- ==============================
-- CREACIÓN DE TABLAS - GESTIÓN HOTEL
-- ==============================

-- TABLA HOTEL
CREATE TABLE HOTEL (
    id_hotel       NUMBER PRIMARY KEY,
    nombre         VARCHAR2(100) NOT NULL,
    direccion      VARCHAR2(200),
    telefono       VARCHAR2(20),
    email          VARCHAR2(100)
);

-- TABLA SERVICIO
CREATE TABLE SERVICIO (
    id_servicio     NUMBER PRIMARY KEY,
    nombre_servicio VARCHAR2(50) NOT NULL,
    descripcion     VARCHAR2(100),
    precio_servicio NUMBER(10),
    id_hotel  NUMBER,
    CONSTRAINT SERVICIO_HOTEL_FK FOREIGN KEY (id_hotel) REFERENCES HOTEL(id_hotel)
);

-- TABLA HABITACION
CREATE TABLE HABITACION (
    id_habitacion   NUMBER PRIMARY KEY,
    numero          VARCHAR2(10),
    tipo            VARCHAR2(10),
    precio_por_noche NUMBER,
    estado          CHAR(1),
    id_hotel  NUMBER,
    CONSTRAINT HABITACION_HOTEL_FK FOREIGN KEY (id_hotel) REFERENCES HOTEL(id_hotel)
);

-- TABLA EMPLEADO
CREATE TABLE EMPLEADO (
    id_empleado     NUMBER(10) PRIMARY KEY,
    nombre          VARCHAR2(30) NOT NULL,
    apellido        VARCHAR2(30) NOT NULL,
    cargo           VARCHAR2(30),
    telefono        NUMBER,
    email           VARCHAR2(100),
    id_hotel  NUMBER,
    CONSTRAINT EMPLEADO_HOTEL_FK FOREIGN KEY (id_hotel) REFERENCES HOTEL(id_hotel)
);

-- TABLA CLIENTE
CREATE TABLE CLIENTE (
    id_cliente      NUMBER PRIMARY KEY,
    nombre          VARCHAR2(20) NOT NULL,
    apellido        VARCHAR2(40) NOT NULL,
    run             VARCHAR2(13) UNIQUE,
    telefono        VARCHAR2(20),
    email           VARCHAR2(100),
    direccion       VARCHAR2(100)
);

-- TABLA RESERVA
CREATE TABLE RESERVA (
    id_reserva          NUMBER PRIMARY KEY,
    fecha_inicio        DATE NOT NULL,
    fecha_fin           DATE NOT NULL,
    estado              CHAR(1),
    id_cliente  NUMBER,
    id_habitacion NUMBER,
    id_consumo NUMBER,
    id_empleado NUMBER(10),
    CONSTRAINT RESERVA_CLIENTE_FK FOREIGN KEY (id_cliente) REFERENCES CLIENTE(id_cliente),
    CONSTRAINT RESERVA_HABITACION_FK FOREIGN KEY (id_habitacion) REFERENCES HABITACION(id_habitacion),
    CONSTRAINT RESERVA_EMPLEADO_FK FOREIGN KEY (id_empleado) REFERENCES EMPLEADO(id_empleado),
    CONSTRAINT RESERVA_CONSUMO_SERVICIO_FK FOREIGN KEY (id_consumo) REFERENCES CONSUMO_SERVICIO(id_consumo)
);

-- TABLA CONSUMO_SERVICIO
CREATE TABLE CONSUMO_SERVICIO (
    id_consumo          NUMBER PRIMARY KEY,
    cantidad            NUMBER,
    total               NUMBER,
    id_reserva          NUMBER,
    id_servicio         NUMBER,
    CONSTRAINT CONSUMO_SERVICIO_RESERVA_FK FOREIGN KEY (id_reserva) REFERENCES RESERVA(id_reserva),
    CONSTRAINT CONSUMO_SERVICIO_SERVICIO_FK FOREIGN KEY (id_servicio) REFERENCES SERVICIO(id_servicio)
);

--TABLA METODO DE PAGO
CREATE TABLE METODO_PAGO (
    id_metodo_pago NUMBER PRIMARY KEY,
    nombre         VARCHAR2(50) NOT NULL,
    descripcion    VARCHAR2(100)
);

-- TABLA PAGO
CREATE TABLE PAGO (
    id_pago             NUMBER PRIMARY KEY,
    id_reserva          NUMBER NOT NULL,
    monto               NUMBER(10,2) NOT NULL,
    fecha_de_pago       DATE NOT NULL,
    id_metodo_pago      NUMBER NOT NULL,
    CONSTRAINT PAGO_RESERVA_FK FOREIGN KEY (id_reserva) REFERENCES RESERVA(id_reserva)
);

-- ==============================
-- POBLACION DE TABLAS - GESTIÓN HOTEL
-- ==============================

--LA A DE LOS CHAR ES DE ACTIVOS

--HOTEL--

INSERT INTO HOTEL (id_hotel, nombre, direccion, telefono, email) 
VALUES (1, 'Hotel Grand Plaza', 'Av. Libertador 1234, Santiago, Chile', '123456789', 'contactostgo@grandplaza.com');

INSERT INTO HOTEL (id_hotel, nombre, direccion, telefono, email) 
VALUES (2, 'Hotel Grand Plaza', 'Calle Sol 567, Valparaíso, Chile', '987654321', 'contactovalpo@grandplaza.com');

--SERVICIO--

INSERT INTO SERVICIO (id_servicio, nombre_servicio, descripcion, precio_servicio, id_hotel) 
VALUES (1, 'Wi-Fi', 'Acceso a internet inalámbrico', 5000, 1);

INSERT INTO SERVICIO (id_servicio, nombre_servicio, descripcion, precio_servicio, id_hotel) 
VALUES (2, 'Desayuno', 'Desayuno buffet', 10000, 1);

INSERT INTO SERVICIO (id_servicio, nombre_servicio, descripcion, precio_servicio, id_hotel) 
VALUES (3, 'Piscina', 'Acceso a la piscina', 15000, 2);

--HABITACION--

INSERT INTO HABITACION (id_habitacion, numero, tipo, precio_por_noche, estado, id_hotel) 
VALUES (1, '101', 'Individual', 30000, 'A', 1);

INSERT INTO HABITACION (id_habitacion, numero, tipo, precio_por_noche, estado, id_hotel) 
VALUES (2, '102', 'Doble', 50000, 'A', 1);

INSERT INTO HABITACION (id_habitacion, numero, tipo, precio_por_noche, estado, id_hotel) 
VALUES (3, '201', 'Suite', 120000, 'A', 2);

--EMPLEADO--

INSERT INTO EMPLEADO (id_empleado, nombre, apellido, cargo, telefono, email, id_hotel) 
VALUES (1, 'Juan', 'Pérez', 'Recepcionista', 11223344, 'juan.perez@grandplaza.com', 1);

INSERT INTO EMPLEADO (id_empleado, nombre, apellido, cargo, telefono, email, id_hotel) 
VALUES (2, 'Ana', 'Martínez', 'Camarera', 22334455, 'ana.martinez@vistaverde.com', 2);

--CLIENTE--

INSERT INTO CLIENTE (id_cliente, nombre, apellido, run, telefono, email, direccion) 
VALUES (1, 'Carlos', 'Gómez', '12345678-9', '987654321', 'carlos.gomez@gmail.com', 'Calle Falsa 123');

INSERT INTO CLIENTE (id_cliente, nombre, apellido, run, telefono, email, direccion) 
VALUES (2, 'Laura', 'Rodríguez', '98765432-1', '123456789', 'laura.rodriguez@gmail.com', 'Av. Libertador 456');

--RESERVA--

INSERT INTO RESERVA (id_reserva, fecha_inicio, fecha_fin, estado, id_cliente, id_habitacion, id_consumo, id_empleado)
VALUES (1, TO_DATE('2023-10-01', 'YYYY-MM-DD'), TO_DATE('2023-10-05', 'YYYY-MM-DD'), 'A', 1, 1, NULL, 1);

INSERT INTO RESERVA (id_reserva, fecha_inicio, fecha_fin, estado, id_cliente, id_habitacion, id_consumo, id_empleado)
VALUES (2, TO_DATE('2023-10-03', 'YYYY-MM-DD'), TO_DATE('2023-10-04', 'YYYY-MM-DD'), 'A', 2, 2, NULL, 2);

--CONSUMO SERVICIO--

INSERT INTO CONSUMO_SERVICIO (id_consumo, cantidad, total, id_reserva, id_servicio) 
VALUES (1, 1, 5000, 1, 1);

INSERT INTO CONSUMO_SERVICIO (id_consumo, cantidad, total, id_reserva, id_servicio) 
VALUES (2, 2, 20000, 2, 3);

--METODO DE PAGO--

INSERT INTO METODO_PAGO (id_metodo_pago, nombre, descripcion)
VALUES (1, 'Tarjeta de Crédito', 'Tarjeta de crédito');

INSERT INTO METODO_PAGO (id_metodo_pago, nombre, descripcion)
VALUES (2, 'Efectivo', 'Pago en efectivo');

--PAGO--

INSERT INTO PAGO (id_pago, id_reserva, monto, fecha_de_pago, id_metodo_pago, estado)
VALUES (1, 1, 30000, TO_DATE('2023-10-01', 'YYYY-MM-DD'), 1);

INSERT INTO PAGO (id_pago, id_reserva, monto, fecha_de_pago, id_metodo_pago, estado)
VALUES (2, 2, 70000, TO_DATE('2023-10-03', 'YYYY-MM-DD'), 2);

