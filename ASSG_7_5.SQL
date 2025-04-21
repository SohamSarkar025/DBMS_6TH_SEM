set serveroutput on
drop table areas;
create table areas(radius number(5,3),area number(10,3));
declare
       r number;
       pi constant number(10,3):=3.14;
       area number(10,3);
begin
       for r in 1..10
       loop
           area:=pi*power(r,2);
           insert into areas values(r,area);
       end loop;
end;
/
       