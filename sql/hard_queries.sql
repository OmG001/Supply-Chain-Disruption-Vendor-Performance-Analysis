## CTEs + logic for complex queries

-- High-risk suppliers (avg delay > overall avg)
WITH supplier_delay AS (
    SELECT
        supplier_name,
        Round(AVG(final_lead_time),4) AS avg_delay
    FROM orders
    GROUP BY supplier_name
)
SELECT
    s.supplier_name,
    sd.avg_delay
FROM supplier_delay sd
JOIN suppliers s ON sd.supplier_name = s.supplier_name
WHERE sd.avg_delay >=
      (SELECT AVG(final_lead_time) FROM orders)
	   Group By sd.avg_delay, s.supplier_name;


-- Customers with decreasing order frequency
WITH customer_order_stats AS (
    SELECT
        customer_demographics,
        COUNT(sku) AS total_orders,
        SUM(number_of_products_sold) AS total_units
    FROM orders
    GROUP BY customer_demographics
)
SELECT
    c.customer_id,
    c.customer_demographics,
    cos.total_orders,
    cos.total_units
FROM customer_order_stats cos
JOIN customers c ON cos.customer_demographics = c.customer_demographics
WHERE cos.total_orders < (
    SELECT AVG(total_orders) FROM customer_order_stats
);

-- Products with declining sales over the last 6 months
WITH product_sales AS (
    SELECT
        product_type,
        SUM(number_of_products_sold) AS total_units_sold,
        Round(AVG(stock_levels),3) AS avg_stock
    FROM orders
    GROUP BY product_type
)
SELECT
    p.product_id,
    p.product_type,
    ps.total_units_sold,
    ps.avg_stock
FROM product_sales ps
JOIN products p ON ps.product_type = p.product_type
WHERE ps.total_units_sold <
      (SELECT AVG(total_units_sold) FROM product_sales);
