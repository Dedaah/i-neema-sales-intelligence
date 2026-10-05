# Forecasting

## 1. Forecasting Overview

The i-Neema Sales Intelligence solution includes a forecasting component within Power BI.

The purpose of the forecasting analysis is to provide management with a forward-looking view of expected sales based on historical sales patterns.

Forecasting is presented as an analytical support tool rather than a guarantee of future sales performance.

The forecasting functionality is integrated into the Power BI reporting environment and uses the sales history stored in the MySQL database.

---

## 2. Forecasting Objectives

The forecasting component was developed to:

- Provide an indication of expected future sales.
- Support management planning.
- Extend historical sales analysis into future reporting periods.
- Identify potential seasonal sales patterns.
- Compare historical sales with forecast values.
- Provide a visual representation of expected future performance.
- Support management discussions around sales targets and planning.

---

## 3. Forecasting Data Source

The forecast is based on historical sales information stored in the MySQL database.

The primary source table is:

`factsales`

The relevant fields include:

- `SalesDate`
- `SALESAMOUNT`

The `DimDate` table is used to organize the sales history into reporting periods.

This allows the forecast analysis to work with:

- Months.
- Quarters.
- Years.
- Historical periods.
- Future periods.

---

## 4. Forecasting Approach

The forecasting analysis was implemented in Power BI using the historical sales trend.

The forecast considers historical sales behaviour and seasonal patterns.

The Power BI forecasting functionality was initially reviewed using the built-in forecast capability.

The initial result produced a relatively flat forecast.

The forecasting configuration was therefore refined to account for seasonality.

This produced a forecast that varied across future months rather than assuming that each future month would have approximately the same sales value.

---

## 5. Seasonality

Seasonality refers to recurring patterns in a time series where sales behaviour changes depending on the period.

The forecasting analysis was adjusted to recognize seasonal patterns in the historical sales data.

This is important because sales may not remain constant throughout the year.

A forecast that ignores seasonality can produce an overly simplified representation of future performance.

The refined forecast therefore provides different expected values for different future months.

---

## 6. Forecast Period

The dashboard uses a forecast period to distinguish future forecast months from historical or completed reporting periods.

The forecast period is based on the current reporting year and the available historical sales data.

The forecasting page identifies future periods that require forecast values.

This provides a clear distinction between:

- Actual sales.
- Current reporting-period sales.
- Forecast sales.

---

## 7. Forecast Months

The Power BI model includes a:

`Forecast Months`

measure.

This measure supports the identification of future periods available for forecasting.

The forecast-month logic is used as part of the dashboard's forward-looking analysis.

---

## 8. Forecast Sales Measure

The Power BI model includes a:

`Forecast Sales`

measure.

This measure supports the presentation of forecast values within the forecasting analysis.

The measure is used alongside historical sales information so that users can compare observed sales performance with future forecast values.

---

## 9. Forecast Period Measure

The Power BI model also includes:

`Forecast Period`

This measure supports the identification and display of the forecast reporting period.

It is used to help distinguish forecast information from completed historical periods.

---

## 10. Forecast Visual

The Forecast Analysis page includes a line-based sales trend visual.

The visual allows users to view:

- Historical sales.
- Current sales information.
- Future forecast values.

The visual provides a continuous view of sales performance over time.

This makes it easier to identify the direction and pattern of the forecast.

---

## 11. Forecast Monthly Values

The seasonality-adjusted forecast produced the following future monthly values during development:

| Month | Forecast Sales |
|---|---:|
| August | 364,587.00 |
| September | 579,855.60 |
| October | 629,741.60 |
| November | 588,235.20 |
| December | 95,779.10 |

These values represent the forecast output generated during development and should be treated as forecast estimates rather than confirmed future sales.

---

## 12. Forecast Interpretation

The forecast values demonstrate that expected sales are not necessarily evenly distributed across the remaining months.

The forecast includes higher expected values in some periods and lower expected values in others.

For example:

- September has a higher forecast than August.
- October has a higher forecast than September.
- November remains relatively high.
- December is considerably lower in the forecast output.

This variation reflects the seasonality adjustment used during forecasting.

---

## 13. Forecast vs Actual Sales

The forecasting analysis is designed to allow historical actual sales to be viewed alongside forecast sales.

This distinction is important because actual and forecast values have different meanings.

### Actual Sales

Actual sales represent transactions that have already occurred and have been recorded in the database.

### Forecast Sales

Forecast sales represent estimated future performance based on the forecasting model.

Forecast values should therefore not be interpreted as confirmed transactions.

---

## 14. YTD Sales and Forecasting

