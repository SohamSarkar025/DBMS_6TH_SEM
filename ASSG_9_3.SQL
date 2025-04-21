set serveroutput on
declare

e_no number:=&e_no;
e_name varchar2(20);

begin
select ename into e_name from emp where empno=e_no;
dbms_output.put_line('The employee name is '||e_name);
exception
when no_data_found then
dbms_output.put_line('No data found');
end;
/