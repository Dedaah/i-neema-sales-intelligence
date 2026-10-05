# Data Entry Workflow

## 1. Workflow Overview

The i-Neema Sales Intelligence solution uses a controlled spreadsheet-based workflow for collecting new sales, customer, and product information before the information is entered into the central MySQL database.

The workflow is designed to improve data consistency, reduce manual errors, provide visibility over submitted records, and support communication between the people entering information and the person responsible for maintaining the database.

The overall workflow is:

**Data Entry → Validation → Submission → Notification → Review → MySQL Entry → Power BI Refresh**

---

## 2. Data Entry Platform

The current data-entry workflow uses Google Sheets as the staging and submission environment.

Google Sheets was selected because it provides:

- Familiar spreadsheet-based data entry.
- Easy access for authorized users.
- Shared access.
- Controlled data validation.
- Simple collaboration.
- Integration with Google Apps Script.
- A practical low-cost approach for the current project.

The Google Sheets workbook contains separate areas for sales transactions, customers, and products.

---

## 3. Workbook Structure

The main data-entry areas are:

- `FactSales`
- `DimCustomer`
- `DimProduct`

Each section serves a different purpose.

### FactSales

Stores new sales transaction information.

### DimCustomer

Stores new customer master information.

### DimProduct

Stores new product master information.

The separation of these areas reflects the structure of the MySQL database.

---

## 4. FactSales Data Entry

The `FactSales` data-entry area captures sales transactions.

The main fields are:

| Field | Purpose |
|---|---|
| `SalesDate` | Date of the sales transaction |
| `CustomerID` | Customer associated with the sale |
| `ProductID` | Product associated with the sale |
| `Quantity` | Quantity sold |
| `SalesAmount` | Monetary value of the sale |
| `Entry Status` | Current processing status |
| `Notification` | Notification method or status |
| `Notes` | Additional information about the entry |

The transaction information is later used to populate the MySQL `factsales` table.

---

## 5. Customer Data Entry

The customer-entry workflow is used when a new customer needs to be added to the system.

The customer information includes:

- Customer ID.
- Customer name.
- Industry.
- Entry status.

The customer record is reviewed before being added to the MySQL `dimcustomer` table.

This process helps ensure that new customers are not added directly to the reporting database without basic validation.

---

## 6. Product Data Entry

The product-entry workflow is used when a new product needs to be added to the system.

The product information includes:

- Product ID.
- Product category.
- Entry status.

The product record is reviewed before being added to the MySQL `dimproduct` table.

Maintaining products separately from sales transactions helps ensure that the product master list remains controlled.

---

## 7. Customer ID Validation

The FactSales workflow uses controlled Customer ID selection.

Customer IDs are linked to the customer master list through spreadsheet data validation.

This reduces the possibility of users manually entering:

- Incorrect customer IDs.
- Misspelled customer IDs.
- Customer IDs that do not exist.
- Inconsistent customer identifiers.

The Customer ID selected in a sales transaction should correspond to an existing customer in the customer master data.

---

## 8. Product ID Validation

The FactSales workflow also uses controlled Product ID selection.

Product IDs are linked to the product master list through spreadsheet data validation.

This reduces the possibility of users entering:

- Incorrect product IDs.
- Misspelled product IDs.
- Products that do not exist.
- Inconsistent product identifiers.

The Product ID selected in a sales transaction should correspond to a valid product in the product master data.

---

## 9. Entry Status

The data-entry workflow uses an `Entry Status` field to track the processing stage of records.

The current status values are:

- `New`
- `Submitted`
- `Reviewed`
- `Entered into SQL`

These statuses provide visibility into where each record is within the data-entry process.

### New

The record has been entered but has not yet been submitted for processing.

### Submitted

The record has been submitted and requires review or further processing.

### Reviewed

The record has been checked and approved for database entry.

### Entered into SQL

The record has been successfully entered into the MySQL database.

---

## 10. Notification Control

The workflow includes a `Notification` field.

The available options include:

- `None`
- `Email`
- `WhatsApp`
- `Email + WhatsApp`

The field provides a way to indicate how the relevant submission should be communicated.

The current automated notification process primarily uses email.

---

## 11. Notes Field

A `Notes` field is included in the sales-entry workflow to provide additional context when required.

Examples of information that may be recorded include:

- Clarification about a transaction.
- Special customer information.
- Product information requiring review.
- Corrections or follow-up information.
- Other information relevant to processing the record.

The notes field is intended to support communication and review without altering the core transaction fields.

---

## 12. Data Submission Workflow

The general submission process is:

1. The user enters the required information.
2. Customer and Product IDs are selected from controlled lists.
3. The user checks the information entered.
4. The `Entry Status` is changed to `Submitted`.
5. The notification workflow detects the submission.
6. An automated email notification is generated.
7. The responsible person reviews the submitted information.
8. Corrections are made where necessary.
9. Approved records are entered into MySQL.
10. The record status is updated to `Entered into SQL`.

---

## 13. Google Apps Script Automation

Google Apps Script is used to automate notifications within the data-entry workflow.

The script monitors relevant status columns and responds when a record reaches the appropriate submission status.

The current automation covers:

- New customer submissions.
- New product submissions.
- FactSales submissions.

The automation reduces the need for users to manually send notification emails whenever new records are submitted.

---

## 14. Notification Trigger Logic

The notification automation uses status changes as triggers.

The workflow monitors the relevant status fields.

For example:

### FactSales

When the FactSales status changes to:

`Submitted`

the automation generates the relevant notification.

### New Customers

When the customer-entry status changes to:

`Pending`

the automation generates the relevant notification.

