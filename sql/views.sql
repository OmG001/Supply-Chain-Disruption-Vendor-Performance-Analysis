-- SUPPLIER PERFORMANCE VIEW
CREATE OR REPLACE VIEW supplier_performance AS
SELECT
    s.supplier_id,
    s.supplier_name,
    s.location,
    COUNT(o.sku) AS total_orders,
    Round(AVG(o.final_lead_time),3) AS avg_lead_time,
    Round(SUM(o.costs),3) AS total_cost,
    Round(AVG(s.defect_rates),3) AS avg_defect_rate,
    Round(AVG(o.profit),3) AS avg_profit
FROM orders o
JOIN suppliers s ON o.supplier_name = s.supplier_name
GROUP BY
    s.supplier_id,
    s.supplier_name,
    s.location;

SELECT *
FROM supplier_performance
ORDER BY avg_lead_time DESC;

-- PRODUCT RISK & PERFORMANCE VIEW
CREATE OR REPLACE VIEW product_performance AS
SELECT
    p.product_id,
    p.product_type,
    p.sku,
    Round(SUM(o.number_of_products_sold),3) AS total_units_sold,
    Round(AVG(o.stock_levels),3) AS avg_stock_level,
    Round(SUM(o.profit),3) AS total_profit,
    CASE
        WHEN AVG(o.stock_levels) < 45 THEN 'Low Stock'
        WHEN SUM(o.number_of_products_sold) < 12000 THEN 'Low Demand'
        ELSE 'Normal'
    END AS product_risk_flag
FROM orders o
JOIN products p ON o.product_type = p.product_type
GROUP BY
    p.product_id,
    p.product_type,
    p.sku;

SELECT *
FROM product_performance;

-- SUPPLY CHAIN RISK SUMMARY (EXECUTIVE VIEW)
CREATE OR REPLACE VIEW supply_chain_risk_summary AS
SELECT
    shipping_risk_flag,
    stock_risk_flag,
    COUNT(sku) AS total_orders,
    Round(SUM(costs),3) AS total_cost,
    Round(SUM(revenue_generated),3) AS total_revenue,
    Round(AVG(profit),3) AS avg_profit
FROM orders
GROUP BY
    shipping_risk_flag,
    stock_risk_flag;

SELECT *
FROM supply_chain_risk_summary;


---- CUSTOMER VALUE VIEW
CREATE OR REPLACE VIEW customer_value AS
SELECT
    c.customer_id,
    c.customer_demographics,
    c.location,
    COUNT(o.sku) AS total_orders,
    Round(SUM(o.revenue_generated),3) AS total_revenue,
    SUM(o.number_of_products_sold) AS total_units,
    Round(AVG(o.profit),3) AS avg_profit_per_order
FROM orders o
JOIN customers c ON o.customer_demographics = c.customer_demographics
GROUP BY
    c.customer_id,
    c.customer_demographics,
    c.location;

SELECT *
FROM customer_value
ORDER BY total_revenue DESC;

