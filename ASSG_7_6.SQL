set serveroutput on
declare
       cli_no varchar2(6):='&client_no';
       t_c_no number(10,2);
begin
      select balance_due into t_c_no from client_master where client_no=cli_no;
      if(t_c_no >=6000)
      then
          t_c_no:=t_c_no+1000;
          update client_master set balance_due=t_c_no where client_no=cli_no;
      else
          dbms_output.put_line('The balance due is below 6000');
      end if;
end;
/