# BigBasket Capstone Project

## Project Overview

This project analyzes BigBasket order data using SQL, Python/Pandas, Google Sheets/Excel, and Tableau Public.

The objective is to clean and analyze order-level data, calculate category and monthly revenue performance, compare actual revenue with category targets, and present the findings through an interactive Tableau dashboard.

---

## Business Questions

The analysis focuses on:

1. What are the overall order and revenue patterns?
2. Which product categories generate the most revenue?
3. How does each category perform against its revenue target?
4. How does revenue change month by month?
5. Which categories require attention?
6. What business actions can be recommended from the analysis?

---

## Dataset

The project uses the following data:

- `orders_raw.csv` — raw order-level data
- `products.csv` — product and category information
- `bigbasket_capstone.db` — SQLite database containing the project tables

The SQLite database contains:

- `products` — 31 rows
- `customers` — 50 rows
- `orders` — 500 rows
- `category_targets` — 6 rows

Order status counts:

- Delivered: 434
- Cancelled: 42
- Pending: 24

---

## Tools Used

- Python
- Pandas
- SQLite
- SQL
- Google Sheets / Excel
- Tableau Public
- Matplotlib
- GitHub

---

# SQL Analysis

The SQL analysis is divided into three files.

### `01_foundations.sql`

Demonstrates foundational SQL concepts:

- SELECT
- WHERE
- DISTINCT
- ORDER BY
- LIMIT
- AS
- IN
- BETWEEN
- NOT BETWEEN
- IS NULL

### `02_aggregation_joins.sql`

Demonstrates:

- INNER JOIN
- LEFT JOIN
- GROUP BY
- COUNT
- SUM
- AVG
- HAVING

### `03_reporting.sql`

Contains:

- Product revenue tiers
- Monthly category revenue
- Category target variance
- Percentage variance
- Target status classification

### `verify.sql`

Contains database verification queries for table row counts and order status counts.

---

# Key SQL Results

Total delivered revenue:

**₹88,282**

Delivered orders:

**434**

Category revenue:

| Category | Revenue |
|---|---:|
| Household Essentials | ₹21,715 |
| Personal Care | ₹16,382 |
| Bakery | ₹15,410 |
| Dairy & Eggs | ₹14,090 |
| Snacks & Beverages | ₹10,895 |
| Fruits & Vegetables | ₹9,790 |

---

# Target Performance

| Category | Revenue | Target | Variance | Status |
|---|---:|---:|---:|---|
| Household Essentials | ₹21,715 | ₹17,000 | ₹4,715 above | Above Target |
| Personal Care | ₹16,382 | ₹15,500 | ₹882 above | Above Target |
| Bakery | ₹15,410 | ₹12,000 | ₹3,410 above | Above Target |
| Dairy & Eggs | ₹14,090 | ₹16,500 | ₹2,410 below | Below Target - Watch |
| Snacks & Beverages | ₹10,895 | ₹13,000 | ₹2,105 below | Below Target - Critical |
| Fruits & Vegetables | ₹9,790 | ₹12,000 | ₹2,210 below | Below Target - Critical |

**3 out of 6 categories met or exceeded their targets.**

---

# Spreadsheet Analysis

The Excel/Google Sheets workbook contains:

- `Monthly Data`
- `Category Targets`
- `Pivot`
- `Category Summary`

The Category Summary calculates:

- Revenue
- Target
- Variance
- Percentage variance
- Target status
- Reconciliation with the SQL results

The reconciliation checks confirmed that the category revenue values match the SQL results.

---

# Python / Pandas Analysis

The Python analysis is contained in:

`analysis.ipynb`

The analysis includes:

- Loading raw order and product data
- Initial data inspection
- `info()` and `describe()`
- Status distribution
- Duplicate detection and removal
- City and category standardization
- Missing amount analysis
- Outlier detection
- Outlier capping
- Date feature creation
- Revenue per unit
- Delivered-order analysis
- Product and supplier analysis
- Matplotlib visualizations
- Business observations

---

# Tableau Dashboard

The Tableau Public dashboard contains:

- Monthly revenue trend
- Category revenue comparison
- Target performance by category
- Total Revenue KPI
- Delivered Orders KPI
- Average Order Value KPI
- Categories Meeting Target KPI
- Interactive filtering

### Tableau Public Dashboard

[View the Interactive Tableau Dashboard](PASTE-YOUR-TABLEAU-PUBLIC-LINK-HERE)

---

# Data Story

## Overall Performance

The business generated **₹88,282 in delivered revenue from 434 delivered orders**, with an average order value of approximately **₹203.4**.

Overall target performance was mixed, with **3 of 6 categories meeting or exceeding their targets**.

## Category Performance

**Household Essentials** was the strongest category, generating **₹21,715**, which was **₹4,715 above its target**.

**Personal Care** and **Bakery** also exceeded their targets by **₹882** and **₹3,410**, respectively.

**Dairy & Eggs** was below target by **₹2,410**, placing it in the **Below Target - Watch** category.

**Snacks & Beverages** and **Fruits & Vegetables** were classified as **Below Target - Critical**, with shortfalls of **₹2,105** and **₹2,210**, respectively.

## Recommendations

### 1. Improve critical underperforming categories

Focus on **Fruits & Vegetables** and **Snacks & Beverages**, which are both below target by more than 15%.

Promotions, product bundles, and improved product visibility could be used to increase delivered revenue in these categories.

### 2. Build on Household Essentials performance

Continue investing in **Household Essentials**, the strongest category with revenue of **₹21,715** and a **₹4,715 positive variance** against its target.

Successful products from this category could also be cross-sold with products from weaker categories.

---

# Project Files

```text
generate_data.py
bigbasket_capstone.db
orders_raw.csv
products.csv
verify.sql

01_foundations.sql
02_aggregation_joins.sql
03_reporting.sql
monthly_category_revenue.csv

bigbasket_analysis.xlsx
analysis.ipynb

ai_log.md
README.md