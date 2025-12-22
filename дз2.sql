CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE
);

SET SESSION cte_max_recursion_depth = 300000;


INSERT INTO orders (order_id, customer_id, order_date)
WITH RECURSIVE numbers (n) AS (
    SELECT 1
    UNION ALL
    SELECT n + 1 FROM numbers WHERE n < 300000
)
SELECT 
    n,
    FLOOR(RAND() * 1000) + 1,
    DATE_ADD('2020-01-01', INTERVAL FLOOR(RAND() * 1825) DAY)
FROM numbers;

CREATE INDEX idx_customer_date ON orders(customer_id, order_date);

EXPLAIN 
SELECT * 
FROM orders 
WHERE customer_id = 500 
ORDER BY order_date DESC 
LIMIT 5;
