set serveroutput on
declare
num number;
j number;
n number;
i number;
flag number;
g number;
begin
num:=&num;
n:=TRUNC(num/2);
for i in 2..n loop 
if ( mod(num,i)=0)then
flag:=1;
exit;
else 
flag:=0;
end if;
end loop;
dbms_output.put_line('______________');

if(flag=1)then dbms_output.put_line(num||' is not prime');
else
select seqw.nextval into g from dual;
insert into prime_entry values(g,num);
end if;
end;
/