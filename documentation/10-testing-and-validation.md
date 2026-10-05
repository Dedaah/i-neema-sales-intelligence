# Testing and Validation

## 1. Testing Overview

Testing was performed throughout the development and deployment of the i-Neema Sales Intelligence solution to confirm that the system functions correctly from data entry through to the final Power BI dashboard.

The testing approach covered the complete reporting pipeline:

**Data Entry → Data Validation → MySQL → Power BI → Gateway → Power BI Service → Dashboard**

Testing focused on:

- Data accuracy.
- Data integrity.
- Database relationships.
- SQL functionality.
- Power BI calculations.
- Dashboard behaviour.
- Gateway connectivity.
- Scheduled refresh.
- Manual refresh.
- New-data propagation.
- Notification automation.
- End-to-end system functionality.

---

## 2. Testing Objectives

The primary testing objectives were to confirm that:

1. Users can enter data correctly.
2. Invalid or incomplete data can be identified.
3. New customers can be added to the system.
4. New products can be added to the system.
5. Sales transactions can be entered correctly.
6. Data can be transferred into MySQL.
7. Foreign-key relationships are maintained.
8. SQL queries return the expected results.
9. Power BI calculations produce the expected results.
10. Dashboard filters work correctly.
11. Dashboard visuals respond to selections.
12. The gateway can connect Power BI Service to MySQL.
13. Manual refresh works successfully.
14. Scheduled refresh is configured.
15. Newly added database records appear in Power BI after refresh.

---

## 3. Testing Approach

Testing was performed progressively rather than waiting until the end of the project.

The approach was:

**Build → Test → Identify Issue → Correct → Retest → Validate**

This allowed problems to be identified close to the stage where they were introduced.

Testing included both:

- Functional testing.
- Data validation.

---

# 4. Data Entry Testing

## 4.1 Customer Data Entry

The customer-entry workflow was tested by entering new customer information into the Google Sheets staging environment.

The test confirmed that:

- CustomerID could be entered.
- CustomerName could be entered.
- Industry could be selected or entered.
- Entry Status could be updated.
- The new customer could be submitted for processing.

The workflow successfully supported the addition of new customer records.

---

## 4.2 Product Data Entry

The product-entry workflow was tested using new product records.

The test confirmed that:

- ProductID could be entered.
- ProductCategory could be entered.
- Entry Status could be updated.
- New product information could be submitted.

The workflow successfully supported the addition of new product records.

---

## 4.3 Sales Data Entry

The FactSales entry workflow was tested using new sales transactions.

The test confirmed that users could enter:

- SalesDate.
- CustomerID.
- ProductID.
- Quantity.
- SalesAmount.
- Entry Status.
- Notification preference.
- Notes where required.

The workflow was successfully tested with actual sales entries.

---

# 5. Data Validation Testing

## 5.1 CustomerID Validation

CustomerID validation was implemented using a controlled list.

The purpose was to reduce:

- Typographical errors.
- Invalid customer references.
- Inconsistent customer IDs.

The validation was tested by selecting customer IDs from the available customer list.

---

## 5.2 ProductID Validation

ProductID validation was implemented using a controlled product list.

The test confirmed that users could select valid ProductIDs rather than manually entering arbitrary product codes.

This helps maintain consistency between:

- FactSales.
- DimProduct.

---

## 5.3 Quantity Validation

Quantity was tested as a numerical field.

The purpose was to ensure that sales quantities were entered as numeric values that could be loaded into the MySQL integer field.

---

## 5.4 SalesDate Validation

SalesDate was tested using the date format required by MySQL.

The expected database format is:

`YYYY-MM-DD`

An invalid date format such as:

`8/12/2026`

caused a MySQL date conversion error.

The equivalent accepted format was:

`2026-8-12`

This demonstrated the importance of maintaining a compatible date format between the staging environment and MySQL.

---

# 6. Entry Status Testing

Entry Status was tested as part of the data-entry workflow.

The workflow uses statuses to indicate the stage of a record.

Examples include:

- New.
- Submitted.
- Reviewed.
- Entered into SQL.

Testing confirmed that the status field could be used to track the progression of submitted records.

---

# 7. Notification Testing

The Apps Script notification workflow was tested for:

- New customers.
- New products.
- FactSales submissions.

