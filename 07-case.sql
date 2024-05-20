declare
    v_dia Number(1,0) := &dia;
begin
    
    -- Segun el valor de v_dia, mostraremos un mensaje u otro
    case v_dia
        when 1 then dbms_output.put_line('Lunes');
        when 2 then dbms_output.put_line('Martes');
        when 3 then dbms_output.put_line('Miercoles');
        when 4 then dbms_output.put_line('Jueves');
        when 5 then dbms_output.put_line('Viernes');
        when 6 then dbms_output.put_line('Sabado');
        when 7 then dbms_output.put_line('Domingo');
        else dbms_output.put_line('Debe ser un dia entre 1 y 7');
    end case;    
end;