PROGRAM 8: Write a PL/SQL block which displays the gross salary of
employees as per user input EID. (Consider an EMP table with EID,
EName, Deptno, Deptname, Gender, Age, BasicSal with appropriate data types.)
Gross_Salary: BASICSAL + (DA + HRA + Medical) - PF.
Rules: HRA = 15% of basic, DA = 50% of basic, Medical = Rs. 500, PF = 10% of basic.
--------------------------------------------------------

-- Table creation
CREATE TABLE EMP (
    EID       NUMBER PRIMARY KEY,
    EName     VARCHAR2(50),
    Deptno    NUMBER,
    Deptname  VARCHAR2(50),
    Gender    VARCHAR2(10),
    Age       NUMBER,
    BasicSal  NUMBER
);

INSERT INTO EMP VALUES (101, 'Amit', 10, 'HR', 'Male', 30, 20000);
INSERT INTO EMP VALUES (102, 'Sneha', 20, 'Finance', 'Female', 28, 25000);
INSERT INTO EMP VALUES (103, 'Rakesh', 10, 'HR', 'Male', 50, 22000);
COMMIT;

-- PL/SQL Block
SET SERVEROUTPUT ON;
DECLARE
    v_eid   NUMBER := &eid;
    v_basic EMP.BasicSal%TYPE;
    v_da    NUMBER;
    v_hra   NUMBER;
    v_med   NUMBER := 500;
    v_pf    NUMBER;
    v_gross NUMBER;
BEGIN
    SELECT BasicSal INTO v_basic FROM EMP WHERE EID = v_eid;

    v_da    := 0.50 * v_basic;
    v_hra   := 0.15 * v_basic;
    v_pf    := 0.10 * v_basic;
    v_gross := v_basic + (v_da + v_hra + v_med) - v_pf;

    DBMS_OUTPUT.PUT_LINE('Gross Salary for EID ' || v_eid || ' = ' || v_gross);
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No employee found with EID ' || v_eid);
END;
/
