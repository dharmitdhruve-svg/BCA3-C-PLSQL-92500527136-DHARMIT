PROGRAM 3: Write a PL/SQL block that uses a cursor attribute
%ROWCOUNT to display the name, department and basic salary of the
first 5 employees getting the highest basic salary. (Use Explicit Cursor)
--------------------------------------------------------

SET SERVEROUTPUT ON;
DECLARE
    CURSOR c_emp IS
        SELECT EName, Deptname, BasicSal FROM EMP ORDER BY BasicSal DESC;
    v_ename EMP.EName%TYPE;
    v_dept  EMP.Deptname%TYPE;
    v_sal   EMP.BasicSal%TYPE;
BEGIN
    OPEN c_emp;
    LOOP
        FETCH c_emp INTO v_ename, v_dept, v_sal;
        EXIT WHEN c_emp%NOTFOUND OR c_emp%ROWCOUNT > 5;
        DBMS_OUTPUT.PUT_LINE(v_ename || ' | ' || v_dept || ' | ' || v_sal);
    END LOOP;
    CLOSE c_emp;
END;
/
