select * from dept; 
set serveroutput on 
declare 
	dno number:=&dno; 
	loc1 varchar2(10):='&loc'; 
begin 
	update Dept set loc=loc1 where Deptno=dno; 
	if sql%found then 
		dbms_output.put_line(' The updated loc is ' || loc1); 
	end if; 
	if sql%notfound then 
		dbms_output.put_line(' The updated loc is not found. '); 
	end if; 
end; 
/ 