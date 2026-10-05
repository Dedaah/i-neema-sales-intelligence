# Deployment and Refresh

## 1. Deployment Overview

The i-Neema Sales Intelligence solution is deployed using Microsoft Power BI Service with an On-premises Data Gateway connecting the cloud reporting environment to the local MySQL database.

The deployment architecture allows management to access the published Power BI report while the underlying sales data remains stored in the local MySQL environment.

The deployment flow is:

**Google Sheets Data Entry / Staging → MySQL `iNeemaDB` → On-premises Data Gateway → Power BI Service Semantic Model → Published Power BI Report**

---

## 2. Deployment Objectives

The deployment environment was established to:

- Make the Power BI report available through Power BI Service.
- Allow management to access the dashboard remotely.
- Connect Power BI Service to the local MySQL database.
- Enable automated semantic model refresh.
- Keep the MySQL database as the central sales data source.
- Reduce the need for manual report updates.
- Provide a repeatable reporting and refresh process.

---

## 3. Deployment Components

The deployed solution consists of:

| Component | Role |
|---|---|
| Google Sheets | Data entry / staging |
| MySQL `iNeemaDB` | Central database |
| Power BI Desktop | Report development |
| Power BI Semantic Model | Published analytical data model |
| On-premises Data Gateway | Connection between Power BI Service and local MySQL |
| Power BI Service | Cloud reporting and deployment environment |
| Published Power BI Report | Management reporting interface |

---

## 4. Power BI Desktop

Power BI Desktop was used to develop the reporting solution.

Development activities included:

- Connecting to MySQL.
- Loading the required tables.
- Creating the data model.
- Creating the `DimDate` table.
- Building DAX measures.
- Creating report pages.
- Building visuals.
- Adding slicers.
- Adding navigation.
- Adding bookmarks.
- Developing forecasting analysis.
- Testing dashboard behaviour.

The completed report was then published to Power BI Service.

---

## 5. Power BI Service

Power BI Service provides the deployed reporting environment.

The published solution includes a semantic model and report.

The Power BI Service environment provides:

- Remote dashboard access.
- Published report availability.
- Semantic model management.
- Refresh configuration.
- Refresh history.
- Gateway configuration.
- Report sharing and access management.

The Power BI Service therefore acts as the management-facing deployment layer.

---

## 6. Semantic Model

The published Power BI solution uses a semantic model connected to the MySQL database.

The semantic model contains:

- Customer data.
- Product data.
- Sales transaction data.
- Date information.
- DAX measures.
- Analytical calculations.

The semantic model is responsible for making the database information available to the published Power BI report.

The current semantic model is:

`iNeemaDB-Dashboard`

---

## 7. On-premises Data Gateway

An On-premises Data Gateway was installed and configured to allow Power BI Service to access the local MySQL database.

The gateway provides the communication path between the cloud-based Power BI Service and the local database environment.

The gateway is registered as:

`i-Neema-PowerBI-Gateway`

---

## 8. Gateway Installation

The On-premises Data Gateway Standard installation was completed as part of the deployment process.

The installation included:

1. Installing the gateway software.
2. Registering the gateway.
3. Creating the gateway recovery key.
4. Confirming gateway availability.
5. Configuring the MySQL connection.
6. Connecting the Power BI semantic model to the gateway.
7. Testing the connection through refresh activity.

The gateway was successfully brought online and made available for Power BI Service.

---

## 9. Gateway Recovery Key

A gateway recovery key was created during gateway registration.

The recovery key is a security-sensitive configuration item and is not stored in this repository.

The key is required for certain gateway recovery and restoration activities.

For security reasons:

- The recovery key should not be committed to GitHub.
- The recovery key should not be stored in project documentation.
- The recovery key should be kept in a secure location.
- Access should be limited to authorized administrators.

---

## 10. MySQL Connection

The gateway was configured to connect to the local MySQL environment.

The database used by the connection is:

`iNeemaDB`

The connection uses the local MySQL environment and provides access to the database tables required by the Power BI semantic model.

The connection was tested through actual Power BI refresh activity.

---

## 11. Gateway Connection Configuration

