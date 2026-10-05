# Power BI Dashboard

## 1. Dashboard Overview

The i-Neema Sales Intelligence Dashboard is the primary reporting and analytical interface for the sales database.

The dashboard is built using Microsoft Power BI and uses the MySQL `iNeemaDB` database as its central data source.

The solution is designed to provide management with a consolidated view of sales performance, customer activity, product performance, industry performance, growth, and forecasting.

The dashboard also provides interactive filtering and navigation so users can move between different analytical views without needing to work directly with the underlying database.

---

## 2. Dashboard Objectives

The Power BI dashboard was developed to:

- Provide a centralized view of sales performance.
- Reduce dependence on manually prepared reports.
- Allow management to monitor key sales KPIs.
- Analyse sales trends over time.
- Identify important customers and products.
- Analyse sales by industry and product category.
- Compare current performance with previous periods.
- Provide year-to-date performance analysis.
- Provide sales forecasting.
- Allow users to filter and investigate the data interactively.
- Support management decision-making with consistent data.

---

## 3. Power BI Architecture

The reporting flow is:

**Google Sheets Data Entry / Staging → MySQL `iNeemaDB` → Power BI Desktop → Power BI Service**

The Power BI Service connects to the local MySQL database through the On-premises Data Gateway.

The overall reporting environment therefore consists of:

- MySQL database.
- Power BI Desktop.
- Power BI semantic model.
- On-premises Data Gateway.
- Power BI Service.
- Published dashboard/report.

---

## 4. Data Source

The primary reporting source is:

`iNeemaDB`

The database contains:

- `dimcustomer`
- `dimproduct`
- `factsales`

The Power BI model uses these tables to provide the foundation for sales analysis.

Customer and product information are stored in dimension tables, while transaction-level sales information is stored in the sales fact table.

---

## 5. Power BI Data Model

The Power BI model follows a dimensional structure.

The main relationships are:

**dimcustomer → factsales**

and:

**dimproduct → factsales**

The customer dimension provides:

- Customer ID.
- Customer name.
- Industry.

The product dimension provides:

- Product ID.
- Product category.

The sales fact table provides:

- Sales date.
- Customer ID.
- Product ID.
- Quantity.
- Sales amount.

A `DimDate` table is also used in the Power BI model to support time-based calculations and reporting.

---

## 6. Date Analysis

The dashboard uses the `DimDate` table to support time-based analysis.

The date model enables reporting by:

- Year.
- Quarter.
- Month.
- Year-to-date period.
- Previous year.
- Monthly growth.
- Quarterly growth.
- Forecast period.

The date dimension is particularly important for DAX calculations that compare current sales with previous periods.

---

## 7. Dashboard Pages

The Power BI solution contains several analytical pages.

The main reporting areas include:

1. Homepage.
2. Sales Overview.
3. Sales Performance / Product Analysis.
4. Forecast Analysis.

The pages are connected through dashboard navigation and interactive controls.

---

# 8. Homepage

The Homepage provides a management-oriented summary of current sales performance.

The page was designed to provide important information immediately when the report is opened.

Key elements include:

- Dynamic greeting.
- Current date.
- Current time.
- Year-to-date sales.
- Year-to-date growth.
- Growth direction indicator.
- Six-month sales trend.
- Navigation controls.
- Report filters where applicable.

---

## 8.1 Dynamic Greeting

The homepage includes a dynamic greeting that changes according to the current time.

The greeting provides a more responsive management dashboard experience.

The implementation uses a DAX measure to determine the appropriate greeting.

---

## 8.2 Current Date

The homepage displays the current reporting date.

This provides users with immediate context regarding when the dashboard is being viewed.

---

## 8.3 Current Time

The homepage also includes the current time.

This is generated using a DAX measure and is intended to provide a live dashboard experience.

---

## 8.4 Year-to-Date Sales

The homepage displays year-to-date sales as one of the primary management KPIs.

The YTD calculation is based on the `DimDate` table.

This allows the dashboard to show sales accumulated from the beginning of the current year through the selected reporting period.

---

## 8.5 YTD Growth

