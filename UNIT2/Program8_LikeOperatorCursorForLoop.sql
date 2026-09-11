PROGRAM 8: Write a PL/SQL block to display data with the use of LIKE
Operator using cursor FOR Loop.
--------------------------------------------------------
(Uses the CUSTOMER table created in Unit 2, Program 7)

SET SERVEROUTPUT ON;
DECLARE
    CURSOR c_cust IS
        SELECT CustName, City FROM CUSTOMER WHERE CustName LIKE 'R%';
BEGIN
    FOR rec IN c_cust LOOP
        DBMS_OUTPUT.PUT_LINE(rec.CustName || ' - ' || rec.City);
    END LOOP;
END;
/
