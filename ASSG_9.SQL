SET SERVEROUTPUT ON;

CREATE TABLE Emp_sal_inc( 
  Emp_id   NUMBER(10),  
  cur_sal  NUMBER(20,4),  
  inc_date DATE 
);

DECLARE
  CURSOR cur IS
    SELECT Empno, Sal 
    FROM Emp 
    WHERE Deptno = (SELECT Deptno FROM Dept WHERE Dname = 'RESEARCH');

  Emp_id   Emp.Empno%TYPE;
  Emp_sal  Emp.Sal%TYPE;
  v_count  NUMBER := 0;

BEGIN
  OPEN cur;
  
  LOOP
    FETCH cur INTO Emp_id, Emp_sal;
    EXIT WHEN cur%NOTFOUND;

    -- Update salary
    UPDATE Emp 
    SET Sal = Sal * 1.02 
    WHERE Empno = Emp_id;

    -- Calculate new salary locally instead of SELECTing again
    Emp_sal := Emp_sal * 1.02;

    -- Insert into Emp_sal_inc
    INSERT INTO Emp_sal_inc 
    VALUES (Emp_id, Emp_sal, SYSDATE);

    v_count := v_count + 1;
  END LOOP;

  COMMIT;
  CLOSE cur;

  DBMS_OUTPUT.PUT_LINE(v_count || ' employee(s) updated and inserted into Emp_sal_inc.');

END;
/
