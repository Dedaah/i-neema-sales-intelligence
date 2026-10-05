# Limitations and Future Improvements

## 1. Overview

The i-Neema Sales Intelligence solution is currently functional and deployed for operational sales reporting.

The solution successfully connects the data-entry workflow to MySQL and Power BI, with an On-premises Data Gateway providing connectivity between the local database environment and Power BI Service.

However, the current implementation has limitations that should be considered when evaluating the solution and planning future development.

These limitations are primarily related to:

- Infrastructure.
- Data-entry processes.
- Automation.
- Data quality.
- Refresh reliability.
- Security.
- Scalability.
- Monitoring.
- Advanced analytics.

The limitations do not prevent the current solution from functioning, but they identify areas that can be improved as the business and reporting requirements grow.

---

# 2. Current System Strengths

Before documenting limitations, it is important to distinguish between limitations and completed functionality.

The current solution already provides:

- Centralized sales storage in MySQL.
- Structured customer data.
- Structured product data.
- Structured sales transaction data.
- Foreign-key relationships.
- Google Sheets data-entry workflow.
- Data validation.
- Entry-status tracking.
- Email notification automation.
- Power BI reporting.
- DAX-based business calculations.
- Forecast analysis.
- Power BI Service deployment.
- On-premises Data Gateway connectivity.
- Encrypted MySQL gateway connection.
- Daily scheduled refresh.
- Manual refresh capability.
- Refresh-history monitoring.
- End-to-end validation.

The future improvements documented below are therefore intended to strengthen an already functioning system rather than replace a failed implementation.

---

# 3. Limitation: Local MySQL Database

The current MySQL database is hosted in the local environment.

This creates a dependency on the local infrastructure.

If the computer or environment hosting MySQL is unavailable, Power BI may not be able to retrieve new data during refresh.

This is different from a fully cloud-hosted database where the database infrastructure can remain available independently of an individual user's computer.

### Impact

The local deployment can affect:

- Availability.
- Refresh reliability.
- Remote administration.
- Disaster recovery.
- Scalability.

### Future Improvement

A future version could move the MySQL database to an appropriate managed or always-on server environment.

Possible options could include:

- Cloud-hosted MySQL.
- Dedicated company server.
- Virtual machine.
- Managed database service.

The selected option should be based on cost, security, reliability, and company policy.

---

# 4. Limitation: Gateway Dependency

Power BI Service currently depends on the On-premises Data Gateway to access the local MySQL database.

The gateway is operational and has been successfully tested, but it introduces another component that must remain available.

The current gateway is:

`i-Neema-PowerBI-Gateway`

### Impact

A gateway problem can prevent Power BI Service from refreshing the semantic model.

A gateway connectivity failure was encountered during implementation:

`DM_GWPipeline_Client_GatewayUnreachable`

### Future Improvement

Future infrastructure improvements could include:

- Dedicated gateway infrastructure.
- Gateway monitoring.
- Gateway failure notifications.
- Redundant gateway architecture where appropriate.
- Migration to a cloud database that reduces or removes the gateway dependency.

---

# 5. Limitation: Scheduled Refresh Dependency

The current system uses a daily scheduled refresh at:

**4:00 PM UTC/GMT**

The scheduled refresh works through the gateway and MySQL connection.

However, scheduled refresh depends on the availability of the underlying infrastructure.

### Impact

If the required local environment or gateway is unavailable when the refresh runs, the refresh may fail.

### Future Improvement

The system could be improved through:

- Refresh-failure alerts.
- Automated monitoring.
- More frequent refresh schedules where justified.
- An always-available database environment.
- Automated operational checks.

---

# 6. Limitation: Manual Monitoring

Although Power BI Service provides refresh history, the current solution still relies on manual monitoring to identify and investigate some refresh issues.

The project does not currently include a dedicated automated monitoring dashboard for infrastructure health.

### Impact

A failed refresh may not be identified immediately unless someone checks Power BI Service or receives an available platform notification.

### Future Improvement

A future monitoring solution could track:

- Gateway status.
- Refresh success/failure.
- Refresh duration.
- Database availability.
- Data-load errors.
- Number of records loaded.

Automated alerts could then notify the responsible person when a refresh fails.

---

