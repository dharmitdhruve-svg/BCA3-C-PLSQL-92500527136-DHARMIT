PROGRAM 7: Write a PL/SQL block to display records from the CUSTOMER
table using an explicit cursor.
--------------------------------------------------------

CREATE TABLE CUSTOMER (
    CustID   NUMBER PRIMARY KEY,
    CustName VARCHAR2(50),
    City     VARCHAR2(50),
    Phone    VARCHAR2(15)
);

INSERT INTO CUSTOMER VALUES (1, 'Rahul Shah', 'Rajkot', '9876543210');
INSERT INTO CUSTOMER VALUES (2, 'Priya Mehta', 'Ahmedabad', '9123456780');
COMMIT;

SET SERVEROUTPUT ON;
DECLARE
    CURSOR c_cust IS SELECT CustID, CustName, City, Phone FROM CUSTOMER;
    v_id    CUSTOMER.CustID%TYPE;
    v_name  CUSTOMER.CustName%TYPE;
    v_city  CUSTOMER.City%TYPE;
    v_phone CUSTOMER.Phone%TYPE;
BEGIN
    OPEN c_cust;
    LOOP
        FETCH c_cust INTO v_id, v_name, v_city, v_phone;
        EXIT WHEN c_cust%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE(v_id || ' | ' || v_name || ' | ' || v_city || ' | ' || v_phone);
    END LOOP;
    CLOSE c_cust;
END;
/
