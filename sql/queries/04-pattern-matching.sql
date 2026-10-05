-- i-Neema Sales Intelligence
-- Pattern Matching Queries
-- Database: iNeemaDB
-- Purpose: Search sales records using the LIKE operator

USE iNeemaDB;

-- 1. Find products whose ProductID starts with "BB"
-- Result observed during project analysis: 47 rows
SELECT *
FROM FactSales
WHERE ProductID LIKE 'BB%';

-- 2. Find products containing "Battery" in the ProductID
-- Result observed during project analysis: 1 row
SELECT *
FROM FactSales
WHERE ProductID LIKE '%Battery%';

-- 3. Find products whose ProductID ends with "23mm"
-- Result observed during project analysis: 25 rows
SELECT *
FROM FactSales
WHERE ProductID LIKE '%23mm';

-- 4. Find products whose ProductID starts with "BZ"
SELECT *
FROM FactSales
WHERE ProductID LIKE 'BZ%';

-- 5. Find products whose ProductID contains "Pneumatic"
SELECT *
FROM FactSales
WHERE ProductID LIKE '%Pneumatic%';