The homepage also displays year-to-date growth compared with the corresponding previous-year period.

The growth indicator uses:

- An upward arrow when growth is positive.
- A downward arrow when growth is negative.
- A neutral indicator when there is no change.

The displayed value is formatted as a percentage.

---

## 8.6 YTD Growth Colour

Conditional formatting is used to make the direction of performance visually clear.

The current logic uses:

- Green for positive growth.
- Red for negative growth.
- Grey for zero growth.

This allows users to interpret the KPI quickly without reading the underlying number alone.

---

## 8.7 Six-Month Sales Trend

The homepage includes a six-month sales trend visual.

The visual provides a quick view of recent sales performance and allows management to identify changes in sales activity over time.

The chart is based on the sales data stored in MySQL.

---

# 9. Sales Overview

The Sales Overview page provides a broader view of sales performance.

The page focuses on key sales KPIs and trends.

The main metrics include:

- Total Sales.
- Total Quantity Sold.
- Number of Customers.
- Number of Products.
- Average Sale Value.

The page also contains analytical visuals for:

- Monthly sales.
- Sales by product category.
- Sales by industry.

---

## 9.1 Total Sales

The Total Sales KPI represents the total value of sales transactions in the current filter context.

The measure is based on:

`factsales[SALESAMOUNT]`

The KPI responds to dashboard filters and slicers.

---

## 9.2 Total Quantity Sold

The Total Quantity Sold KPI represents the total quantity recorded in the sales fact table.

This allows management to view sales volume separately from sales value.

---

## 9.3 Number of Customers

The dashboard uses a distinct customer count to identify the number of customers represented in the sales data.

This prevents repeated sales transactions for the same customer from being counted as separate customers.

---

## 9.4 Number of Products

The dashboard uses a distinct product count to identify the number of products represented in the sales data.

---

## 9.5 Average Sale Value

The dashboard includes an average transaction value metric.

This provides an indication of the typical sales value represented by the current reporting context.

---

## 9.6 Monthly Sales Trend

The Sales Overview page includes a monthly sales trend visual.

This allows users to identify:

- Periods of higher sales.
- Periods of lower sales.
- Changes in sales activity.
- Seasonal or recurring patterns.

The visual responds to the available report filters.

---

## 9.7 Sales by Product Category

Sales are analysed by product category.

This allows management to identify the categories contributing to overall sales.

The visual can be filtered by:

- Year.
- Quarter.
- Month.
- Customer.
- Industry.
- Product.

---

## 9.8 Sales by Industry

The dashboard analyses sales by customer industry.

This allows management to identify industries contributing to sales performance.

Industry analysis also supports customer segmentation and management reporting.

---

# 10. Sales Performance and Product Analysis

The Sales Performance / Product Analysis area provides more detailed analysis of product and customer performance.

The page includes analysis such as:

- Top products.
- Product category performance.
- Product contribution.
- Customer contribution.
- Industry contribution.
- Pareto analysis.

The page includes multiple filters to allow users to investigate performance from different perspectives.

---

## 10.1 Top Products

The dashboard identifies the highest-performing products based on sales revenue.

A Top 10 product visual is used to focus attention on the products contributing the most sales value.

---

## 10.2 Product Ranking

Products are ranked according to their sales contribution.

The ranking responds to the current filter context.

This allows users to analyse product performance for:

- A selected year.
- A selected quarter.
- A selected month.
- A selected customer.
- A selected industry.
- A selected product category.

---

## 10.3 Product Category Mix

The dashboard includes a product category mix visual.

This allows users to see how total sales are distributed across product categories.

The visual is intended to answer questions such as:

- Which categories contribute most to sales?
- How concentrated are sales across categories?
- How does the category mix change under different filters?

---

## 10.4 Customer Sales Contribution

Customer contribution analysis identifies how much each customer contributes to total sales.

The dashboard includes measures for:

- Customer sales.
- Customer rank.
- Customer revenue contribution percentage.
- Cumulative customer revenue.
- Customer Pareto percentage.

---

## 10.5 Industry Sales Contribution

