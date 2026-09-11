PROGRAM 4: Write a PL/SQL block which accepts measurement in feet
and displays it in cm, inch and meter.
--------------------------------------------------------

SET SERVEROUTPUT ON;
DECLARE
    feet   NUMBER := &feet;
    cm     NUMBER;
    inches NUMBER;
    meter  NUMBER;
BEGIN
    cm     := feet * 30.48;
    inches := feet * 12;
    meter  := feet * 0.3048;
    DBMS_OUTPUT.PUT_LINE(feet || ' feet = ' || cm || ' cm');
    DBMS_OUTPUT.PUT_LINE(feet || ' feet = ' || inches || ' inch');
    DBMS_OUTPUT.PUT_LINE(feet || ' feet = ' || meter || ' meter');
END;
/
