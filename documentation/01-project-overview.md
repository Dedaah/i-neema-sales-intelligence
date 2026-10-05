# i-Neema Sales Intelligence Dashboard

## 1. Project Overview

The i-Neema Sales Intelligence Dashboard is a business intelligence project developed to improve the way i-Neema Ghana Limited monitors, analyzes, and communicates sales performance.

The project combines a structured MySQL sales database with Microsoft Power BI to provide an interactive reporting environment for management and decision-making.

The solution was developed with the objective of moving sales reporting away from primarily manual analysis and toward a more structured, centralized, and refreshable reporting process.

---

## 2. Business Context

i-Neema Ghana Limited manages sales information across customers, products, industries, quantities, sales dates, and sales values.

As the volume of sales information increases, manually reviewing and comparing this information becomes more difficult and time-consuming.

The project therefore focuses on creating a centralized sales intelligence solution that can transform structured sales data into meaningful management information.

---

## 3. Project Objectives

The main objectives of the project are to:

- Centralize sales data in a structured relational database.
- Establish consistent customer and product master data.
- Provide interactive sales reporting through Power BI.
- Monitor key sales performance indicators.
- Analyze sales trends across different periods.
- Analyze sales performance by customer, industry, product, and product category.
- Compare current performance with previous periods.
- Provide year-to-date sales performance analysis.
- Provide sales forecasting to support forward-looking analysis.
- Establish automated data refresh and online dashboard access.
- Create a controlled data-entry workflow for future sales updates.

---

## 4. Solution Overview

The current solution follows an Excel/Google Sheets → MySQL → Power BI architecture.

The main flow is:

**Data Entry / Staging → MySQL Database → Power BI Data Model → Interactive Dashboard**

### Data Entry and Staging

Structured sales information is prepared through spreadsheet-based data-entry and staging processes.

Customer and product master data are maintained separately from sales transactions to improve consistency and reduce duplicate information.

### MySQL Database

MySQL is used as the central relational database for the sales data.

The database contains:

- `dimcustomer` — customer master data
- `dimproduct` — product master data
- `factsales` — sales transaction data

Relationships between the dimension tables and sales fact table allow sales information to be analyzed across customers and products.

### Power BI

Microsoft Power BI is used to connect to the database, model the data, create analytical measures, and present the results through interactive dashboards.

The Power BI solution includes:

- Executive dashboard
- Sales overview analysis
- Product and sales performance analysis
- Forecast analysis
- Interactive filters and navigation
- KPI cards
- Trend analysis
- Year-to-date analysis
- Comparative performance analysis

---

## 5. Key Technologies

| Technology | Purpose |
|---|---|
| Microsoft Excel / Google Sheets | Data staging and controlled data entry |
| MySQL 8.0 | Relational sales database |
| MySQL Workbench | Database development and administration |
| Microsoft Power BI | Data modelling, analytics, visualization and reporting |
| DAX | Power BI calculations and analytical measures |
| On-premises Data Gateway | Connection between the local MySQL environment and Power BI Service |
| Git / GitHub | Project version control and portfolio documentation |

---

## 6. Analytical Capabilities

The dashboard is designed to provide management with visibility into several areas of sales performance.

### Sales Performance

- Total sales
- Total quantity sold
- Customer counts
- Product counts
- Average transaction value
- Largest and smallest sales
- Sales growth

### Time-Based Analysis

- Monthly sales
- Quarterly sales
- Year-to-date sales
- Previous-year comparisons
- Sales growth percentages
- Best and weakest sales periods

### Customer and Industry Analysis

- Sales by customer
- Sales by industry
- Customer revenue contribution
- Customer ranking
- Industry ranking
- Pareto analysis

### Product Analysis

- Sales by product
- Product ranking
- Product category performance
- Product revenue contribution
- Product Pareto analysis
- Product category mix

### Forecasting

The project also incorporates Power BI forecasting capabilities to provide an indication of expected future sales based on historical sales patterns.

Forecasting is intended as a supporting analytical tool rather than a replacement for management judgement.

