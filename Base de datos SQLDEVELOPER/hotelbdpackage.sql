-- Paquete: HOTEL_PKG

-- Registrar reserva
--Calcular total reserva (noches * precio habitacion + suma consumos)
--Registrar pagos parciales y actualizar estado de reserva
--Usa record, associative arrays, cursores anidados y manejo de excepciones

CREATE OR REPLACE PACKAGE HOTEL_PKG IS


  -- record que representa los datos mínimos de una reserva
  TYPE t_reserva_rec IS RECORD (
    id_reserva     NUMBER,
    fecha_inicio   DATE,
    fecha_fin      DATE,
    estado         CHAR(1),
    id_cliente     NUMBER,
    id_habitacion  NUMBER,
    id_empleado    NUMBER
  );

  -- record para devolver resumen de totales
  TYPE t_total_rec IS RECORD (
    noches        NUMBER,
    total_habitacion NUMBER,
    total_servicios  NUMBER,
    total_general    NUMBER
  );

  -- associative array para lista de consumos (id_servicio, cantidad, total)
  TYPE t_consumo_rec IS RECORD (
    id_consumo NUMBER,
    id_servicio NUMBER,
    cantidad NUMBER,
    total NUMBER
  );
  TYPE t_consumo_tab IS TABLE OF t_consumo_rec INDEX BY PLS_INTEGER;

  -- Excepciones específicas --
  ex_habitacion_no_encontrada EXCEPTION;
  ex_reserva_no_encontrada EXCEPTION;
  ex_pago_invalido EXCEPTION;

  -- Procedimientos y funciones públicas --

  -- Registrar una reserva nueva: inserta en RESERVA y devuelve id_reserva generado
  PROCEDURE proc_registrar_reserva(
    p_fecha_inicio IN DATE,
    p_fecha_fin    IN DATE,
    p_id_cliente   IN NUMBER,
    p_id_habitacion IN NUMBER,
    p_id_empleado  IN NUMBER,
    p_id_reserva_out OUT NUMBER
  );

  -- Calcular el total de una reserva (noches * precio habitacion + sum(consumos))
  FUNCTION func_calcular_total_reserva(p_id_reserva IN NUMBER) RETURN t_total_rec;

  -- Registrar un pago parcial; actualiza PAGO y cambia estado de RESERVA si se completa el pago.
  -- p_monto puede ser parcial. estado_reserva: 'A' (activa), 'P' (pagada parcialmente), 'C' (cerrada/pagada)
  PROCEDURE proc_registrar_pago(
    p_id_reserva IN NUMBER,
    p_monto      IN NUMBER,
    p_id_metodo_pago IN NUMBER,
    p_id_pago_out OUT NUMBER
  );

  -- Procedimiento de utilidad: listar consumos de una reserva (ejemplo de cursores anidados)
  PROCEDURE proc_listar_consumos(p_id_reserva IN NUMBER);

