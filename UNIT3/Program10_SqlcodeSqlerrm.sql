PROGRAM 10: Write a program that explains the use of exception
trapping functions SQLCODE and SQLERRM.
--------------------------------------------------------

SET SERVEROUTPUT ON;
DECLARE
    v_num1 NUMBER := &num1;
    v_num2 NUMBER := &num2;
    v_res  NUMBER;
BEGIN
    v_res := v_num1 / v_num2;
    DBMS_OUTPUT.PUT_LINE('Result = ' || v_res);
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error Code : ' || SQLCODE);
        DBMS_OUTPUT.PUT_LINE('Error Msg  : ' || SQLERRM);
END;
/