The tests confirmed that the configured automation could identify submitted records and generate structured email notifications.

The notification process was successfully tested for all three data-entry categories.

---

# 8. Notification Options Testing

The available notification options were tested.

The configured options include:

- None.
- Email.
- WhatsApp.
- Email + WhatsApp.

The options provide a mechanism for indicating the preferred notification channel.

The current implemented automation uses email notification.

WhatsApp is currently an available workflow option but is not implemented as an automated messaging integration.

---

# 9. MySQL Database Testing

Testing was performed after establishing the `iNeemaDB` database.

The database was checked to confirm that the required tables existed.

The core tables are:

- `dimcustomer`
- `dimproduct`
- `factsales`

---

# 10. Table Structure Validation

The table structures were reviewed against the intended database design.

### DimCustomer

The table contains:

- CustomerID.
- CustomerName.
- Industry.

CustomerID is the primary key.

### DimProduct

The table contains:

- ProductID.
- ProductCategory.

ProductID is the primary key.

### FactSales

The table contains:

- SalesID.
- SalesDate.
- CustomerID.
- ProductID.
- Quantity.
- SALESAMOUNT.

SalesID is an auto-incrementing primary key.

---

# 11. Primary Key Testing

Primary-key constraints were tested during data preparation.

The tests demonstrated that duplicate primary-key values cannot be inserted into the relevant dimension tables.

A duplicate ProductID was encountered during product data preparation:

`BZ1212-450g`

The duplicate was identified and required data review before the product dimension could be finalized.

This confirmed that the primary-key constraint was functioning as intended.

---

# 12. Foreign Key Testing

Foreign-key relationships were implemented in FactSales.

The relationships are:

**FactSales.CustomerID → DimCustomer.CustomerID**

**FactSales.ProductID → DimProduct.ProductID**

These relationships ensure that sales transactions reference valid customers and products.

Foreign-key behaviour was also encountered during database maintenance.

For example, attempts to truncate `DimProduct` were prevented because FactSales contained dependent records.

This confirmed that referential integrity was being enforced by MySQL.

---

# 13. ProductID Length Testing

A ProductID length issue was identified during product data loading.

Some ProductIDs exceeded the original column length.

The ProductID column was subsequently adjusted to:

`VARCHAR(50)`

This provided sufficient capacity for the project's actual product identifiers.

The data was then retested.

---

# 14. Product Data Quality Testing

Product data was reviewed to identify inconsistent product descriptions.

One example involved a generic product entry:

`BB Pneumatic`

The product was subsequently separated into more specific product IDs:

- `BB Pneumatic SP-647-BMC`
- `BB Pneumatic SP-647`

The relevant FactSales records were updated accordingly.

This improved the consistency of product-level reporting.

---

# 15. FactSales Data Testing

FactSales data was tested after loading the sales transaction records into MySQL.

The database was checked to confirm:

- Sales dates were loaded.
- Customer IDs were present.
- Product IDs were present.
- Quantities were loaded.
- Sales amounts were loaded.
- Foreign-key relationships were maintained.

---

# 16. FactSales Import Testing

The FactSales import process used:

`LOAD DATA LOCAL INFILE`

The import successfully loaded the sales records into MySQL.

An import produced:

- 172 rows affected.
- 172 warnings.

The warnings were related to date conversion/truncation.

This issue was identified and reviewed as part of data-quality validation.

---

# 17. Duplicate Sales Testing

Duplicate FactSales records were identified during data preparation.

A set of duplicate records had been inserted for sales dated:

`2026-08-12`

The affected records included transactions involving:

- C019.
- C01.
- BB Belts-23mm.
- BB Battery - ZU-602.
- BZ9411-100g.

The duplicate records were identified and addressed during data cleaning.

This demonstrates the importance of validating imported transaction data before relying on the resulting dashboard figures.

---

# 18. SQL Query Testing

SQL queries were tested progressively as part of the SQL learning and database validation process.

The following SQL functionality was tested:

- SELECT.
- WHERE.
- AND.
- OR.
- DISTINCT.
- ORDER BY.
- LIMIT.
- LIKE.
- BETWEEN.
- IS NULL.
- IS NOT NULL.

The queries were tested against the actual i-Neema database.

---

# 19. SQL Filter Testing

