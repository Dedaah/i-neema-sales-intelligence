# Solution Architecture

## 1. Architecture Overview

The i-Neema Sales Intelligence solution follows a structured data-to-reporting architecture designed to move sales information from controlled data entry through a central MySQL database into an interactive Power BI reporting environment.

The overall architecture is:

**Data Entry / Staging → MySQL Database → Power BI Desktop → Power BI Service**

An On-premises Data Gateway provides the connection between the local MySQL environment and Power BI Service for scheduled refresh.

The architecture is designed to provide:

- Centralized data storage.
- Controlled data entry.
- Structured data modelling.
- Reusable analytical calculations.
- Interactive reporting.
- Automated refresh.
- Online access for authorized users.

---

## 2. High-Level Architecture

The solution can be represented as follows:

**Data Entry / Staging**

↓  

**MySQL Database**

- `dimcustomer`
- `dimproduct`
- `factsales`

↓

**Power BI Desktop**

- Data Model
- DAX Measures
- Relationships
- Visualizations
- Dashboard Pages

↓

**Power BI Service**

- Semantic Model
- Published Reports
- Scheduled Refresh
- Online Access

**On-premises Data Gateway**

The On-premises Data Gateway provides the connection between Power BI Service and the local MySQL database during scheduled refresh.

---

## 3. Architecture Components

### 3.1 Data Entry and Staging Layer

The data-entry and staging layer is responsible for collecting and preparing business information before it enters the central database.

The current workflow uses spreadsheet-based data entry and staging.

The main data areas include:

- Sales transactions.
- Customer master data.
- Product master data.

The data-entry workflow includes validation controls such as:

- Customer ID selection.
- Product ID selection.
- Entry status.
- Notification status.
- Required sales fields.

This layer is intended to reduce data-entry errors before information reaches the MySQL database.

---

### 3.2 MySQL Database Layer

MySQL acts as the central data storage layer for the sales intelligence solution.

The database is named:

`iNeemaDB`

The core tables are:

- `dimcustomer`
- `dimproduct`
- `factsales`

The database provides a structured and centralized source for sales reporting.

The sales fact table stores individual sales transaction records, while the customer and product tables provide descriptive master information.

---

## 4. Database Relationships

The database follows a simple relational structure.

The relationships are:

**dimcustomer.CustomerID → factsales.CustomerID**

and:

**dimproduct.ProductID → factsales.ProductID**

The relationship structure is:

- One customer can have many sales transactions.
- One product can appear in many sales transactions.
- Each sales transaction references a customer.
- Each sales transaction references a product.

This structure allows Power BI to analyze sales by customer, industry, product, and product category.

---

## 5. Power BI Data Model Layer

Power BI Desktop is used as the analytical modelling environment.

The Power BI model connects to the MySQL database and provides the structure required for reporting and analysis.

The model includes:

- Sales transaction data.
- Customer information.
- Product information.
- Date dimension.
- Relationships between tables.
- DAX measures.

The date dimension supports time-based analysis such as:

- Monthly sales.
- Quarterly sales.
- Year-to-date sales.
- Previous-year comparisons.
- Growth calculations.
- Forecast analysis.

---

## 6. DAX Analytical Layer

DAX is used to create analytical measures within Power BI.

The measures support calculations such as:

- Total sales.
- Total quantity.
- Customer counts.
- Product counts.
- Average transaction value.
- Sales growth.
- Quantity growth.
- Customer growth.
- Product growth.
- Year-to-date sales.
- Previous-year sales.
- Revenue contribution.
- Customer ranking.
- Product ranking.
- Industry ranking.
- Pareto analysis.
- Forecast-related calculations.

The DAX measure library is documented separately in:

`power-bi/measures/sales-intelligence-measures.dax`

---

## 7. Power BI Reporting Layer

The Power BI reporting layer presents the analytical results through interactive dashboard pages.

The dashboard includes areas for:

- Executive overview.
- Sales overview.
- Sales performance.
- Product analysis.
- Forecast analysis.

The reporting environment includes:

- KPI cards.
- Charts.
- Tables.
- Trend analysis.
- Growth indicators.
- Filters.
- Navigation controls.
- Dynamic calculations.

The reporting layer is designed to support both high-level management monitoring and more detailed analysis.

---

## 8. Power BI Service Layer

Power BI Service provides the online reporting environment.

The Power BI solution is published to Power BI Service so that authorized users can access the dashboard without requiring the Power BI Desktop application.

The Power BI Service environment contains the published semantic model and reports.

The service also provides:

- Online dashboard access.
- Semantic model management.
- Scheduled refresh.
- Refresh history.
- Gateway connectivity.
- Report sharing and access control.

---

## 9. On-premises Data Gateway

The On-premises Data Gateway provides the connection between Power BI Service and the local MySQL environment.

The gateway has been installed and registered as:

`i-Neema-PowerBI-Gateway`

The gateway is responsible for allowing Power BI Service to communicate with the local MySQL database during scheduled refresh operations.

