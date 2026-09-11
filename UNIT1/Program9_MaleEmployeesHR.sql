PROGRAM 9: Write a PL/SQL block which displays all records of Male
employees working in the HR Dept from the EMP table.
--------------------------------------------------------

SET SERVEROUTPUT ON;
DECLARE
    CURSOR c_emp IS
        SELECT EID, EName, Deptname, Gender, Age, BasicSal
        FROM EMP
        WHERE Gender = 'Male' AND Deptname = 'HR';
BEGIN
    FOR emp_rec IN c_emp LOOP
        DBMS_OUTPUT.PUT_LINE('EID: ' || emp_rec.EID ||
                              ' Name: ' || emp_rec.EName ||
                              ' Dept: ' || emp_rec.Deptname ||
                              ' Age: ' || emp_rec.Age ||
                              ' Salary: ' || emp_rec.BasicSal);
    END LOOP;
END;
/
