set serveroutput on 
create table Emp_sal_inc( 
  Emp_id number(10),  
  cur_sal number(20,4),  
  inc_date date 
); 

declare 
  	cursor cur is 
    	select Empno, Sal from Emp where Deptno=(Select Deptno from Dept where 
Dname='RESEARCH'); 
  	Emp_id number; 
  	Emp_sal Emp.Sal%type; 
begin 
  	open cur; 
  	if cur%isopen then 
    		loop 
			fetch cur into Emp_id, Emp_sal; 
			exit when cur%notfound; 
			update Emp set Sal=Sal*1.02 where Empno=Emp_id; 
			select Sal into Emp_sal from Emp where Empno=Emp_id; 
			insert into Emp_sal_inc values(Emp_id, Emp_sal, SYSDATE); 
		end loop; 
		commit; 
		dbms_output.put_line(cur%rowcount); 
	else 
		dbms_output.put_line(' Cursor not open....'); 
	end if; 
	close cur; 
end; 
/ 

select * from Dept; 
select * from Emp; 
select * from Emp_sal_inc; 