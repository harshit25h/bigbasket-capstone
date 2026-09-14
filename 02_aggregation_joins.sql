-- 1. INNER JOIN + aggregation
-- Category performance for Delivered orders

SELECT
    p.category,
    COUNT(o.order_id) AS order_count,
    SUM(o.amount_inr) AS total_revenue,
    AVG(o.amount_inr) AS avg_revenue
FROM orders o
JOIN products p
    ON o.product_id = p.product_id
WHERE o.status = 'Delivered'
GROUP BY p.category
HAVING total_revenue > 10000
ORDER BY total_revenue DESC;

-- 2. LEFT JOIN
-- Show every product and its number of orders

SELECT
    p.product_id,
    p.product_name,
    COUNT(o.order_id) AS order_count
FROM products p
LEFT JOIN orders o
    ON p.product_id = o.product_id
GROUP BY
    p.product_id,
    p.product_name
ORDER BY order_count DESC;