-- i-Neema Sales Intelligence
-- Filtering Queries
-- Database: iNeemaDB
-- Purpose: Filter sales records using WHERE, AND, OR, BETWEEN and comparison operators

USE iNeemaDB;

-- 1. Sales for customer C02
SELECT *
FROM FactSales
WHERE CustomerID = 'C02';

-- 2. Sales for customer C02 where sales amount is greater than 100,000
-- Result observed during project analysis: 21 rows
SELECT *
FROM FactSales
WHERE CustomerID = 'C02'
  AND SALESAMOUNT > 100000;

-- 3. Sales amounts between 50,000 and 100,000
-- Result observed during project analysis: 40 rows
SELECT *
FROM FactSales
WHERE SALESAMOUNT BETWEEN 50000 AND 100000;

-- 4. Sales records meeting either of two conditions
SELECT *
FROM FactSales
WHERE CustomerID = 'C02'
   OR CustomerID = 'C01';

-- 5. Sales records where quantity is greater than 10
SELECT *
FROM FactSales
WHERE Quantity > 10;

-- 6. Sales records where sales amount is less than 50,000
SELECT *
FROM FactSales
WHERE SALESAMOUNT < 50000;