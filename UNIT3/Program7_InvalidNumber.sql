PROGRAM 7: Write a program that explains the use of the
INVALID_NUMBER exception.
--------------------------------------------------------

SET SERVEROUTPUT ON;
DECLARE
    v_str VARCHAR2(10) := '&val';
    v_num NUMBER;
BEGIN
    v_num := TO_NUMBER(v_str);
    DBMS_OUTPUT.PUT_LINE('Valid number entered: ' || v_num);
EXCEPTION
    WHEN INVALID_NUMBER THEN
        DBMS_OUTPUT.PUT_LINE('Error: Invalid number format entered');
END;
/
