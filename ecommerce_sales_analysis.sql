CREATE DATABASE ecommerce_analysis;

USE ecommerce_analysis;

SELECT DATABASE();

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    email VARCHAR(100),
    city VARCHAR(50),
    state VARCHAR(50),
    registration_date DATE
);

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10,2)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    order_status VARCHAR(30),
    FOREIGN KEY (customer_id)
        REFERENCES customers(customer_id)
);

CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    FOREIGN KEY (order_id)
        REFERENCES orders(order_id),
    FOREIGN KEY (product_id)
        REFERENCES products(product_id)
);

CREATE TABLE payments (
    payment_id INT PRIMARY KEY,
    order_id INT,
    payment_date DATE,
    payment_method VARCHAR(30),
    payment_status VARCHAR(30),
    FOREIGN KEY (order_id)
        REFERENCES orders(order_id)
);

INSERT INTO customers
(customer_id, customer_name, email, city, state, registration_date)
VALUES
(101, 'Rahul Sharma', 'rahul@gmail.com', 'Hyderabad', 'Telangana', '2025-01-10'),
(102, 'Priya Reddy', 'priya@gmail.com', 'Vijayawada', 'Andhra Pradesh', '2025-01-15'),
(103, 'Arun Kumar', 'arun@gmail.com', 'Bangalore', 'Karnataka', '2025-02-05'),
(104, 'Sneha Rao', 'sneha@gmail.com', 'Chennai', 'Tamil Nadu', '2025-02-12'),
(105, 'Kiran Kumar', 'kiran@gmail.com', 'Hyderabad', 'Telangana', '2025-02-20'),
(106, 'Anjali Patel', 'anjali@gmail.com', 'Mumbai', 'Maharashtra', '2025-03-01'),
(107, 'Vijay Singh', 'vijay@gmail.com', 'Delhi', 'Delhi', '2025-03-10'),
(108, 'Neha Reddy', 'neha@gmail.com', 'Hyderabad', 'Telangana', '2025-03-18'),
(109, 'Ravi Teja', 'raviteja@gmail.com', 'Pune', 'Maharashtra', '2025-04-05'),


  INSERT INTO products
(product_id, product_name, category, price)
VALUES
(201, 'Laptop', 'Electronics', 55000),
(202, 'Smartphone', 'Electronics', 25000),
(203, 'Headphones', 'Electronics', 2500),
(204, 'Keyboard', 'Accessories', 1500),
(205, 'Mouse', 'Accessories', 800),
(206, 'Monitor', 'Electronics', 12000),
(207, 'Printer', 'Electronics', 15000),
(208, 'Office Chair', 'Furniture', 8500),
(209, 'Desk', 'Furniture', 12000),
(210, 'Webcam', 'Accessories', 3000);
(110, 'Divya Sharma', 'divya@gmail.com', 'Bangalore', 'Karnataka', '2025-04-15');


INSERT INTO orders
(order_id, customer_id, order_date, order_status)
VALUES
(1001, 101, '2025-04-01', 'Delivered'),
(1002, 102, '2025-04-02', 'Delivered'),
(1003, 103, '2025-04-05', 'Delivered'),
(1004, 104, '2025-04-07', 'Cancelled'),
(1005, 105, '2025-04-10', 'Delivered'),
(1006, 106, '2025-04-12', 'Delivered'),
(1007, 107, '2025-04-15', 'Shipped'),
(1008, 108, '2025-04-18', 'Delivered'),
(1009, 101, '2025-04-20', 'Delivered'),
(1010, 103, '2025-04-22', 'Delivered'),
(1011, 105, '2025-04-25', 'Cancelled'),
(1012, 109, '2025-04-27', 'Delivered'),
(1013, 110, '2025-04-29', 'Shipped'),
(1014, 102, '2025-05-02', 'Delivered'),
(1015, 108, '2025-05-05', 'Delivered');

INSERT INTO order_items
(order_item_id, order_id, product_id, quantity)
VALUES
(1, 1001, 201, 1),
(2, 1001, 205, 2),
(3, 1002, 202, 1),
(4, 1002, 203, 1),
(5, 1003, 206, 2),
(6, 1004, 204, 1),
(7, 1005, 201, 1),
(8, 1005, 205, 1),
(9, 1006, 207, 1),
(10, 1006, 210, 2),
(11, 1007, 202, 1),
(12, 1007, 208, 1),
(13, 1008, 209, 1),
(14, 1008, 205, 2),
(15, 1009, 203, 2),
(16, 1009, 204, 1),
(17, 1010, 201, 1),
(18, 1010, 206, 1),
(19, 1011, 208, 1),
(20, 1012, 207, 1),
(21, 1012, 210, 1),
(22, 1013, 202, 1),
(23, 1013, 205, 2),
(24, 1014, 201, 1),
(25, 1015, 209, 1);

INSERT INTO payments
(payment_id, order_id, payment_date, payment_method, payment_status)
VALUES
(501, 1001, '2025-04-01', 'UPI', 'Paid'),
(502, 1002, '2025-04-02', 'Credit Card', 'Paid'),
(503, 1003, '2025-04-05', 'Debit Card', 'Paid'),
(504, 1004, '2025-04-07', 'UPI', 'Refunded'),
(505, 1005, '2025-04-10', 'Credit Card', 'Paid'),
(506, 1006, '2025-04-12', 'UPI', 'Paid'),
(507, 1007, '2025-04-15', 'Debit Card', 'Paid'),
(508, 1008, '2025-04-18', 'Cash', 'Paid'),
(509, 1009, '2025-04-20', 'UPI', 'Paid'),
(510, 1010, '2025-04-22', 'Credit Card', 'Paid'),
(511, 1011, '2025-04-25', 'UPI', 'Refunded'),
(512, 1012, '2025-04-27', 'Debit Card', 'Paid'),
(513, 1013, '2025-04-29', 'UPI', 'Paid'),
(514, 1014, '2025-05-02', 'Credit Card', 'Paid'),
(515, 1015, '2025-05-05', 'UPI', 'Paid');

-- ============================
-- BUSINESS ANALYSIS
-- ============================


SELECT
    (SELECT COUNT(*) FROM customers) AS total_customers,
    (SELECT COUNT(*) FROM orders) AS total_orders,
    (SELECT COUNT(*) FROM products) AS total_products,
    (SELECT SUM(quantity) FROM order_items) AS total_units_sold;


-- Total Revenue from Non-Cancelled Orders

SELECT
    SUM(oi.quantity * p.price) AS total_revenue
FROM orders o
JOIN order_items oi
    ON o.order_id = oi.order_id
JOIN products p
    ON oi.product_id = p.product_id
WHERE o.order_status <> 'Cancelled';


-- Revenue by Product

SELECT
    p.product_name,
    SUM(oi.quantity * p.price) AS total_revenue
FROM order_items oi
JOIN products p
    ON oi.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_revenue DESC;


-- Customer Spending Analysis

SELECT
    c.customer_id,
    c.customer_name,
    SUM(oi.quantity * p.price) AS total_spending
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
JOIN order_items oi
    ON o.order_id = oi.order_id
JOIN products p
    ON oi.product_id = p.product_id
WHERE o.order_status <> 'Cancelled'
GROUP BY
    c.customer_id,
    c.customer_name
ORDER BY total_spending DESC;


