-- Seccion donde declaramos las variables
declare
    v_num Number(2) := 10;
    v_cadena Varchar(10) := 'Fernando';
    v_fecha Date := SYSDATE;
begin
    -- Mostramos el valor de cada una de las variables
    DBMS_OUTPUT.PUT_LINE('El valor de v_num es ' || v_num);
    DBMS_OUTPUT.PUT_LINE('El valor de v_cadena es ' || v_cadena);
    DBMS_OUTPUT.PUT_LINE('El valor de v_fecha es ' || v_fecha);
end;