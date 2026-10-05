# Business Requirements

## 1. Purpose

This document defines the business requirements for the i-Neema Sales Intelligence Dashboard.

The purpose of the requirements is to establish what the solution is expected to achieve from a business, reporting, data-entry, and management perspective.

These requirements provide the foundation for the database design, Power BI data model, dashboard development, forecasting, refresh process, and future improvements.

---

## 2. Business Problem

i-Neema Ghana Limited manages sales information across customers, products, industries, sales dates, quantities, and sales values.

As sales information grows, relying on manually prepared reports and spreadsheets can make it more difficult to:

- Monitor sales performance consistently.
- Identify changes in sales trends.
- Compare current performance with previous periods.
- Identify major customers and revenue contributors.
- Analyze product and industry performance.
- Maintain consistent customer and product information.
- Provide management with timely sales information.

The project therefore aims to establish a more structured sales intelligence environment that can centralize sales information and make it easier to analyze and communicate.

---

## 3. Business Objectives

The solution is intended to support the following business objectives:

- Improve visibility of sales performance.
- Centralize sales information in a structured database.
- Reduce dependence on manually prepared sales reports.
- Improve consistency of customer and product information.
- Provide management with interactive sales analysis.
- Support faster identification of important sales trends.
- Enable comparison of current and historical performance.
- Support customer, industry, and product analysis.
- Provide forward-looking sales forecasting.
- Establish a foundation for automated and repeatable reporting.

---

## 4. Stakeholders and Users

The primary stakeholder for the dashboard is company management, particularly executives who require a high-level view of business performance.

Other potential users include employees involved in:

- Sales
- Marketing
- Technical operations
- Administration
- Management reporting
- Data entry and sales administration

User access and dashboard permissions may be expanded in the future as the reporting environment develops.

---

## 5. Business Reporting Requirements

The dashboard should provide management with an accessible view of key sales information.

The solution should allow users to monitor:

- Total sales.
- Total quantity sold.
- Number of customers.
- Number of products sold.
- Average transaction value.
- Sales growth.
- Year-to-date sales.
- Previous-year performance.
- Monthly sales performance.
- Quarterly sales performance.
- Customer performance.
- Industry performance.
- Product performance.
- Product category performance.

---

## 6. Key Performance Indicators

The dashboard should provide key performance indicators that summarize sales performance.

### Core Sales KPIs

- Total Sales
- Total Quantity Sold
- Total Customers
- Total Products Sold
- Average Transaction Value
- Largest Sale
- Smallest Sale

### Growth KPIs

- Sales Growth %
- Quantity Growth %
- Customer Growth %
- Product Growth %
- Year-to-Date Growth %

### Performance KPIs

- Top Customer
- Top Industry
- Top Product
- Top Product Category
- Best Sales Month
- Best Sales Quarter
- Weakest Sales Month

The KPIs should update dynamically according to the selected reporting filters.

---

## 7. Time-Based Analysis Requirements

The solution should allow sales performance to be analyzed across different time periods.

Users should be able to analyze:

- Daily sales where required.
- Monthly sales.
- Quarterly sales.
- Year-to-date sales.
- Previous-year sales.
- Period-over-period growth.
- Current-year versus previous-year performance.

The dashboard should support filtering by:

- Year
- Quarter
- Month

A dedicated date dimension is used in Power BI to support time-based calculations and comparisons.

---

## 8. Customer and Industry Requirements

The solution should allow users to understand where sales revenue is being generated.

Customer analysis should include:

- Sales by customer.
- Customer ranking.
- Customer revenue contribution.
- Top customers.
- Customer comparisons.

Industry analysis should include:

- Sales by industry.
- Industry ranking.
- Industry revenue contribution.
- Comparison of industry performance.
- Identification of major contributing industries.

Pareto analysis should also be used where appropriate to identify the customers or industries contributing the largest proportion of total sales.

---

## 9. Product Requirements

The solution should allow management to analyze sales performance at product and product-category levels.

Product analysis should include:

- Sales by product.
- Product ranking.
- Top products.
- Product revenue contribution.
- Product category performance.
- Product category mix.
- Product Pareto analysis.

The product master table should provide a controlled list of valid products used by the sales transaction table.

---

## 10. Forecasting Requirements

The solution should provide forward-looking sales analysis using historical sales information.

Forecasting should:

- Use historical sales performance as an input.
- Provide an indication of expected future sales.
- Support management planning and discussion.
- Be presented separately from actual sales.
- Clearly distinguish forecast values from historical actual values.

Forecasting should be treated as a supporting analytical tool and should not be interpreted as a guaranteed future result.

---

## 11. Data Entry Requirements

The solution should support a controlled process for entering new sales information.

Sales entry should capture at least:

- Sales Date
- Customer ID
- Product ID
- Quantity
- Sales Amount

Customer and product information should be maintained separately through master data tables.

The data-entry workflow should use controlled values where practical to reduce:

- Incorrect customer IDs.
- Incorrect product IDs.
- Duplicate master data.
- Inconsistent naming.
- Invalid transaction information.

---

## 12. Data Quality Requirements

