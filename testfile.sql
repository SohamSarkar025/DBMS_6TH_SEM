set serverout on

create or replace function prime_test2(id number) return number is
num number(10);
begin
select num_id into num from prime_entry where prime_num=id;
return 0;
exception
when no_data_found then
return 1;
end;
/
declare
num number(10);
n number;
x number;
flag number;
i number;
begin
num:=&num;
n:=TRUNC(num/2);
for i in 2..n loop
if(mod(num,2)=0)then
flag:=1;
exit;
else
flag:=0;
end if;
end loop;
if(flag=1)then
dbms_output.put_line('Number is not prime');
else
x:=prime_test2(num);
if(x=1)then
insert into prime_entry values(seq.nextval,num);
else
dbms_output.put_line('Number already exist..');
end if;
end if;
end;
/
