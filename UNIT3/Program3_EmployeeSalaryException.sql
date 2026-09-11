PROGRAM 3: Write a PL/SQL block to accept employee name from a user
if it exists, display his/her basic salary otherwise display
appropriate message using exception handling.
--------------------------------------------------------
(Uses the EMP table created in Unit 1, Program 8)

SET SERVEROUTPUT ON;
DECLARE
    v_name  EMP.EName%TYPE := '&ename';
    v_basic EMP.BasicSal%TYPE;
BEGIN
    SELECT BasicSal INTO v_basic FROM EMP WHERE EName = v_name;
    DBMS_OUTPUT.PUT_LINE('Basic Salary of ' || v_name || ' = ' || v_basic);
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No employee found with name ' || v_name);
END;
/
