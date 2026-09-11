PROGRAM 1: Write a PL/SQL block that explains the use of the
ZERO_DIVIDE exception.
--------------------------------------------------------

SET SERVEROUTPUT ON;
DECLARE
    a NUMBER := &a;
    b NUMBER := &b;
    c NUMBER;
BEGIN
    c := a / b;
    DBMS_OUTPUT.PUT_LINE('Result = ' || c);
EXCEPTION
    WHEN ZERO_DIVIDE THEN
        DBMS_OUTPUT.PUT_LINE('Error: Division by zero is not allowed');
END;
/
