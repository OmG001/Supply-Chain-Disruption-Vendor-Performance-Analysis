-- Insert data into suppliers table from orders table
INSERT INTO suppliers (
    supplier_name,
    location,
    manufacturing_costs,
    manufacturing_lead_time,
    production_volumes,
    inspection_results,
    defect_rates
)
SELECT DISTINCT
    supplier_name,
    location,
    manufacturing_costs,
    manufacturing_lead_time,
    production_volumes,
    inspection_results,
    defect_rates
FROM orders
WHERE supplier_name IS NOT NULL;

-- Insert data into products table from orders table
INSERT INTO products (
    sku,
    product_type,
    price
)
SELECT DISTINCT
    sku,
    product_type,
    price
FROM orders
WHERE sku IS NOT NULL;

-- Insert data into customers table from orders table
INSERT INTO customers (
    customer_demographics,
    location
)
SELECT DISTINCT
    customer_demographics,
    location
FROM orders
WHERE customer_demographics IS NOT NULL;
