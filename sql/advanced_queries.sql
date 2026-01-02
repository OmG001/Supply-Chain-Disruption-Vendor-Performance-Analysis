## Window functions, ranking, moving averages, and percentiles

-- Rank suppliers by total delay
SELECT
    s.supplier_name,
    SUM(o.final_lead_time) AS total_delay,
    RANK() OVER (
        ORDER BY SUM(o.final_lead_time) DESC
    ) AS delay_rank
FROM orders o
JOIN suppliers s ON o.supplier_name = s.supplier_name
GROUP BY s.supplier_name;

-- Rolling inventory benchmark
SELECT
    product_type,
    stock_levels,
    Round(AVG(stock_levels) OVER (
        PARTITION BY product_type
        ROWS BETWEEN 3 PRECEDING AND CURRENT ROW
    ),3) AS rolling_avg_stock
FROM orders
ORDER BY product_type;

-- Products with highest sales concentration (percentile logic)
WITH product_sales AS (
    SELECT
        product_type,
        SUM(number_of_products_sold) AS total_units_sold
    FROM orders
    GROUP BY product_type
),
ranked_products AS (
    SELECT
        product_type,
        total_units_sold,
        PERCENT_RANK() OVER (
            ORDER BY total_units_sold DESC
        ) AS sales_percentile
    FROM product_sales
)
SELECT
    p.product_id,
    p.product_type,
    rp.total_units_sold,
    rp.sales_percentile
FROM ranked_products rp
JOIN products p ON rp.product_type = p.product_type
WHERE rp.sales_percentile >= 0.05;


-- Cumulative units sold per customer (Window function)
SELECT
    c.customer_id,
    c.customer_demographics,
    SUM(o.number_of_products_sold) OVER (
        PARTITION BY c.customer_id
    ) AS cumulative_units_sold
FROM orders o
JOIN customers c ON o.customer_demographics = c.customer_demographics
ORDER BY c.customer_id;