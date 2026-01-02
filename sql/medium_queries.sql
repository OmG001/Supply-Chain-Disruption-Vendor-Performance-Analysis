## GROUP BY and JOIN examples

-- Total cost per supplier
SELECT 
    s.supplier_name,
    SUM(o.costs) AS total_cost
FROM orders o
JOIN suppliers s ON o.supplier_name = s.supplier_name
GROUP BY s.supplier_name
ORDER BY s.supplier_name ASC;

-- Average delay by region
SELECT 
    s.location,
    Round(AVG(o.final_lead_time),3) AS avg_delay_days
FROM orders o
JOIN suppliers s ON o.supplier_name = s.supplier_name
GROUP BY s.location;

-- Total revenue by customer demographics
SELECT 
    c.customer_demographics,
    Round(SUM(o.revenue_generated),3) AS total_revenue_generated
FROM orders o
JOIN customers c ON o.customer_demographics = c.customer_demographics
GROUP BY c.customer_demographics
ORDER BY total_revenue_generated DESC
LIMIT 3;

-- Products never ordered
SELECT 
    p.product_id,
    p.product_type,
    o.sku
FROM products p
LEFT JOIN orders o ON p.product_type = o.product_type
WHERE o.sku IS NULL;

--Revenue trend by Lead Time Category
SELECT
    CASE
        WHEN final_lead_time <= 5 THEN '0–5 days'
        WHEN final_lead_time <= 10 THEN '6–10 days'
        WHEN final_lead_time <= 20 THEN '11–20 days'
        ELSE '20+ days'
    END AS lead_time_bucket,
    Round(SUM(revenue_generated),3) AS total_revenue_generated
FROM orders
GROUP BY lead_time_bucket
ORDER BY lead_time_bucket;


-- Customers with more than 5 orders
SELECT 
    c.customer_demographics,
    COUNT(o.sku) AS order_count
FROM orders o
JOIN customers c ON o.customer_demographics = c.customer_demographics
GROUP BY c.customer_demographics
HAVING COUNT(o.sku) > 5;
