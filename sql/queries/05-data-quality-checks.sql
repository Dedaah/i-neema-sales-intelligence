-- i-Neema Sales Intelligence
-- Data Quality Checks
-- Database: iNeemaDB
-- Purpose: Identify missing values and basic data-quality issues

USE iNeemaDB;

-- 1. Check for sales records with missing CustomerID
-- Result observed during project analysis: 0 rows
SELECT *
FROM FactSales
WHERE CustomerID IS NULL;

-- 2. Check for sales records with missing ProductID
SELECT *
FROM FactSales
WHERE ProductID IS NULL;

-- 3. Check for sales records with missing SalesAmount
-- Result observed during project analysis: 191 rows had non-null SalesAmount
SELECT *
FROM FactSales
WHERE SALESAMOUNT IS NULL;

-- 4. Count sales records with missing CustomerID
SELECT COUNT(*) AS MissingCustomerID
FROM FactSales
WHERE CustomerID IS NULL;

-- 5. Count sales records with missing ProductID
SELECT COUNT(*) AS MissingProductID
FROM FactSales
WHERE ProductID IS NULL;

-- 6. Count sales records with missing SalesAmount
SELECT COUNT(*) AS MissingSalesAmount
FROM FactSales
WHERE SALESAMOUNT IS NULL;

-- 7. Check for zero or negative sales amounts
SELECT *
FROM FactSales
WHERE SALESAMOUNT <= 0;

-- 8. Check for zero or negative quantities
SELECT *
FROM FactSales
WHERE Quantity <= 0;