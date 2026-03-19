USE warehouse_db;

-- Q1: Total sales revenue by product category for each month
SELECT d.month_name, p.product_category, SUM(f.total_revenue) AS monthly_revenue
FROM fact_sales f
JOIN dim_date d ON d.date_key = f.date_key
JOIN dim_product p ON p.product_key = f.product_key
GROUP BY d.month_name, p.product_category
ORDER BY d.month, p.product_category;


-- Q2: Top 2 performing stores by total revenue
SELECT s.store_name, SUM(f.total_revenue) AS monthly_revenue
FROM fact_sales f
JOIN dim_store s ON f.store_key = s.store_key  
GROUP BY s.store_name
ORDER BY total_revenue DESC
LIMIT 2;


-- Q3: Month-over-month sales trend across all stores
SELECT d.month, d.year, SUM(f.total_revenue) AS monthly_revenue
FROM fact_sales f
JOIN dim_date d ON d.date_key = f.date_key
GROUP BY d.month, d.year
ORDER BY d.month;