/* ============================================================
   CELEBAL TECHNOLOGIES INTERNSHIP
   WEEK 3 - SQL ANALYSIS USING SUBQUERIES, CTEs & WINDOW FUNCTIONS
   DATASET: SUPERSTORE
   ============================================================ */

USE superstore_db;

/* ============================================================
   STEP 1: CREATE REQUIRED TABLES
   ============================================================ */

-- Display existing tables
SHOW TABLES;

-- Remove tables if they already exist
DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS products;

-- Create Customers table using DISTINCT records
CREATE TABLE customers AS
SELECT DISTINCT
    `Customer ID`,
    `Customer Name`,
    Segment
FROM superstore;

-- Create Orders table using DISTINCT records
CREATE TABLE orders AS
SELECT DISTINCT
    `Order ID`,
    `Order Date`,
    `Customer ID`,
    Sales,
    Profit,
    Quantity
FROM superstore;

-- Create Products table using DISTINCT records
CREATE TABLE products AS
SELECT DISTINCT
    `Product ID`,
    `Product Name`,
    Category,
    `Sub-Category`
FROM superstore;

-- Verify table creation
SHOW TABLES;

/* Verify Customers Table */
SELECT * FROM customers LIMIT 5;

/* Verify Orders Table */
SELECT * FROM orders LIMIT 5;

/* Verify Products Table */
SELECT * FROM products LIMIT 5;

/* Record Count Validation */
SELECT COUNT(*) AS Customer_Count FROM customers;
SELECT COUNT(*) AS Order_Count FROM orders;
SELECT COUNT(*) AS Product_Count FROM products;


/* ============================================================
   QUESTION 1
   Find all orders where Sales is greater than Average Sales
   (Using Subquery)
   ============================================================ */

SELECT *
FROM superstore
WHERE Sales >
(
    SELECT AVG(Sales)
    FROM superstore
);

/* ============================================================
   QUESTION 2
   Find the Highest Sales Order for Each Customer
   (Using Correlated Subquery)
   ============================================================ */

SELECT *
FROM superstore s1
WHERE Sales =
(
    SELECT MAX(s2.Sales)
    FROM superstore s2
    WHERE s1.`Customer ID` = s2.`Customer ID`
);

/* ============================================================
   QUESTION 3
   Compute Total Sales Per Customer
   (Using Common Table Expression - CTE)
   ============================================================ */

WITH customer_sales AS
(
    SELECT
        `Customer ID`,
        `Customer Name`,
        SUM(Sales) AS Total_Sales
    FROM superstore
    GROUP BY
        `Customer ID`,
        `Customer Name`
)

SELECT *
FROM customer_sales;

/* ============================================================
   QUESTION 4
   Find Customers Whose Total Sales Are Above Average
   (Using CTE + Subquery)
   ============================================================ */

WITH customer_sales AS
(
    SELECT
        `Customer ID`,
        `Customer Name`,
        SUM(Sales) AS Total_Sales
    FROM superstore
    GROUP BY
        `Customer ID`,
        `Customer Name`
)

SELECT *
FROM customer_sales
WHERE Total_Sales >
(
    SELECT AVG(Total_Sales)
    FROM customer_sales
);

/* ============================================================
   QUESTION 5
   Rank Customers Based on Total Sales
   (Using RANK Window Function)
   ============================================================ */

WITH customer_sales AS
(
    SELECT
        `Customer ID`,
        `Customer Name`,
        SUM(Sales) AS Total_Sales
    FROM superstore
    GROUP BY
        `Customer ID`,
        `Customer Name`
)

SELECT *,
RANK() OVER
(
ORDER BY Total_Sales DESC
) AS Sales_Rank
FROM customer_sales;

/* ============================================================
   QUESTION 6
   Assign Row Number to Orders Within Each Customer
   (Using ROW_NUMBER Window Function)
   ============================================================ */

SELECT
`Customer ID`,
`Customer Name`,
`Order ID`,
Sales,

ROW_NUMBER() OVER
(
PARTITION BY `Customer ID`
ORDER BY Sales DESC
) AS Row_Num

FROM superstore;

/* ============================================================
   QUESTION 7
   Display Top 3 Customers Based on Total Sales
   (Using CTE + RANK)
   ============================================================ */

WITH customer_sales AS
(
    SELECT
        `Customer ID`,
        `Customer Name`,
        SUM(Sales) AS Total_Sales
    FROM superstore
    GROUP BY
        `Customer ID`,
        `Customer Name`
)

SELECT *
FROM
(
    SELECT *,
    RANK() OVER
    (
    ORDER BY Total_Sales DESC
    ) AS Sales_Rank

    FROM customer_sales
) ranked

WHERE Sales_Rank <= 3;

/* ============================================================
   QUESTION 8
   Customer Name, Total Sales and Customer Rank
   (Using CTE + JOIN + Window Function)
   ============================================================ */

WITH customer_sales AS
(
    SELECT
        `Customer ID`,
        SUM(Sales) AS Total_Sales
    FROM superstore
    GROUP BY `Customer ID`
)

SELECT
c.`Customer Name`,
cs.Total_Sales,

RANK() OVER
(
ORDER BY cs.Total_Sales DESC
) AS Sales_Rank

FROM customer_sales cs
JOIN customers c
ON cs.`Customer ID` = c.`Customer ID`;

/* ============================================================
   INSIGHTS
   ============================================================

1. Customers with sales above average were identified using subqueries.

2. CTEs simplified customer-level sales aggregation and improved query readability.

3. Window functions enabled customer ranking without losing row-level information.

4. Top-ranked customers contributed significantly to overall business revenue.

5. ROW_NUMBER helped identify the highest-value orders within each customer group.

6. Data was normalized into Customers, Orders and Products tables for better analysis.

7. Subqueries, CTEs and Window Functions provided deeper business insights compared to basic SQL queries.

============================================================ */
