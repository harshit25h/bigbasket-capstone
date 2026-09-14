SELECT *
FROM orders
WHERE status = 'Delivered'
LIMIT 10;

-- 2. DISTINCT
-- Show all unique payment methods

SELECT DISTINCT payment_mode
FROM orders;

-- 3. ORDER BY and LIMIT
-- Show the 5 highest-value orders

SELECT *
FROM orders
ORDER BY amount_inr DESC
LIMIT 5;
-- 4. AS (Alias)
-- Count all orders and give the result a readable name

SELECT COUNT(*) AS total_orders
FROM orders;

-- 5. IN
-- Show orders paid using UPI or Wallet

SELECT *
FROM orders
WHERE payment_mode IN ('UPI', 'Wallet');

-- 6. BETWEEN
-- Show orders with amount between ₹100 and ₹500

SELECT *
FROM orders
WHERE amount_inr BETWEEN 100 AND 500;

-- 7. NOT BETWEEN
-- Show orders with amount outside ₹100 to ₹500

SELECT *
FROM orders
WHERE amount_inr NOT BETWEEN 100 AND 500;

-- 8. IS NULL
-- Find orders where the amount is missing

SELECT *
FROM orders
WHERE amount_inr IS NULL;