The sales intelligence solution should maintain reasonable data quality standards.

The system should aim to ensure that:

- Customer IDs are valid.
- Product IDs are valid.
- Required sales fields are completed.
- Sales dates are valid.
- Quantities are numeric.
- Sales amounts are numeric.
- Customer records are not unnecessarily duplicated.
- Product records are not unnecessarily duplicated.
- Relationships between sales and master data remain valid.

Data validation should be performed before or during the process of loading information into the MySQL database.

---

## 13. Refresh Requirements

The Power BI solution should provide updated information without requiring the dashboard to be rebuilt manually whenever new sales information is entered.

The current deployment uses an On-premises Data Gateway to connect the local MySQL database to Power BI Service.

The scheduled refresh is configured for:

**Daily at 4:00 PM**

The refresh process should:

1. Retrieve updated information from MySQL.
2. Refresh the Power BI semantic model.
3. Update the published dashboard.
4. Make the latest available information accessible to authorized users.

Refresh history should be monitored to identify failed or incomplete refreshes.

---

## 14. Dashboard Interaction Requirements

The dashboard should allow users to interact with the data rather than relying only on static reports.

Interactive capabilities include:

- Year filtering.
- Quarter filtering.
- Month filtering.
- Customer filtering.
- Industry filtering.
- Product filtering.
- Product category filtering.
- Interactive navigation between dashboard pages.
- Dynamic KPI calculations.
- Dynamic performance indicators.
- Interactive charts and visualizations.

The dashboard should maintain a consistent user experience across its reporting pages.

---

## 15. Management Reporting Requirements

The dashboard should provide both high-level and detailed analysis.

The executive-level view should allow management to quickly understand:

- Current sales performance.
- Sales growth.
- Year-to-date performance.
- Major revenue contributors.
- Recent sales trends.
- Forecast information.

Detailed reporting pages should allow users to investigate:

- Customers.
- Industries.
- Products.
- Product categories.
- Sales trends.
- Historical performance.

---

## 16. Access and Security Requirements

The dashboard should not be treated as an unrestricted public reporting system.

Access to the published Power BI dashboard should be controlled according to organizational requirements.

The solution should aim to:

- Restrict dashboard access to authorized users.
- Protect the underlying sales database.
- Avoid exposing confidential customer or sales information publicly.
- Keep database credentials secure.
- Protect the Power BI Service environment.
- Maintain appropriate access controls as the number of users increases.

Future development may introduce more detailed role-based access depending on organizational requirements.

---

## 17. Notification Requirements

The data-entry workflow should support notifications for selected data-entry events.

The current workflow includes notification automation for:

- New customer submissions.
- New product submissions.
- Submitted sales information.

The notification process is intended to help responsible personnel become aware of new records that require review or further processing.

---

## 18. Functional Requirements Summary

The solution should provide the following functional capabilities:

| Requirement | Description |
|---|---|
| Sales Data Storage | Store structured sales transactions in MySQL |
| Customer Management | Maintain customer master data |
| Product Management | Maintain product master data |
| Sales Analysis | Analyze sales performance |
| KPI Reporting | Display key performance indicators |
| Time Analysis | Analyze monthly, quarterly and YTD performance |
| Customer Analysis | Analyze sales by customer |
| Industry Analysis | Analyze sales by industry |
| Product Analysis | Analyze sales by product and category |
| Forecasting | Provide forward-looking sales analysis |
| Interactive Filtering | Allow users to filter dashboard information |
| Data Entry | Support controlled sales data entry |
| Notifications | Notify responsible users of selected submissions |
| Automated Refresh | Refresh Power BI from the MySQL database |
| Online Reporting | Provide access to the published Power BI dashboard |

---

## 19. Non-Functional Requirements

In addition to the functional requirements, the solution should aim to provide:

### Reliability

The reporting system should provide consistent results when valid data is supplied.

### Maintainability

The database, DAX measures, Power BI model, and documentation should be structured so that future changes can be made without rebuilding the entire solution.

### Scalability

The solution should be capable of handling increasing volumes of customers, products, and sales transactions.

### Usability

The dashboard should be understandable to management users without requiring detailed technical knowledge.

### Security

Sales and customer information should be protected from unauthorized access.

### Accessibility

The published Power BI dashboard should be accessible to authorized users through Power BI Service.

---

## 20. Expected Business Value

The business requirements are intended to support a reporting environment that enables i-Neema to:

- Make better use of existing sales information.
- Reduce manual reporting effort.
- Improve visibility into sales performance.
- Identify important revenue contributors.
- Monitor changes in performance.
- Support management discussions with consistent information.
- Improve the foundation for future business intelligence development.

---

## 21. Requirements Traceability

The requirements documented here provide the basis for the technical components developed in the project.

The relationship between requirements and implementation is documented through:

- MySQL database design.
- Power BI data model.
- DAX measures.
- Dashboard pages.
- Data-entry workflow.
- Notification automation.
- Forecasting analysis.
- Gateway and scheduled refresh configuration.
- Testing and validation procedures.

These requirements may be updated as the business reporting needs evolve.