# 7. Limitation: Google Sheets as the Data Entry Layer

Google Sheets currently acts as the staging and data-entry environment.

This approach provides flexibility and is suitable for the current project scope, but it is not equivalent to a dedicated transactional application.

### Impact

Potential issues include:

- Manual data-entry errors.
- Accidental changes.
- Duplicate entries.
- Inconsistent user behaviour.
- Dependence on spreadsheet structure.
- Limited transaction-level controls.

### Future Improvement

A future system could use:

- A web-based data-entry application.
- A controlled internal form.
- A database application.
- A low-code business application.
- A dedicated sales-entry interface.

The database would remain the central storage layer.

---

# 8. Limitation: Manual Data Quality Management

Data validation has been implemented, but some data-quality issues still require human review.

Issues encountered during development included:

- Duplicate records.
- Product inconsistencies.
- Date-format problems.
- Product ID inconsistencies.
- Duplicate sales transactions.

### Impact

Poor source data can affect:

- Sales totals.
- Product analysis.
- Customer analysis.
- Forecasting.
- Management decisions.

### Future Improvement

Data-quality controls could be strengthened through:

- Automated duplicate detection.
- Database validation rules.
- Standardized product master management.
- Automated exception reports.
- Data-quality dashboards.
- Validation before records are loaded into production tables.

---

# 9. Limitation: Duplicate Transaction Risk

FactSales contains individual sales transaction records.

During development, duplicate sales records were identified.

This demonstrated that duplicate transaction entry is a realistic data-quality risk.

### Impact

Duplicate transactions can artificially increase:

- Sales.
- Quantity sold.
- Customer revenue.
- Product revenue.
- Forecasting inputs.

### Future Improvement

Future versions could introduce:

- Transaction identifiers.
- Duplicate-detection logic.
- Submission IDs.
- Invoice numbers.
- Database uniqueness rules where appropriate.
- Automated duplicate warnings.

The correct approach will depend on how i-Neema's sales and invoicing processes operate.

---

# 10. Limitation: Product Master Management

The current DimProduct table contains:

- ProductID.
- ProductCategory.

Product names are not stored separately because the current product IDs are sufficiently descriptive for the project.

This keeps the current model simple.

However, as the product portfolio grows, product IDs may not always be sufficient for user-friendly reporting.

### Future Improvement

A future product master could include:

- ProductID.
- ProductName.
- ProductCategory.
- ProductBrand.
- ProductStatus.
- Unit of Measure.
- Supplier.
- Standard Cost.
- Selling Price.

This should only be implemented if the business requires the additional information.

---

# 11. Limitation: Customer Master Information

The current customer dimension contains:

- CustomerID.
- CustomerName.
- Industry.

This is sufficient for the current reporting requirements.

However, management may eventually require additional customer-level analysis.

### Future Improvement

Potential additional fields could include:

- Customer location.
- Region.
- Customer type.
- Account manager.
- Customer status.
- Contact information.
- Customer segment.
- Acquisition date.

Any additional customer information should be implemented only where there is a clear business requirement.

---

# 12. Limitation: Limited Sales Transaction Attributes

The current FactSales table focuses on the core sales information:

- SalesDate.
- CustomerID.
- ProductID.
- Quantity.
- SalesAmount.

This is sufficient for the current sales-intelligence dashboard.

However, future management reporting may require more transaction detail.

### Future Improvement

Possible future fields could include:

- Invoice number.
- Sales representative.
- Sales channel.
- Discount.
- Unit price.
- Cost.
- Gross profit.
- Gross margin.
- Region.
- Sales order number.
- Payment status.

These additions would support more detailed profitability and commercial analysis.

---

# 13. Limitation: Profitability Analysis

The current dashboard focuses primarily on sales performance.

Sales revenue does not necessarily represent profitability.

A product or customer generating high revenue may not necessarily generate the highest profit.

### Future Improvement

If cost data becomes available, the reporting model could be extended to include:

- Cost of goods sold.
- Gross profit.
- Gross margin.
- Profit by product.
- Profit by customer.
- Profit by industry.
- Profit by salesperson.

This would allow management to evaluate both revenue and profitability.

---

# 14. Limitation: Inventory Integration

The current Sales Intelligence solution does not yet include a complete inventory-management system.

