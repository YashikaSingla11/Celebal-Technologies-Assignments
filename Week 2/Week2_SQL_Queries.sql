/* =====================================================
   CELEBAL SUMMER INTERNSHIP 2026
   WEEK 2 - E-COMMERCE SALES DATABASE
   ===================================================== */

/* ===========================
   SECTION A - SQL BASICS
   =========================== */

/* Q1 - Display all customers */
SELECT * FROM customers;

/* Q2 - Display first name, last name and city */
SELECT first_name,last_name,city
FROM customers;

/* Q3 - List unique product categories */
SELECT DISTINCT category
FROM products;

/* Q4 - Identify Primary Keys */

SHOW KEYS FROM customers WHERE Key_name='PRIMARY';

SHOW KEYS FROM products WHERE Key_name='PRIMARY';

SHOW KEYS FROM orders WHERE Key_name='PRIMARY';

SHOW KEYS FROM order_items WHERE Key_name='PRIMARY';

/* Q5 - Constraints on email column */
SHOW CREATE TABLE customers;

/* Duplicate Email Test */
INSERT INTO customers
VALUES
(109,'Test','User',
'aarav.s@email.com',
'Mumbai',
'Maharashtra',
'2024-09-01',
TRUE);

/* Q6 - Negative Price Test */
INSERT INTO products
VALUES
(
209,
'Test Product',
'Electronics',
'TestBrand',
-50,
10
);

/* ===========================
   SECTION B - FILTERING
   =========================== */

/* Q7 - Delivered Orders */
SELECT *
FROM orders
WHERE status='Delivered';

/* Q8 - Electronics Products Above 2000 */
SELECT *
FROM products
WHERE category='Electronics'
AND unit_price > 2000;

/* Q9 - Maharashtra Customers Joined In 2024 */
SELECT *
FROM customers
WHERE state='Maharashtra'
AND join_date >= '2024-01-01'
AND join_date < '2025-01-01';

/* Q10 - Orders Between Dates */
SELECT *
FROM orders
WHERE order_date BETWEEN '2024-08-10'
AND '2024-08-25'
AND status <> 'Cancelled';

/* Q11 - Index Example */
SELECT *
FROM orders
WHERE order_date='2024-08-15';

/* Q12 - Non SARGable Query */
SELECT *
FROM customers
WHERE YEAR(join_date)=2024;

/* Q12 - SARGable Query */
SELECT *
FROM customers
WHERE join_date >= '2024-01-01'
AND join_date < '2025-01-01';

/* ===========================
   SECTION C - AGGREGATION
   =========================== */

/* Q13 - Total Orders */
SELECT COUNT(*) AS total_orders
FROM orders;

/* Q14 - Total Revenue */
SELECT SUM(total_amount) AS total_revenue
FROM orders
WHERE status='Delivered';

/* Q15 - Average Price By Category */
SELECT category,
AVG(unit_price) AS average_price
FROM products
GROUP BY category;

/* Q16 - Order Count And Revenue By Status */
SELECT status,
COUNT(*) AS order_count,
SUM(total_amount) AS total_revenue
FROM orders
GROUP BY status
ORDER BY total_revenue DESC;

/* Q17 - Maximum And Minimum Price */
SELECT category,
MAX(unit_price) AS max_price,
MIN(unit_price) AS min_price
FROM products
GROUP BY category;

/* Q18 - Categories With Avg Price > 2000 */
SELECT category,
AVG(unit_price) AS average_price
FROM products
GROUP BY category
HAVING AVG(unit_price) > 2000;

/* ===========================
   SECTION D - JOINS
   =========================== */

/* Q19 - INNER JOIN */
SELECT
o.order_id,
o.order_date,
c.first_name,
c.last_name,
o.total_amount
FROM orders o
INNER JOIN customers c
ON o.customer_id=c.customer_id;

/* Q20 - LEFT JOIN */
SELECT
c.customer_id,
c.first_name,
c.last_name,
o.order_id,
o.order_date
FROM customers c
LEFT JOIN orders o
ON c.customer_id=o.customer_id;

/* Q21 - Three Table JOIN */
SELECT
o.order_id,
p.product_name,
oi.quantity,
oi.unit_price,
oi.discount_pct
FROM orders o
JOIN order_items oi
ON o.order_id=oi.order_id
JOIN products p
ON oi.product_id=p.product_id;

/* Q22 - LEFT JOIN */
SELECT *
FROM customers c
LEFT JOIN orders o
ON c.customer_id=o.customer_id;

/* Q22 - RIGHT JOIN */
SELECT *
FROM customers c
RIGHT JOIN orders o
ON c.customer_id=o.customer_id;

/* Q23 - Foreign Keys */
SELECT
TABLE_NAME,
COLUMN_NAME,
REFERENCED_TABLE_NAME,
REFERENCED_COLUMN_NAME
FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE
WHERE REFERENCED_TABLE_NAME IS NOT NULL
AND TABLE_SCHEMA='celebal_week2';

/* Invalid Foreign Key Example */
INSERT INTO orders
VALUES
(
2000,
999,
'2024-09-01',
'Pending',
1000
);

/* ===========================
   SECTION E - ADVANCED SQL
   =========================== */

/* Q24 - CASE Statement */
SELECT
product_name,
unit_price,
CASE
WHEN unit_price < 1000 THEN 'Budget'
WHEN unit_price BETWEEN 1000 AND 3000 THEN 'Mid-Range'
ELSE 'Premium'
END AS price_tier
FROM products;

/* Q25 - Delivered Vs Not Delivered */
SELECT
SUM(CASE WHEN status='Delivered' THEN 1 ELSE 0 END)
AS Delivered_Orders,
SUM(CASE WHEN status<>'Delivered' THEN 1 ELSE 0 END)
AS Not_Delivered_Orders
FROM orders;

/* Q26 - ACID */

/* Atomicity */
START TRANSACTION;

UPDATE products
SET stock_qty=stock_qty-1
WHERE product_id=201;

UPDATE products
SET stock_qty=stock_qty-1
WHERE product_id=999;

ROLLBACK;

/* Consistency */
INSERT INTO products
VALUES
(
300,
'Test Product',
'Electronics',
'Brand',
-100,
10
);

/* Isolation */
START TRANSACTION;

UPDATE products
SET stock_qty=stock_qty-5
WHERE product_id=201;

SELECT stock_qty
FROM products
WHERE product_id=201;

/* Durability */
START TRANSACTION;

UPDATE products
SET stock_qty=stock_qty-1
WHERE product_id=201;

COMMIT;

SELECT stock_qty
FROM products
WHERE product_id=201;

/* Q27 - Transaction Example */

START TRANSACTION;

INSERT INTO orders
VALUES
(
1011,
102,
CURDATE(),
'Pending',
1598.00
);

INSERT INTO order_items
VALUES
(
5016,
1011,
206,
1,
1299.00,
0
);

INSERT INTO order_items
VALUES
(
5017,
1011,
208,
1,
299.00,
0
);

UPDATE products
SET stock_qty=stock_qty-1
WHERE product_id=206;

UPDATE products
SET stock_qty=stock_qty-1
WHERE product_id=208;

COMMIT;
