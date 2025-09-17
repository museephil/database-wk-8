-- Week 8 Database Assignment
-- E-commerce Store
-- Built by Philip Musee David

CREATE DATABASE ecommerce_wk8;
USE ecommerce_wk8;

-- Users table (customers)
CREATE TABLE users (
  user_id INT AUTO_INCREMENT PRIMARY KEY,
  full_name VARCHAR(100) NOT NULL,
  email VARCHAR(100) NOT NULL UNIQUE,
  phone VARCHAR(20) UNIQUE
);

-- Products table
CREATE TABLE products (
  product_id INT AUTO_INCREMENT PRIMARY KEY,
  product_name VARCHAR(100) NOT NULL,
  price DECIMAL(10,2) NOT NULL,
  stock INT NOT NULL
);

-- Orders table (one user can make many orders)
CREATE TABLE orders (
  order_id INT AUTO_INCREMENT PRIMARY KEY,
  user_id INT NOT NULL,
  order_date DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- Order_Items (many-to-many between orders and products)
CREATE TABLE order_items (
  order_item_id INT AUTO_INCREMENT PRIMARY KEY,
  order_id INT NOT NULL,
  product_id INT NOT NULL,
  quantity INT NOT NULL,
  FOREIGN KEY (order_id) REFERENCES orders(order_id),
  FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- Payments (one order can have one payment)
CREATE TABLE payments (
  payment_id INT AUTO_INCREMENT PRIMARY KEY,
  order_id INT NOT NULL UNIQUE,
  amount DECIMAL(10,2) NOT NULL,
  method VARCHAR(50) NOT NULL,
  paid_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

-- Sample data with my classmates' names :)
INSERT INTO users (full_name,email,phone) VALUES
('Evans ProTrader','evans@example.com','0799000001'),
('Lukas CU Leader','lukas@example.com','0799000002'),
('Martin Gambler','martin@example.com','0799000003');

INSERT INTO products (product_name,price,stock) VALUES
('Laptop',55000,10),
('Phone',15000,20),
('Book: SQL Basics',1200,15);

INSERT INTO orders (user_id) VALUES
(1),(2);

INSERT INTO order_items (order_id,product_id,quantity) VALUES
(1,1,1),(1,3,2),(2,2,1);

INSERT INTO payments (order_id,amount,method) VALUES
(1,57400,'M-Pesa'),
(2,15000,'Card');
