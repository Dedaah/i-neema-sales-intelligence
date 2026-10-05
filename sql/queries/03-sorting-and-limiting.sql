-- i-Neema Sales Intelligence
-- Sorting and Limiting Queries
-- Database: iNeemaDB
-- Purpose: Sort sales records and limit the number of returned rows

USE iNeemaDB;

-- 1. Sort sales from highest to lowest sales amount
SELECT *
FROM FactSales
ORDER BY SALESAMOUNT DESC;

-- 2. Sort sales from lowest to highest sales amount
SELECT *
FROM FactSales
ORDER BY SALESAMOUNT ASC;

-- 3. View the highest-value sales records first
SELECT *
FROM FactSales
ORDER BY SALESAMOUNT DESC
LIMIT 10;

-- 4. View the lowest-value sales records first
SELECT *
FROM FactSales
ORDER BY SALESAMOUNT ASC
LIMIT 10;

-- 5. Sort sales by date from newest to oldest
SELECT *
FROM FactSales
ORDER BY SalesDate DESC
LIMIT 10;

-- 6. Sort sales by customer and then by sales amount
SELECT *
FROM FactSales
ORDER BY CustomerID ASC,
         SALESAMOUNT DESC;