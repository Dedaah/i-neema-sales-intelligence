-- i-Neema Sales Intelligence
-- Basic SELECT Queries
-- Database: iNeemaDB
-- Purpose: Basic retrieval of sales data

USE iNeemaDB;

-- 1. View all sales records
SELECT *
FROM FactSales;

-- 2. View selected columns from the sales table
SELECT
    SalesDate,
    CustomerID,
    ProductID,
    Quantity,
    SALESAMOUNT
FROM FactSales;

-- 3. View customer records
SELECT *
FROM DimCustomer;

-- 4. View product records
SELECT *
FROM DimProduct;

-- 5. View unique customer IDs appearing in sales
SELECT DISTINCT CustomerID
FROM FactSales;

-- 6. View unique product IDs appearing in sales
SELECT DISTINCT ProductID
FROM FactSales;