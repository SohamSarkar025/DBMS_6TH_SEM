SET SERVEROUTPUT ON;

-- Function to get the next Transaction ID
CREATE OR REPLACE FUNCTION Max_id RETURN NUMBER  
IS 
    var_id NUMBER(4); 
BEGIN 
    SELECT MAX(Transaction_id) INTO var_id FROM Transaction_acc; 

    IF var_id IS NULL THEN 
        var_id := 200; 
    ELSE 
        var_id := var_id + 1; 
    END IF; 

    RETURN var_id; 

EXCEPTION 
    WHEN NO_DATA_FOUND THEN 
        RETURN 200;  -- Return starting ID if table is empty
END; 
/

-- Procedure to insert into Transaction_acc
CREATE OR REPLACE PROCEDURE Transaction_entry(
    varaccn IN Acc_details.Acc_no%TYPE, 
    varamt  IN Acc_details.Total_amt%TYPE   -- Updated datatype reference
) 
IS 
    vartid Transaction_acc.Transaction_id%TYPE; 
BEGIN 
    vartid := Max_id(); 

    INSERT INTO Transaction_acc 
    VALUES (vartid, varaccn, varamt, 0, 'CHQ', 0, SYSDATE); 

    DBMS_OUTPUT.PUT_LINE('Data inserted with ID: ' || vartid); 
END; 
/

-- PL/SQL block to apply interest and record transactions
BEGIN  
    FOR rec IN (
        SELECT Acc_no, Total_amt 
        FROM Acc_details 
        WHERE Acc_details = 'A'
    )
    LOOP 
        -- Update account with interest
        UPDATE Acc_details 
        SET Total_amt = rec.Total_amt * 1.02 
        WHERE Acc_no = rec.Acc_no; 

        DBMS_OUTPUT.PUT_LINE(rec.Acc_no || ' is updated'); 

        -- Call transaction entry with updated amount
        Transaction_entry(rec.Acc_no, rec.Total_amt * 1.02); 
    END LOOP; 

    COMMIT; 
END; 
/
