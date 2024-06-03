-- drop table  orders;
-- drop table  statistics;
-- drop table  products;
-- drop table  categories;

CREATE TABLE categories (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    description TEXT
);

CREATE TABLE products (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    price DECIMAL(10,2) NOT NULL,
    category_id INT NOT NULL,
    FOREIGN KEY (category_id) REFERENCES categories(id)
);

CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    purchase_date TIMESTAMP NOT NULL,
    FOREIGN KEY (product_id) REFERENCES products(id)
);

CREATE TABLE statistics (
    id SERIAL PRIMARY KEY,
    product_id INT NOT NULL,
    category_id INT NOT NULL,
    quantity INT NOT NULL,
    purchase_date DATE NOT NULL,
    FOREIGN KEY (product_id) REFERENCES products(id),
    FOREIGN KEY (category_id) REFERENCES categories(id)
);

CREATE OR REPLACE FUNCTION update_order_statistics()
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO statistics (product_id, category_id, quantity, purchase_date)
    VALUES (NEW.product_id, (SELECT category_id FROM products WHERE id = NEW.product_id), NEW.quantity, DATE(NEW.purchase_date));
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER update_order_statistics_trigger
AFTER INSERT ON orders
FOR EACH ROW
EXECUTE FUNCTION update_order_statistics();


INSERT INTO categories (name, description) VALUES
('phone', 'description phone'),
('noutbuk', 'description noutbuk'),
('komputer', 'description komputer');


INSERT INTO products (name, description, price, category_id) VALUES
('phone - 1', 'description phone - 1', 11.22, 1),
('phone - 2', 'description phone - 2', 12.32, 1),
('noutbuk - 1', 'description noutbuk - 1', 14.22, 2),
('noutbuk - 2', 'description noutbuk - 2', 44.11, 2),
('komputer - 1', 'description komputer - 1', 33.11, 3),
('komputer - 2', 'description komputer - 2', 51.21, 3);


INSERT INTO orders (product_id, quantity, purchase_date) VALUES
(1, 2, '2024-06-01 10:00:00'),
(2, 1, '2024-06-01 11:01:00'),
(3, 3, '2024-06-02 10:22:00'),
(4, 1, '2024-06-02 13:13:00'),
(5, 3, '2024-06-03 10:04:00'),
(6, 2, '2024-06-03 15:15:00');


-- выводим количество товаров и категорий купленных за день
SELECT 
    product_id, 
    count(product_id) AS product_count, 
    category_id, 
    purchase_date 
FROM 
    statistics 
GROUP BY
    product_id, category_id, purchase_date 
ORDER BY
    purchase_date DESC;