The Forecast Analysis page also includes:

`YTD Sales`

This provides the current year-to-date sales position before considering future forecast periods.

The combination of YTD sales and forecast information provides management with a view of:

- Sales achieved so far.
- Remaining forecast period.
- Expected future sales.
- Potential full-period performance.

---

## 15. Average Monthly Sales

The forecast analysis includes:

`Average Monthly Sales`

This provides an additional reference point for interpreting forecast performance.

Average monthly sales can be used to understand the general level of historical or current sales activity and compare that level with forecast periods.

---

## 16. Quarterly Forecast Analysis

The Forecast Analysis page also supports quarterly performance analysis.

This provides another level of aggregation for interpreting the forecast.

Quarterly analysis helps management examine whether forecast activity is concentrated within particular parts of the year.

It also provides a useful comparison against monthly fluctuations.

---

## 17. Month-in-Progress Analysis

The dashboard includes logic for identifying the:

`Month in Progress`

This helps distinguish the current incomplete reporting month from completed historical months.

This distinction is important when interpreting sales trends because a partially completed month should not necessarily be compared directly with a full historical month.

---

## 18. Forecast Labels

The forecast section uses the label:

**Forecast Sales**

This terminology was selected to make the purpose of the values clear.

The dashboard does not use wording such as:

**Projected FY2026**

because the forecast should not be interpreted as a guaranteed full-year projection.

The term "Forecast Sales" more accurately communicates that the values are estimates generated from the available sales history and forecasting configuration.

---

## 19. Forecasting and DAX

The forecasting section is supported by DAX measures within the Power BI analytical layer.

Relevant measures include:

- `Forecast Months`
- `Forecast Period`
- `Forecast Sales`
- `YTD Sales`
- `Average Monthly Sales`
- `Latest Month Sales`
- `Best Sales Month`
- `Weakest Sales Month`
- `Best Sales Quarter`

These measures support the surrounding analytical context of the forecast.

---

## 20. Forecasting and Date Intelligence

The forecast depends on correct date modelling.

The `DimDate` table provides the date context required for:

- Year filtering.
- Quarter filtering.
- Month filtering.
- Year-to-date calculations.
- Previous-year comparisons.
- Forecast-period identification.

Correct date relationships are therefore important for the reliability of the forecasting analysis.

---

## 21. Forecast Filters

The Forecast Analysis page can be investigated using report filters.

Available filters include:

- Year.
- Quarter.
- Month.

These filters allow users to investigate the sales history and forecast within different reporting contexts.

---

## 22. Forecast Analysis Workflow

The forecasting workflow can be summarized as:

**Historical Sales Data**

↓

**Date-Based Aggregation**

↓

**Historical Sales Trend**

↓

**Forecast Configuration**

↓

**Seasonality Adjustment**

↓

**Future Forecast Periods**

↓

**Power BI Forecast Visual**

This workflow allows historical information to be transformed into a forward-looking analytical view.

---

## 23. Forecasting Development Process

The forecasting component was developed incrementally.

The development process included:

1. Reviewing historical monthly sales.
2. Creating the Forecast Analysis page.
3. Adding YTD sales information.
4. Identifying future forecast periods.
5. Testing Power BI's built-in forecasting capability.
6. Reviewing the initial forecast output.
7. Identifying that the initial forecast was relatively flat.
8. Adjusting the forecasting configuration to account for seasonality.
9. Reviewing the resulting monthly forecast values.
10. Refining the dashboard terminology.
11. Presenting the result as Forecast Sales.
12. Integrating the forecast into the wider management dashboard.

---

## 24. Initial Forecasting Result

The initial forecasting configuration produced a relatively flat future trend.

This was not considered sufficiently informative for the intended management analysis because it did not reflect the variation visible in the historical sales pattern.

The forecasting configuration was therefore reviewed and adjusted.

---

## 25. Seasonality-Adjusted Result

After seasonality was incorporated, the forecast produced different values across future months.

The resulting forecast was:

| Month | Forecast Sales |
|---|---:|
| August | 364,587.00 |
| September | 579,855.60 |
| October | 629,741.60 |
| November | 588,235.20 |
| December | 95,779.10 |

This provided a more variable forward-looking trend than the initial flat forecast.

---

## 26. Forecasting Limitations

The forecast has several limitations that should be considered when interpreting the results.

### Historical Dependence

The forecast is based on historical sales behaviour.

If historical patterns do not continue, forecast accuracy may decrease.

### Limited Business Variables

The current forecast is primarily based on sales history.

It does not currently incorporate additional variables such as:

