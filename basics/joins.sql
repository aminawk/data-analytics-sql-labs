-- Join exercise: Customer + Orders
SELECT 
    c.customer_id,
    c.name,
    o.order_id,
    o.order_date
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id;
