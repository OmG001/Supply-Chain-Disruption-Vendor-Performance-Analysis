DROP TABLE IF EXISTS suppliers;
CREATE TABLE suppliers (
    supplier_id SERIAL PRIMARY KEY,
    supplier_name TEXT,
    location TEXT,
    manufacturing_costs NUMERIC,
    manufacturing_lead_time INT,
    production_volumes INT,
    inspection_results TEXT,
    defect_rates NUMERIC
);

DROP TABLE IF EXISTS products;
CREATE TABLE products (
    product_id SERIAL PRIMARY KEY,
    sku TEXT UNIQUE,
    product_type TEXT,
    price NUMERIC
);

DROP TABLE IF EXISTS customers;
CREATE TABLE customers (
    customer_id SERIAL PRIMARY KEY,
    customer_demographics TEXT,
    location TEXT
);

DROP TABLE IF EXISTS orders;
CREATE TABLE orders (
    product_type TEXT,
    sku TEXT,
    price NUMERIC,
    availability TEXT,
    number_of_products_sold INT,
    revenue_generated NUMERIC,
    customer_demographics TEXT,
    stock_levels INT,
    order_quantities INT,
    shipping_times INT,
    shipping_carriers TEXT,
    shipping_costs NUMERIC,
    supplier_name TEXT,
    location TEXT,
    production_volumes INT,
    manufacturing_lead_time INT,
    manufacturing_costs NUMERIC,
    inspection_results TEXT,
    defect_rates NUMERIC,
    transportation_modes TEXT,
    routes TEXT,
    costs NUMERIC,
    final_lead_time NUMERIC,
    profit NUMERIC,
    shipping_risk_flag TEXT,
    stock_risk_flag TEXT
);

-------------------------------------
--> Load Data
-------------------------------------
COPY orders
FROM 'F:\Projects\ProjectO\SQL Projects\Project 1-Supply Chain Disruption & Vendor Performance Analysis\data\cleaned_supply_chain_data.csv' DELIMITER ',' CSV HEADER;
