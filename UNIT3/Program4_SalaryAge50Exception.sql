PROGRAM 4: Write a PL/SQL block to display the salary of that
employee whose age is 50 years otherwise display appropriate messages
using exception handling.
--------------------------------------------------------
(Uses the EMP table created in Unit 1, Program 8)

SET SERVEROUTPUT ON;
DECLARE
    v_name  EMP.EName%TYPE;
    v_basic EMP.BasicSal%TYPE;
BEGIN
    SELECT EName, BasicSal INTO v_name, v_basic FROM EMP WHERE Age = 50;
    DBMS_OUTPUT.PUT_LINE(v_name || '''s Salary = ' || v_basic);
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No employee found with age 50');
    WHEN TOO_MANY_ROWS THEN
        DBMS_OUTPUT.PUT_LINE('Multiple employees found with age 50');
END;
/
