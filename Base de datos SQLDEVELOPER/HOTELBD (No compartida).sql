SET SERVEROUTPUT ON;

-- Probar registro de reserva
DECLARE
  v_id_reserva NUMBER;
BEGIN
  HOTEL_PKG.proc_registrar_reserva(
    p_fecha_inicio   => TO_DATE('2023-12-01','YYYY-MM-DD'),
    p_fecha_fin      => TO_DATE('2023-12-05','YYYY-MM-DD'),
    p_id_cliente     => 1,
    p_id_habitacion  => 1,
    p_id_empleado    => 1,
    p_id_reserva_out => v_id_reserva
  );
  DBMS_OUTPUT.PUT_LINE('Reserva creada con id: ' || v_id_reserva);
END;
/

-- Probar cálculo de total
DECLARE
  v_tot HOTEL_PKG.t_total_rec;
BEGIN
  v_tot := HOTEL_PKG.func_calcular_total_reserva(1);
  DBMS_OUTPUT.PUT_LINE('Total reserva = ' || v_tot.total_general);
END;
/

DECLARE
  v_id_pago NUMBER;
BEGIN
  HOTEL_PKG.proc_registrar_pago(
    p_id_reserva => 1,
    p_monto => 20000,
    p_id_metodo_pago => 1,
    p_id_pago_out => v_id_pago
  );
  DBMS_OUTPUT.PUT_LINE('Pago registrado con id: '||v_id_pago);
END;
/

BEGIN
  HOTEL_PKG.proc_listar_consumos(1);
END;
/






