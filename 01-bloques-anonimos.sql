-- Muestra los mensajes en "Salida Script"
-- Sino se pone, debes activar la salida DBMS
set serveroutput on;

begin
    -- dbms_output.put_line muestra el texto que le pasemos
    dbms_output.put_line('Hola mundo');
end;