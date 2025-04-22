set serveroutput on
declare 
IN_ARR exception;
Pragma exception_init(IN_ARR , -01400);
begin
insert into emp values(null,'BLAKE','MANAGER',7839,to_date('1-5-1981','dd-mm-yyyy'),2850, null, 30);
exception
when IN_ARR then
dbms_output.put_line('My exception you are gandu , u cant put not null values ');
end;
/