- Marketing campaigns.
- Lead pipeline.
- Customer contracts.
- Inventory availability.
- Product availability.
- Pricing changes.
- Economic conditions.
- Competitor activity.
- Major one-off contracts.

### Data Volume

The accuracy of a forecasting model generally depends partly on the quantity and quality of historical observations available.

As the database grows, more historical information may become available for forecasting.

### Unusual Sales Events

Large one-off transactions can influence historical patterns and therefore affect future forecast values.

Such events should be considered when interpreting forecast results.

---

## 27. Forecasting Data Quality Requirements

Reliable forecasting depends on reliable historical sales data.

Important data-quality requirements include:

- Correct sales dates.
- Correct sales amounts.
- Correct customer IDs.
- Correct product IDs.
- Consistent transaction recording.
- Avoidance of duplicate transactions.
- Accurate historical records.
- Consistent product categorization.

Data-quality issues in the underlying database can affect the resulting forecast.

---

## 28. Forecast Validation

Forecast values should be monitored over time by comparing forecast results with actual sales.

A future enhancement can therefore include forecast-versus-actual analysis.

This would allow management to evaluate:

- Forecast accuracy.
- Forecast error.
- Bias.
- Seasonal assumptions.
- Model performance.

As additional historical forecast and actual data becomes available, the forecasting process can be reviewed and improved.

---

## 29. Future Forecasting Improvements

Potential future improvements include:

- Forecast-versus-actual tracking.
- Forecast accuracy metrics.
- More advanced time-series models.
- Automated seasonality detection.
- Outlier treatment.
- Longer historical training periods.
- Product-level forecasting.
- Customer-level forecasting.
- Industry-level forecasting.
- Category-level forecasting.
- Inventory-aware forecasting.
- Marketing-aware forecasting.
- Lead-pipeline forecasting.
- Scenario analysis.

These improvements should be introduced as the business develops a larger and more reliable historical dataset.

---

## 30. Potential Forecasting Scenarios

Future versions of the solution could support scenario analysis such as:

### Base Scenario

Forecast based on the current historical pattern.

### Growth Scenario

Forecast based on an assumed increase in sales activity.

### Conservative Scenario

Forecast based on lower expected sales activity.

### Business Expansion Scenario

Forecast incorporating expected new customers, products, markets, or sales opportunities.

These scenarios would provide management with additional planning information but would require clearly defined assumptions.

---

## 31. Forecasting Governance

Forecast values should always be presented as estimates.

Users should distinguish between:

**Actual**

Confirmed sales transactions already recorded in the database.

and:

**Forecast**

Estimated future sales generated using the forecasting methodology.

Forecast outputs should not be treated as guaranteed revenue.

---

## 32. Forecasting and Management Decision-Making

The forecasting component is intended to support, not replace, management judgment.

Forecast information can help management consider:

- Expected sales direction.
- Potential seasonal changes.
- Resource requirements.
- Sales planning.
- Inventory planning.
- Business targets.
- Potential performance gaps.

Management should consider other business information alongside the forecast when making decisions.

---

## 33. Current Forecasting Status

| Component | Status |
|---|---|
| Forecast Analysis page | Implemented |
| YTD Sales | Implemented |
| Forecast Period | Implemented |
| Forecast Months | Implemented |
| Forecast Sales | Implemented |
| Average Monthly Sales | Implemented |
| Monthly forecast visual | Implemented |
| Seasonal forecasting configuration | Implemented |
| Forecast terminology refinement | Implemented |
| Forecast-versus-actual tracking | Future enhancement |
| Advanced forecast accuracy metrics | Future enhancement |
| Scenario forecasting | Future enhancement |

---

## 34. Related Repository Artifacts

The forecasting component is supported by:

`power-bi/measures/sales-intelligence-measures.dax`

`documentation/07-power-bi-dashboard.md`

`documentation/04-data-architecture.md`

`documentation/06-sql-database.md`

`sql/schema/iNeemaDB_schema.sql`

These artifacts provide the underlying data model, DAX calculations, and dashboard documentation supporting the forecasting analysis.

---

## 35. Conclusion

The i-Neema Sales Intelligence solution includes a functional forecasting component within Power BI.

The forecast uses historical sales information and was refined to account for seasonal patterns.

The forecasting analysis provides management with a forward-looking view of expected sales while clearly distinguishing forecast estimates from actual recorded sales.

The current implementation provides a useful foundation for future forecasting improvements.

As the sales database grows and more historical data becomes available, the forecasting capability can be expanded to include forecast accuracy measurement, additional business variables, scenario analysis, and more advanced forecasting techniques.