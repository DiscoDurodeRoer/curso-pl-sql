-- Creo la funcion
CREATE OR REPLACE FUNCTION obtenerProducto(p_codigo producto.codigo%type)
RETURN producto%rowtype
AS
    v_producto producto%rowtype;
begin

    -- Obtengo el producto
    select * into v_producto
    from producto
    where codigo = p_codigo;

    -- Devuelvo el producto    
    return v_producto;
   
-- control de excepciones
exception
    when no_data_found then
        dbms_output.put_line('No existe el producto ' || p_codigo);
        return null;
    WHEN others THEN 
        dbms_output.put_line('Error'); 
        return null;
end;
/

declare
    v_codigo producto.codigo%type := &codigo;
    v_producto producto%rowtype;
begin
    -- Llamamos a la función creada
    v_producto := obtenerProducto(v_codigo);
    
    -- En los rowtype, para saber si es nulo, debemos acceder a una de sus propiedades 
    if v_producto.codigo is not null then
        dbms_output.put_line('Informacion del producto con codigo ' || v_codigo); 
        dbms_output.put_line('Nombre: ' || v_producto.nombre); 
        dbms_output.put_line('Precio: ' || v_producto.precio); 
        dbms_output.put_line('Codigo fabricante: ' || v_producto.codigo_fabricante);
    end if;
    
end;