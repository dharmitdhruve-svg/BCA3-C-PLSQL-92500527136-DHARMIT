PROGRAM 9: Write a program using implicit cursor to display the
commission of given EMPNO, also raise a user-defined exception
NULL_COMMISSION when no value (NULL) is available for commission.
(Use User Defined Exception)
--------------------------------------------------------

CREATE TABLE EMP_COMM (
    EmpNo      NUMBER PRIMARY KEY,
    EName      VARCHAR2(50),
    Commission NUMBER
);

INSERT INTO EMP_COMM VALUES (1001, 'Vikas', 500);
INSERT INTO EMP_COMM VALUES (1002, 'Neha', NULL);
COMMIT;

SET SERVEROUTPUT ON;
DECLARE
    v_empno EMP_COMM.EmpNo%TYPE := &empno;
    v_comm  EMP_COMM.Commission%TYPE;
    NULL_COMMISSION EXCEPTION;
BEGIN
    SELECT Commission INTO v_comm FROM EMP_COMM WHERE EmpNo = v_empno;

    IF v_comm IS NULL THEN
        RAISE NULL_COMMISSION;
    END IF;

    DBMS_OUTPUT.PUT_LINE('Commission for EmpNo ' || v_empno || ' = ' || v_comm);
EXCEPTION
    WHEN NULL_COMMISSION THEN
        DBMS_OUTPUT.PUT_LINE('No commission value available for EmpNo ' || v_empno);
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No employee found with EmpNo ' || v_empno);
END;
/
