set serveroutput on 
declare 
	IN_ERR exception; 
  	Pragma exception_init(IN_ERR, -01400); 
begin 
  	insert into Emp values (null,'BLAKE','MANAGER',7839,to_date('1-5-1981','dd-mm-yyyy'),2850, null, 30); 
    	exception 
    	when IN_ERR then 
      		dbms_output.put_line(' Cannot insert Null values in not Null column. '); 
end; 
/ 