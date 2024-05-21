-- Creo el procedimiento
CREATE OR REPLACE PROCEDURE infoProducto(p_codigo producto.codigo%type)
as
     v_producto producto%rowtype;
begin

    -- Obtengo el producto
    select * into v_producto
    from producto
    where codigo = p_codigo;
    
    -- Muestro los datos del producto
    dbms_output.put_line('Informacion del producto con codigo ' || p_codigo); 
    dbms_output.put_line('Nombre: ' || v_producto.nombre); 
    dbms_output.put_line('Precio: ' || v_producto.precio); 
    dbms_output.put_line('Codigo fabricante: ' || v_producto.codigo_fabricante); 

-- excepciones
exception
    when no_data_found then
        dbms_output.put_line('No existe el producto ' || p_codigo);
    WHEN others THEN 
        dbms_output.put_line('Error'); 
end;
/

-- bloque anonimo para llamar al procedimiento
declare
    v_codigo producto.codigo%type := &codigo;
begin
    infoProducto(v_codigo);
end;

-- llamar al procedimiento fuera de un bloque anonimo
exec infoProducto(2);