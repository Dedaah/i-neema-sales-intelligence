# SQL Database

## 1. Database Overview

The i-Neema Sales Intelligence solution uses MySQL as its central relational database.

The database is named:

`iNeemaDB`

The database provides the structured data foundation for the Power BI Sales Intelligence Dashboard.

It stores:

- Customer master data.
- Product master data.
- Sales transaction data.

The database is designed to provide a centralized and consistent source of sales information for reporting and analysis.

---

## 2. Database Technology

| Component | Technology |
|---|---|
| Database Management System | MySQL |
| Database | `iNeemaDB` |
| Development Tool | MySQL Workbench |
| Primary Reporting Tool | Microsoft Power BI |
| Database Role | Central sales data source |

The database was developed and maintained using MySQL Workbench.

---

## 3. Database Structure

The current database contains three core tables:

| Table | Type | Purpose |
|---|---|---|
| `dimcustomer` | Dimension | Customer master data |
| `dimproduct` | Dimension | Product master data |
| `factsales` | Fact | Sales transaction data |

The structure follows a simple dimensional design in which the sales fact table connects to customer and product dimensions.

---

## 4. Customer Table

### Table Name

`dimcustomer`

### Purpose

The `dimcustomer` table stores the master list of customers.

It provides the customer information used to identify and analyze sales transactions.

### Structure

| Column | Data Type | Key | Description |
|---|---|---|---|
| `CustomerID` | `VARCHAR(10)` | Primary Key | Unique customer identifier |
| `CustomerName` | `VARCHAR(150)` | — | Customer name |
| `Industry` | `VARCHAR(100)` | — | Customer industry |

All three fields are required.

`CustomerID` uniquely identifies each customer.

---

## 5. Product Table

### Table Name

`dimproduct`

### Purpose

The `dimproduct` table stores the master list of products used in sales transactions.

### Structure

| Column | Data Type | Key | Description |
|---|---|---|---|
| `ProductID` | `VARCHAR(50)` | Primary Key | Unique product identifier |
| `ProductCategory` | `VARCHAR(100)` | — | Product category |

Both fields are required.

`ProductID` uniquely identifies each product.

The product identifier is used directly in the sales transaction table.

---

## 6. Sales Fact Table

### Table Name

`factsales`

### Purpose

The `factsales` table stores the individual sales transaction records used by the reporting system.

### Structure

| Column | Data Type | Key | Description |
|---|---|---|---|
| `SalesID` | `INT` | Primary Key | Unique sales transaction identifier |
| `SalesDate` | `DATE` | — | Date of the transaction |
| `CustomerID` | `VARCHAR(10)` | Foreign Key | Customer associated with the transaction |
| `ProductID` | `VARCHAR(50)` | Foreign Key | Product associated with the transaction |
| `Quantity` | `INT` | — | Quantity sold |
| `SALESAMOUNT` | `DECIMAL(12,2)` | — | Monetary value of the transaction |

`SalesID` uses `AUTO_INCREMENT` so that each new transaction receives a unique identifier.

---

## 7. Sales Transaction Grain

The grain of the `factsales` table is:

**One row represents one sales transaction line item.**

This design allows multiple products from the same invoice or business transaction to be represented as separate rows.

For example, if a customer purchases three different products, the transaction can be represented by three separate sales fact rows.

This structure supports detailed analysis by:

- Date.
- Customer.
- Industry.
- Product.
- Product category.
- Quantity.
- Sales value.

---

## 8. Primary Keys

Primary keys are used to uniquely identify records within each table.

The current primary keys are:

| Table | Primary Key |
|---|---|
| `dimcustomer` | `CustomerID` |
| `dimproduct` | `ProductID` |
| `factsales` | `SalesID` |

Primary keys help prevent duplicate identifiers and provide the foundation for table relationships.

---

## 9. Foreign Keys

The `factsales` table contains two foreign key relationships.

### Customer Foreign Key

`factsales.CustomerID`

references:

`dimcustomer.CustomerID`

### Product Foreign Key

`factsales.ProductID`

references:

`dimproduct.ProductID`

These relationships help ensure that sales transactions reference valid customers and products.

---

