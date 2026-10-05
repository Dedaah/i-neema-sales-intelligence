# Data Architecture

## 1. Data Architecture Overview

The i-Neema Sales Intelligence solution uses a structured relational data architecture to support consistent sales reporting and analysis.

The architecture separates transactional sales data from customer and product master data.

The core data flow is:

**Data Entry / Staging → MySQL → Power BI Data Model → Power BI Reports**

MySQL acts as the central structured data store, while Power BI provides the analytical and reporting layer.

---

## 2. Data Sources

The current solution uses spreadsheet-based data entry and staging as the initial source of business information.

The main data areas are:

- Customer master data.
- Product master data.
- Sales transaction data.

The spreadsheet workflow provides a controlled environment for entering and preparing new information before it is added to the MySQL database.

The MySQL database then serves as the central reporting source for Power BI.

---

## 3. Data Storage Architecture

The central database is:

`iNeemaDB`

The database contains three core tables:

| Table | Type | Purpose |
|---|---|---|
| `dimcustomer` | Dimension | Stores customer master information |
| `dimproduct` | Dimension | Stores product master information |
| `factsales` | Fact | Stores sales transaction information |

This structure separates descriptive information from transactional information.

---

## 4. Dimension Tables

Dimension tables provide descriptive information that can be used to categorize and analyze sales transactions.

The current solution contains two main dimension tables:

- `dimcustomer`
- `dimproduct`

---

## 5. Customer Dimension

The customer dimension table is:

`dimcustomer`

Its purpose is to maintain a controlled list of customers.

The table contains:

| Column | Description |
|---|---|
| `CustomerID` | Unique identifier for each customer |
| `CustomerName` | Customer's name |
| `Industry` | Industry associated with the customer |

`CustomerID` is the primary key of the table.

The customer dimension allows sales to be analyzed by:

- Customer.
- Industry.
- Customer ranking.
- Customer revenue contribution.
- Customer performance.

---

## 6. Product Dimension

The product dimension table is:

`dimproduct`

Its purpose is to maintain the controlled product master list.

The table contains:

| Column | Description |
|---|---|
| `ProductID` | Unique identifier for each product |
| `ProductCategory` | Product category associated with the product |

`ProductID` is the primary key of the table.

The product dimension allows sales to be analyzed by:

- Product.
- Product category.
- Product ranking.
- Product revenue contribution.
- Product category performance.

---

## 7. Sales Fact Table

The central transaction table is:

`factsales`

The table stores individual sales transaction records.

Its current structure includes:

| Column | Description |
|---|---|
| `SalesID` | Unique identifier for each sales record |
| `SalesDate` | Date of the sales transaction |
| `CustomerID` | Customer associated with the transaction |
| `ProductID` | Product associated with the transaction |
| `Quantity` | Quantity sold |
| `SALESAMOUNT` | Monetary value of the transaction |

`SalesID` is the primary key of the fact table.

`CustomerID` and `ProductID` are foreign keys linking the sales table to the relevant dimension tables.

---

## 8. Sales Transaction Grain

The grain of the `factsales` table is:

**One row represents one sales transaction line item.**

This means that each row records the sale of a particular product to a particular customer on a particular date.

For example, if an invoice contains three different products, those products can be represented as three separate sales transaction rows.

This transaction-level structure allows the database to support detailed analysis of:

- Sales value.
- Quantity.
- Customer.
- Product.
- Product category.
- Date.
- Industry.

---

## 9. Primary Keys

Primary keys uniquely identify records within their respective tables.

The current primary keys are:

| Table | Primary Key |
|---|---|
| `dimcustomer` | `CustomerID` |
| `dimproduct` | `ProductID` |
| `factsales` | `SalesID` |

The use of primary keys helps prevent duplicate records and provides the foundation for relationships between the tables.

---

## 10. Foreign Keys

The `factsales` table contains two foreign keys.

### Customer Relationship

`factsales.CustomerID`

references:

`dimcustomer.CustomerID`

### Product Relationship

`factsales.ProductID`

references:

`dimproduct.ProductID`

These relationships ensure that sales transactions are associated with valid customers and products.

---

## 11. Data Model Relationships

The relational structure can be summarized as:

**dimcustomer**

`CustomerID`

**1 → many**

**factsales**

`CustomerID`

and:

**dimproduct**

`ProductID`

**1 → many**

**factsales**

`ProductID`

This creates a simple dimensional model in which the sales fact table sits at the center of the reporting structure.

---

## 12. Power BI Data Model

The MySQL tables are imported or connected into Power BI to create the analytical data model.

The Power BI model includes:

- `dimcustomer`
- `dimproduct`
- `factsales`
- `DimDate`

The dimension tables provide filtering and grouping context, while the fact table provides the underlying sales values and quantities.

The date dimension supports time-based analysis and DAX calculations.

---

## 13. Date Dimension

A dedicated date dimension named:

`DimDate`

