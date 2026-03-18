CREATE DATABASE assignment_db;
USE assignment_db;

-- Q1: Create sales_reps table
CREATE TABLE sales_rep(
    sales_rep_id VARCHAR(10),
    sales_rep_name VARCHAR(100) NOT NULL ,
    sales_rep_email VARCHAR(150) NOT NULL UNIQUE,
    office_address TEXT NOT NULL,
    PRIMARY KEY (sales_rep_id)
)ENGINE=InnoDB;

-- Q2: Create customers table
CREATE TABLE customers(
    customer_id VARCHAR(10),
    customer_name VARCHAR(100) NOT NULL,
    customer_email VARCHAR(150) NOT NULL UNIQUE,
    customer_city VARCHAR(100) NOT NULL,
    PRIMARY KEY (customer_id)
)ENGINE=InnoDB;

-- Q3: Create products table
CREATE TABLE products(
    product_id VARCHAR(10),
    product_name  VARCHAR(100) NOT NULL ,
    category VARCHAR(100) NOT NULL,
    unit_price  DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (product_id)
)ENGINE=InnoDB;


-- Q4: Create orders table
CREATE TABLE orders(
    order_id VARCHAR(10),
    customer_id VARCHAR(10) NOT NULL,
    product_id VARCHAR(10) NOT NULL,
    sales_rep_id VARCHAR(10) NOT NULL,
    quantity INT NOT NULL,
    order_date DATE NOT NULL,
    PRIMARY KEY(order_id),
    FOREIGN KEY(customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY(product_id) REFERENCES products(product_id),
    FOREIGN KEY(sales_rep_id) REFERENCES sales_rep(sales_rep_id)
    )ENGINE=InnoDB;
    
    
INSERT INTO sales_rep 
    (sales_rep_id, sales_rep_name, sales_rep_email, office_address) 
VALUES
    ('SR01', 'Deepak Joshi', 'deepak@corp.com', 'Mumbai HQ, Nariman Point, Mumbai - 400021'),
    ('SR02', 'Anita Desai', 'anita@corp.com', 'Delhi Office, Connaught Place, New Delhi - 110001'),
    ('SR03', 'Ravi Kumar', 'ravi@corp.com', 'South Zone, MG Road, Bangalore - 560001');
    
    
INSERT INTO customers 
    (customer_id, customer_name, customer_email, customer_city) 
VALUES
    ('C001', 'Rohan Mehta', 'rohan@gmail.com', 'Mumbai'),
    ('C002', 'Priya Sharma', 'priya@gmail.com', 'Delhi'),
    ('C003', 'Amit Verma', 'amit@gmail.com', 'Bangalore'),
    ('C004', 'Sneha Iyer', 'sneha@gmail.com', 'Chennai'),
    ('C005', 'Vikram Singh', 'vikram@gmail.com', 'Mumbai'),
    ('C006', 'Neha Gupta', 'neha@gmail.com', 'Delhi'),
    ('C007', 'Arjun Nair', 'arjun@gmail.com', 'Bangalore'),
    ('C008', 'Kavya Rao', 'kavya@gmail.com', 'Hyderabad');
    
INSERT INTO products 
    (product_id, product_name, category, unit_price) 
VALUES
    ('P001', 'Laptop', 'Electronics', 55000),
    ('P002', 'Mouse', 'Electronics', 800),
    ('P003', 'Desk Chair', 'Furniture', 8500),
    ('P004', 'Notebook', 'Stationery', 120),
    ('P005', 'Headphones', 'Electronics', 3200),
    ('P006', 'Standing Desk', 'Furniture', 22000),
    ('P007', 'Pen Set', 'Stationery', 250),
    ('P008', 'Webcam', 'Electronics', 2100);
    
INSERT INTO orders 
    (order_id, customer_id, product_id, sales_rep_id, quantity, order_date) 
VALUES
    ('ORD1000', 'C002', 'P001', 'SR03', 2, '2023-05-21'),
    ('ORD1001', 'C004', 'P002', 'SR03', 5, '2023-02-22'),
    ('ORD1002', 'C002', 'P005', 'SR02', 1, '2023-01-17'),
    ('ORD1003', 'C002', 'P002', 'SR01', 5, '2023-09-16'),
    ('ORD1004', 'C001', 'P005', 'SR01', 5, '2023-11-29');
    
SELECT * FROM sales_rep;
SELECT * FROM customers;
SELECT * FROM products;
SELECT * FROM orders;