Industry analysis provides similar contribution measures.

The dashboard includes:

- Industry sales.
- Industry ranking.
- Industry revenue contribution.
- Cumulative industry revenue.
- Industry Pareto percentage.

This supports analysis of sales concentration across customer industries.

---

# 11. Pareto Analysis

Pareto analysis was implemented for products, customers, and industries.

The purpose is to identify how sales are distributed across ranked entities.

The analysis uses cumulative revenue and contribution percentages.

For example, products can be ranked from highest to lowest revenue and then analysed cumulatively to determine how much of total sales is generated by the leading products.

This provides management with a way to identify high-contribution products and customers.

---

## 11.1 Product Pareto Measures

Product Pareto analysis uses measures including:

- Product Rank.
- Product Revenue Contribution %.
- Cumulative Product Revenue.
- Product Pareto %.
- Pareto 80% Line.

These measures support the identification of products responsible for a significant proportion of total revenue.

---

## 11.2 Customer Pareto Measures

Customer Pareto analysis uses measures including:

- Customer Rank.
- Customer Revenue Contribution %.
- Cumulative Customer Revenue.
- Customer Pareto %.
- Pareto 80% Line.

These measures help identify customer concentration.

---

## 11.3 Industry Pareto Measures

Industry Pareto analysis uses:

- Industry Rank.
- Industry Revenue Contribution %.
- Cumulative Industry Revenue.
- Industry Pareto %.

This allows industry-level sales concentration to be evaluated.

---

# 12. Key Performance Indicators

The Power BI solution includes a DAX-based KPI layer.

Key measures include:

- Total Sales.
- Total Sales LY.
- Sales Growth %.
- Total Quantity Sold.
- Quantity LY.
- Quantity Growth %.
- Total Customers.
- Customers LY.
- Customer Growth %.
- Total Products Sold.
- Products LY.
- Product Growth %.
- Average Transaction Value.
- Largest Sale.
- Smallest Sale.

These measures are designed to respond dynamically to the report filter context.

---

# 13. Year-over-Year Analysis

Year-over-year analysis compares current performance with the equivalent previous-year period.

The dashboard includes measures for:

- Current sales.
- Previous-year sales.
- Sales growth percentage.
- Growth direction.
- Growth display.
- Growth colour.

The previous-year calculations use the `DimDate` table and DAX time-intelligence functions.

---

# 14. Growth Indicators

The dashboard uses visual indicators to communicate growth direction.

The indicators include:

**Positive performance**

▲

**Negative performance**

▼

**No change**

●

The corresponding colour logic is used to make the status immediately visible.

---

# 15. Quarterly Analysis

The dashboard includes quarterly performance measures.

These include:

- Current Quarter Sales.
- Current Quarter Sales LY.
- Current Quarter Growth %.
- Current Quarter Growth Display.
- Current Quarter Growth Colour.

Quarterly analysis allows management to compare performance across reporting periods.

---

# 16. Year-to-Date Analysis

The dashboard includes year-to-date measures for management reporting.

These include:

- YTD Sales.
- YTD Sales LY.
- YTD Growth %.
- YTD Growth Display.
- YTD Growth Colour.

YTD calculations allow current-year performance to be compared against the corresponding previous-year period.

---

# 17. Sales Trend Analysis

The Power BI model includes measures designed to interpret sales trends.

These include:

- Sales Trend Message.
- Sales Trend Title.
- Sales Period Label.
- Sales Period Status.
- Monthly / Period Growth %.
- Period Growth Colour.
- Best Sales Month.
- Weakest Sales Month.
- Best Sales Quarter.

These measures support the dashboard's dynamic analytical messaging.

---

# 18. Forecast Analysis

The Forecast Analysis page provides forward-looking sales analysis.

The page includes:

- YTD Sales.
- Forecast Period.
- Forecast Months.
- Month-in-progress information.
- Forecast sales.
- Monthly sales trends.
- Average monthly sales.
- Quarterly performance.

The forecasting section is intended to provide management with an indication of expected future sales based on historical sales patterns.

---

## 18.1 Forecast Period

