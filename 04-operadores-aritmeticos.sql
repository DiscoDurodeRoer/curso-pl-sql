declare
    v_n1 Number(2) := 10;
    v_n2 Number(2) := 2;
begin
    -- suma
    DBMS_OUTPUT.PUT_LINE('Suma ' || (v_n1 + v_n2));
    -- resta
    DBMS_OUTPUT.PUT_LINE('Resta ' || (v_n1 - v_n2));
    -- multiplicacion
    DBMS_OUTPUT.PUT_LINE('Multiplicacion ' || (v_n1 * v_n2));
    -- division
    DBMS_OUTPUT.PUT_LINE('Division ' || (v_n1 / v_n2));
    -- potencia
    DBMS_OUTPUT.PUT_LINE('Potencia ' || (v_n1 ** v_n2));
end;