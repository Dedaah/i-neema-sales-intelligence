# SQL Procedures

No stored procedures are currently implemented in the i-Neema Sales Intelligence database.

The project currently uses direct SQL queries for:

- Data exploration
- Filtering
- Sorting
- Pattern matching
- Data-quality checks
- Database validation

Stored procedures may be introduced in a future development phase if recurring database operations require reusable server-side logic.

## Current Approach

The current database architecture prioritizes simplicity and maintainability. SQL queries are documented in the `sql/queries/` directory, while the database structure is documented in the `sql/schema/` directory.