set serveroutput on
create or replace function prime_test(id number) return number
is
num number(20);
begin
select num_id into num from prime_entry where prime_num=id;
return 1;
exception
when no_data_found then
return 0;
end;
/
set serveroutput on
declare
num number;
n number;
i number;
flag number;
x number;
begin
num:=&num;
n:=TRUNC(num/2);
for i in 2..n loop
if(mod(num,i)=0)then
flag:=1;
exit;
else
flag:=0;
end if;
end loop;
dbms_output.put_line('________________________');

if(flag=1)then 
dbms_output.put_line('Number is not prime');
else
x:=prime_test(num);
if(x=1)then
dbms_output.put_line('Number is already exits!');
else
insert into prime_entry values(seqw.nextval,num);
end if;
end if;
end;
/