Specific filters were tested against the sales data.

Examples included:

### Customer Filter

Filtering for:

`CustomerID = 'C02'`

returned 21 records when combined with the applicable sales-value condition used during testing.

### Sales Amount Range

Filtering SalesAmount between:

`50000` and `100000`

returned 40 records during testing.

### Product Pattern

Using:

`LIKE 'BB%'`

returned 47 matching records during testing.

These tests demonstrated that SQL filtering was operating correctly against the project data.

---

# 20. SQL Pattern Matching Testing

Additional pattern-matching tests were performed.

Examples included:

- Products containing `Battery`.
- Product IDs ending with `23mm`.
- Product IDs beginning with `BB`.

One search using:

`%Battery%`

returned one matching record.

A search using:

`%23mm`

returned 25 matching records during testing.

---

# 21. NULL Testing

NULL-value checks were performed against the FactSales data.

Tests included:

- CustomerID IS NULL.
- SalesAmount IS NULL.
- CustomerID IS NOT NULL.
- SalesAmount IS NOT NULL.

The tests confirmed that CustomerID had no NULL values in the tested dataset.

The SalesAmount NOT NULL check returned 191 records during the relevant validation stage.

---

# 22. Power BI Data Model Testing

The Power BI data model was tested after connecting Power BI Desktop to MySQL.

The model was checked to confirm that:

- Customer data loaded.
- Product data loaded.
- Sales data loaded.
- Relationships were functioning.
- Date filtering worked.
- Measures returned values.
- Visuals responded to filters.

---

# 23. Power BI Measure Testing

DAX measures were tested individually during dashboard development.

Measures tested included calculations for:

- Total Sales.
- Total Quantity Sold.
- Total Customers.
- Total Products Sold.
- Average Transaction Value.
- Sales Growth.
- Customer Growth.
- Product Growth.
- Quantity Growth.
- YTD Sales.
- YTD Growth.
- Previous-year comparisons.
- Pareto analysis.
- Forecast analysis.

Measures were tested within the actual report rather than only in isolation.

---

# 24. YTD Testing

Year-to-date calculations were tested using the dashboard's current-year data.

The YTD calculations were checked against the underlying sales data to confirm that sales accumulated correctly within the reporting period.

YTD growth was also tested against the corresponding previous-year period.

The dashboard uses dynamic YTD calculations rather than a fixed value.

---

# 25. Growth Indicator Testing

The dashboard uses directional indicators for growth.

The display logic includes:

- Up arrow for positive growth.
- Down arrow for negative growth.
- Neutral indicator when growth is zero.

The related colour logic was also tested.

The configured colours are:

- Positive growth: green.
- Negative growth: red.
- Zero growth: grey.

This was successfully implemented in the dashboard.

---

# 26. Dashboard Filter Testing

Dashboard slicers and filters were tested to confirm that visuals respond to user selections.

Filters include combinations of:

- Year.
- Quarter.
- Month.
- Industry.
- Customer.
- Product category.
- Product.

The tests confirmed that selecting filter values changes the relevant dashboard calculations and visuals.

---

# 27. Dashboard Navigation Testing

Dashboard navigation was tested using the report's navigation controls.

The report includes multiple analytical sections, including:

- Homepage.
- Sales Overview.
- Sales Performance / Product analysis.
- Forecast Analysis.

Navigation was tested to confirm that users could move between the report sections.

---

# 28. Bookmark Testing

Bookmarks were used to support dynamic dashboard behaviour.

Bookmark functionality was tested to confirm that the intended report states could be displayed.

The homepage includes dynamic menu/navigation behaviour implemented using Power BI features such as bookmarks and navigation controls.

---

# 29. Homepage Testing

The homepage was tested for:

- Dynamic greeting.
- Current date.
- Current time.
- YTD Sales.
- YTD Growth.
- Growth indicators.
- Six-month sales trend.
- Navigation.
- Filters.

The dynamic growth display was specifically tested and successfully implemented.

---

# 30. Sales Overview Testing

The Sales Overview page was tested for:

- Total Sales.
- Total Quantity Sold.
- Number of Customers.
- Number of Products.
- Average Sale Value.
- Monthly sales trend.
- Sales by category.
- Sales by industry.
- Filter behaviour.

