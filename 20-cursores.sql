declare
    
    -- creo un cursor
    cursor c_productos is
    select *
    from producto
    order by precio;

    v_producto producto%rowtype;

    -- creo un cursor de dos tablas
    cursor c_productos_fabricante is
    select 
        p.codigo,
        p.nombre,
        p.precio,
        f.nombre as nombre_fabricante
    from producto p, fabricante f
    where p.codigo_fabricante = f.codigo
    order by precio;
    
begin

    DBMS_OUTPUT.PUT_LINE('Cursor c_productos');
    -- Abrimos el cursor
    open c_productos;
    
    -- Recorremos el cursor
    loop
        -- obtenemos una fila y la guardamos en v_producto
        fetch c_productos into v_producto;
        -- salimos cuando no haya mas datos
        exit when c_productos%notfound;
        
        -- Mostrar informacion del producto
        DBMS_OUTPUT.PUT_LINE('Informacion producto con codigo ' || v_producto.codigo);
        DBMS_OUTPUT.PUT_LINE('Nombre: ' || v_producto.nombre);
        DBMS_OUTPUT.PUT_LINE('Precio ' || v_producto.precio);
        DBMS_OUTPUT.PUT_LINE('Codigo fabricante ' || v_producto.codigo_fabricante);
        DBMS_OUTPUT.PUT_LINE('');
        
    end loop;
    
    -- cerrar el cursor
    close c_productos;
    
    DBMS_OUTPUT.PUT_LINE('Cursor c_productos_fabricante');
    
    -- no es necesario abrir y cerrar el cursor
    for registro in c_productos_fabricante loop
        DBMS_OUTPUT.PUT_LINE('Informacion producto con codigo ' || registro.codigo);
        DBMS_OUTPUT.PUT_LINE('Nombre: ' || registro.nombre);
        DBMS_OUTPUT.PUT_LINE('Precio ' || registro.precio);
        DBMS_OUTPUT.PUT_LINE('Nombre fabricante ' || registro.nombre_fabricante);
        DBMS_OUTPUT.PUT_LINE('');
    end loop;
    
end;