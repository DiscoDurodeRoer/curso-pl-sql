DROP procedure infoproducto;
drop function obtenerproducto;

-- creo el paquete
CREATE OR REPLACE PACKAGE productos as
    PROCEDURE infoproducto(p_codigo producto.codigo%type);
    FUNCTION obtenerproducto(p_codigo producto.codigo%type) RETURN producto%rowtype;
end;

-- creo el cuerpo del paquete
CREATE OR REPLACE PACKAGE BODY productos as

    PROCEDURE infoProducto(p_codigo producto.codigo%type)
    as
        v_producto producto%rowtype;
    begin
    
        select * into v_producto
        from producto
        where codigo = p_codigo;
        
        dbms_output.put_line('Informacion del producto con codigo ' || p_codigo); 
        dbms_output.put_line('Nombre: ' || v_producto.nombre); 
        dbms_output.put_line('Precio: ' || v_producto.precio); 
        dbms_output.put_line('Codigo fabricante: ' || v_producto.codigo_fabricante); 
        
    exception
        when no_data_found then
            dbms_output.put_line('No existe el producto ' || p_codigo);
        WHEN others THEN 
            dbms_output.put_line('Error'); 
    end;
    
        FUNCTION obtenerProducto(p_codigo producto.codigo%type)
    RETURN producto%rowtype
    AS
        v_producto producto%rowtype;
    begin
    
        select * into v_producto
        from producto
        where codigo = p_codigo;
        
        return v_producto;
        
    exception
        when no_data_found then
            dbms_output.put_line('No existe el producto ' || p_codigo);
            return null;
        WHEN others THEN 
            dbms_output.put_line('Error'); 
            return null;
    end;
    
end;

declare
    v_codigo producto.codigo%type := &codigo;
    v_producto producto%rowtype;
begin

    DBMS_OUTPUT.PUT_LINE('PROCEDIMIENTO');
    -- llamamos a infoproducto desde el paquete productos
    productos.infoproducto(v_codigo);
    
    DBMS_OUTPUT.PUT_LINE('FUNCION');
    -- llamamos a obtenerproducto desde el paquete productos
    v_producto := productos.obtenerproducto(v_codigo);
    
    if v_producto.codigo is not null then
        dbms_output.put_line('Informacion del producto con codigo ' || v_codigo); 
        dbms_output.put_line('Nombre: ' || v_producto.nombre); 
        dbms_output.put_line('Precio: ' || v_producto.precio); 
        dbms_output.put_line('Codigo fabricante: ' || v_producto.codigo_fabricante);
    end if;

end;

