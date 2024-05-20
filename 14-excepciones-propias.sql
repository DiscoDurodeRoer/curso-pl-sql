declare
    -- Declaramos las variables con el tipo de la columna
    v_codigo producto.codigo%type := &codigo;
    v_producto producto%rowtype;
    -- declaramos la excepcion
    limite_precio exception;
begin

    -- Obtenemos el nombre del producto
    select * into v_producto
    from producto
    where codigo = v_codigo;
    
    if v_producto.precio >= 100 then
        -- Lanzamos la excepcion
        raise limite_precio;
    end if;
    
    -- Mostramos el resultado
    dbms_output.put_line('Informacion del producto con codigo ' || v_codigo); 
    dbms_output.put_line('Nombre: ' || v_producto.nombre); 
    dbms_output.put_line('Precio: ' || v_producto.precio); 
    dbms_output.put_line('Codigo fabricante: ' || v_producto.codigo_fabricante); 

exception
    when no_data_found then
        dbms_output.put_line('No existe el producto ' || v_codigo);
    -- Controlamos la excepcion
    WHEN limite_precio then
        dbms_output.put_line('El producto vale mas de 100€');
    WHEN others THEN 
        dbms_output.put_line('Error'); 
end;