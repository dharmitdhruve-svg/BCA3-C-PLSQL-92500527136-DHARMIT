PROGRAM 10: Write a PL/SQL block to delete the record of an employee
for a given EID.
--------------------------------------------------------

SET SERVEROUTPUT ON;
DECLARE
    v_eid NUMBER := &eid;
BEGIN
    DELETE FROM EMP WHERE EID = v_eid;
    IF SQL%ROWCOUNT > 0 THEN
        DBMS_OUTPUT.PUT_LINE('Record deleted for EID ' || v_eid);
    ELSE
        DBMS_OUTPUT.PUT_LINE('No record found for EID ' || v_eid);
    END IF;
    COMMIT;
END;
/
