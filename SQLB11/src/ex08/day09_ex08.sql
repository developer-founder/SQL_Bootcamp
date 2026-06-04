CREATE OR REPLACE FUNCTION fnc_fibonacci(pstop INTEGER DEFAULT 10)
RETURNS TABLE (fibonacci INTEGER) AS $$
    WITH RECURSIVE fib AS (
        SELECT 0 AS a, 1 AS b

        UNION ALL

        SELECT b, a + b
        FROM fib
        WHERE b < pstop
    )
    SELECT a AS fibonacci
    FROM fib;
$$ LANGUAGE sql;

SELECT *
FROM fnc_fibonacci(100);

SELECT *
FROM fnc_fibonacci();