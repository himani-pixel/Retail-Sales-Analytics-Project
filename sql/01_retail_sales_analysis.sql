CREATE DATABASE retail_sales_db;
USE retail_sales_db;

SHOW DATABASES;

SELECT DATABASE();

USE retail_sales_db;

SHOW TABLES;

SELECT COUNT(*) AS total_records
FROM orders;

DESCRIBE orders;

SELECT * FROM orders LIMIT 5;


-- Verfying total records 
SELECT COUNT(*) AS total_records
FROM orders;

USE retail_sales_db;

-- Checking 1st 10 records
SELECT * FROM orders LIMIT 10;

-- Checking table structure. 
DESCRIBE orders;

-- Checking missing values
SELECT
    COUNT(*) AS total_records,
    SUM(CASE WHEN `Order ID` IS NULL THEN 1 ELSE 0 END) AS missing_order_id,
    SUM(CASE WHEN Sales IS NULL THEN 1 ELSE 0 END) AS missing_sales,
    SUM(CASE WHEN Profit IS NULL THEN 1 ELSE 0 END) AS missing_profit
FROM orders;

-- Calculating overall business KPIs
SELECT
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    COUNT(DISTINCT `Order ID`) AS Total_Orders,
    SUM(Quantity) AS Total_Quantity,
    ROUND(
        SUM(Profit) / SUM(Sales) * 100, 2
    ) AS Profit_Margin_Percentage
FROM orders;


-- Calculating sale and profit by category
SELECT
    Category,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    SUM(Quantity) AS Total_Quantity,
    COUNT(DISTINCT `Order ID`) AS Total_Orders
FROM orders
GROUP BY Category
ORDER BY Total_Sales DESC;

-- Analyse category profitability
SELECT
    Category,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    ROUND(
        SUM(Profit) / SUM(Sales) * 100, 2
    ) AS Profit_Margin
FROM orders
GROUP BY Category
ORDER BY Profit_Margin DESC;

-- Finding the best-performing category
SELECT
    Category,
    ROUND(SUM(Profit), 2) AS Total_Profit
FROM orders
GROUP BY Category
ORDER BY Total_Profit DESC
LIMIT 1; 