## 10. Database Relationships

The database relationships are:

**dimcustomer.CustomerID**

1 → many

**factsales.CustomerID**

and:

**dimproduct.ProductID**

1 → many

**factsales.ProductID**

This means:

- One customer can have many sales transactions.
- One product can appear in many sales transactions.
- Each sales transaction is associated with one customer.
- Each sales transaction is associated with one product.

---

## 11. Referential Integrity

Foreign key constraints are used to maintain referential integrity.

The customer relationship uses:

`factsales_ibfk_1`

The product relationship uses:

`factsales_ibfk_2`

These constraints prevent sales transactions from referencing customer or product records that do not exist in the corresponding master tables.

This provides an important database-level data-quality control.

---

## 12. Sales Amount Data Type

The `SALESAMOUNT` column uses:

`DECIMAL(12,2)`

This allows sales values to be stored with two decimal places.

Using a fixed decimal data type is appropriate for monetary values because it avoids the potential precision issues associated with floating-point data types.

---

## 13. Sales Date Data Type

The `SalesDate` column uses:

`DATE`

This stores the calendar date associated with each transaction.

The date field is used by Power BI for:

- Monthly analysis.
- Quarterly analysis.
- Year-to-date calculations.
- Previous-year comparisons.
- Growth analysis.
- Forecasting.

---

## 14. Quantity Data Type

The `Quantity` column uses:

`INT`

This is appropriate for the current transaction structure because quantities are recorded as whole-number units.

The field is required and does not allow `NULL` values.

---

## 15. Data Loading Approach

The project uses CSV-based data loading to move structured spreadsheet data into MySQL.

The main datasets are prepared separately for:

- Customers.
- Products.
- Sales transactions.

The data can then be loaded into the corresponding MySQL tables.

The project uses MySQL's `LOAD DATA LOCAL INFILE` approach for efficient CSV loading.

This approach was selected because it provides a repeatable method for loading structured data into the database.

---

## 16. Database Development Process

The database was developed incrementally.

The development process included:

1. Creating the `iNeemaDB` database.
2. Creating the customer dimension.
3. Creating the product dimension.
4. Creating the sales fact table.
5. Defining primary keys.
6. Defining foreign keys.
7. Loading customer data.
8. Loading product data.
9. Loading sales transaction data.
10. Validating imported records.
11. Correcting data-quality issues.
12. Connecting the database to Power BI.

---

## 17. Data Cleaning and Database Maintenance

Database development required several data-quality corrections during implementation.

Examples included:

- Correcting product identifiers.
- Resolving duplicate product records.
- Adjusting column lengths where product identifiers exceeded the original field size.
- Correcting product assignments in sales transactions.
- Standardizing product records.
- Correcting sales-date formats.
- Validating customer and product relationships.
- Removing or correcting invalid records where necessary.

These activities were necessary to maintain the integrity of the reporting database.

---

## 18. Product Master Data Management

Product master data is maintained separately from sales transactions.

This allows product information to be corrected or updated without duplicating product descriptions throughout the sales table.

The product table currently stores:

- `ProductID`
- `ProductCategory`

The design intentionally avoids adding unnecessary product-name lookup structures because the existing product identifiers are sufficiently meaningful for the current reporting requirements.

---

## 19. Customer Master Data Management

Customer information is also maintained separately from sales transactions.

The customer table stores:

- `CustomerID`
- `CustomerName`
- `Industry`

This prevents customer descriptive information from being repeatedly stored in every sales transaction.

It also allows customer information to be maintained centrally.

---

## 20. SQL Operations Used During Development

Several SQL operations were used during development and data validation.

These included:

- `CREATE DATABASE`
- `CREATE TABLE`
- `ALTER TABLE`
- `INSERT`
- `UPDATE`
- `DELETE`
- `SELECT`
- `WHERE`
- `AND`
- `OR`
- `DISTINCT`
- `ORDER BY`
- `LIMIT`
- `LIKE`
- `BETWEEN`
- `IS NULL`
- `IS NOT NULL`
- `LOAD DATA LOCAL INFILE`

These operations supported database creation, data loading, cleaning, validation, and analysis.

---

