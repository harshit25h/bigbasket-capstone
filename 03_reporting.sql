-- 1. CASE WHEN
-- Classify products based on their Delivered revenue

SELECT
    p.product_name,
    SUM(o.amount_inr) AS total_revenue,
    CASE
        WHEN SUM(o.amount_inr) >= 3000 THEN 'High'
        WHEN SUM(o.amount_inr) >= 1000 THEN 'Medium'
        ELSE 'Low'
    END AS revenue_tier
FROM orders o
JOIN products p
    ON o.product_id = p.product_id
WHERE o.status = 'Delivered'
GROUP BY p.product_id, p.product_name
ORDER BY total_revenue DESC;

-- 2. Monthly category revenue report
-- Delivered orders only

SELECT
    p.category,
    strftime('%Y-%m', o.order_date) AS month,
    COUNT(o.order_id) AS order_count,
    SUM(o.amount_inr) AS total_revenue,
    AVG(o.amount_inr) AS avg_revenue
FROM orders o
JOIN products p
    ON o.product_id = p.product_id
WHERE o.status = 'Delivered'
GROUP BY
    p.category,
    month
ORDER BY
    p.category,
    month;

-- 3. Target variance report
-- Compare Delivered revenue with category targets

SELECT
    p.category,
    SUM(o.amount_inr) AS revenue,
    ct.target_revenue_inr,
    ct.target_revenue_inr - SUM(o.amount_inr) AS variance,
    ((SUM(o.amount_inr) - ct.target_revenue_inr) * 100.0)
        / ct.target_revenue_inr AS percentage_variance,
    CASE
        WHEN SUM(o.amount_inr) >= ct.target_revenue_inr
            THEN 'Above Target'
        WHEN ((ct.target_revenue_inr - SUM(o.amount_inr)) * 100.0)
             / ct.target_revenue_inr <= 15
            THEN 'Below Target - Watch'
        ELSE 'Below Target - Critical'
    END AS target_status
FROM orders o
JOIN products p
    ON o.product_id = p.product_id
JOIN category_targets ct
    ON p.category = ct.category
WHERE o.status = 'Delivered'
GROUP BY
    p.category,
    ct.target_revenue_inr
ORDER BY
    revenue DESC;