The working gateway configuration uses an encrypted MySQL connection.

During troubleshooting, the connection configuration was reviewed and the encryption setting was changed from an unencrypted configuration to an encrypted/TLS configuration.

This resolved the connection issue and allowed the gateway to establish the required connection to MySQL.

---

## 12. Localhost and Database Connection

The MySQL connection was configured using the local database environment.

The connection was established using:

`127.0.0.1`

with:

`iNeemaDB`

as the database.

The working configuration was then mapped to the corresponding Power BI gateway connection.

---

## 13. Semantic Model to Gateway Mapping

The published semantic model was connected to the gateway.

The configured relationship is:

**Power BI Service Semantic Model**

↓

**i-Neema-PowerBI-Gateway**

↓

**MySQL Connection**

↓

**`iNeemaDB`**

This allows the semantic model to retrieve updated data from the local MySQL database during refresh.

---

## 14. Power BI Gateway Data Source

The configured MySQL connection is available to the Power BI gateway environment.

The connection provides access to:

- `dimcustomer`
- `dimproduct`
- `factsales`

and other database objects required by the semantic model.

The Power BI Service uses this gateway connection when the semantic model is refreshed.

---

## 15. Scheduled Refresh

A scheduled refresh was configured for the published semantic model.

The current schedule is:

**Daily at 4:00 PM**

The scheduled refresh allows new or updated records stored in MySQL to become available in the Power BI Service report without requiring the report to be manually rebuilt.

---

## 16. Refresh Process

The refresh process follows:

**New Data Entered**

↓

**Data Stored in MySQL**

↓

**Scheduled Refresh Triggered**

↓

**Power BI Service Contacts Gateway**

↓

**Gateway Connects to MySQL**

↓

**Semantic Model Refreshes**

↓

**Updated Data Available in Report**

This process allows the dashboard to operate using the live database as its central source.

---

## 17. Manual Refresh

Manual refresh was also tested during deployment.

A manual refresh can be initiated from Power BI Service when immediate validation is required.

Manual refresh was particularly useful during deployment testing and troubleshooting.

It allowed the project to confirm that:

- The gateway was operational.
- The MySQL connection was working.
- The semantic model could retrieve updated data.
- New database records appeared in the report.

---

## 18. Refresh History

Power BI Service provides refresh history for monitoring scheduled and manual refresh activity.

Refresh history was reviewed during deployment and troubleshooting.

The refresh history provides information that can be used to determine whether a refresh:

- Succeeded.
- Failed.
- Was manually triggered.
- Was completed at the expected time.

Refresh history is therefore an important monitoring mechanism for the deployed solution.

---

## 19. Gateway Connectivity Issue

During implementation, a scheduled refresh failure was encountered.

The error included:

`DM_GWPipeline_Client_GatewayUnreachable`

The failure indicated that Power BI Service was unable to complete the expected gateway connection during that refresh attempt.

The issue was investigated rather than assuming that the underlying database or dashboard was faulty.

---

## 20. Gateway Troubleshooting

The troubleshooting process included reviewing:

- Gateway status.
- Gateway availability.
- MySQL connection configuration.
- Localhost connection settings.
- Database selection.
- Encryption settings.
- Power BI semantic model connection.
- Refresh history.

The gateway itself was confirmed to be online and running.

The MySQL connection configuration was then reviewed.

---

## 21. Encryption Configuration

During troubleshooting, the MySQL gateway connection was reviewed.

The connection was initially configured without encryption.

The connection was subsequently changed to use:

**Encrypted / TLS**

This adjustment allowed the gateway connection to operate correctly.

The successful refresh following the configuration change confirmed that the connection was functioning.

---

## 22. Successful Refresh Validation

After the gateway and connection configuration were corrected, a manual refresh was completed successfully.

The Power BI Service showed:

**Latest refresh successful**

This provided evidence that the deployment chain was operational.

---

## 23. New Data Validation

The deployment was also tested using newly added database records.

New:

- Customers.
- Products.
- Sales transactions.

were added to the underlying data environment.

After the database was updated and the semantic model refreshed, the new information appeared in Power BI.

