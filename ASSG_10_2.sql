set serveroutput on 
create table Emp_audit 
(Emp_no number(4) primary key, 
Dept_no number(4) not null references Dept, 
Status varchar2(8), 
Salary number(8,2) not null,  
Audit_date date not null); 

set serveroutput on 
drop trigger trg_sal; 
create trigger trg_sal after  
update or delete on Emp for each row 
declare 
	status varchar2(20); 
	begin 
		if updating then 
			status:='UPDATE'; 
		end if; 
		if deleting then 
			status:='DELETE'; 
		end if; 
		insert into Emp_audit values(:Old.empno, :Old.deptno,status, :Old.Sal,SYSDATE);
 	end; 
/