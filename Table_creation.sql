-- Sample Sales Dataset and Exercises
-- File: Sample_Sales_Dataset.sql
-- Instructions: Run these CREATE TABLE and INSERT statements in your MySQL database (USE your_database;) to load the sample dataset.
-- ==========================
-- TABLE: customers
-- ==========================
CREATE TABLE customers (
  customer_id INT PRIMARY KEY,
  first_name VARCHAR(50),
  last_name VARCHAR(50),
  email VARCHAR(100),
  city VARCHAR(50),
  state VARCHAR(50),
  country VARCHAR(50),
  signup_date DATE
);

INSERT INTO customers VALUES
(1,'John','Doe','john.doe@example.com','Lagos','Lagos State','Nigeria','2023-01-15'),
(2,'Jane','Smith','jane.smith@example.com','Abuja','FCT','Nigeria','2022-11-02'),
(3,'Ali','Musa','ali.musa@example.com','Kano','Kano State','Nigeria','2024-03-20'),
(4,'Maria','Garcia','maria.garcia@example.com','Accra','Greater Accra','Ghana','2021-07-05'),
(5,'Chen','Li','chen.li@example.com','Lagos','Lagos State','Nigeria','2020-06-18');

-- ==========================
-- TABLE: products
-- ==========================
CREATE TABLE products (
  product_id INT PRIMARY KEY,
  product_name VARCHAR(100),
  category VARCHAR(50),
  unit_price DECIMAL(10,2),
  units_in_stock INT
);

INSERT INTO products VALUES
(101,'Electric Kettle','Appliances',45.50,120),
(102,'Blender','Appliances',60.00,80),
(103,'Water Bottle 1L','Accessories',8.00,500),
(104,'Running Shoes','Footwear',85.00,200),
(105,'T-Shirt (Unisex)','Clothing',12.00,1000),
(106,'Smartphone Model X','Electronics',350.00,35),
(107,'Headphones','Electronics',25.00,150);

-- ==========================
-- TABLE: suppliers
-- ==========================
CREATE TABLE suppliers (
  supplier_id INT PRIMARY KEY,
  supplier_name VARCHAR(100),
  contact_email VARCHAR(100),
  country VARCHAR(50)
);

INSERT INTO suppliers VALUES
(201,'Global Appliances Ltd','sales@globalappliances.com','China'),
(202,'FreshGoods Suppliers','contact@freshgoods.com','Nigeria'),
(203,'TechSource','support@techsource.com','South Korea');

-- ==========================
-- TABLE: orders
-- ==========================
CREATE TABLE orders (
  order_id INT PRIMARY KEY,
  customer_id INT,
  order_date DATE,
  status VARCHAR(20),
  shipping_city VARCHAR(50),
  shipping_country VARCHAR(50),
  FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

INSERT INTO orders VALUES
(1001,1,'2024-01-20','Shipped','Lagos','Nigeria'),
(1002,2,'2024-02-14','Delivered','Abuja','Nigeria'),
(1003,3,'2024-03-25','Processing','Kano','Nigeria'),
(1004,1,'2024-04-05','Cancelled','Lagos','Nigeria'),
(1005,4,'2024-04-10','Delivered','Accra','Ghana');

-- ==========================
-- TABLE: order_items
-- ==========================
CREATE TABLE order_items (
  order_item_id INT PRIMARY KEY,
  order_id INT,
  product_id INT,
  quantity INT,
  unit_price DECIMAL(10,2),
  FOREIGN KEY (order_id) REFERENCES orders(order_id),
  FOREIGN KEY (product_id) REFERENCES products(product_id)
);

INSERT INTO order_items VALUES
(1,1001,101,1,45.50),
(2,1001,103,2,8.00),
(3,1002,105,3,12.00),
(4,1003,104,1,85.00),
(5,1003,107,2,25.00),
(6,1004,106,1,350.00),
(7,1005,103,10,8.00),
(8,1005,105,5,12.00);

-- ==========================
-- TABLE: inventory_movements (sample for stock tracking)
-- ==========================
CREATE TABLE inventory_movements (
  movement_id INT PRIMARY KEY,
  product_id INT,
  movement_date DATE,
  movement_type VARCHAR(10), -- 'IN' or 'OUT'
  quantity INT,
  FOREIGN KEY (product_id) REFERENCES products(product_id)
);

INSERT INTO inventory_movements VALUES
(1,101,'2024-01-10','IN',100),
(2,101,'2024-01-15','OUT',10),
(3,103,'2024-02-01','IN',300),
(4,103,'2024-03-01','OUT',50),
(5,106,'2024-04-01','IN',40);