The forecast period identifies the portion of the reporting year for which forecasting is being displayed.

The dashboard distinguishes between historical/current sales and future forecast periods.

---

## 18.2 Forecast Months

The `Forecast Months` measure supports the identification of the remaining periods available for forecasting.

This is used to support the forecast reporting logic.

---

## 18.3 Forecast Sales

The dashboard includes a `Forecast Sales` measure for forecast reporting.

The forecast section was refined so that the forecast is presented as:

**Forecast Sales**

rather than using a label such as:

**Projected FY2026**

This was done to keep the terminology clear and avoid implying a fixed projection methodology where the visual is being used as a forecast analysis.

---

## 18.4 Forecast Seasonality

The Power BI forecasting analysis was adjusted to account for seasonality.

The forecast output therefore reflects historical seasonal patterns rather than relying solely on a flat forecast.

The current forecast analysis includes future monthly periods and allows users to compare historical sales with forecast sales.

---

# 19. Dashboard Filters and Slicers

Interactive filters are used throughout the report.

Depending on the page, users can filter by:

- Year.
- Quarter.
- Month.
- Industry.
- Customer.
- Product category.
- Product.

These filters allow users to investigate specific sections of the business without changing the underlying database.

---

# 20. Dynamic Dashboard Behaviour

The dashboard uses DAX measures and Power BI filter context to make several elements dynamic.

Examples include:

- KPI values.
- Growth percentages.
- Growth indicators.
- Growth colours.
- Reporting period labels.
- Sales trend messages.
- Top customer information.
- Top industry information.
- Top product information.
- Forecast information.

This reduces the need to create separate static visuals for every reporting scenario.

---

# 21. Dashboard Navigation

The report includes navigation controls to allow users to move between major analytical areas.

The navigation structure supports movement between:

- Homepage.
- Sales Overview.
- Product / Sales Performance.
- Forecast Analysis.

Bookmarks and navigation controls are used to support the dashboard interface.

---

# 22. Bookmarks and Interactive Menu

Bookmarks were used as part of the dashboard navigation and menu experience.

The interactive menu allows users to access different reporting sections without relying solely on the standard Power BI page tabs.

This contributes to a more application-like management dashboard experience.

---

# 23. DAX Analytical Layer

The Power BI solution uses DAX measures to provide the analytical layer between the database and the report visuals.

The measure library includes calculations for:

- Sales.
- Quantity.
- Customers.
- Products.
- Growth.
- Previous-year comparisons.
- YTD analysis.
- Quarterly analysis.
- Monthly analysis.
- Customer contribution.
- Product contribution.
- Industry contribution.
- Pareto analysis.
- Forecasting.
- Dynamic dashboard messaging.
- Dashboard display logic.

The measure library is documented separately in:

`power-bi/measures/sales-intelligence-measures.dax`

---

# 24. Core Sales Measures

The core sales measures include:

- `Total Sales`
- `Total Sales LY`
- `Average Transaction Value`
- `Largest Sale`
- `Smallest Sale`
- `Total Quantity Sold`
- `Total Customers`
- `Total Products Sold`

These measures form the foundation for many of the dashboard visuals.

---

# 25. Growth Measures

Growth-related measures include:

- `Sales Growth %`
- `Sales Growth Arrow`
- `Sales Growth Colour`
- `Sales Growth Display`
- `Sales Growth Label`
- `Quantity Growth %`
- `Quantity Growth Colour`
- `Quantity Growth Display`
- `Customer Growth %`
- `Customer Growth Colour`
- `Customer Growth Display`
- `Products Growth %`
- `Product Growth Colour`
- `Products Growth Display`

These measures allow the report to communicate changes in performance clearly.

---

# 26. Customer Analytical Measures

Customer analysis includes measures such as:

- `Customer Sales`
- `Customer Rank`
- `Customer Revenue Contribution %`
- `Cumulative Customer Revenue`
- `Customer Pareto %`
- `Top Customer Name`
- `Top Customer Value`

These measures support customer ranking and contribution analysis.

---

# 27. Product Analytical Measures

Product analysis includes measures such as:

