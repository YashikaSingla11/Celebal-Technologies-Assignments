import sqlite3
import argparse
import pandas as pd

conn = sqlite3.connect("../ecommerce.db")

parser = argparse.ArgumentParser()
parser.add_argument("--report", required=True)

args = parser.parse_args()

if args.report == "revenue":

    query = """
    SELECT
    SUM(quantity*unit_price*(1-discount_percent/100.0)) AS Total_Revenue
    FROM order_items;
    """

elif args.report == "top_customers":

    query = """
    SELECT
    o.customer_id,
    SUM(oi.quantity*oi.unit_price*(1-oi.discount_percent/100.0)) AS Revenue

    FROM orders o

    JOIN order_items oi
    ON o.order_id=oi.order_id

    GROUP BY o.customer_id

    ORDER BY Revenue DESC

    LIMIT 10;
    """

elif args.report == "top_products":

    query = """
    SELECT
    product_id,
    SUM(quantity) AS TotalQuantity

    FROM order_items

    GROUP BY product_id

    ORDER BY TotalQuantity DESC

    LIMIT 10;
    """

else:
    print("Invalid Report Name")
    exit()

df = pd.read_sql(query, conn)
print(df)

conn.close()