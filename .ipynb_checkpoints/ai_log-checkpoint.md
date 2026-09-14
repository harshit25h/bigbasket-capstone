# AI Assistance Log

## AI Tool Used
ChatGPT

## Purpose of AI Assistance
AI assistance was used to support understanding, debugging, and documentation during the BigBasket capstone project.

## Areas Where AI Was Used

### SQL
- Explained SQL concepts such as SELECT, WHERE, DISTINCT, ORDER BY, LIMIT, IN, BETWEEN, IS NULL, GROUP BY, HAVING, and JOINs.
- Helped debug SQL queries based on the actual database schema.
- Helped construct aggregation, reporting, monthly revenue, and target variance queries.

### Python / Pandas
- Explained Pandas data cleaning concepts and operations.
- Assisted with duplicate removal, text standardization, missing-value handling, outlier detection, capping, date features, merging, and analysis.
- Helped structure the analysis notebook and visualizations.

### Tableau
- Assisted with creating KPI cards, revenue charts, target-status visualizations, filters, and the dashboard.
- Helped troubleshoot calculated fields and dashboard interactions.

### Data Story
- Helped organize findings from the analysis into business insights and recommendations.
- Recommendations were based on the calculated project results.

### Documentation
- Assisted with organizing the project files and preparing README documentation.

## Verification
AI-generated suggestions were tested against the actual project database, SQL outputs, spreadsheet results, Python analysis, and Tableau dashboard. Database-specific values and final results were verified before being included in the project.

## Pandas Analysis Verification

### RCTCF Prompt

**Role:** Act as a senior data analyst reviewing a retail order dataset.

**Context:** The BigBasket capstone dataset contains raw order records and product information. The analysis includes duplicate removal, text standardization, missing-value checks, IQR-based outlier capping, feature engineering, supplier analysis, and visualizations.

**Task:** Review the Pandas analysis and verify whether the cleaning and analysis steps are logically correct.

**Constraints:**
- Do not invent values.
- Use the actual calculated results from the notebook.
- Keep missing revenue amounts as missing.
- Do not delete outlier orders; cap Delivered-order outliers at the IQR upper fence.
- Keep exactly three observations.

**Format:** Provide a concise verification with any issues identified and the corrected approach.

### Verification Result

The Pandas workflow was verified against the actual notebook outputs. The raw dataset contained 508 rows, and removing duplicate order IDs reduced it to 500 rows. City and category values were standardized successfully. Ten `amount_inr` values remained missing and were not filled. Delivered orders with non-missing amounts were used for IQR analysis, producing an upper fence of ₹552.50 and 16 outliers. The outliers were capped rather than removed. Date features, revenue per unit, delivery indicators, category revenue, supplier revenue, and the three required charts were then created successfully.