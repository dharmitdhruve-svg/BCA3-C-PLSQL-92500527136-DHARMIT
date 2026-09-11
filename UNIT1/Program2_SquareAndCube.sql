PROGRAM 2: Write a PL/SQL block to calculate the square and cube
of the given number.
--------------------------------------------------------

SET SERVEROUTPUT ON;
DECLARE
    num NUMBER := &num;
    sq  NUMBER;
    cu  NUMBER;
BEGIN
    sq := num * num;
    cu := num * num * num;
    DBMS_OUTPUT.PUT_LINE('Square = ' || sq);
    DBMS_OUTPUT.PUT_LINE('Cube   = ' || cu);
END;
/