is used within Power BI.

The date dimension supports calculations and analysis based on:

- Year.
- Quarter.
- Month.
- Date.
- Year-to-date performance.
- Previous-year comparisons.
- Period growth.

The date dimension is related to the sales transaction date.

The date dimension is important because it provides a consistent time structure for DAX calculations across the dashboard.

---

## 14. Data Flow into Power BI

The data flow from the database into Power BI follows this process:

1. Sales information is entered or prepared through the staging workflow.
2. Validated information is stored in MySQL.
3. Power BI connects to the MySQL database.
4. The relevant database tables are loaded into the Power BI model.
5. Relationships are established between the tables.
6. The `DimDate` table provides the time intelligence structure.
7. DAX measures calculate business metrics.
8. Dashboard visuals use the model and measures to display analytical results.

---

## 15. Data Quality Architecture

Data quality is supported through separation of master data and transaction data.

Customer and product master tables provide controlled reference values for sales transactions.

The data-entry workflow also uses validation controls such as:

- Customer ID dropdowns.
- Product ID dropdowns.
- Entry status.
- Notification status.
- Required fields.

The MySQL database further enforces structural rules through:

- Primary keys.
- Foreign keys.
- Required fields.
- Data types.
- Referential integrity.

These controls reduce the likelihood of invalid relationships and inconsistent master data.

---

## 16. Data Validation

Data validation is performed at multiple stages.

### Staging Validation

The spreadsheet workflow provides initial validation before information enters the database.

### Database Validation

MySQL enforces structural rules such as:

- Primary key uniqueness.
- Foreign key relationships.
- Required fields.
- Appropriate data types.

### Power BI Validation

Power BI calculations and visual outputs are reviewed to confirm that the model produces expected analytical results.

The testing process is documented separately in:

`documentation/10-testing-and-validation.md`

---

## 17. Data Transformation

The data architecture is designed to keep major transactional information centralized in MySQL while allowing Power BI to perform analytical transformations and calculations.

Examples of Power BI calculations include:

- Total sales.
- Total quantity.
- Customer counts.
- Product counts.
- Growth percentages.
- Year-to-date sales.
- Previous-year sales.
- Revenue contribution.
- Rankings.
- Pareto analysis.
- Forecast analysis.

DAX is therefore used primarily for analytical calculations rather than storing calculated results back into the source database.

---

## 18. Data Security Considerations

The data architecture contains business and customer information that should be protected.

Security considerations include:

- Restricting access to the MySQL database.
- Protecting database credentials.
- Limiting access to the Power BI semantic model.
- Restricting published report access to authorized users.
- Avoiding unnecessary exposure of raw customer and sales information.
- Protecting the On-premises Data Gateway environment.

Security requirements may be expanded as the reporting environment grows.

---

## 19. Current Data Architecture Status

The major components of the data architecture have been implemented.

| Component | Status |
|---|---|
| Customer master table | Implemented |
| Product master table | Implemented |
| Sales fact table | Implemented |
| Primary keys | Implemented |
| Foreign keys | Implemented |
| Customer-sales relationship | Implemented |
| Product-sales relationship | Implemented |
| Power BI data model | Implemented |
| Date dimension | Implemented |
| DAX analytical measures | Implemented |
| Data-entry validation | Implemented |
| Database schema documentation | Implemented |

---

## 20. Current Data Architecture Limitations

The current architecture has been designed to meet the immediate sales intelligence requirements, but several limitations remain.

These include:

- The data-entry process still relies on spreadsheet-based workflows.
- Additional business domains are not yet fully integrated.
- Inventory data is not currently part of the core sales model.
- Marketing data is maintained separately from the sales database.
- Lead and opportunity information is not yet part of the current sales model.
- More advanced role-based data access may be required as the number of users increases.
- Additional data-quality automation may be required as data volume grows.

These limitations provide opportunities for future development.

---

## 21. Future Data Architecture Improvements

Future improvements may include:

- Integration of inventory data.
- Integration of marketing data.
- Integration of lead and opportunity data.
- More formalized master data management.
- Automated data-quality checks.
- Additional dimensions such as sales representative or territory where required.
- More advanced historical tracking.
- Cloud-based database infrastructure where appropriate.
- Automated data pipelines.
- Expanded analytical models.

Any future changes should be evaluated based on business requirements, cost, security, maintainability, and scalability.

---

## 22. Related Documentation

The data architecture is supported by the following project documentation:

- `documentation/03-solution-architecture.md`
- `documentation/05-data-entry-workflow.md`
- `documentation/06-sql-database.md`
- `documentation/07-power-bi-dashboard.md`
- `documentation/08-forecasting.md`
- `documentation/10-testing-and-validation.md`
- `sql/schema/iNeemaDB_schema.sql`
- `power-bi/measures/sales-intelligence-measures.dax`

Together, these documents provide a complete record of the structure, relationships, processing, and analytical use of the project's data.