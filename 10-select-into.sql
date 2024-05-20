declare
    v_total Number(8) := 0;
    v_total_precios Number(8) := 0;
begin
    -- almaceno los campos en las variables
    select count(*), sum(precio) into v_total, v_total_precios
    from producto;
    
    -- muestro los valores
    dbms_output.put_line('Numero total de productos: ' || v_total);
    dbms_output.put_line('Precio total de todos los productos: ' || v_total_precios);  
end;