set serveroutput on
declare
        amt number(20):=500;
        t number;
        n number;
begin

     n:=&account_number;
     update acc_details set total_amt=total_amt-amt where acc_no=n;
     commit;
     savepoint s;
     update acc_details set total_amt=total_amt-amt where acc_no=n;
     select total_amt into t from acc_details where acc_no=n;

if(t<1000)then
             dbms_output.put_line('Balance after second transaction '||t);
             dbms_output.put_line('Insufficient Balance');
             rollback to savepoint s;
             dbms_output.put_line('Balance after rollback '||t);
else
            commit;
            select total_amt into t from acc_details where acc_no=n;
            dbms_output.put_line('Balance after commit: '||t);
end if;
end;
/