- `Product Rank`
- `Product Revenue Contribution %`
- `Cumulative Product Revenue`
- `Product Pareto %`
- `Top Product Name`
- `Top Product Revenue`
- `Top Product Category`
- `Top Product Category Revenue`
- `Product Order`
- `Product Bar Colour`

These measures support product ranking, contribution analysis, and visual formatting.

---

# 28. Industry Analytical Measures

Industry analysis includes:

- `Industry Rank`
- `Industry Revenue Contribution %`
- `Cumulative Industry Revenue`
- `Industry Pareto %`
- `Top Industry Name`
- `Top Industry Revenue`
- `Top Industry Sales %`

These measures support industry-level sales analysis.

---

# 29. Dynamic Dashboard Measures

The dashboard includes dynamic measures used to improve the management experience.

Examples include:

- `Dynamic Greeting`
- `Current Time`
- `Today Date`
- `Last Refresh`
- `Last Refresh Display`
- `Reporting Period`
- `Reporting Period Display`
- `Sales Trend Message`
- `Sales Trend Title`
- `Sales Period Label`
- `Sales Period Status`

These measures allow dashboard information to adapt to the current reporting context.

---

# 30. Refresh Information

The dashboard includes a refresh-related measure:

`Last Refresh`

and a display version:

`Last Refresh Display`

These measures provide users with information about the latest available data refresh.

Refresh monitoring is particularly important because the Power BI Service depends on the On-premises Data Gateway to access the local MySQL database.

---

# 31. Power BI Service Deployment

The report is published to Power BI Service through a semantic model.

The published environment provides management access to the dashboard without requiring users to work directly in Power BI Desktop.

The Power BI Service is also responsible for scheduled semantic model refresh.

---

# 32. On-premises Data Gateway

The Power BI Service uses an On-premises Data Gateway to connect to the local MySQL database.

The gateway:

- Runs on the local environment.
- Provides Power BI Service access to MySQL.
- Uses the configured MySQL connection.
- Enables scheduled refresh.
- Allows updated database records to reach the published report.

The gateway is registered as:

`i-Neema-PowerBI-Gateway`

---

# 33. MySQL Gateway Connection

The MySQL connection used by the gateway connects to:

`iNeemaDB`

The connection was configured using the local MySQL environment.

Encrypted connectivity was established for the working gateway configuration.

The connection was tested through actual Power BI refresh activity.

---

# 34. Scheduled Refresh

The current scheduled refresh is configured for:

**Daily at 4:00 PM**

The refresh allows new or updated records in MySQL to become available in the published Power BI report.

Manual refresh was also successfully tested through the gateway.

---

# 35. Refresh Monitoring

Refresh history is monitored in Power BI Service.

During implementation, a gateway connectivity issue was encountered and investigated.

The issue was associated with:

`DM_GWPipeline_Client_GatewayUnreachable`

The gateway and connection configuration were investigated and subsequently a manual refresh completed successfully.

New customer, product, and sales records were also confirmed to flow through the database and appear in Power BI after successful refresh.

This demonstrated that the complete reporting pipeline was operational:

**Data Entry → MySQL → Gateway → Power BI Service → Dashboard**

---

# 36. Dashboard Testing

The dashboard has been tested through actual data changes.

Testing included:

- Adding new customer records.
- Adding new product records.
- Adding new sales records.
- Updating the MySQL database.
- Refreshing the Power BI semantic model.
- Confirming that new data appeared in the report.
- Checking KPI updates.
- Checking dashboard visuals.
- Checking scheduled refresh configuration.

These tests confirmed that the reporting environment is connected to the live database rather than relying solely on static imported data.

---

# 37. Current Dashboard Status

The current Power BI implementation includes:

| Component | Status |
|---|---|
| Power BI report | Implemented |
| MySQL data source | Connected |
| Data model | Implemented |
| DimDate | Implemented |
| DAX measure layer | Implemented |
| Homepage | Implemented |
| Sales Overview | Implemented |
| Product / Sales Performance | Implemented |
| Forecast Analysis | Implemented |
| Interactive filtering | Implemented |
| Dashboard navigation | Implemented |
| Bookmarks / menu | Implemented |
| Power BI Service publication | Implemented |
| On-premises Data Gateway | Implemented |
| Scheduled refresh | Implemented |
| Refresh testing | Completed |

