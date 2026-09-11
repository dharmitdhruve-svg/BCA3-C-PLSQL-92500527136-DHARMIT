PROGRAM 6: Write a program that explains the use of the NO_DATA_FOUND
exception.
--------------------------------------------------------
(Uses the EMP table created in Unit 1, Program 8)

SET SERVEROUTPUT ON;
DECLARE
    v_name EMP.EName%TYPE;
    v_eid  NUMBER := &eid;
BEGIN
    SELECT EName INTO v_name FROM EMP WHERE EID = v_eid;
    DBMS_OUTPUT.PUT_LINE('Employee Name: ' || v_name);
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No data found for the given EID');
END;
/
