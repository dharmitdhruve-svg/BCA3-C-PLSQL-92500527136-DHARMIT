PROGRAM 8: Write a program that explains the use of the ZERO_DIVIDE
exception.
--------------------------------------------------------

SET SERVEROUTPUT ON;
DECLARE
    v_total NUMBER := &total;
    v_count NUMBER := &count;
    v_avg   NUMBER;
BEGIN
    v_avg := v_total / v_count;
    DBMS_OUTPUT.PUT_LINE('Average = ' || v_avg);
EXCEPTION
    WHEN ZERO_DIVIDE THEN
        DBMS_OUTPUT.PUT_LINE('Error: Cannot divide by zero (count = 0)');
END;
/
