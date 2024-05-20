-- while
declare
  -- Declaro la variable v_i
  v_i number(2) := 1;
begin
  DBMS_OUTPUT.PUT_LINE('While');
  -- Recorro de v_i a 10m incluido el 10
  while (v_i<=10)
  loop
    DBMS_OUTPUT.PUT_LINE(v_i);
    -- Actualizo el valor de v_i
    v_i := v_i+1;
  end loop;

end;
/

-- for
begin
  DBMS_OUTPUT.PUT_LINE('For');
  DBMS_OUTPUT.PUT_LINE('NORMAL');
  for v_i in 1..10
  loop
    DBMS_OUTPUT.PUT_LINE(v_i);
  end loop;
  
  DBMS_OUTPUT.PUT_LINE('REVERSO');
  for v_i in reverse 1..10
  loop
    DBMS_OUTPUT.PUT_LINE(v_i);
  end loop;

end;
/

-- loop
declare
  v_i number(8) := 1;
begin
  
  DBMS_OUTPUT.PUT_LINE('Loop');
  loop
    -- muestro el valor de v_i
    DBMS_OUTPUT.PUT_LINE(v_i);
    exit when v_i=10;
    -- actualizo v_i
    v_i := v_i+1;
  end loop;

end;
