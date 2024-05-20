DECLARE 
   -- Declaramos los arrays
   type alumnosarray IS VARRAY(3) OF VARCHAR2(20); 
   type notasarray IS VARRAY(3) OF NUMBER(2); 
   v_alumnos alumnosarray := alumnosarray('Fernando', 'Manuel', 'Alberto'); 
   v_notas notasarray  := notasarray(7, 10, 2); 
BEGIN 
   -- recorremos los arrays
   FOR v_i in 1..v_alumnos.count LOOP 
      dbms_output.put_line('Alumno: ' || v_alumnos(v_i) || 
      ', nota: ' || v_notas(v_i)); 
   END LOOP; 
END;