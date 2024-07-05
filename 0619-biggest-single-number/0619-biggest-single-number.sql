SELECT num
FROM (
    SELECT num
    FROM MyNumbers
    GROUP BY num
    HAVING COUNT(num) = 1
    ORDER BY num DESC
    LIMIT 1
) AS subquery
UNION
SELECT NULL
ORDER BY num DESC
LIMIT 1;
