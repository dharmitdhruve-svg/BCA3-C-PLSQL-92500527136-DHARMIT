PROGRAM 5: Write a PL/SQL block which converts temperature from
Celsius to Fahrenheit.
--------------------------------------------------------

SET SERVEROUTPUT ON;
DECLARE
    celsius NUMBER := &celsius;
    fahren  NUMBER;
BEGIN
    fahren := (celsius * 9/5) + 32;
    DBMS_OUTPUT.PUT_LINE(celsius || ' Celsius = ' || fahren || ' Fahrenheit');
END;
/
