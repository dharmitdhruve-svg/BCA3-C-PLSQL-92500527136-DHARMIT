PROGRAM 9: Write a PL/SQL block to show the records using ORDER BY
clause using cursor.
--------------------------------------------------------
(Uses the CUSTOMER table created in Unit 2, Program 7)

SET SERVEROUTPUT ON;
DECLARE
    CURSOR c_cust IS
        SELECT CustName, City FROM CUSTOMER ORDER BY CustName ASC;
BEGIN
    FOR rec IN c_cust LOOP
        DBMS_OUTPUT.PUT_LINE(rec.CustName || ' - ' || rec.City);
    END LOOP;
END;
/