## 21. SQL Data Validation

SQL queries were used to validate the database after data loading and during development.

Validation activities included checking:

- Number of records.
- Duplicate records.
- Missing customer IDs.
- Missing product IDs.
- Missing sales amounts.
- Sales amount ranges.
- Product patterns.
- Customer-specific transactions.
- Date values.
- Imported transaction records.

SQL filtering was also used to investigate specific business questions and confirm that the database returned expected results.

---

## 22. Example Analytical Queries

The database supports analytical queries such as:

### Sales for a Specific Customer

    SELECT *
    FROM factsales
    WHERE CustomerID = 'C02';

### Sales Above a Specific Amount

    SELECT *
    FROM factsales
    WHERE SALESAMOUNT > 100000;

### Products Beginning With a Specific Pattern

    SELECT *
    FROM dimproduct
    WHERE ProductID LIKE 'BB%';

### Transactions Within a Sales Range

    SELECT *
    FROM factsales
    WHERE SALESAMOUNT BETWEEN 50000 AND 100000;

These queries were also used as part of the SQL learning and database validation process.

---

## 23. Database-to-Power BI Connection

The MySQL database serves as the central source for the Power BI reporting environment.

The connection follows:

**MySQL `iNeemaDB` → Power BI Desktop → Power BI Service**

Power BI uses the database tables to build the reporting model.

The database therefore acts as the central source of truth for the sales reporting solution.

---

## 24. Database Refresh and Reporting

New records entered into the MySQL database can become available to Power BI after the semantic model is refreshed.

The production reporting environment uses the On-premises Data Gateway to allow Power BI Service to access the local MySQL database.

The current scheduled refresh is:

**Daily at 4:00 PM**

This allows updated database information to flow into the published Power BI reporting environment.

---

## 25. Current Database Status

The current database implementation includes:

| Component | Status |
|---|---|
| `iNeemaDB` database | Implemented |
| `dimcustomer` | Implemented |
| `dimproduct` | Implemented |
| `factsales` | Implemented |
| Primary keys | Implemented |
| Foreign keys | Implemented |
| Referential integrity | Implemented |
| CSV data loading | Implemented |
| Data validation | Implemented |
| Power BI connection | Implemented |
| Gateway connectivity | Implemented |
| Scheduled refresh | Implemented |

---

## 26. Current Database Limitations

The current database architecture meets the immediate sales reporting requirements but has some limitations.

These include:

- The database currently focuses primarily on sales information.
- Inventory is not yet integrated into the core model.
- Marketing data is not currently stored within the sales database.
- Lead and opportunity information is not currently part of the core schema.
- Additional historical tracking may be required for some master-data changes.
- More advanced audit logging may be introduced in future.
- Database administration is currently relatively manual.

---

## 27. Future Database Improvements

Potential future improvements include:

- Inventory tables.
- Inventory transaction history.
- Lead and opportunity tables.
- Sales representative dimensions.
- Territory or regional dimensions.
- Marketing data integration.
- Audit tables.
- Historical master-data tracking.
- Automated data-quality procedures.
- Stored procedures for recurring database operations.
- More advanced indexing as transaction volume increases.
- Automated data pipelines.

Future database changes should be introduced only where they provide clear business or technical value.

---

## 28. Database Documentation

The complete database schema is documented in:

`sql/schema/iNeemaDB_schema.sql`

The schema file documents:

- Table structures.
- Column definitions.
- Primary keys.
- Foreign keys.
- Database relationships.

This documentation is intended to provide a reproducible technical record of the MySQL database used by the i-Neema Sales Intelligence solution.

---

## 29. Related Documentation

The SQL database is connected to the following project components:

- `documentation/03-solution-architecture.md`
- `documentation/04-data-architecture.md`
- `documentation/05-data-entry-workflow.md`
- `documentation/07-power-bi-dashboard.md`
- `documentation/09-deployment-and-refresh.md`
- `documentation/10-testing-and-validation.md`
- `sql/schema/iNeemaDB_schema.sql`
- `power-bi/measures/sales-intelligence-measures.dax`

Together, these documents describe how the database supports the wider i-Neema Sales Intelligence solution.