The configured data source uses the local MySQL environment and the `iNeemaDB` database.

The gateway is currently online and established as part of the reporting workflow.

---

## 10. Scheduled Refresh Architecture

The Power BI semantic model is configured to refresh automatically through the gateway.

The current refresh schedule is:

**Daily at 4:00 PM**

The refresh process follows this sequence:

1. Power BI Service initiates the scheduled refresh.
2. Power BI Service communicates with the On-premises Data Gateway.
3. The gateway connects to the local MySQL server.
4. The gateway retrieves updated data from `iNeemaDB`.
5. The Power BI semantic model is refreshed.
6. Updated data becomes available in the published report.

This process allows new sales information entered into the database to become available in the Power BI reporting environment without rebuilding the report.

---

## 11. Data Flow

The end-to-end data flow is:

### Step 1 — Data Entry

New sales, customer, or product information is entered through the controlled spreadsheet workflow.

### Step 2 — Data Validation

Customer IDs, product IDs, statuses, and other required fields are validated.

### Step 3 — Database Entry

Validated information is entered into the MySQL database.

### Step 4 — Power BI Connection

Power BI Desktop connects to the MySQL database and uses the database tables as the reporting source.

### Step 5 — Data Modelling

Relationships, date logic, and analytical measures are applied in the Power BI model.

### Step 6 — Reporting

Power BI visuals use the model and DAX measures to produce the dashboard.

### Step 7 — Publishing

The Power BI report and semantic model are published to Power BI Service.

### Step 8 — Scheduled Refresh

The On-premises Data Gateway allows Power BI Service to retrieve updated information from MySQL during scheduled refresh.

---

## 12. Security Architecture

The solution is designed with controlled access in mind.

Security considerations include:

- Restricting access to the MySQL database.
- Protecting database credentials.
- Restricting Power BI report access to authorized users.
- Protecting customer and sales information.
- Keeping the On-premises Data Gateway within the controlled environment.
- Avoiding publication of sensitive sales information through unrestricted public links.

Future development may introduce more granular role-based access depending on organizational requirements.

---

## 13. Reliability and Monitoring

The architecture includes several areas that require ongoing monitoring.

These include:

- MySQL database availability.
- Gateway status.
- Power BI Service connectivity.
- Scheduled refresh execution.
- Refresh history.
- Data accuracy.
- Data-entry quality.

The Power BI Service refresh history is used to monitor whether scheduled refresh operations complete successfully.

Manual refreshes may also be performed when troubleshooting or validating newly entered information.

---

## 14. Design Principles

The solution architecture follows several principles.

### Centralized Data

MySQL serves as the central structured source for sales reporting.

### Separation of Data and Reporting

Business data is stored in MySQL while reporting and visualization are handled by Power BI.

### Controlled Master Data

Customers and products are maintained as separate master tables rather than repeatedly storing descriptive information in every sales transaction.

### Reusable Analytics

DAX measures are created so calculations can be reused across multiple dashboard visuals.

### Automated Refresh

The gateway and scheduled refresh reduce the need for repeated manual report updates.

### Incremental Development

The architecture can be expanded as additional business requirements emerge.

---

## 15. Current Architecture Status

The major components of the architecture have been implemented.

| Component | Status |
|---|---|
| Data-entry workflow | Implemented |
| Customer master data | Implemented |
| Product master data | Implemented |
| MySQL database | Implemented |
| Power BI data model | Implemented |
| DAX analytical measures | Implemented |
| Power BI dashboard | Implemented |
| Forecast analysis | Implemented |
| On-premises Data Gateway | Implemented |
| MySQL to Power BI Service connection | Implemented |
| Scheduled refresh | Implemented |
| Notification automation | Implemented |
| Final dashboard visual refinement | In progress |

---

## 16. Future Architecture Considerations

The current architecture provides a practical foundation for the organization's sales intelligence requirements.

As the solution grows, possible future improvements may include:

- Dedicated production database infrastructure.
- More formal data-entry applications.
- Expanded role-based access control.
- Additional business data sources.
- Inventory integration.
- Marketing data integration.
- Lead and opportunity management.
- More advanced forecasting.
- Automated data-quality monitoring.
- Centralized cloud infrastructure where appropriate.
- Additional management dashboards.

These improvements should be evaluated based on business requirements, cost, security, maintainability, and organizational capacity.

---

## 17. Architecture Documentation

The detailed technical components of the architecture are documented in the following repository files:

- `documentation/04-data-architecture.md`
- `documentation/05-data-entry-workflow.md`
- `documentation/06-sql-database.md`
- `documentation/07-power-bi-dashboard.md`
- `documentation/08-forecasting.md`
- `documentation/09-deployment-and-refresh.md`
- `sql/schema/iNeemaDB_schema.sql`
- `power-bi/measures/sales-intelligence-measures.dax`

Together, these documents provide a technical record of how the i-Neema Sales Intelligence solution is structured, implemented, maintained, and deployed.