The visuals were checked against the underlying data model.

---

# 31. Sales Performance Testing

The Sales Performance analysis was tested for:

- Top 10 Products.
- Product Pareto analysis.
- Industry Pareto analysis.
- Product Category Mix.
- Top Product KPI.
- Top Industry KPI.
- Top Product Category KPI.
- Filtering by product and industry.

The Pareto calculations were tested to ensure that cumulative revenue contribution behaved correctly when products or industries were evaluated.

---

# 32. Forecast Testing

The Forecast Analysis page was tested using historical sales data and the Power BI forecasting functionality.

Testing covered:

- Historical sales line.
- Forecast line.
- Forecast period.
- Forecast months.
- Monthly sales.
- Quarterly performance.
- Year filters.
- Quarter filters.
- Month filters.

The forecast was reviewed for reasonableness against the historical sales pattern.

---

# 33. Forecast Development Testing

During forecast development, forecast values were reviewed to understand how Power BI responded to the historical data.

Example forecast values observed during development included:

| Month | Forecast Sales |
|---|---:|
| August | 364,587 |
| September | 579,855.6 |
| October | 629,741.6 |
| November | 588,235.2 |
| December | 95,779.1 |

These values were used during dashboard development and testing.

The dashboard ultimately uses the label:

`Forecast Sales`

rather than:

`Projected FY2026`

---

# 34. Gateway Testing

The On-premises Data Gateway was tested after deployment.

Testing confirmed that:

- The gateway was installed.
- The gateway was registered.
- The gateway was online.
- The gateway could connect to MySQL.
- The semantic model could use the gateway connection.

The gateway is registered as:

`i-Neema-PowerBI-Gateway`

---

# 35. Encrypted Connection Testing

The MySQL gateway connection was tested during troubleshooting.

The connection was initially configured without encryption.

The configuration was subsequently changed to an encrypted/TLS connection.

Following the change, a successful refresh was completed.

This validated the working gateway connection configuration.

---

# 36. Manual Refresh Testing

Manual refresh was tested from Power BI Service.

The test confirmed that Power BI Service could:

1. Contact the gateway.
2. Connect to MySQL.
3. Retrieve updated data.
4. Refresh the semantic model.
5. Update the published report.

The latest manual refresh was successfully completed.

---

# 37. Scheduled Refresh Testing

A daily scheduled refresh was configured for:

**4:00 PM UTC/GMT**

Refresh history was monitored to confirm scheduled-refresh behaviour.

A scheduled refresh failure was encountered during testing.

The error included:

`DM_GWPipeline_Client_GatewayUnreachable`

The issue was investigated and subsequently resolved through gateway and connection troubleshooting.

---

# 38. Gateway Failure Testing

The gateway failure demonstrated that a Power BI refresh can fail even when the report and database themselves are functioning.

The error:

`DM_GWPipeline_Client_GatewayUnreachable`

was used to investigate the communication path between:

**Power BI Service → Gateway → MySQL**

This testing helped establish the importance of monitoring the gateway in addition to the database and Power BI report.

---

# 39. New Customer Validation

A new customer record was added during testing.

The workflow confirmed that:

1. The customer could be entered.
2. The customer could be submitted.
3. The notification workflow could identify the submission.
4. The customer could be added to MySQL.
5. The customer became available to the reporting environment after refresh.

This validated the customer-data pipeline.

---

# 40. New Product Validation

A new product was added during testing.

The workflow confirmed that:

1. The product could be entered.
2. The product could be submitted.
3. Notification automation could identify the submission.
4. The product could be added to MySQL.
5. The product became available to Power BI after refresh.

This validated the product-data pipeline.

---

# 41. New Sales Validation

New sales transactions were added during testing.

The workflow confirmed that:

1. Sales data could be entered.
2. The sales record could be submitted.
3. Notification automation could identify the submission.
4. The transaction could be added to MySQL.
5. Power BI could retrieve the updated sales data after refresh.
6. The dashboard reflected the updated information.

This was an important end-to-end validation of the solution.

---

# 42. End-to-End Testing

The final end-to-end test validated the complete system.

The tested process was:

**Google Sheets**

↓

**Data Validation**

↓

**Apps Script Notification**

↓

**MySQL `iNeemaDB`**

↓

**On-premises Data Gateway**

