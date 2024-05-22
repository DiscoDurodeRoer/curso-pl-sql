CREATE OR REPLACE PROCEDURE infoProducto(p_codigo producto.codigo%type, p_producto OUT producto%rowtype)
as
begin

    select * into p_producto
    from producto
    where codigo = p_codigo;
    
exception
    when no_data_found then
        dbms_output.put_line('No existe el producto ' || p_codigo);
    WHEN others THEN 
        dbms_output.put_line('Error'); 
end;

declare
    v_codigo producto.codigo%type := &codigo;
    v_producto producto%rowtype;
begin
    -- Llamamos al procedimiento creado
    infoProducto(v_codigo, v_producto);
    if v_producto.codigo is not null then
        dbms_output.put_line('Informacion del producto con codigo ' || v_codigo); 
        dbms_output.put_line('Nombre: ' || v_producto.nombre); 
        dbms_output.put_line('Precio: ' || v_producto.precio); 
        dbms_output.put_line('Codigo fabricante: ' || v_producto.codigo_fabricante);
    end if;

end;