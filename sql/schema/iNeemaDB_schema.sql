-- ============================================================
-- i-Neema Sales Intelligence
-- MySQL Database Schema
-- ============================================================
--
-- Database: iNeemaDB
-- Purpose: Sales intelligence and reporting
--
-- This script documents the database structure used by the
-- Power BI Sales Intelligence Dashboard.
--
-- No production/customer data is included in this file.
-- ============================================================


-- ------------------------------------------------------------
-- Table: dimcustomer
-- Purpose: Customer master/dimension table
-- ------------------------------------------------------------

CREATE TABLE `dimcustomer` (
    `CustomerID` varchar(10) NOT NULL,
    `CustomerName` varchar(150) NOT NULL,
    `Industry` varchar(100) NOT NULL,
    PRIMARY KEY (`CustomerID`)
) ENGINE=InnoDB
  DEFAULT CHARSET=utf8mb4
  COLLATE=utf8mb4_0900_ai_ci;


-- ------------------------------------------------------------
-- Table: dimproduct
-- Purpose: Product master/dimension table
-- ------------------------------------------------------------

CREATE TABLE `dimproduct` (
    `ProductID` varchar(50) NOT NULL,
    `ProductCategory` varchar(100) NOT NULL,
    PRIMARY KEY (`ProductID`)
) ENGINE=InnoDB
  DEFAULT CHARSET=utf8mb4
  COLLATE=utf8mb4_0900_ai_ci;


-- ------------------------------------------------------------
-- Table: factsales
-- Purpose: Sales transaction/fact table
-- ------------------------------------------------------------

CREATE TABLE `factsales` (
    `SalesID` int NOT NULL AUTO_INCREMENT,
    `SalesDate` date NOT NULL,
    `CustomerID` varchar(10) NOT NULL,
    `ProductID` varchar(50) NOT NULL,
    `Quantity` int NOT NULL,
    `SALESAMOUNT` decimal(12,2) NOT NULL,

    PRIMARY KEY (`SalesID`),

    KEY `CustomerID` (`CustomerID`),
    KEY `ProductID` (`ProductID`),

    CONSTRAINT `factsales_ibfk_1`
        FOREIGN KEY (`CustomerID`)
        REFERENCES `dimcustomer` (`CustomerID`),

    CONSTRAINT `factsales_ibfk_2`
        FOREIGN KEY (`ProductID`)
        REFERENCES `dimproduct` (`ProductID`)
) ENGINE=InnoDB
  AUTO_INCREMENT=683
  DEFAULT CHARSET=utf8mb4
  COLLATE=utf8mb4_0900_ai_ci;


-- ============================================================
-- Data Model Relationships
-- ============================================================
--
-- dimcustomer.CustomerID
--          1
--          |
--          |
--          *
-- factsales.CustomerID
--
-- dimproduct.ProductID
--          1
--          |
--          |
--          *
-- factsales.ProductID
--
-- ============================================================