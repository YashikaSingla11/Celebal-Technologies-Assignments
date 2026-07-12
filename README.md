# E-Commerce Analytics System

## Project Overview

This project is an end-to-end E-Commerce Order Analytics System developed using **Python, Pandas, SQLite, and SQL**. It generates realistic e-commerce datasets, cleans and validates the data, stores it in a SQL database, performs business analytics using SQL queries, and provides reports through a Python Command Line Interface (CLI).

---

## Objectives

- Generate realistic e-commerce datasets
- Clean and validate data using Pandas
- Load cleaned data into SQLite
- Perform SQL analytics using Joins, Aggregations, Window Functions, and CTEs
- Analyze customer retention and segmentation
- Build a CLI reporting tool
- Handle edge cases and invalid inputs

---

## Technologies Used

- Python
- Pandas
- Faker
- NumPy
- SQLite
- SQL
- argparse

---

## Project Structure

```
ecommerce-analytics-system/
│
├── data/
│   ├── raw/
│   └── cleaned/
│
├── notebooks/
│   ├── Project.ipynb
│   ├── 02_clean_data.ipynb
│   ├── 03_SQL_Database.ipynb
│   └── 04_SQL_Analysis.ipynb
│
├── scripts/
│   └── report_cli.py
│
├── sql/
│   ├── schema.sql
│   ├── aggregations.sql
│   ├── window_functions.sql
│   └── cohort_analysis.sql
│
├── output/
│   └── sample_reports/
│
├── ecommerce.db
├── requirements.txt
└── README.md
```

---

## 📊 Project Workflow

### Step 1
Generate realistic datasets using Faker.

### Step 2
Clean data using Pandas.

### Step 3
Load cleaned data into SQLite.

### Step 4
Perform SQL analytics using Joins and Aggregations.

### Step 5
Use Window Functions and CTEs.

### Step 6
Perform Cohort Analysis.

### Step 7
Customer Segmentation using RFM concepts.

### Step 8
Generate reports using CLI.

---

## Reports

The project generates:

- Total Revenue
- Revenue by Customer
- Revenue by Category
- Monthly Revenue
- Top Products
- Top Customers
- Average Order Value
- Customer Ranking
- Running Revenue
- Moving Average Revenue
- Cohort Analysis
- Customer Segmentation

---

##  Run the Project

### Install Libraries

```bash
pip install -r requirements.txt
```

### Run CLI

```bash
cd scripts
```

Revenue Report

```bash
python report_cli.py --report revenue
```

Top Customers

```bash
python report_cli.py --report top_customers
```

Top Products

```bash
python report_cli.py --report top_products
```

Monthly Revenue

```bash
python report_cli.py --report monthly_revenue
```

---

## Sample Output

Store screenshots inside:

```
output/sample_reports/
```

---


##  Future Improvements

- Interactive Dashboard using Power BI
- Streamlit Web App
- MySQL/PostgreSQL Support
- Data Visualization
- Automated ETL Pipeline