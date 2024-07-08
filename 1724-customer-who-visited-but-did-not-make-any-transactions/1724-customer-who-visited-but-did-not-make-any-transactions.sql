SELECT customer_id, COUNT(*) AS "count_no_trans"
FROM (
    SELECT customer_id
    FROM Visits
    LEFT JOIN Transactions ON Transactions.visit_id = Visits.visit_id
    WHERE transaction_id IS NULL
) AS a
GROUP BY customer_id;
