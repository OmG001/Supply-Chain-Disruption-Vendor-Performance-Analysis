-- Total number of suppliers
SELECT COUNT(*) AS "Total Suppliers" FROM suppliers;

-- Orders delivered late
SELECT *
FROM orders
WHERE shipping_risk_flag = 'High Risk';

-- Average inventory level
SELECT AVG(stock_levels) AS avg_stock_level
FROM orders;

-- Total revenue from profitable orders
SELECT SUM(revenue_generated) AS total_revenue
FROM orders
WHERE profit > 0;

-- List of products with low inventory
SELECT o.sku, o.stock_levels, p.product_id, p.product_type
FROM orders o
JOIN products p ON o.sku = p.sku 
WHERE stock_levels < 50;