Sales reporting therefore focuses on sales transactions rather than real-time stock availability.

### Future Improvement

A future inventory module could include:

- Inventory master.
- Opening stock.
- Purchases.
- Sales.
- Stock adjustments.
- Transfers.
- Closing stock.
- Reorder levels.
- Safety stock.
- Stock valuation.

The inventory system could then be connected to the sales database.

---

# 15. Limitation: Lead and Opportunity Management

The current solution is primarily focused on sales transactions.

It does not yet provide a complete CRM-style lead and opportunity pipeline.

### Future Improvement

A future sales pipeline module could track statuses such as:

- New.
- Contacted.
- Qualified.
- Proposal Sent.
- Negotiation.
- Won.
- Lost.

Additional analysis could include:

- Lead conversion rate.
- Pipeline value.
- Opportunity ageing.
- Win rate.
- Sales-cycle duration.
- Pipeline by salesperson.
- Pipeline by industry.

---

# 16. Limitation: Limited Marketing Integration

Marketing information is not currently integrated directly into the sales database.

Marketing performance may involve separate sources such as:

- LinkedIn.
- Instagram.
- TikTok.
- Email/newsletter activity.

### Future Improvement

A future marketing data model could integrate:

- Campaigns.
- Impressions.
- Clicks.
- Engagement.
- Leads.
- Campaign spend.
- Sponsored performance.
- Organic performance.

This could allow management to analyze the relationship between marketing activity and sales outcomes.

---

# 17. Limitation: Forecasting

Forecasting has been incorporated into the Power BI analysis.

However, the current forecast should be treated as a planning and analytical aid rather than a guaranteed prediction.

Forecast quality depends heavily on:

- Historical sales volume.
- Data quality.
- Seasonality.
- Business changes.
- Market conditions.
- Product availability.
- Customer behaviour.

### Future Improvement

Forecasting could be improved through:

- Longer historical datasets.
- Better seasonality analysis.
- Product-level forecasting.
- Customer-level forecasting.
- Industry-level forecasting.
- External business variables.
- More advanced statistical models.
- Machine-learning forecasting where justified.

---

# 18. Limitation: External Business Factors

The current sales model primarily uses internal sales information.

It does not automatically incorporate external variables that may affect sales.

Examples include:

- Commodity prices.
- Mining activity.
- Exchange rates.
- Economic conditions.
- Major customer projects.
- Industry demand.
- Competitor activity.

### Future Improvement

Where reliable data is available, selected external variables could be incorporated into advanced analysis and forecasting.

---

# 19. Limitation: Dashboard Scope

The current dashboard focuses primarily on sales intelligence.

It provides analysis such as:

- Sales performance.
- Customer performance.
- Product performance.
- Industry performance.
- Growth.
- Forecasting.

### Future Improvement

The platform could eventually expand into a broader management information system covering:

- Sales.
- Marketing.
- Inventory.
- Finance.
- HR.
- Leads.
- Customer relationship management.

Expansion should be driven by business priorities rather than adding complexity without a clear purpose.

---

# 20. Limitation: User Access Management

The dashboard is deployed through Power BI Service.

However, the current project does not yet document a full enterprise access-control structure for different management roles.

### Future Improvement

Future access management could include role-based access such as:

- CEO.
- Management.
- Sales.
- Marketing.
- Finance.
- Technical.
- HR and Administration.

Power BI Row-Level Security could also be introduced where different users need access to different subsets of information.

---

# 21. Limitation: No Formal Production Change Management Process

The current project is still being developed and refined.

Changes to:

- DAX.
- SQL.
- Power BI visuals.
- Database structures.
- Data-entry workflows.

are currently managed as part of the project development process.

### Future Improvement

A more formal production process could include:

1. Development environment.
2. Testing environment.
3. Production environment.
4. Change approval.
5. Version control.
6. Deployment documentation.
7. Rollback procedures.

---

# 22. Limitation: Limited Automated Testing

The current project has been tested manually.

Manual testing was useful for validating the initial solution, but it becomes less efficient as the system grows.

### Future Improvement

Automated tests could be introduced for:

- SQL data integrity.
- Duplicate detection.
- Referential integrity.
- DAX calculation validation.
- Data refresh.
- Data-quality rules.

