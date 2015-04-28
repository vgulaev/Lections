SET serveroutput ON
DECLARE
    hello VARCHAR2(50) := 'Hello, world!';
    p INTEGER;
BEGIN
    DBMS_OUTPUT.put_line(hello);
END;