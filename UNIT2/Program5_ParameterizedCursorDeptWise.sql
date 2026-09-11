PROGRAM 5: Write a PL/SQL block using a parameterized cursor that
displays the department wise basic salary of each employee and
department wise total gross salary. (Parameterized Cursor and Use
Cursor For Loop)
--------------------------------------------------------

SET SERVEROUTPUT ON;
DECLARE
    CURSOR c_alldept IS
        SELECT DISTINCT Deptno, Deptname FROM EMP;

    CURSOR c_dept(p_deptno EMP.Deptno%TYPE) IS
        SELECT EName, BasicSal FROM EMP WHERE Deptno = p_deptno;

    v_gross_total NUMBER;
    v_gross       NUMBER;
BEGIN
    FOR d IN c_alldept LOOP
        DBMS_OUTPUT.PUT_LINE('Department: ' || d.Deptname);
        v_gross_total := 0;
        FOR e IN c_dept(d.Deptno) LOOP
            v_gross := e.BasicSal + (0.50 * e.BasicSal) + (0.15 * e.BasicSal) + 500 - (0.10 * e.BasicSal);
            DBMS_OUTPUT.PUT_LINE('   ' || e.EName || ' - Basic: ' || e.BasicSal || ' Gross: ' || v_gross);
            v_gross_total := v_gross_total + v_gross;
        END LOOP;
        DBMS_OUTPUT.PUT_LINE('   Department Total Gross Salary: ' || v_gross_total);
    END LOOP;
END;
/
