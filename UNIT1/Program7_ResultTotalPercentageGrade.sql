PROGRAM 7: Write a PL/SQL block to calculate the total, percentage
and grade of student based on his/her Rollno from the RESULT table.
(Create RESULT table with Rollno, Name, Sub1, Sub2, Sub3, Sub4, Sub5,
Total, Per, Grade attributes with appropriate data type).
--------------------------------------------------------

-- Table creation
CREATE TABLE RESULT (
    Rollno NUMBER PRIMARY KEY,
    Name   VARCHAR2(50),
    Sub1   NUMBER,
    Sub2   NUMBER,
    Sub3   NUMBER,
    Sub4   NUMBER,
    Sub5   NUMBER,
    Total  NUMBER,
    Per    NUMBER,
    Grade  VARCHAR2(5)
);

INSERT INTO RESULT (Rollno, Name, Sub1, Sub2, Sub3, Sub4, Sub5)
VALUES (1, 'Dharmit', 80, 75, 90, 85, 70);
COMMIT;

-- PL/SQL Block
SET SERVEROUTPUT ON;
DECLARE
    v_rollno NUMBER := &rollno;
    v_name   RESULT.Name%TYPE;
    v_s1     RESULT.Sub1%TYPE;
    v_s2     RESULT.Sub2%TYPE;
    v_s3     RESULT.Sub3%TYPE;
    v_s4     RESULT.Sub4%TYPE;
    v_s5     RESULT.Sub5%TYPE;
    v_total  NUMBER;
    v_per    NUMBER;
    v_grade  VARCHAR2(5);
BEGIN
    SELECT Name, Sub1, Sub2, Sub3, Sub4, Sub5
    INTO v_name, v_s1, v_s2, v_s3, v_s4, v_s5
    FROM RESULT
    WHERE Rollno = v_rollno;

    v_total := v_s1 + v_s2 + v_s3 + v_s4 + v_s5;
    v_per   := v_total / 5;

    IF v_per >= 75 THEN
        v_grade := 'A';
    ELSIF v_per >= 60 THEN
        v_grade := 'B';
    ELSIF v_per >= 40 THEN
        v_grade := 'C';
    ELSE
        v_grade := 'F';
    END IF;

    UPDATE RESULT
    SET Total = v_total, Per = v_per, Grade = v_grade
    WHERE Rollno = v_rollno;

    DBMS_OUTPUT.PUT_LINE('Name       : ' || v_name);
    DBMS_OUTPUT.PUT_LINE('Total      : ' || v_total);
    DBMS_OUTPUT.PUT_LINE('Percentage : ' || v_per);
    DBMS_OUTPUT.PUT_LINE('Grade      : ' || v_grade);
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No record found for Rollno ' || v_rollno);
END;
/