---

## 7. Data Model

The core sales database follows a simple dimensional structure.

                 ┌─────────────────────┐
                 │     dimcustomer     │
                 │─────────────────────│
                 │ CustomerID (PK)     │
                 │ CustomerName        │
                 │ Industry            │
                 └──────────┬──────────┘
                            │
                            │ 1
                            │
                            │ *
                 ┌──────────▼──────────┐
                 │      factsales      │
                 │─────────────────────│
                 │ SalesID (PK)        │
                 │ SalesDate           │
                 │ CustomerID (FK)     │
                 │ ProductID (FK)      │
                 │ Quantity            │
                 │ SalesAmount         │
                 └──────────▲──────────┘
                            │
                            │ *
                            │
                            │ 1
                 ┌──────────┴──────────┐
                 │     dimproduct     │
                 │─────────────────────│
                 │ ProductID (PK)      │
                 │ ProductCategory     │
                 └─────────────────────┘

## 8. Reporting and Refresh Strategy

The Power BI solution has been configured for online reporting using the on-premises data source.

An On-premises Data Gateway has been installed and established as the connection between the local MySQL environment and Power BI Service.

The deployment configuration includes:

- On-premises Data Gateway registered and online.
- MySQL data source connected through the gateway.
- Power BI Service connected to the gateway.
- Scheduled dataset refresh configured in Power BI Service.
- Daily refresh scheduled for **4:00 PM**.

The refresh process allows Power BI Service to retrieve updated sales information from the MySQL database without requiring the dashboard to be manually refreshed each day.

The scheduled refresh configuration will continue to be monitored to confirm reliable refresh execution and data availability in the published dashboard.

---

## 9. Project Development Approach

The project was developed incrementally rather than attempting to build the complete solution at once.

The development process included:

1. Understanding the business reporting requirements.
2. Structuring customer, product, and sales data.
3. Creating the MySQL database.
4. Cleaning and standardizing sales data.
5. Establishing relationships between sales and master data.
6. Connecting Power BI to the database.
7. Developing DAX measures.
8. Building dashboard pages and interactive navigation.
9. Developing comparative and year-to-date analysis.
10. Implementing forecasting analysis.
11. Establishing the On-premises Data Gateway.
12. Connecting MySQL to Power BI Service through the gateway.
13. Configuring the daily scheduled refresh.
14. Developing a controlled data-entry and notification workflow.
15. Documenting the solution for future maintenance and development.

---

## 10. Expected Business Outcome

The completed solution is intended to provide i-Neema management with a more accessible and structured view of sales performance.

The dashboard is designed to help users:

- Monitor sales performance more efficiently.
- Identify changes in sales trends.
- Understand major revenue contributors.
- Compare current and historical performance.
- Identify important customers, industries, and products.
- Support data-informed business discussions.
- Reduce dependence on manually prepared sales reports.
- Establish a foundation for more automated business intelligence reporting.

---

## 11. Project Status

The project is currently in the development and refinement stage.

Major technical components have been developed, including:

- MySQL sales database
- Relational data model
- Power BI data model
- DAX analytical measures
- Executive dashboard
- Sales analysis pages
- Forecast analysis
- Interactive navigation and filtering
- Data-entry workflow
- Email notification automation
- On-premises Data Gateway
- MySQL-to-Power BI Service connectivity
- Daily scheduled refresh configuration

The dashboard design is still undergoing refinement. Final visual screenshots will be added to the repository after the dashboard design has been finalized.

The gateway and scheduled refresh infrastructure have been established. Continued monitoring and validation will be performed to confirm reliable daily refresh execution and data accuracy.

---

## 12. Repository Documentation

The GitHub repository documents the project across its major technical and business components.

Related documentation includes:

- Business requirements
- Solution architecture
- Data architecture
- Data-entry workflow
- SQL database
- Power BI dashboard
- Forecasting
- Deployment and refresh
- Testing and validation
- Limitations and future improvements

The repository is intended to provide a reproducible and professionally documented record of the project development process.