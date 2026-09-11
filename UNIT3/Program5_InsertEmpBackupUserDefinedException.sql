PROGRAM 5: Write a PL/SQL block using a cursor to insert the records
of employees in the EMP_BACKUP table for a given department number,
also raise a user defined exception NO_DEPT_FOUND when no records are
found for entered DEPT_NO. (Use User Defined Exception)
--------------------------------------------------------
(Uses the EMP_BACKUP table created in Unit 2, Program 6)

SET SERVEROUTPUT ON;
DECLARE
    v_deptno EMP.Deptno%TYPE := &deptno;
    CURSOR c_emp IS SELECT * FROM EMP WHERE Deptno = v_deptno;
    v_count NUMBER := 0;
    NO_DEPT_FOUND EXCEPTION;
BEGIN
    FOR rec IN c_emp LOOP
        INSERT INTO EMP_BACKUP VALUES
            (rec.EID, rec.EName, rec.Deptno, rec.Deptname, rec.Gender, rec.Age, rec.BasicSal);
        v_count := v_count + 1;
    END LOOP;

    IF v_count = 0 THEN
        RAISE NO_DEPT_FOUND;
    END IF;

    DBMS_OUTPUT.PUT_LINE(v_count || ' record(s) backed up for Department ' || v_deptno);
    COMMIT;
EXCEPTION
    WHEN NO_DEPT_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No records found for Department Number ' || v_deptno);
END;
/
