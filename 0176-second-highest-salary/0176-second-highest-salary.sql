SELECT 
    CASE 
        WHEN COUNT(*) = 1 THEN NULL
        ELSE (
            SELECT salary
            FROM Employee
            WHERE salary != (SELECT MAX(salary) FROM Employee)
            ORDER BY salary DESC
            LIMIT 1
        )
    END AS "SecondHighestSalary"
FROM Employee;
