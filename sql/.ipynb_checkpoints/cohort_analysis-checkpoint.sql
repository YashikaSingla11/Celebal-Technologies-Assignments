-- First Purchase Month

WITH first_purchase AS (

SELECT

customer_id,

MIN(substr(order_date,1,7)) AS cohort_month

FROM orders

GROUP BY customer_id

)

SELECT *

FROM first_purchase;
-- Monthly Orders

WITH monthly_orders AS (

SELECT

customer_id,

substr(order_date,1,7) AS order_month

FROM orders

)

SELECT *

FROM monthly_orders;
-- Repeat Customers

SELECT

customer_id,

COUNT(order_id) AS TotalOrders,

CASE

WHEN COUNT(order_id)=1

THEN 'One-Time'

WHEN COUNT(order_id) BETWEEN 2 AND 5

THEN 'Occasional'

ELSE 'Loyal'

END AS CustomerSegment

FROM orders

GROUP BY customer_id;
-- Spend Tier

SELECT

o.customer_id,

ROUND(

SUM(
oi.quantity*oi.unit_price
),2

) AS TotalSpend,

CASE

WHEN SUM(oi.quantity*oi.unit_price)<5000

THEN 'Low'

WHEN SUM(oi.quantity*oi.unit_price)<20000

THEN 'Medium'

ELSE 'High'

END AS SpendTier

FROM orders o

JOIN order_items oi

ON o.order_id=oi.order_id

GROUP BY o.customer_id;
