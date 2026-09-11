PROGRAM 2: Write a PL/SQL block to accept a student name from a user
if it exists, display his/her result from the RESULT table otherwise
display appropriate message using exception handling.
--------------------------------------------------------
(Uses the RESULT table created in Unit 1, Program 7)

SET SERVEROUTPUT ON;
DECLARE
    v_name  RESULT.Name%TYPE := '&sname';
    v_total RESULT.Total%TYPE;
    v_per   RESULT.Per%TYPE;
    v_grade RESULT.Grade%TYPE;
BEGIN
    SELECT Total, Per, Grade INTO v_total, v_per, v_grade
    FROM RESULT WHERE Name = v_name;

    DBMS_OUTPUT.PUT_LINE('Total: ' || v_total || ' Percentage: ' || v_per || ' Grade: ' || v_grade);
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No result found for student ' || v_name);
END;
/
