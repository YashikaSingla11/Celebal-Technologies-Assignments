## Week 1
# Data Exploration and Cleaning using Pandas

This project demonstrates the basic use of Python Pandas for performing data exploration, cleaning, and preprocessing operations on a shopping dataset.

# Objective

The objective of this assignment is to:

Load a CSV dataset into a Pandas DataFrame
Explore the structure of the dataset
Handle missing values
Perform basic data operations
Remove duplicate records
Create a derived column
Save the cleaned dataset as a new CSV file
Dataset Used

# Dataset Name: Combined_dataset.csv

# The dataset contains shopping-related product information such as:

Product title
Ratings
Prices
Discounts
Seller information
Product specifications
Category details

## Week 2
- E-Commerce Sales Database

# Topics Covered:
- SQL Basics
- Constraints
- WHERE Clause
- GROUP BY
- Aggregation
- JOINs
- CASE Statements
- ACID Properties
- Transactions

# Tools Used:
- MySQL Workbench 8.0 CE

# Dataset Name: Sample-Superstore.csv
  
# Files:-
- Result Set(Week2).pdf
- Week2_SQL_Queries.sql
- Week2_SQL_Script(LMS).sql
- RESULT SET(LMS) SQL-QUERRIES.pdf

##Week 3
# SQL Analysis using Subqueries, CTEs and Window Functions

This project demonstrates advanced SQL concepts by analyzing the Superstore dataset using Subqueries, Common Table Expressions (CTEs), and Window Functions.

# Objective

The objective of this assignment is to:

- Create normalized tables from the Superstore dataset
- Apply Subqueries for advanced filtering and analysis
- Use Common Table Expressions (CTEs) for aggregations
- Implement Window Functions such as ROW_NUMBER() and RANK()
- Identify top-performing customers and sales patterns
- Generate business insights from transactional data

# Dataset Used

Dataset Name: Sample - Superstore.csv

# Topics Covered

- Subqueries
- Correlated Subqueries
- Common Table Expressions (CTEs)
- Window Functions
- ROW_NUMBER()
- RANK()
- Data Aggregation
- Customer Sales Analysis

# Tools Used

- MySQL Workbench 8.0 CE

# Files

- Result Set(Week3).pdf
- Sample - Superstore.csv
- Week-3.sql

# Key Analysis Performed

- Orders with Sales above Average Sales
- Highest Sales Order for Each Customer
- Total Sales per Customer using CTE
- Customers with Above Average Sales
- Customer Ranking based on Total Sales
- Row Number Assignment within Customer Orders
- Top 3 Customers by Sales
- Customer Sales Ranking using CTE and Window Functions

## Week 4
# Azure Cloud Fundamentals and Data Pipeline using Azure Data Factory

This project demonstrates the implementation of an end-to-end data pipeline using Azure Storage Account and Azure Data Factory (ADF).

# Objective

- Explore Azure Portal and create cloud resources
- Configure Azure Storage Account and Blob Container
- Upload and manage CSV files in Blob Storage
- Create and configure Azure Data Factory
- Build and execute data pipelines
- Validate file metadata using Get Metadata activity
- Manage access using IAM roles

# Tools Used

- Microsoft Azure Portal
- Azure Storage Account
- Azure Blob Storage
- Azure Data Factory (ADF)

# Key Tasks Performed

- Created Resource Group
- Created Storage Account and Blob Container
- Uploaded CSV file to Blob Storage
- Configured Linked Service and Datasets
- Implemented Get Metadata Activity
- Developed Pipeline using Copy Data Activity
- Executed and monitored pipeline
- Assigned IAM roles (Reader & Contributor)

# Mini Project

Built a complete pipeline to read a CSV file from Azure Blob Storage, validate metadata, and copy data to a new destination using Azure Data Factory.

# Outcome

- Successful pipeline execution
- Data copied to destination location
- Metadata validation completed
  
