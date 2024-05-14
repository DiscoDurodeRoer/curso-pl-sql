declare
    v_n1 Number(2,0) := 1;
    v_n2 Number(2,0) := 2;
    v_n3 Number(2,0) := 3;
begin
    
    -- Si n1 es mayor o igual que n2 y n3, es el mayor
    if v_n1 >= v_n2 and v_n1 >= v_n3 then
        dbms_output.put_line(v_n1 || ' es el mayor');
    -- n1 esta descartado, si n2 es mayor que n3, es el mayor
    elsif v_n2 >= v_n3 then
        dbms_output.put_line(v_n2 || ' es el mayor');
    -- n1 y n2 descartados, n3 es el mayor
    else
        dbms_output.put_line(v_n3 || ' es el mayor');
    end if;
    
end;