
set serveroutput on

declare

cursor cur is
select empno,sal from emp where deptno=(select deptno from dept where dname='RESEARCH');
emp_id number(10);
emp_sal emp.sal%type;

begin

open cur;
if cur%isopen then
loop
fetch cur into emp_id,emp_sal;
exit when cur%notfound;
update emp set sal=sal*0.02 where empno=emp_id;
select sal into emp_sal from emp where empno=emp_id;
insert into emp_sal_inc values(emp_id,emp_sal,sysdate);
end loop;
dbms_output.put_line(cur%rowcount);
else
dbms_output.put_line('cursor not found');
end if;
close cur;
end;
/

