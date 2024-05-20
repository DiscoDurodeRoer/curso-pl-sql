declare
    -- Declaramos las variables con el tipo de la columna
    v_codigo producto.codigo%type := &codigo;
    v_producto producto%rowtype;
begin

    -- Obtenemos el nombre del producto
    select * into v_producto
    from producto
    where codigo = v_codigo;
    
    -- Mostramos el resultado
    DBMS_OUTPUT.put_line('Informacion del producto con codigo ' || v_codigo);
    DBMS_OUTPUT.put_line('Nombre: ' || v_producto.nombre);
    DBMS_OUTPUT.put_line('Precio: ' || v_producto.precio);
    DBMS_OUTPUT.put_line('Codigo fabricante: ' || v_producto.codigo_fabricante);

end;