This confirmed the end-to-end reporting flow.

---

## 24. End-to-End Deployment Test

The complete deployment test followed this sequence:

1. Add or update data.
2. Store the information in MySQL.
3. Trigger a Power BI refresh.
4. Power BI Service communicates with the gateway.
5. Gateway connects to MySQL.
6. Semantic model retrieves the updated information.
7. Report visuals update.
8. New information becomes available through the published dashboard.

The successful test demonstrated that the deployed architecture was operational.

---

## 25. Refresh Reliability

Refresh reliability depends on several components operating correctly.

These include:

- Local computer availability.
- MySQL Server availability.
- MySQL connection configuration.
- On-premises Data Gateway availability.
- Network connectivity.
- Power BI Service availability.
- Correct gateway credentials.
- Correct semantic model configuration.

A failure in any of these components may prevent a scheduled refresh from completing successfully.

---

## 26. Local Environment Dependency

Because the current MySQL database is hosted locally, the Power BI Service depends on the local environment being available when a scheduled refresh occurs.

The gateway must also be running and connected.

This means the deployment is not completely independent of the local computer and network environment.

---

## 27. Scheduled Refresh Considerations

The daily 4:00 PM refresh requires:

- The gateway to be online.
- The MySQL Server to be available.
- The local environment to have the required connectivity.
- The gateway connection to remain valid.
- Power BI Service to be able to communicate with the gateway.

If any required component is unavailable, the refresh may fail.

---

## 28. Refresh Monitoring Procedure

The recommended monitoring process is:

1. Open Power BI Service.
2. Open the relevant workspace.
3. Open the semantic model.
4. Review refresh history.
5. Confirm the latest scheduled refresh status.
6. Check the gateway status if a refresh fails.
7. Review the error message.
8. Test the database connection where required.
9. Trigger a manual refresh if appropriate.
10. Confirm that updated data appears in the report.

---

## 29. Refresh Failure Response

When a scheduled refresh fails, the following checks should be performed:

### Step 1: Check Gateway Status

Confirm that:

`i-Neema-PowerBI-Gateway`

is online and running.

### Step 2: Check MySQL

Confirm that MySQL Server is running and that `iNeemaDB` is accessible.

### Step 3: Check Connection Configuration

Review:

- Server address.
- Database name.
- Credentials.
- Encryption settings.

### Step 4: Check Semantic Model

Confirm that the semantic model is still mapped to the correct gateway connection.

### Step 5: Review Refresh History

Check the detailed refresh error.

### Step 6: Manual Refresh

Run a manual refresh after correcting any identified issue.

### Step 7: Validate Updated Data

Confirm that the latest records appear in the report.

---

## 30. Deployment Security

The deployed solution contains several security-sensitive components.

These include:

- MySQL credentials.
- Power BI credentials.
- Gateway credentials.
- Gateway recovery key.
- Power BI Service access.
- Database access.

Sensitive credentials are not stored in this repository.

The repository contains technical documentation and configuration descriptions rather than passwords, recovery keys, or private authentication information.

---

## 31. GitHub Security

The following items should not be committed to GitHub:

- Database passwords.
- Gateway recovery keys.
- Power BI credentials.
- Private authentication tokens.
- Personal access tokens.
- Private customer information.
- Production credentials.
- Confidential business data.

The repository is intended to document the architecture and development process without exposing sensitive information.

---

## 32. Deployment Status

The current deployment includes:

| Component | Status |
|---|---|
| Power BI Desktop report | Deployed |
| Power BI Service | Configured |
| Semantic model | Configured |
| On-premises Data Gateway | Installed |
| Gateway registration | Completed |
| Gateway status | Online |
| MySQL connection | Configured |
| Encrypted connection | Configured |
| Semantic model mapping | Completed |
| Manual refresh | Successfully tested |
| Scheduled refresh | Configured |
| New-data refresh test | Successfully completed |
| Refresh monitoring | Established |

---

## 33. Current Deployment Architecture

The deployed architecture can be summarized as:

**Data Entry / Staging**

↓

**MySQL `iNeemaDB`**

↓