This would reduce the amount of manual testing required after future changes.

---

# 23. Limitation: Backup and Recovery

The project documentation and SQL/DAX artifacts are maintained in GitHub.

However, the overall production environment still requires a formal backup and disaster-recovery strategy.

### Future Improvement

A complete backup strategy should consider:

- MySQL database backups.
- Backup frequency.
- Backup retention.
- Off-site storage.
- Restore testing.
- Power BI configuration.
- Gateway recovery.
- Recovery-key protection.

A backup should also be periodically restored in a test environment to confirm that it is usable.

---

# 24. Limitation: Dependence on Correct User Procedures

The current solution depends partly on users following the established data-entry workflow.

Examples include:

- Selecting the correct CustomerID.
- Selecting the correct ProductID.
- Entering valid quantities.
- Entering correct sales dates.
- Using the correct submission status.

### Future Improvement

User training and controlled data-entry interfaces can reduce this dependency.

Future interfaces could use:

- Mandatory fields.
- Automated lookups.
- Conditional validation.
- Error messages.
- Duplicate warnings.
- Approval workflows.

---

# 25. Limitation: Data Volume and Performance

The current dataset is suitable for the current project scope.

However, database and Power BI performance should be monitored as transaction volume increases.

### Future Improvement

If the dataset becomes significantly larger, improvements could include:

- Database indexing.
- Query optimization.
- Data-model optimization.
- Incremental refresh.
- Aggregation tables.
- Dedicated database infrastructure.
- Data warehouse architecture.

These changes should be introduced when actual performance requirements justify them.

---

# 26. Limitation: Current Architecture Is Still Evolving

The current architecture was designed to meet the project's immediate business requirements while keeping cost and complexity under control.

It is therefore not intended to represent a final enterprise data platform.

The architecture may evolve as:

- Data volume increases.
- More departments use the system.
- More dashboards are introduced.
- More automation is required.
- Security requirements increase.
- Management reporting requirements expand.

---

# 27. Future Improvement: Centralized Data Platform

A future version could evolve from the current MySQL database into a broader centralized data platform.

Possible architecture:

**Operational Data Sources**

↓

**Central Database / Data Warehouse**

↓

**Transformation / Data Quality Layer**

↓

**Semantic Model**

↓

**Power BI**

This would make it easier to integrate multiple business functions while maintaining a controlled analytical layer.

---

# 28. Future Improvement: Automated Data Pipeline

The current data flow includes several manual steps.

A future implementation could automate more of the pipeline.

Potential flow:

**Data Entry**

↓

**Validation**

↓

**Automated Database Load**

↓

**Data Quality Checks**

↓

**Power BI Refresh**

↓

**Monitoring / Alerts**

This would reduce manual intervention and improve consistency.

---

# 29. Future Improvement: Automated Refresh Alerts

A future monitoring system could send notifications when:

- A scheduled refresh fails.
- The gateway becomes unavailable.
- The database connection fails.
- Data quality checks fail.
- Expected data is not received.

This would allow issues to be addressed before management relies on outdated information.

---

# 30. Future Improvement: Data Quality Dashboard

A dedicated data-quality dashboard could monitor:

- Duplicate records.
- Missing CustomerIDs.
- Missing ProductIDs.
- Invalid dates.
- Missing sales amounts.
- Unexpected product categories.
- Unmapped customers.
- Unmapped products.
- Data-entry status.

This would make data quality visible rather than relying only on manual database checks.

---

# 31. Future Improvement: Business KPI Expansion

The current dashboard provides core sales KPIs.

Future KPIs could include:

### Sales

- Revenue.
- Quantity.
- Average transaction value.
- Growth.
- YTD performance.

### Customers

- New customers.
- Active customers.
- Customer growth.
- Customer revenue contribution.
- Customer retention.

### Products

- Top products.
- Product growth.
- Product contribution.
- Product profitability.

### Commercial Performance

- Gross profit.
- Gross margin.
- Discount rate.
- Sales conversion.
- Pipeline value.

---

# 32. Future Improvement: Executive Alerting

The dashboard could eventually include automated alerts for significant business events.

Examples include:

- Sales falling below a defined threshold.
- Major customer revenue decline.
- Significant product decline.
- Unusual sales increase.
- Forecast shortfall.
- Low inventory.
- Failed refresh.

This could help management focus on exceptions rather than continuously checking every metric.

---

# 33. Future Improvement: Mobile Reporting

Power BI Service can provide access to reports across supported devices.

Future dashboard development could place additional emphasis on mobile-friendly executive reporting.

The mobile experience could prioritize:

- Revenue.
- Growth.
- Forecast.
- Top customers.
- Top products.
- Critical alerts.

The objective would be to provide management with quick access to important information without requiring the full desktop report layout.

---

# 34. Future Improvement: Cloud Migration

If the organization requires higher availability and reduced infrastructure dependency, the database could eventually be moved to a cloud environment.

Potential benefits include:

- Higher availability.
- Remote administration.
- Reduced dependence on a local computer.
- Improved scalability.
- Easier integration with cloud services.

Potential considerations include:

- Cost.
- Security.
- Internet dependency.
- Data governance.
- Migration complexity.

Cloud migration should therefore be evaluated based on actual business requirements.

---

# 35. Future Improvement: Dedicated Infrastructure

If the system remains on-premises, a dedicated server could be considered.

A dedicated server could host:

- MySQL.
- Gateway.
- Database backups.
- Supporting services.

This would reduce dependence on an individual analyst's workstation.

---

# 36. Future Improvement: Stronger Security Controls

As more departments use the system, security requirements may increase.

Future security improvements could include:

- Role-based access.
- Row-Level Security.
- Dedicated service accounts.
- Strong password policies.
- Credential rotation.
- Network restrictions.
- Database auditing.
- Secure backup storage.
- Formal access reviews.

---

# 37. Future Improvement: Formal Documentation Governance

The current project documentation establishes the technical and business foundation.

As the solution grows, documentation should be maintained as part of the normal development process.

Future documentation could include:

- Data dictionary.
- API documentation.
- User manuals.
- Administration guide.
- Disaster recovery guide.
- Change log.
- Data-quality rules.
- Security procedures.
- Deployment procedures.

---

# 38. Future Improvement: Data Dictionary

A formal data dictionary would provide a centralized description of each database field.

For example:

| Table | Field | Description | Data Type |
|---|---|---|---|
| DimCustomer | CustomerID | Unique customer identifier | VARCHAR |
| DimCustomer | CustomerName | Customer name | VARCHAR |
| DimCustomer | Industry | Customer industry | VARCHAR |
| DimProduct | ProductID | Unique product identifier | VARCHAR |
| DimProduct | ProductCategory | Product classification | VARCHAR |
| FactSales | SalesDate | Date of sale | DATE |
| FactSales | CustomerID | Customer associated with transaction | VARCHAR |
| FactSales | ProductID | Product associated with transaction | VARCHAR |
| FactSales | Quantity | Quantity sold | INT |
| FactSales | SALESAMOUNT | Sales value | DECIMAL |

This would make the database easier to maintain and hand over to another analyst or developer.

---

# 39. Future Improvement: Business Ownership

As the system becomes more important to the organization, clear ownership should be established.

Potential responsibilities could include:

### Business Owner

Responsible for:

- KPI definitions.
- Business priorities.
- Reporting requirements.

### Data Owner

Responsible for:

- Data quality.
- Master data.
- Data governance.

### Technical Owner

Responsible for:

- Database.
- Gateway.
- Power BI.
- Technical maintenance.

Clear ownership reduces ambiguity when problems occur.

---

# 40. Future Improvement: User Training

Future users should receive training covering:

- Data-entry procedures.
- Customer selection.
- Product selection.
- Entry status.
- Notification process.
- Dashboard navigation.
- Filters.
- KPI interpretation.

Training should emphasize that dashboard accuracy depends on the quality of the source data.

---

# 41. Future Improvement: Formal User Acceptance Testing

The current project has undergone functional testing.

A future production rollout should also include formal User Acceptance Testing (UAT).

UAT could involve selected business users from:

- Management.
- Sales.
- Marketing.
- Technical.
- HR and Administration.

Users would validate that the system answers the business questions they actually need.

---

# 42. Future Improvement: Performance Monitoring

As the database grows, performance should be monitored.

Metrics could include:

- Query execution time.
- Refresh duration.
- Gateway processing time.
- Dashboard load time.
- Database size.
- Number of sales records.

Performance monitoring would provide evidence for deciding when architectural changes are required.

---

# 43. Future Improvement: Advanced Analytics

Once sufficient historical data has accumulated, advanced analytics could be introduced.

Potential applications include:

- Customer lifetime value.
- Customer segmentation.
- Product demand forecasting.
- Sales opportunity scoring.
- Churn analysis.
- Anomaly detection.
- Sales seasonality.
- Cross-selling analysis.

These should be introduced only when the underlying data is sufficiently reliable.

---

# 44. Future Improvement: Machine Learning

Machine-learning techniques could eventually support advanced forecasting or classification tasks.

Potential applications include:

- Sales forecasting.
- Customer churn prediction.
- Lead conversion prediction.
- Product demand prediction.
- Anomaly detection.

Machine learning should not replace basic data-quality controls or sound business analysis.

The quality of the output will depend heavily on the quality and volume of historical data.

---

# 45. Future Improvement: Integration with Other Systems

The architecture could eventually integrate with other business systems.

Potential integrations include:

- Accounting systems.
- CRM systems.
- Inventory systems.
- Procurement systems.
- Marketing platforms.
- HR systems.
- Email systems.

Integration would reduce duplicate data entry and improve consistency between departments.

---

# 46. Future Improvement Priorities

Future improvements should be prioritized according to business value.

A possible priority structure is:

### Priority 1 — Reliability

- Refresh monitoring.
- Gateway monitoring.
- Database backup.
- Recovery procedures.

### Priority 2 — Data Quality

- Duplicate detection.
- Master-data controls.
- Data-quality reporting.
- Automated validation.

### Priority 3 — Business Expansion

- CRM / lead management.
- Inventory.
- Profitability.
- Marketing integration.

### Priority 4 — Infrastructure

- Dedicated server.
- Cloud database.
- Automated pipelines.

### Priority 5 — Advanced Analytics

- Advanced forecasting.
- Machine learning.
- Predictive analytics.

This order should be reviewed as business requirements change.

---

# 47. Recommended Development Direction

The current solution should not be unnecessarily over-engineered.

The recommended development direction is:

**Stabilize → Monitor → Improve Data Quality → Automate → Expand**

This means:

1. Stabilize the existing reporting environment.
2. Monitor refresh and database reliability.
3. Strengthen data-quality controls.
4. Automate repetitive processes.
5. Add new business modules when there is a clear requirement.
6. Introduce advanced analytics when sufficient data is available.

---

# 48. Long-Term Vision

The long-term objective is to evolve the current sales dashboard into a centralized business intelligence platform for i-Neema.

A potential future architecture could include:

**Sales**

**Marketing**

**Inventory**

**CRM / Leads**

**Finance**

**HR**

↓

**Central Data Platform**

↓

**Data Quality and Transformation**

↓

**Business Semantic Models**

↓

**Power BI**

↓

**Management Intelligence**

The current Sales Intelligence project provides the foundation for this potential evolution.

---

# 49. Current Project Position

The project has progressed from a manual reporting concept to a functioning data and reporting pipeline.

The current solution includes:

- Structured data entry.
- Data validation.
- Notification automation.
- Centralized MySQL storage.
- SQL analysis.
- Power BI reporting.
- Forecasting.
- Power BI Service deployment.
- Gateway connectivity.
- Scheduled refresh.
- End-to-end validation.
- Technical documentation.
- GitHub version control.

This provides a practical foundation for future improvements.

---

# 50. Conclusion

The i-Neema Sales Intelligence solution is operational within its current scope.

Its main limitations are associated with the current local infrastructure, gateway dependency, manual data-quality management, limited automation, and the scope of the current sales-focused data model.

These limitations are manageable within the current implementation.

Future improvements should focus first on reliability, data quality, monitoring, and automation before introducing unnecessary architectural complexity.

As the organization's reporting requirements grow, the system can gradually expand to include additional business functions, stronger infrastructure, more advanced analytics, and potentially a centralized cloud or enterprise data platform.

The current project therefore represents both a functioning sales-intelligence solution and a foundation for a broader business intelligence environment at i-Neema.