END HOTEL_PKG;
/
CREATE OR REPLACE PACKAGE BODY HOTEL_PKG IS

  -- Implementación de helpers (privados) --

  -- obtener siguiente id para una tabla (simple, no concurrente)
  FUNCTION next_id(p_table IN VARCHAR2, p_col IN VARCHAR2) RETURN NUMBER IS
    v_sql VARCHAR2(4000);
    v_id  NUMBER;
  BEGIN
    v_sql := 'SELECT NVL(MAX(' || p_col || '),0)+1 FROM ' || p_table;
    EXECUTE IMMEDIATE v_sql INTO v_id;
    RETURN v_id;
  EXCEPTION
    WHEN OTHERS THEN
      RETURN 1;
  END;

  -- calcular número de noches entre fechas (si fecha_fin <= fecha_inicio devuelve 0)
  FUNCTION f_calcular_noches(p_inicio IN DATE, p_fin IN DATE) RETURN NUMBER IS
  BEGIN
    IF p_fin <= p_inicio THEN
      RETURN 0;
    END IF;
    RETURN TRUNC(p_fin) - TRUNC(p_inicio);
  EXCEPTION
    WHEN OTHERS THEN
      RETURN 0;
  END;

  -- PROCEDIMIENTO: proc_registrar_reserva --
  PROCEDURE proc_registrar_reserva(
    p_fecha_inicio IN DATE,
    p_fecha_fin    IN DATE,
    p_id_cliente   IN NUMBER,
    p_id_habitacion IN NUMBER,
    p_id_empleado  IN NUMBER,
    p_id_reserva_out OUT NUMBER
  ) IS
    v_id_reserva NUMBER;
    v_habi_count NUMBER;
  BEGIN
    -- validar que la habitacion exista
    SELECT COUNT(*) INTO v_habi_count FROM HABITACION WHERE id_habitacion = p_id_habitacion;
    IF v_habi_count = 0 THEN
      RAISE ex_habitacion_no_encontrada;
    END IF;

    -- generar id y crear reserva (estado 'A' = Activa)
    v_id_reserva := next_id('RESERVA', 'id_reserva');
    INSERT INTO RESERVA (
      id_reserva, fecha_inicio, fecha_fin, estado, id_cliente, id_habitacion, id_empleado
    ) VALUES (
      v_id_reserva, p_fecha_inicio, p_fecha_fin, 'A', p_id_cliente, p_id_habitacion, p_id_empleado
    );

    p_id_reserva_out := v_id_reserva;
    COMMIT;
  EXCEPTION
    WHEN ex_habitacion_no_encontrada THEN
      ROLLBACK;
      RAISE_APPLICATION_ERROR(-20001, 'La habitación indicada no existe.');
    WHEN DUP_VAL_ON_INDEX THEN
      ROLLBACK;
      RAISE_APPLICATION_ERROR(-20002, 'Violación de unicidad al insertar la reserva.');
    WHEN OTHERS THEN
      ROLLBACK;
      RAISE;
  END proc_registrar_reserva;

  /* ---- FUNCTION: func_calcular_total_reserva 
       retorna record con noches, total_habitacion, total_servicios, total_general
  ---- */
  FUNCTION func_calcular_total_reserva(p_id_reserva IN NUMBER) RETURN t_total_rec IS
    v_reserva_rec t_reserva_rec;
    v_total t_total_rec;
    v_precio_habitacion NUMBER := 0;
    v_noches NUMBER := 0;

    -- cursor externo: obtener datos reserva
    CURSOR cur_res IS
      SELECT r.id_reserva, r.fecha_inicio, r.fecha_fin, r.estado, r.id_cliente, r.id_habitacion, r.id_empleado
      FROM RESERVA r
      WHERE r.id_reserva = p_id_reserva;

    -- cursor interno (nido): consumos para la reserva
    CURSOR cur_consumos IS
      SELECT cs.id_consumo, cs.id_servicio, cs.cantidad, cs.total
      FROM CONSUMO_SERVICIO cs
      WHERE cs.id_reserva = p_id_reserva;
  BEGIN
    v_total.noches := 0;
    v_total.total_habitacion := 0;
    v_total.total_servicios := 0;
    v_total.total_general := 0;

    OPEN cur_res;
    FETCH cur_res INTO v_reserva_rec;
    IF cur_res%NOTFOUND THEN
      CLOSE cur_res;
      RAISE ex_reserva_no_encontrada;
    END IF;
    CLOSE cur_res;

    -- obtener precio habitacion
    SELECT precio_por_noche INTO v_precio_habitacion
    FROM HABITACION
    WHERE id_habitacion = v_reserva_rec.id_habitacion;

    v_noches := f_calcular_noches(v_reserva_rec.fecha_inicio, v_reserva_rec.fecha_fin);
    v_total.noches := v_noches;
    v_total.total_habitacion := v_noches * NVL(v_precio_habitacion,0);

    -- recorrido anidado: sumar consumos (cursor interno)
    FOR rc IN cur_consumos LOOP
      v_total.total_servicios := v_total.total_servicios + NVL(rc.total,0);
    END LOOP;

    v_total.total_general := v_total.total_habitacion + v_total.total_servicios;
    RETURN v_total;

  EXCEPTION
    WHEN NO_DATA_FOUND THEN
      RAISE_APPLICATION_ERROR(-20010, 'Habitación de la reserva no encontrada.');
    WHEN ex_reserva_no_encontrada THEN
      RAISE_APPLICATION_ERROR(-20011, 'Reserva no encontrada: ' || p_id_reserva);
    WHEN OTHERS THEN
      RAISE;
  END func_calcular_total_reserva;

  /* -- PROCEDIMIENTO: proc_registrar_pago --
     Inserta en PAGO, actualiza estado de RESERVA:
       - Si total pagos >= total reserva => estado 'C' (cerrada)
       - Si total pagos > 0 y < total => estado 'P' (pagada parcialmente)
       - Si total pagos = 0 => 'A'
  ---- */
  PROCEDURE proc_registrar_pago(
    p_id_reserva IN NUMBER,
    p_monto      IN NUMBER,
    p_id_metodo_pago IN NUMBER,
    p_id_pago_out OUT NUMBER
  ) IS
    v_id_pago NUMBER;
    v_total_rec t_total_rec;
    v_total_reserva NUMBER;
    v_sum_pagos NUMBER;
  BEGIN
    -- validar monto
    IF p_monto IS NULL OR p_monto <= 0 THEN
      RAISE ex_pago_invalido;
    END IF;

    -- validar existencia de reserva
    DECLARE
      v_count NUMBER;
    BEGIN
      SELECT COUNT(*) INTO v_count FROM RESERVA WHERE id_reserva = p_id_reserva;
      IF v_count = 0 THEN
        RAISE ex_reserva_no_encontrada;
      END IF;
    END;

    -- calcular total de la reserva
    v_total_rec := func_calcular_total_reserva(p_id_reserva);
    v_total_reserva := v_total_rec.total_general;

    -- insertar pago
    v_id_pago := next_id('PAGO', 'id_pago');
    INSERT INTO PAGO (id_pago, id_reserva, monto, fecha_de_pago, id_metodo_pago, estado)
      VALUES (v_id_pago, p_id_reserva, p_monto, SYSDATE, p_id_metodo_pago, 'A'); -- 'A' = activo (registro)

    -- recalc suma de pagos realizados (incluye este)
    SELECT NVL(SUM(monto),0) INTO v_sum_pagos FROM PAGO WHERE id_reserva = p_id_reserva;

    -- actualizar estado de reserva en base a pagos
    IF v_sum_pagos >= v_total_reserva THEN
      UPDATE RESERVA SET estado = 'C' WHERE id_reserva = p_id_reserva; -- cerrada/pagada
    ELSIF v_sum_pagos > 0 AND v_sum_pagos < v_total_reserva THEN
      UPDATE RESERVA SET estado = 'P' WHERE id_reserva = p_id_reserva; -- pagada parcialmente
    ELSE
      UPDATE RESERVA SET estado = 'A' WHERE id_reserva = p_id_reserva; -- activa
    END IF;

    p_id_pago_out := v_id_pago;
    COMMIT;
  EXCEPTION
    WHEN ex_pago_invalido THEN
      ROLLBACK;
      RAISE_APPLICATION_ERROR(-20020, 'Monto de pago inválido.');
    WHEN ex_reserva_no_encontrada THEN
      ROLLBACK;
      RAISE_APPLICATION_ERROR(-20021, 'Reserva no encontrada (no se puede registrar pago).');
    WHEN DUP_VAL_ON_INDEX THEN
      ROLLBACK;
      RAISE_APPLICATION_ERROR(-20022, 'Violación de unicidad al insertar el pago.');
    WHEN OTHERS THEN
      ROLLBACK;
      RAISE;
  END proc_registrar_pago;

  /* -- PROCEDIMIENTO: proc_listar_consumos --
     Ejemplo que demuestra cursores anidados: para cada consumo imprime detalles
     (en un entorno real podrías retornar un REF CURSOR; aquí mostramos SELECTs con DBMS_OUTPUT).
  -- */
  PROCEDURE proc_listar_consumos(p_id_reserva IN NUMBER) IS
    CURSOR c_consumos IS
      SELECT id_consumo, id_servicio, cantidad, total
      FROM CONSUMO_SERVICIO
      WHERE id_reserva = p_id_reserva;

    -- cursor anidado para obtener nombre de servicio
    CURSOR c_serv(p_id_servicio NUMBER) IS
      SELECT nombre_servicio, descripcion FROM SERVICIO WHERE id_servicio = p_id_servicio;

    v_consumo t_consumo_rec;
    v_nombre_servicio VARCHAR2(200);
    v_desc VARCHAR2(400);
  BEGIN
    OPEN c_consumos;
    LOOP
      FETCH c_consumos INTO v_consumo.id_consumo, v_consumo.id_servicio, v_consumo.cantidad, v_consumo.total;
      EXIT WHEN c_consumos%NOTFOUND;

      -- abrir cursor anidado por cada consumo
      OPEN c_serv(v_consumo.id_servicio);
      FETCH c_serv INTO v_nombre_servicio, v_desc;
      IF c_serv%FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Consumo ID=' || v_consumo.id_consumo
          || ' Servicio=' || v_nombre_servicio
          || ' Cantidad=' || v_consumo.cantidad
          || ' Total=' || v_consumo.total);
      ELSE
        DBMS_OUTPUT.PUT_LINE('Consumo ID=' || v_consumo.id_consumo || ' Servicio no encontrado');
      END IF;
      CLOSE c_serv;
    END LOOP;
    CLOSE c_consumos;
  EXCEPTION
    WHEN OTHERS THEN
      IF c_consumos%ISOPEN THEN
        CLOSE c_consumos;
      END IF;
      RAISE;
  END proc_listar_consumos;

END HOTEL_PKG;
/