---

# 38. Current Dashboard Limitations

The dashboard is operational but can be further improved.

Current limitations include:

- Some advanced forecast presentation elements may require further refinement.
- Additional visual design improvements may be introduced.
- Some Power BI native visual formatting limitations remain.
- Additional management KPIs may be introduced as business requirements evolve.
- Marketing and inventory information are not yet fully integrated into the reporting model.
- Dashboard performance may require optimization as transaction volume increases.

---

# 39. Future Dashboard Improvements

Potential future improvements include:

- Additional executive KPIs.
- Inventory dashboards.
- Marketing performance dashboards.
- Lead and opportunity reporting.
- Sales representative performance.
- Regional or territory analysis.
- More advanced forecasting.
- Automated anomaly detection.
- Improved mobile layout.
- Additional drill-through pages.
- More detailed customer analysis.
- More advanced alerting and notification functionality.
- Performance optimization for larger datasets.

Future improvements should be prioritized according to business value and actual reporting requirements.

---

# 40. Related Repository Artifacts

The Power BI dashboard is supported by the following repository artifacts:

`power-bi/measures/sales-intelligence-measures.dax`

`sql/schema/iNeemaDB_schema.sql`

`documentation/03-solution-architecture.md`

`documentation/04-data-architecture.md`

`documentation/05-data-entry-workflow.md`

`documentation/06-sql-database.md`

`documentation/09-deployment-and-refresh.md`

`documentation/10-testing-and-validation.md`

---

# 41. Dashboard Development Approach

The dashboard was developed incrementally.

The development approach focused on:

1. Establishing the MySQL database.
2. Connecting Power BI to the database.
3. Building the data model.
4. Creating core DAX measures.
5. Building the Homepage.
6. Building sales analysis pages.
7. Adding customer, product, and industry analysis.
8. Adding Pareto analysis.
9. Adding forecasting.
10. Adding interactive filters.
11. Adding navigation and bookmarks.
12. Connecting the published report to the gateway.
13. Configuring scheduled refresh.
14. Testing data flow through the complete reporting pipeline.
15. Refining the dashboard presentation.

This approach allowed technical functionality to be established before focusing on additional visual refinements.

---

# 42. Overall Reporting Flow

The complete reporting process can be summarized as:

**1. Data Entry**

Sales, customer, and product information is entered through the staging/data-entry workflow.

↓

**2. Validation**

Input fields are validated using the configured data-entry controls.

↓

**3. MySQL Database**

Validated records are entered into `iNeemaDB`.

↓

**4. Power BI Connection**

Power BI connects to the MySQL database.

↓

**5. DAX Analytical Layer**

DAX measures calculate KPIs, growth, contribution, ranking, Pareto analysis, and forecasting information.

↓

**6. Power BI Dashboard**

The calculated information is presented through interactive report pages.

↓

**7. Power BI Service**

The report is published for management access.

↓

**8. On-premises Data Gateway**

The gateway provides the connection between Power BI Service and the local MySQL database.

↓

**9. Scheduled Refresh**

The semantic model is refreshed daily at 4:00 PM.

---

# 43. Conclusion

The Power BI dashboard provides the reporting and analytical layer of the i-Neema Sales Intelligence solution.

It connects the structured MySQL database to an interactive management reporting environment.

The current implementation provides:

- Sales performance monitoring.
- Customer analysis.
- Product analysis.
- Industry analysis.
- Growth analysis.
- Year-to-date analysis.
- Quarterly analysis.
- Pareto analysis.
- Forecasting.
- Interactive filtering.
- Dashboard navigation.
- Automated database refresh through the On-premises Data Gateway.

The dashboard is therefore established as an operational reporting solution, with future enhancements focused primarily on expanding analytical capabilities, improving presentation, integrating additional business data, and optimizing the solution as usage and data volume increase.