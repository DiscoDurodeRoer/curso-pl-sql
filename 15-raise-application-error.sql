declare
    v_codigo producto.codigo%type := &codigo;
    v_producto producto%rowtype;
    -- Creo la excepcion
    limite_precio EXCEPTION;
    -- asocio la excepcion al codigo de error
    pragma exception_init(limite_precio,-20001);
begin

    select * into v_producto
    from producto
    where codigo = v_codigo;
    
    if v_producto.precio >= 100 then
        -- lanzo la excepcion
        RAISE_APPLICATION_ERROR(-20001, 'Se ha superado el limite');
    end if;
    
    dbms_output.put_line('Informacion del producto con codigo ' || v_codigo); 
    dbms_output.put_line('Nombre: ' || v_producto.nombre); 
    dbms_output.put_line('Precio: ' || v_producto.precio); 
    dbms_output.put_line('Codigo fabricante: ' || v_producto.codigo_fabricante); 

exception
    when no_data_found then
        dbms_output.put_line('No existe el producto ' || v_codigo);
    -- capturo la excepcion
    when limite_precio then
        dbms_output.put_line(sqlerrm);
    WHEN others THEN 
        dbms_output.put_line('Error'); 
end;