SELECT
ROUND(
SUM(quantity*unit_price*(1-discount_percent/100.0)),2
) AS TotalRevenue
FROM order_items;

SELECT

o.customer_id,

ROUND(
SUM(oi.quantity*oi.unit_price*(1-oi.discount_percent/100.0)),2
) AS Revenue

FROM orders o

JOIN order_items oi

ON o.order_id=oi.order_id

GROUP BY o.customer_id

ORDER BY Revenue DESC;

SELECT

p.category,

ROUND(
SUM(oi.quantity*oi.unit_price*(1-oi.discount_percent/100.0)),2
) AS Revenue

FROM products p

JOIN order_items oi

ON p.product_id=oi.product_id

GROUP BY p.category

ORDER BY Revenue DESC;
SELECT

substr(o.order_date,1,7) AS Month,

ROUND(
SUM(oi.quantity*oi.unit_price*(1-oi.discount_percent/100.0)),2
) AS Revenue

FROM orders o

JOIN order_items oi

ON o.order_id=oi.order_id

GROUP BY Month

ORDER BY Month;
SELECT

product_id,

SUM(quantity) AS QuantitySold,

ROUND(
SUM(quantity*unit_price),2
) AS Revenue

FROM order_items

GROUP BY product_id

ORDER BY Revenue DESC

LIMIT 10;
SELECT

customer_id,

ROUND(
AVG(OrderValue),2
) AS AverageOrderValue

FROM (
SELECT

o.order_id,

o.customer_id,

SUM(oi.quantity*oi.unit_price) AS OrderValue

FROM orders o

JOIN order_items oi

ON o.order_id=oi.order_id

GROUP BY o.order_id
) AS order_summary

GROUP BY customer_id

ORDER BY AverageOrderValue DESC;