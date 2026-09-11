PROGRAM 4: Write a PL/SQL block using a cursor FOR loop to display
the name and the basic salary of the top 3 highest paid employees.
(Use Cursor For Loop)
--------------------------------------------------------

SET SERVEROUTPUT ON;
DECLARE
    CURSOR c_emp IS
        SELECT EName, BasicSal FROM EMP ORDER BY BasicSal DESC
        FETCH FIRST 3 ROWS ONLY;
        -- If FETCH FIRST is unsupported, replace with:
        -- SELECT EName, BasicSal FROM (SELECT EName, BasicSal FROM EMP ORDER BY BasicSal DESC) WHERE ROWNUM <= 3;
BEGIN
    FOR rec IN c_emp LOOP
        DBMS_OUTPUT.PUT_LINE(rec.EName || ' - ' || rec.BasicSal);
    END LOOP;
END;
/
