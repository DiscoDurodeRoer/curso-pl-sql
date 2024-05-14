declare
    v_n1 Number(2):= 3;
    v_n2 Number(2):= 2;
    v_n3 Number(2):= 1;
begin

    -- operadores logicos
    if v_n1 > v_n2 then
        DBMS_OUTPUT.PUT_LINE(v_n1 || 
        ' es mayor que ' ||
        v_n2);
    end if;
    
    if v_n1 < v_n2 then
        DBMS_OUTPUT.PUT_LINE(v_n1 || 
        ' es menor que ' ||
        v_n2);
    end if;
    
    if v_n1 >= v_n2 then
        DBMS_OUTPUT.PUT_LINE(v_n1 || 
        ' es mayor o igual que ' ||
        v_n2);
    end if;
    
    if v_n1 <= v_n2 then
        DBMS_OUTPUT.PUT_LINE(v_n1 || 
        ' es menor o igual que ' ||
        v_n2);
    end if;
    
    if v_n1 = v_n2 then
         DBMS_OUTPUT.PUT_LINE(v_n1 || 
        ' es igual que ' ||
        v_n2);
    end if;
    
    if v_n1 <> v_n2 then
         DBMS_OUTPUT.PUT_LINE(v_n1 || 
        ' es distinto que ' ||
        v_n2);
    end if;
    
    -- operadores relacionales
    
    -- AND
    -- T and T = T
    -- T and F = F
    -- F and T = F
    -- F and F = F
    
    if v_n1 > v_n2 and v_n1 > v_n3 then
        DBMS_OUTPUT.PUT_LINE(v_n1 || 
        ' es mayor que ' || v_n2 || ' y ' ||
        v_n3);
    end if;
    
    -- AND
    -- T or T = T
    -- T or F = T
    -- F or T = T
    -- F or F = F
    
     if v_n1 = v_n2 or v_n2 > v_n3 then
        DBMS_OUTPUT.PUT_LINE(v_n1 || 
        ' es igual que ' || v_n2 || ' o ' ||
        ' que ' || v_n2 || ' es mayor que ' || v_n3);
    end if;
    
end;