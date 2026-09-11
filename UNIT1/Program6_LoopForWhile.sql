PROGRAM 6: Write a program to generate the numbers using LOOP,
FOR LOOP and WHILE LOOP up to the number inputted by the user.
--------------------------------------------------------

SET SERVEROUTPUT ON;
DECLARE
    n NUMBER := &n;
    i NUMBER;
BEGIN
    DBMS_OUTPUT.PUT_LINE('--- Using Basic LOOP ---');
    i := 1;
    LOOP
        DBMS_OUTPUT.PUT_LINE(i);
        i := i + 1;
        EXIT WHEN i > n;
    END LOOP;

    DBMS_OUTPUT.PUT_LINE('--- Using FOR LOOP ---');
    FOR j IN 1..n LOOP
        DBMS_OUTPUT.PUT_LINE(j);
    END LOOP;

    DBMS_OUTPUT.PUT_LINE('--- Using WHILE LOOP ---');
    i := 1;
    WHILE i <= n LOOP
        DBMS_OUTPUT.PUT_LINE(i);
        i := i + 1;
    END LOOP;
END;
/
