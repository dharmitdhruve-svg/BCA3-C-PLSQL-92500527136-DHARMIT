PROGRAM 10: Write a PL/SQL block to perform an update operation on
the EMPLOYEE table using an implicit cursor.
--------------------------------------------------------

CREATE TABLE EMPLOYEE (
    EmpID  NUMBER PRIMARY KEY,
    EName  VARCHAR2(50),
    Salary NUMBER
);

INSERT INTO EMPLOYEE VALUES (1, 'Ravi', 15000);
INSERT INTO EMPLOYEE VALUES (2, 'Kiran', 18000);
COMMIT;

SET SERVEROUTPUT ON;
BEGIN
    UPDATE EMPLOYEE SET Salary = Salary + 1000 WHERE EmpID = 1;
    IF SQL%ROWCOUNT > 0 THEN
        DBMS_OUTPUT.PUT_LINE('Employee record updated successfully');
    ELSE
        DBMS_OUTPUT.PUT_LINE('No such employee found');
    END IF;
    COMMIT;
END;
/
