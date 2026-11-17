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

-- 1. Category-wise Sales, Profit and Quantity

SELECT
    Category,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    SUM(Quantity) AS Total_Quantity
FROM orders
GROUP BY Category
ORDER BY Total_Sales DESC;

-- 2. Category-wise Profitability

SELECT
    Category,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    ROUND(
        (SUM(Profit) / NULLIF(SUM(Sales), 0)) * 100, 2
    ) AS Profit_Margin
FROM orders
GROUP BY Category
ORDER BY Total_Profit DESC;

-- 3. Best Selling Category

SELECT
    Category,
    ROUND(SUM(Sales), 2) AS Total_Sales
FROM orders
GROUP BY Category
ORDER BY Total_Sales DESC
LIMIT 1;

-- 4. Sub-Category-wise Sales Analysis

SELECT
    `Sub-Category`,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    SUM(Quantity) AS Total_Quantity
FROM orders
GROUP BY `Sub-Category`
ORDER BY Total_Sales DESC;

-- 5. Regional Sales and Profit Analysis

SELECT
    Region,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    SUM(Quantity) AS Total_Quantity
FROM orders
GROUP BY Region
ORDER BY Total_Sales DESC;

-- 6. Regional Profit Margin

SELECT
    Region,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    ROUND(
        SUM(Profit) / NULLIF(SUM(Sales), 0) * 100,
        2
    ) AS Profit_Margin
FROM orders
GROUP BY Region
ORDER BY Profit_Margin DESC;

-- 7. Total Unique Customers
SELECT
    COUNT(DISTINCT `Customer ID`) AS Total_Customers
FROM orders;

-- 8. Top 10 Customers by Sales
SELECT
    `Customer Name`,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    COUNT(DISTINCT `Order ID`) AS Total_Orders
FROM orders
GROUP BY `Customer Name`
ORDER BY Total_Sales DESC
LIMIT 10;

-- 9. Sales and Profit by Customer Segment
SELECT
    Segment,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    SUM(Quantity) AS Total_Quantity,
    COUNT(DISTINCT `Order ID`) AS Total_Orders
FROM orders
GROUP BY Segment
ORDER BY Total_Sales DESC;

-- 10. Profit Margin by Customer Segment
SELECT
    Segment,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    ROUND(SUM(Profit) / NULLIF(SUM(Sales), 0) * 100, 2) AS Profit_Margin
FROM orders
GROUP BY Segment
ORDER BY Profit_Margin DESC;


-- 11. Shipping Mode Analysis
SELECT
    `Ship Mode`,
    COUNT(DISTINCT `Order ID`) AS Total_Orders,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit
FROM orders
GROUP BY `Ship Mode`
ORDER BY Total_Orders DESC;

-- 12. Average Shipping Days by Ship Mode
SELECT
    `Ship Mode`,
    ROUND(AVG(`Shipping Days`), 2) AS Avg_Shipping_Days,
    MIN(`Shipping Days`) AS Minimum_Days,
    MAX(`Shipping Days`) AS Maximum_Days
FROM orders
GROUP BY `Ship Mode`
ORDER BY Avg_Shipping_Days;

-- 13. Discount-wise Sales and Profit Analysis
SELECT
    Discount,
    COUNT(*) AS Total_Records,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    ROUND(AVG(Profit), 2) AS Average_Profit
FROM orders
GROUP BY Discount
ORDER BY Discount;

-- 14. High Discount Orders with Negative Profit
SELECT
    `Order ID`,
    `Product Name`,
    Discount,
    Sales,
    Profit
FROM orders
WHERE Discount >= 0.30
AND Profit < 0
ORDER BY Discount DESC
LIMIT 20;

-- 15. Year-wise Sales and Profit Analysis
SELECT
    `Order Year`,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    COUNT(DISTINCT `Order ID`) AS Total_Orders
FROM orders
GROUP BY `Order Year`
ORDER BY `Order Year`;

-- 16. Monthly Sales Trend
SELECT
    `Order Year`,
    `Order Month`,
    `Month Name`,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit
FROM orders
GROUP BY
    `Order Year`,
    `Order Month`,
    `Month Name`
ORDER BY
    `Order Year`,
    `Order Month`;
    
-- 17. Top 10 Products by Sales
SELECT
    `Product Name`,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    SUM(Quantity) AS Total_Quantity
FROM orders
GROUP BY `Product Name`
ORDER BY Total_Sales DESC
LIMIT 10;

-- 18. Top 10 Products by Profit
SELECT
    `Product Name`,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit
FROM orders
GROUP BY `Product Name`
ORDER BY Total_Profit DESC
LIMIT 10;

-- 19. Products Generating Overall Loss
SELECT
    `Product Name`,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit
FROM orders
GROUP BY `Product Name`
HAVING SUM(Profit) < 0
ORDER BY Total_Profit ASC
LIMIT 10;

-- 20. Top 10 States by Sales
SELECT
    State,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    COUNT(DISTINCT `Order ID`) AS Total_Orders
FROM orders
GROUP BY State
ORDER BY Total_Sales DESC
LIMIT 10;

-- 21. Bottom 10 States by Profit
SELECT
    State,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit
FROM orders
GROUP BY State
ORDER BY Total_Profit ASC
LIMIT 10;