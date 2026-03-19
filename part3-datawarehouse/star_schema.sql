DROP database wherehouse_db;
CREATE database wherehouse_db;
USE wherehouse_db;

CREATE TABLE dim_date (
	date_key INT PRIMARY KEY,
    full_date DATE NOT NULL,
    day INT NOT NULL,
    month INT NOT NULL,
    month_name VARCHAR(20) NOT NULL,
    quarter INT NOT NULL,
    year INT NOT NULL
);

CREATE TABLE dim_store (
	store_key INT PRIMARY KEY AUTO_INCREMENT,
    store_name VARCHAR(50) NOT NULL,
    store_city VARCHAR(50) NOT NULL
);
	
CREATE TABLE dim_product (
	product_key INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(50) NOT NULL,
    product_category VARCHAR(50) NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL
);

CREATE TABLE fact_sales (
	transaction_id VARCHAR(20) PRIMARY KEY,
    date_key INT NOT NULL,
    store_key INT NOT NULL,
    product_key INT NOT NULL,
    units_sold INT NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL,
    total_revenue DECIMAL(20,2) NOT NULL,
    FOREIGN KEY (date_key) REFERENCES dim_date(date_key),
    FOREIGN KEY (store_key) REFERENCES dim_store(store_key),
    FOREIGN KEY (product_key) REFERENCES dim_product(product_key)
);

INSERT INTO dim_date (date_key, full_date, day, month, month_name, quarter, year)
VALUES
    (20230829, '2023-08-29', 29, 8, 'August',   3, 2023),
    (20231212, '2023-12-12', 12, 12, 'December', 4, 2023),
    (20230205, '2023-02-05', 05, 02, 'February', 1, 2023),
    (20230115, '2023-01-15', 15, 01, 'January', 1, 2023),
    (20231118, '2023-11-18', 18, 11, 'November', 4, 2023),
	(20230220, '2023-02-20', 20, 2, 'February', 1, 2023),
    (20230809, '2023-08-09', 09, 8, 'August', 3, 2023),
    (20230306, '2023-03-06', 06, 3, 'March', 1, 2023),
    (20230208, '2023-02-08', 08, 2, 'February', 1, 2023),
    (20230521, '2023-05-21', 21, 5, 'May', 2, 2023);
    
    
INSERT INTO dim_store (store_name, store_city)
VALUES
    ('Chennai Anna',    'Chennai'),
    ('Delhi South',     'Delhi'),
    ('Bangalore MG',    'Bangalore'),
    ('Pune FC Road',    'Pune'),
    ('Mumbai Central',  'Mumbai');
    

INSERT INTO dim_product (product_name, product_category, unit_price)
VALUES
    ('Oil 1L',     'Groceries', 26474.34),
    ('Biscuits',   'Groceries', 27469.99),
    ('Pulses 1kg', 'Groceries', 31604.47),
    ('Speaker',      'Electronics', 49262.78),
    ('Tablet',       'Electronics', 23226.12),
    ('Phone',        'Electronics', 48703.39),
    ('Smartwatch',   'Electronics', 58851.01),
    ('Laptop',       'Electronics', 42343.15),
    ('Headphones',   'Electronics', 39854.96),
    ('Jeans',        'Clothing', 2317.47),
    ('Jacket',       'Clothing', 30187.24),
    ('Saree',        'Clothing', 35451.81),
    ('T-Shirt',      'Clothing', 29770.19),
    ('Atta 10kg',    'Groceries', 52464),
    ('Rice 5kg',     'Groceries', 52195.05),
    ('Milk 1L',      'Groceries', 43374.39);
    
    
INSERT INTO fact_sales (transaction_id, date_key, store_key, product_key, unit_price, units_sold, total_revenue)
VALUES 
	('TXN5000', 20230829, 1, 4, 49262.78, 3, 49262.78*3 ),
    ('TXN5001',20231212, 1, 5, 23226.12, 11, 23226.12*11),
    ('TXN5002',20230205, 1, 6, 48703.39, 20, 48703.39*20),
    ('TXN5004',20230115, 1, 7, 58851.01, 10, 58851.01*10),
    ('TXN5014',20231118, 2, 11, 30187.24, 5, 30187.24*5),
    ('TXN5003',20230220, 2, 5, 23226.12, 14, 23226.12*14),
    ('TXN5005',20230809, 3, 14, 52464, 12, 52464*12),
    ('TXN5116',20230306, 4, 2, 27469.99, 2,27469.99*2),
    ('TXN5018',20230208, 3, 9, 39854.96, 15, 39854.96*15),
    ('TXN5012',20230521, 3, 8, 42343.15, 13, 42343.15*13);
    



    