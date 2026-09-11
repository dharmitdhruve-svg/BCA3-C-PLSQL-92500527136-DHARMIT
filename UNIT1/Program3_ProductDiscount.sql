PROGRAM 3: Write a PL/SQL block to accept product name, qty and price
from user and then calculate discount in Rs. based on the given (%).
--------------------------------------------------------

SET SERVEROUTPUT ON;
DECLARE
    pname     VARCHAR2(50) := '&pname';
    qty       NUMBER := &qty;
    price     NUMBER := &price;
    disc_pct  NUMBER := &disc_pct;
    total_amt NUMBER;
    disc_amt  NUMBER;
BEGIN
    total_amt := qty * price;
    disc_amt  := total_amt * disc_pct / 100;
    DBMS_OUTPUT.PUT_LINE('Product: ' || pname);
    DBMS_OUTPUT.PUT_LINE('Total Amount   = ' || total_amt);
    DBMS_OUTPUT.PUT_LINE('Discount in Rs = ' || disc_amt);
END;
/