## Week 5
Apache Spark Data Processing using DataFrames and Transformations

This project demonstrates the use of Apache Spark DataFrames for performing data processing, transformations, filtering, schema handling, and optimized file operations.

# Objective

The objective of this assignment is to:

- Understand Apache Spark architecture and execution modes
- Learn Lazy Evaluation and DAG optimization
- Read data from CSV and Parquet files
- Apply DataFrame transformations and actions
- Perform filtering and selection operations
- Handle null values and data type conversions
- Rename and modify DataFrame schemas
- Perform wide transformations and shuffle operations
- Optimize data processing using Spark best practices

# Topics Covered
- Spark Architecture
- Driver, Executors and Cluster Manager
- Lazy Evaluation
- DAG (Directed Acyclic Graph)
- DataFrames
- Transformations and Actions
- Filtering and Selection
- Schema Handling
- Null Value Handling
- Wide Transformations
- Shuffle Operations
- CSV and Parquet File Processing

# Tools Used
- Apache Spark
- PySpark
- Google Colab

# Key Tasks Performed
- Loaded CSV and Parquet datasets
- Applied filtering and selection operations
- Modified schemas and renamed columns
- Performed data transformations
- Handled missing values
- Executed wide transformations
- Optimized Spark execution using lazy evaluation
- Stored processed data in optimized formats

# Outcome
Successfully implemented Spark DataFrame transformations and optimized data processing workflows.

## Week 6
Spark Data Aggregation and Performance Optimization

This project demonstrates advanced data processing using Apache Spark by performing data cleaning, transformations, aggregations, grouping operations, and performance optimization.

# Objective
The objective of this assignment is to:
- Understand Spark DataFrame operations
- Perform data cleaning and preprocessing
- Handle null values and duplicate records
- Apply filtering conditions
- Perform aggregations and grouping
- Understand shuffle operations
- Modify schemas and perform data transformations
- Build optimized Spark pipelines

# Topics Covered
- Spark DataFrames
- Data Cleaning
- Duplicate Removal
- Null Value Handling
- Filtering
- Group By Operations
- Aggregations
- Data Transformations
- Wide and Narrow Transformations
- Shuffle Operations
- Schema Modification
- Performance Optimization

# Tools Used
- Apache Spark
- PySpark
- Google Colab

# Key Tasks Performed
Loaded datasets into Spark DataFrames
Removed duplicates and null values
Applied filtering conditions
Performed group by and aggregation operations
Used aggregate functions (count, sum, avg, min, max)
Modified DataFrame schemas
Applied transformations and actions
Built optimized Spark pipelines

# Outcome
Successfully implemented Spark-based data cleaning, transformation, and aggregation workflows.

## Week 7
Delta Lake MERGE Implementation for Incremental Data Processing

This project demonstrates incremental data processing using Delta Lake and MERGE operations for updating and inserting customer records.

# Objective
The objective of this assignment is to:
- Understand Delta Lake architecture and capabilities
- Load customer data into Delta tables
- Perform data cleaning operations
- Create incremental datasets
- Apply Delta Lake MERGE operations
- Update existing records
- Insert new records
- Validate final output datasets

# Topics Covered
- Delta Lake
- Delta Tables
- Incremental Processing
- MERGE Operations
- SCD Type 1
- Data Cleaning
- Duplicate Removal
- Null Value Handling
- Data Validation
- Data Quality Checks

# Tools Used
Databricks
Apache Spark
PySpark
Delta Lake
Dataset Used
customer_master.csv
customer_incremental.csv

# Key Tasks Performed
Created customer master dataset
Removed null values and duplicate records
Created Delta tables
Generated incremental customer dataset
Applied Delta Lake MERGE operation
Updated existing customer records
Inserted new customer records
Performed validation checks
Generated final business-ready dataset

# Outcome
Successfully implemented Delta Lake MERGE operation for incremental data processing using SCD Type 1 methodology.
