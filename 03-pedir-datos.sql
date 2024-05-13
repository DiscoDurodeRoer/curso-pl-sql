declare
    -- Pedimos los datos
    -- ¡OJO! Si es un Varchar o Varchar2 debes encerrarlo entre comillas simples
    v_op1 Number(2,0) := &operando1;
    v_op2 Number(2,0) := &operando2;
    v_sum Number(2,0);
begin
    v_sum := v_op1 + v_op2;
    dbms_output.put_line(v_op1 || '+' || v_op2 || '=' || v_sum);
end;