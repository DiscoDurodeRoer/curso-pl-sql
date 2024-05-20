declare
    -- Declaramos las variables con el tipo de la columna
    v_codigo producto.codigo%type := &codigo;
    v_nombre producto.nombre%type;
begin

    -- Obtenemos el nombre del producto
    select nombre into v_nombre
    from producto
    where codigo = v_codigo;
    
    -- Mostramos el resultado
    dbms_output.put_line('Nombre del producto con codigo ' || 
    v_codigo || ': ' || v_nombre); 
end;