/* ============================================================
   CELEBAL SUMMER INTERNSHIP 2026
   WEEK 2 - SQL DATA ANALYSIS USING SUPERSTORE DATASET
   ============================================================ */

USE superstore_db;

/* ============================================================
   STEP 1 - EXPLORE DATASET
   ============================================================ */

-- View table structure
DESCRIBE superstore;

-- Display first 10 records
SELECT *
FROM superstore
LIMIT 10;

-- Count total records
SELECT COUNT(*) AS Total_Records
FROM superstore;

/* ============================================================
   STEP 2 - WHERE FILTERS
   ============================================================ */

-- Orders from West Region
SELECT *
FROM superstore
WHERE Region = 'West';

-- Orders from South Region
SELECT *
FROM superstore
WHERE Region = 'South';

-- Technology Category Orders
SELECT *
FROM superstore
WHERE Category = 'Technology';

-- Furniture Category Orders
SELECT *
FROM superstore
WHERE Category = 'Furniture';

-- High Value Orders (Sales > 1000)
SELECT *
FROM superstore
WHERE Sales > 1000;

-- High Profit Orders
SELECT *
FROM superstore
WHERE Profit > 500;

-- Orders from California
SELECT *
FROM superstore
WHERE State = 'California';

/* ============================================================
   STEP 3 - AGGREGATION USING GROUP BY
   ============================================================ */

-- Total Sales by Region
SELECT
    Region,
    ROUND(SUM(Sales),2) AS Total_Sales
FROM superstore
GROUP BY Region
ORDER BY Total_Sales DESC;

-- Total Quantity by Region
SELECT
    Region,
    SUM(Quantity) AS Total_Quantity
FROM superstore
GROUP BY Region
ORDER BY Total_Quantity DESC;

-- Average Sales by Category
SELECT
    Category,
    ROUND(AVG(Sales),2) AS Average_Sales
FROM superstore
GROUP BY Category;

-- Total Profit by Category
SELECT
    Category,
    ROUND(SUM(Profit),2) AS Total_Profit
FROM superstore
GROUP BY Category
ORDER BY Total_Profit DESC;

-- Total Sales by Segment
SELECT
    Segment,
    ROUND(SUM(Sales),2) AS Total_Sales
FROM superstore
GROUP BY Segment
ORDER BY Total_Sales DESC;

/* ============================================================
   STEP 4 - SORTING AND LIMITING RESULTS
   ============================================================ */

-- Top 10 Products by Sales
SELECT
    `Product Name`,
    ROUND(SUM(Sales),2) AS Total_Sales
FROM superstore
GROUP BY `Product Name`
ORDER BY Total_Sales DESC
LIMIT 10;

-- Top 10 Customers by Sales
SELECT
    `Customer Name`,
    ROUND(SUM(Sales),2) AS Total_Sales
FROM superstore
GROUP BY `Customer Name`
ORDER BY Total_Sales DESC
LIMIT 10;

-- Top Categories by Sales
SELECT
    Category,
    ROUND(SUM(Sales),2) AS Total_Sales
FROM superstore
GROUP BY Category
ORDER BY Total_Sales DESC;

-- Top 10 States by Sales
SELECT
    State,
    ROUND(SUM(Sales),2) AS Total_Sales
FROM superstore
GROUP BY State
ORDER BY Total_Sales DESC
LIMIT 10;

/* ============================================================
   STEP 5 - BUSINESS USE CASES
   ============================================================ */

-- Monthly Sales Trend
SELECT
    YEAR(STR_TO_DATE(`Order Date`,'%m/%d/%Y')) AS Year,
    MONTH(STR_TO_DATE(`Order Date`,'%m/%d/%Y')) AS Month,
    ROUND(SUM(Sales),2) AS Monthly_Sales
FROM superstore
GROUP BY Year, Month
ORDER BY Year, Month;

-- Top 10 Customers by Profit
SELECT
    `Customer Name`,
    ROUND(SUM(Profit),2) AS Total_Profit
FROM superstore
GROUP BY `Customer Name`
ORDER BY Total_Profit DESC
LIMIT 10;

-- Sales by State
SELECT
    State,
    ROUND(SUM(Sales),2) AS Total_Sales
FROM superstore
GROUP BY State
ORDER BY Total_Sales DESC
LIMIT 10;

-- Most Profitable States
SELECT
    State,
    ROUND(SUM(Profit),2) AS Total_Profit
FROM superstore
GROUP BY State
ORDER BY Total_Profit DESC
LIMIT 10;

-- Most Profitable Category
SELECT
    Category,
    ROUND(SUM(Profit),2) AS Total_Profit
FROM superstore
GROUP BY Category
ORDER BY Total_Profit DESC;

/* ============================================================
   STEP 6 - DUPLICATE RECORD CHECK
   ============================================================ */

-- Check Duplicate Order IDs
SELECT
    `Order ID`,
    COUNT(*) AS Duplicate_Count
FROM superstore
GROUP BY `Order ID`
HAVING COUNT(*) > 1;

/* ============================================================
   STEP 7 - DATA QUALITY VALIDATION
   ============================================================ */

-- Check Null Sales
SELECT COUNT(*) AS Null_Sales
FROM superstore
WHERE Sales IS NULL;

-- Check Null Customer Names
SELECT COUNT(*) AS Null_Customers
FROM superstore
WHERE `Customer Name` IS NULL;

-- Check Null Profit Values
SELECT COUNT(*) AS Null_Profit
FROM superstore
WHERE Profit IS NULL;

-- Verify Total Records
SELECT COUNT(*) AS Total_Records
FROM superstore;

/* ============================================================
   BRIEF INSIGHTS
   ============================================================

1. Technology category contributes significantly to sales.
2. West region is one of the highest revenue-generating regions.
3. A small number of customers account for a large share of revenue.
4. Sales show monthly fluctuations indicating seasonality.
5. Some states contribute disproportionately to profit.
6. Data quality validation shows minimal missing values.

============================================================ */