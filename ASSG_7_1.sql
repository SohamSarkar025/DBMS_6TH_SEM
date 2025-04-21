set serveroutput on 
declare
     n number;
     i number;
     j number:=1;
begin
     n:=&x;
     for i in 1..n
     loop
          j:=j*i;
     end loop;
     dbms_output.put_line('Factorial of '||n||' is '||j);
end;
/