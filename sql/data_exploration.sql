CREATE DATABASE superstore_db;
USE superstore_db;

SELECT * FROM superstore_sales 


-- 🔹 1️⃣ View first few records
SELECT *
FROM superstore_sales
LIMIT 10;


-- 🔹 2️⃣ Total number of records
SELECT COUNT(*) AS TotalRows
FROM superstore_sales;


-- 🔹 3️⃣ Total Sales, Quantity, and Profit
SELECT 
    SUM(Sales)   AS Total_Sales,
    SUM(Quantity) AS Total_Quantity,
    SUM(Profit)  AS Total_Profit
FROM superstore_sales;


-- 🔹 4️⃣ Count of unique Customers, Products, and Regions
SELECT 
    COUNT(DISTINCT Customer_Name) AS Unique_Customers,
    COUNT(DISTINCT Product_Name)  AS Unique_Products,
    COUNT(DISTINCT Region)        AS Unique_Regions
FROM superstore_sales;


-- 🔹 5️⃣ Sales by Region
SELECT 
    Region, 
    ROUND(SUM(Sales), 2) AS Total_Sales
FROM superstore_sales
GROUP BY Region
ORDER BY Total_Sales DESC;


-- 🔹 6️⃣ Top 10 Customers by Sales
SELECT 
    Customer_Name, 
    ROUND(SUM(Sales), 2) AS Total_Sales
FROM superstore_sales
GROUP BY Customer_Name
ORDER BY Total_Sales DESC
LIMIT 10;


-- 🔹 7️⃣ Sales by Category and Sub-Category
SELECT 
    Category,
    Sub_Category,
    ROUND(SUM(Sales), 2) AS Total_Sales
FROM superstore_sales
GROUP BY Category, Sub_Category
ORDER BY Category, Total_Sales DESC;


-- 🔹 8️⃣ Monthly Sales Trend
SELECT 
    DATE_FORMAT(`Order_Date`, '%Y-%m') AS Month,
    ROUND(SUM(Sales), 2) AS Total_Sales
FROM superstore_sales
GROUP BY Month
ORDER BY Month;


-- 🔹 9️⃣ Average Shipping Time (Days)
SELECT 
    ROUND(AVG(DATEDIFF(`Ship_Date`, `Order_Date`)), 2) AS Avg_Shipping_Days
FROM superstore_sales;


-- 🔹 🔟 Most Profitable Products (Top 10)
SELECT 
    Product_Name,
    ROUND(SUM(Profit), 2) AS Total_Profit
FROM superstore_sales
GROUP BY Product_Name
ORDER BY Total_Profit DESC
LIMIT 10;
