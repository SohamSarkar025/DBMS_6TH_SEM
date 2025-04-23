SET SERVEROUTPUT ON;

DECLARE  
    CURSOR add_interest IS  
        SELECT Acc_no, Total_amt FROM Acc_details WHERE Acc_details = 'A'; 
    
    varaccn Acc_details.Acc_no%TYPE; 
    varamt  Acc_details.Total_amt%TYPE;  -- Fixed column name

BEGIN 
    OPEN add_interest;

    LOOP 
        FETCH add_interest INTO varaccn, varamt; 
        EXIT WHEN add_interest%NOTFOUND; 

        UPDATE Acc_details 
        SET Total_amt = varamt * 1.02  -- Fixed column name
        WHERE Acc_no = varaccn; 

        DBMS_OUTPUT.PUT_LINE(varaccn || ' is updated'); 
    END LOOP;

    CLOSE add_interest; 
    COMMIT; 
END; 
/