↓

**Power BI Service**

↓

**Semantic Model Refresh**

↓

**Dashboard Update**

The test successfully demonstrated that new data could flow through the complete reporting architecture.

---

# 43. Data Accuracy Validation

Data accuracy was validated by comparing information across the system.

Validation was performed between:

- Staging data.
- MySQL records.
- Power BI data.
- Dashboard results.

This helped identify issues such as:

- Duplicate records.
- Incorrect product descriptions.
- Date-format problems.
- Product ID length issues.
- Inconsistent product references.

---

# 44. Data Integrity Validation

Data integrity was supported through:

- Primary keys.
- Foreign keys.
- Required fields.
- Controlled CustomerID selection.
- Controlled ProductID selection.
- Data validation.
- SQL constraints.

These controls reduce the likelihood of invalid relationships entering the reporting database.

---

# 45. Testing Issues Identified

Several issues were identified during development and testing.

| Issue | Resolution |
|---|---|
| Duplicate ProductID | Identified and reviewed |
| ProductID length too short | Column expanded to `VARCHAR(50)` |
| Generic `BB Pneumatic` product description | Split into specific product IDs |
| Invalid date format | Corrected to MySQL-compatible format |
| FactSales import warnings | Investigated as date conversion issue |
| Duplicate FactSales records | Identified and cleaned |
| Gateway connectivity failure | Gateway/connection configuration investigated |
| Unencrypted MySQL gateway connection | Changed to encrypted/TLS |
| Scheduled refresh failure | Investigated and followed by successful manual refresh |

---

# 46. Regression Testing

After important corrections were made, the affected processes were retested.

For example:

- After ProductID changes, FactSales relationships were checked.
- After gateway configuration changes, refresh was tested again.
- After data-entry workflow changes, notifications were tested again.
- After DAX changes, affected dashboard visuals were reviewed.
- After new records were added, Power BI refresh was tested again.

This reduced the risk that corrections would introduce new problems.

---

# 47. Final Validation Checklist

The following checklist represents the final functional validation of the system.

| Test Area | Validation |
|---|---|
| Google Sheets data entry | Completed |
| Customer validation | Completed |
| Product validation | Completed |
| Sales entry | Completed |
| Entry Status workflow | Completed |
| Email notification automation | Completed |
| MySQL schema | Validated |
| Primary keys | Validated |
| Foreign keys | Validated |
| SQL loading | Tested |
| SQL queries | Tested |
| Data-quality checks | Tested |
| Power BI data model | Tested |
| DAX measures | Tested |
| Dashboard filters | Tested |
| Dashboard navigation | Tested |
| Forecast analysis | Tested |
| Gateway installation | Validated |
| Gateway connection | Validated |
| Encrypted MySQL connection | Validated |
| Manual refresh | Successful |
| Scheduled refresh | Configured and monitored |
| New customer flow | Validated |
| New product flow | Validated |
| New sales flow | Validated |
| End-to-end data flow | Validated |

---

# 48. Current Testing Status

The system has passed the major functional tests required for the current deployment.

The key successful validation is that newly added business data can move through the system and appear in the Power BI dashboard after a successful refresh.

The deployment is therefore considered functionally operational for the current project scope.

---

# 49. Ongoing Testing

Testing does not end after deployment.

Future testing should include:

- Regular refresh validation.
- New data-entry testing.
- Periodic database integrity checks.
- Dashboard calculation validation.
- Gateway availability checks.
- Scheduled refresh monitoring.
- Backup and recovery testing.
- User acceptance testing.
- Performance testing as data volume increases.

---

# 50. Conclusion

Testing and validation confirmed that the i-Neema Sales Intelligence solution operates across the major components of the reporting pipeline.

The system was tested from data entry through MySQL storage, Power BI processing, gateway connectivity, semantic model refresh, and dashboard presentation.

Several data-quality and deployment issues were identified during development. These included duplicate records, product inconsistencies, date-format issues, ProductID length limitations, and a gateway connectivity failure.

The issues were investigated and corrective actions were implemented.

The final end-to-end validation confirmed that new customers, products, and sales transactions could flow through the system and become available in Power BI after refresh.

The solution is therefore functionally operational within the current project scope, while ongoing monitoring and future testing remain necessary as the system grows.