**Local MySQL Environment**

↓

**On-premises Data Gateway**

`i-Neema-PowerBI-Gateway`

↓

**Power BI Service Semantic Model**

`iNeemaDB-Dashboard`

↓

**Published Power BI Report**

↓

**Management Users**

---

## 34. Current Deployment Limitations

The current deployment has several limitations.

### Local Database Dependency

The MySQL database remains hosted in the local environment.

### Gateway Dependency

Power BI Service requires the On-premises Data Gateway to be available for database refresh.

### Network Dependency

Scheduled refresh depends on the required network connectivity being available.

### Manual Administration

Some gateway and database administration activities remain manual.

### Refresh Monitoring

Although scheduled refresh is configured, refresh failures still require monitoring and investigation.

---

## 35. Future Deployment Improvements

Potential future improvements include:

- Moving MySQL to a managed cloud database.
- Implementing a dedicated always-on server.
- Improving automated monitoring.
- Adding refresh failure notifications.
- Implementing centralized infrastructure monitoring.
- Reducing dependence on a personal/local computer.
- Improving disaster recovery.
- Implementing stronger database backup procedures.
- Introducing automated deployment processes.
- Establishing formal production administration procedures.

These improvements should be evaluated based on cost, security, reliability, and business requirements.

---

## 36. Disaster Recovery Considerations

The deployment environment should maintain appropriate recovery procedures for:

- MySQL database.
- Power BI reports.
- Semantic model configuration.
- Gateway configuration.
- Gateway recovery key.
- DAX measures.
- SQL schema.
- Project documentation.

The repository provides a technical backup of important development artifacts, including:

- SQL schema.
- DAX measures.
- Architecture documentation.
- Business requirements.
- Data-entry workflow documentation.
- Power BI documentation.

Sensitive authentication information is intentionally excluded.

---

## 37. Deployment Testing

Deployment testing confirmed that:

- The gateway could connect to MySQL.
- Power BI Service could access the database through the gateway.
- The semantic model could refresh.
- New customer records could reach Power BI.
- New product records could reach Power BI.
- New sales records could reach Power BI.
- Dashboard visuals updated after successful refresh.
- Scheduled refresh was configured successfully.

These tests demonstrate that the deployed reporting pipeline is functional.

---

## 38. Operational Monitoring

Ongoing monitoring should focus on:

- Gateway status.
- MySQL availability.
- Scheduled refresh status.
- Refresh history.
- Database data quality.
- Power BI Service availability.
- Dashboard accessibility.

Regular monitoring will help identify issues before they significantly affect management reporting.

---

## 39. Deployment and Refresh Workflow

The operational workflow is:

**1. Data Entry**

New or updated business information is entered.

↓

**2. Database Update**

Validated information is stored in MySQL.

↓

**3. Scheduled Refresh**

Power BI Service initiates the daily refresh.

↓

**4. Gateway Connection**

The On-premises Data Gateway connects Power BI Service to MySQL.

↓

**5. Semantic Model Refresh**

The semantic model retrieves the updated database information.

↓

**6. Dashboard Update**

Power BI visuals and calculations reflect the refreshed data.

↓

**7. Management Access**

Users view the updated dashboard through Power BI Service.

---

## 40. Conclusion

The i-Neema Sales Intelligence solution has been successfully deployed to Power BI Service with an On-premises Data Gateway providing connectivity to the local MySQL database.

The deployment includes:

- A published Power BI report.
- A configured semantic model.
- A registered On-premises Data Gateway.
- A working MySQL connection.
- Encrypted gateway connectivity.
- Daily scheduled refresh at 4:00 PM.
- Manual refresh capability.
- Refresh monitoring.
- End-to-end data validation.

A gateway connectivity issue was encountered during implementation and investigated. The MySQL gateway connection was subsequently configured using encrypted/TLS connectivity, after which a successful refresh was completed.

The deployment is therefore operational, while continued monitoring is required to maintain refresh reliability.

Future improvements can focus on reducing local infrastructure dependency, improving monitoring and alerting, strengthening backup and disaster recovery, and potentially moving the database to a more highly available environment.