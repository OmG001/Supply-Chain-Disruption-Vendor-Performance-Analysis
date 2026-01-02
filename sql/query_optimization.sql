## This improves performance for queries filtering by supplier and customer demographics

-- Index for faster joins
CREATE INDEX idx_orders_supplier ON orders(supplier_name);

-- Index for customer lookups
CREATE INDEX idx_orders_customer ON orders(customer_demographics);

SELECT * FROM orders
LIMIT 10;