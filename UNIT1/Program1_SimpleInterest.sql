PROGRAM 1: Write a PL/SQL block that calculates the simple interest
based on the given principal amount, rate of interest and number of years.
--------------------------------------------------------

SET SERVEROUTPUT ON;
DECLARE
    principal NUMBER := &principal;
    rate      NUMBER := &rate;
    years     NUMBER := &years;
    si        NUMBER;
BEGIN
    si := (principal * rate * years) / 100;
    DBMS_OUTPUT.PUT_LINE('Simple Interest = ' || si);
END;
/
