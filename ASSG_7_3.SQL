set serveroutput on 
declare
       y number;
begin
       y:=&x;
       if(mod(y,400)=0)
       then
            dbms_output.put_line('Leap Year');
       elsif((mod(y,4)=0) and (mod(y,100)!=0))
       then  
            dbms_output.put_line('Leap Year');
       else
            dbms_output.put_line('Not Leap Year');
       end if;
end;
/