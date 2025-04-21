set serveroutput on
declare
       a number;
       b number;
       c number;
begin
       a:=&a;
       b:=&b;
       c:=&c;
       if((a>b) and (a>c))
       then
            dbms_output.put_line('The maximum num is '||a||'');
       elsif(b>c)
       then
            dbms_output.put_line('The maximum num is '||b||'');
       else
            dbms_output.put_line('The maximum num is '||c||'');
       end if;
end;
/