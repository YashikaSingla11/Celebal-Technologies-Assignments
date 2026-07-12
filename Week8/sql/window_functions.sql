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

-- Dense Rank Customers

SELECT
o.customer_id,

ROUND(
SUM(oi.quantity * oi.unit_price),2
) AS Revenue,

DENSE_RANK() OVER(
ORDER BY SUM(oi.quantity * oi.unit_price) DESC
) AS DenseRank

FROM orders o

JOIN order_items oi

ON o.order_id = oi.order_id

GROUP BY o.customer_id;

-- Running Revenue Total

SELECT

substr(o.order_date,1,7) AS Month,

ROUND(
SUM(oi.quantity*oi.unit_price),2
) AS Revenue,

SUM(
SUM(oi.quantity*oi.unit_price)
) OVER(
ORDER BY substr(o.order_date,1,7)
) AS RunningRevenue

FROM orders o

JOIN order_items oi

ON o.order_id = oi.order_id

GROUP BY Month;

-- Moving Average Revenue

SELECT

substr(o.order_date,1,7) AS Month,

ROUND(
SUM(oi.quantity*oi.unit_price),2
) AS Revenue,

ROUND(

AVG(
SUM(oi.quantity*oi.unit_price)
)

OVER(
ORDER BY substr(o.order_date,1,7)

ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
)

,2)

AS MovingAverage

FROM orders o

JOIN order_items oi

ON o.order_id=oi.order_id

GROUP BY Month;

