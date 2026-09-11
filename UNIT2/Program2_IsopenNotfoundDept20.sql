PROGRAM 2: Write a PL/SQL block that uses a cursor attribute %ISOPEN
and %NOTFOUND to raise the basic salary of employees of department
number 20 by 5% and also display the appropriate message based on the
existence of the record in the EMP table. Whenever any such raise is
given to the employees, a record for the same is maintained in the
emp_update table. (Perform using both Implicit and Explicit Cursor)
--------------------------------------------------------

-- Table to log updates
CREATE TABLE emp_update (
    EID     NUMBER,
    OldSal  NUMBER,
    NewSal  NUMBER,
    UpdDate DATE
);

SET SERVEROUTPUT ON;
DECLARE
    CURSOR c_emp IS SELECT EID, BasicSal FROM EMP WHERE Deptno = 20;
    v_eid EMP.EID%TYPE;
    v_old EMP.BasicSal%TYPE;
BEGIN
    OPEN c_emp;
    IF c_emp%ISOPEN THEN
        DBMS_OUTPUT.PUT_LINE('Cursor opened successfully');
    END IF;

    LOOP
        FETCH c_emp INTO v_eid, v_old;
        EXIT WHEN c_emp%NOTFOUND;

        UPDATE EMP SET BasicSal = BasicSal * 1.05 WHERE EID = v_eid;  -- Implicit cursor
        INSERT INTO emp_update VALUES (v_eid, v_old, v_old * 1.05, SYSDATE);
    END LOOP;
    CLOSE c_emp;

    DBMS_OUTPUT.PUT_LINE('Update process completed for Department 20');
    COMMIT;
END;
/