### New Products

When the product-entry status changes to:

`Pending`

the automation generates the relevant notification.

The exact trigger logic is maintained within the Google Apps Script implementation.

---

## 15. Notification Workflow

The automated notification process follows this sequence:

**User submits record**

↓

**Status changes to submission status**

↓

**Apps Script detects the status change**

↓

**Notification email is generated**

↓

**Responsible person receives notification**

↓

**Record is reviewed**

↓

**Approved record is entered into MySQL**

This process creates a simple communication layer between data entry and database administration.

---

## 16. Data Review Process

Submitted records should be reviewed before being entered into the MySQL database.

The review process should confirm:

- Customer ID is valid.
- Product ID is valid.
- Sales date is valid.
- Quantity is reasonable and correctly entered.
- Sales amount is correctly entered.
- Customer information is accurate.
- Product information is accurate.
- Required fields are complete.
- Duplicate records are not being introduced.

Where a problem is identified, the record should be corrected before database entry.

---

## 17. MySQL Entry

Once a record has been reviewed and approved, the information is entered into the appropriate MySQL table.

The destination depends on the type of record.

| Data Type | MySQL Destination |
|---|---|
| New customer | `dimcustomer` |
| New product | `dimproduct` |
| Sales transaction | `factsales` |

The database provides additional structural controls through primary keys, foreign keys, required fields, and data types.

---

## 18. Relationship Between Data Entry and Power BI

The data-entry workflow does not connect directly to the Power BI dashboard.

Instead, the workflow follows this structure:

**Google Sheets**

↓

**MySQL**

↓

**Power BI**

This approach keeps MySQL as the central reporting data source.

Power BI therefore reads the structured database rather than relying directly on the spreadsheet used for data entry.

---

## 19. Power BI Refresh After Data Entry

After new information has been entered into MySQL, Power BI can retrieve the updated information during its refresh process.

The current reporting architecture uses the On-premises Data Gateway to connect Power BI Service to the local MySQL database.

The scheduled refresh is configured for:

**Daily at 4:00 PM**

The overall process is:

1. New information is entered into the data-entry workflow.
2. The information is reviewed.
3. Approved information is entered into MySQL.
4. Power BI Service initiates the scheduled refresh.
5. The On-premises Data Gateway connects Power BI Service to MySQL.
6. Updated data is retrieved.
7. The Power BI semantic model is refreshed.
8. Updated information becomes available in the published dashboard.

---

## 20. Data Quality Controls

The workflow contains several controls designed to improve data quality.

These include:

- Customer ID dropdown validation.
- Product ID dropdown validation.
- Separate customer master data.
- Separate product master data.
- Entry status tracking.
- Submission notifications.
- Review before database entry.
- MySQL primary keys.
- MySQL foreign keys.
- Required database fields.
- Data type validation.

These controls work together to reduce errors entering the reporting database.

---

## 21. Notification Testing

The notification workflow has been tested using submissions from the different data-entry areas.

Testing was performed for:

- New customer submissions.
- New product submissions.
- FactSales submissions.

The tests confirmed that the notification automation responds to the relevant submission events and generates the expected notification.

---

## 22. Current Workflow Status

The major components of the data-entry workflow have been implemented.

| Component | Status |
|---|---|
| FactSales data-entry sheet | Implemented |
| Customer data-entry sheet | Implemented |
| Product data-entry sheet | Implemented |
| Customer ID validation | Implemented |
| Product ID validation | Implemented |
| Entry Status | Implemented |
| Notification field | Implemented |
| Notes field | Implemented |
| Apps Script notification automation | Implemented |
| Customer notification testing | Completed |
| Product notification testing | Completed |
| FactSales notification testing | Completed |
| MySQL database workflow | Implemented |
| Power BI refresh connection | Implemented |

---

## 23. Current Workflow Limitations

The current workflow provides a practical solution for the project's present requirements, but it has some limitations.

These include:

- Spreadsheet-based data entry still requires manual user input.
- Approved records still require database-entry procedures.
- Notification automation currently focuses primarily on email.
- The workflow depends on users following the defined status process.
- Data quality still depends partly on human review.
- A larger number of users may require stronger workflow and permission controls.

---

## 24. Future Workflow Improvements

Possible future improvements include:

- Direct database-connected data-entry applications.
- Automated insertion of approved records into MySQL.
- Automated duplicate detection.
- Automated data-quality validation.
- More advanced approval workflows.
- Role-based permissions.
- Expanded notification channels.
- Integration with Microsoft Forms, Power Apps, or another controlled input application where appropriate.
- Automated audit history for changes.
- Automated error reporting.
- Integration with additional business workflows.

Any future improvement should be evaluated based on cost, usability, security, maintenance requirements, and expected business value.

---

## 25. Workflow Summary

The current data-entry workflow provides a controlled path from business data entry to reporting.

The complete process is:

**Data Entry**

↓

**Validation**

↓

**Submission**

↓

**Automated Notification**

↓

**Review**

↓

**MySQL Database**

↓

**Power BI Refresh**

↓

**Updated Dashboard**

This workflow provides a practical foundation for maintaining the accuracy and timeliness of the i-Neema Sales Intelligence reporting environment.

---

## 26. Related Documentation

The data-entry workflow is supported by the following project documentation:

- `documentation/02-business-requirements.md`
- `documentation/03-solution-architecture.md`
- `documentation/04-data-architecture.md`
- `documentation/06-sql-database.md`
- `documentation/09-deployment-and-refresh.md`
- `documentation/10-testing-and-validation.md`

The workflow automation is implemented using Google Apps Script alongside the Google Sheets data-entry environment.