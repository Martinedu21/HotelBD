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

-- TABLA EMPLEADO
CREATE TABLE EMPLEADO (
    id_empleado     NUMBER(10) PRIMARY KEY,
    nombre          VARCHAR2(30) NOT NULL,
    apellido        VARCHAR2(30) NOT NULL,
    cargo           VARCHAR2(30),
    telefono        NUMBER,
    email           VARCHAR2(100),
    id_hotel        NUMBER,
    CONSTRAINT EMPLEADO_HOTEL_FK FOREIGN KEY (id_hotel) REFERENCES HOTEL(id_hotel)
);

-- TABLA HABITACION
CREATE TABLE HABITACION (
    id_habitacion   NUMBER PRIMARY KEY,
    numero          VARCHAR2(10),
    tipo            VARCHAR2(20),
    precio_por_noche NUMBER,
    estado          CHAR(1),
    id_hotel        NUMBER,
    CONSTRAINT HABITACION_HOTEL_FK FOREIGN KEY (id_hotel) REFERENCES HOTEL(id_hotel)
);

-- TABLA SERVICIO
CREATE TABLE SERVICIO (
    id_servicio     NUMBER PRIMARY KEY,
    nombre_servicio VARCHAR2(50) NOT NULL,
    descripcion     VARCHAR2(100),
    precio_servicio NUMBER(10),
    id_hotel        NUMBER,
    CONSTRAINT SERVICIO_HOTEL_FK FOREIGN KEY (id_hotel) REFERENCES HOTEL(id_hotel)
);

-- TABLA RESERVA
CREATE TABLE RESERVA (
    id_reserva          NUMBER PRIMARY KEY,
    fecha_inicio        DATE NOT NULL,
    fecha_fin           DATE NOT NULL,
    estado              CHAR(1),
    id_cliente          NUMBER,
    id_habitacion       NUMBER,
    id_empleado         NUMBER(10),
    CONSTRAINT RESERVA_CLIENTE_FK FOREIGN KEY (id_cliente) REFERENCES CLIENTE(id_cliente),
    CONSTRAINT RESERVA_HABITACION_FK FOREIGN KEY (id_habitacion) REFERENCES HABITACION(id_habitacion),
    CONSTRAINT RESERVA_EMPLEADO_FK FOREIGN KEY (id_empleado) REFERENCES EMPLEADO(id_empleado)
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

-- TABLA METODO DE PAGO
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
    estado              CHAR(1),
    CONSTRAINT PAGO_RESERVA_FK FOREIGN KEY (id_reserva) REFERENCES RESERVA(id_reserva),
    CONSTRAINT PAGO_METODO_FK FOREIGN KEY (id_metodo_pago) REFERENCES METODO_PAGO(id_metodo_pago)
);
