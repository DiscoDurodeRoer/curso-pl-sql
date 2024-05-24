-- Se ejecuta antes de insertar, actualizar o borrar en la tabla producto
CREATE OR REPLACE TRIGGER estado_operacion_before
before insert or update or delete on producto
begin

    -- Indica si estoy insertando
    if INSERTING then
        DBMS_OUTPUT.PUT_LINE('Insertando productos...');
    -- Indica si estoy actualizando
    elsif UPDATING then
        DBMS_OUTPUT.PUT_LINE('Actualizando productos...');
    -- Indica si estoy borrando
    elsif DELETING then
        DBMS_OUTPUT.PUT_LINE('Borrando productos...');
    end if;

end;
/

-- Se ejecuta despues de insertar, actualizar o borrar en la tabla producto
CREATE OR REPLACE TRIGGER estado_operacion_after
after insert or update or delete on producto
begin

    -- Indica si estoy insertando
    if INSERTING then
        DBMS_OUTPUT.PUT_LINE('Producto/s insertados');
    -- Indica si estoy actualizando
    elsif UPDATING then
        DBMS_OUTPUT.PUT_LINE('Producto/s actualizados');
    -- Indica si estoy borrando
    elsif DELETING then
        DBMS_OUTPUT.PUT_LINE('Producto/s borrados');
    end if;

end;
/

-- Se ejecuta antes de insertar, actualizar o borrar en la tabla producto
-- Si salta excepcion, no se completa la operacion
-- FOR EACH ROW indica que se ejecuta una vez por cada elemento insertado o actualizado
CREATE OR REPLACE TRIGGER validacion_producto
before insert or update on producto FOR EACH ROW
declare
    v_num_fabricantes NUMBER(4);
begin
    
    -- validamos que el precio es positivo, sino lo es lanzamos excepcion
    if :new.precio < 0 then
        RAISE_APPLICATION_ERROR(-20001, 'El precio no puede ser negativo');
    end if;
    
    -- cuenta el numero de fabricantes
    select COUNT(*) into v_num_fabricantes
    from fabricante
    where codigo = :new.codigo_fabricante;
    
    -- si no hay fabricantes, lanzamos excepcion
    if v_num_fabricantes = 0 then
        RAISE_APPLICATION_ERROR(-20002, 'No existe el fabricante');
    end if;
    
end;
/

-- Insertamos un prodcuto de prueba
INSERT INTO producto (codigo, nombre, precio, codigo_fabricante) 
VALUES(12, 'Nuevo producto', 100, 1);

-- Se ejecuta cuando cambia la columna codigo_fabricante de la tabla producto
CREATE OR REPLACE TRIGGER cambio_fabricante
before update of codigo_fabricante on producto FOR EACH ROW
begin
    -- ¡Tabla mutante!
    -- UPDATE producto set precio = precio + 10 where codigo = :old.codigo;
 
    -- comprobamos si el valor el diferente    
    if :new.codigo_fabricante <> :old.codigo_fabricante then
        -- modificamos el valor de la columna (solo en before)
        :new.precio := :old.precio + 10;
    end if;
end;
/

-- Actualizo un producto
UPDATE producto set codigo_fabricante = 1 where codigo = 1;

-- Borro el producto
DELETE FROM producto where codigo = 12;
