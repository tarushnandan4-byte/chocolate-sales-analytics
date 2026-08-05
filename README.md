# chocolate-sales-analytics
End-to-end sales analytics pipeline built using Excel (Power Query & Pivot Tables) for data cleaning and exploratory analysis, SQL for querying aggregations, and an interactive Power BI dashboard featuring DAX measures and Star Schema data modeling.
---
# 🍫 Chocolate Sales & Revenue Analytics

## 📊 Executive Summary
An end-to-end data analytics project evaluating **$52.3M in enterprise revenue**, SKU performance drivers, sales representative concentration risks, and marketing channel ROI.

---

## 🛠️ Data Pipeline & Technical Architecture

### 1. Data Cleaning & Transformation (Microsoft Excel & Power Query)
* **Data Auditing & Cleaning:** Extracted raw datasets, resolved null values, adjusted data types, and standardized date formats using Power Query.
* **Exploratory Analysis:** Built dynamic Pivot Tables for initial spot-checking, revenue aggregation, and baseline validation.

### 2. Relational Querying & Validation (Microsoft SQL Server)
* Engineered SQL scripts to audit key business dimensions prior to BI reporting.
* Executed ranking queries using window functions (`DENSE_RANK`, `PARTITION BY`) to determine top-performing products, salesperson contributions, and regional distribution.

### 3. Data Modeling & Interactive Visuals (Power BI)
* **Data Modeling:** Designed an optimized **Star Schema** with clear fact-dimension table relationships (`FactSales`, `DimProduct`, `DimSalesrep`, `DimDate`).
* **DAX Formulas:** Formulated explicit DAX measures for core KPIs including Total Revenue ($52.3M), YoY Growth (+4.0%), ROAS (5.53x), and custom conditional formatting logic.
* **Dashboard Design:** Created an executive, high-contrast dark espresso palette layout optimized for quick visual scanning and C-suite reporting.

---

## 🖼️ Dashboard Preview

![Chocolate Sales Dashboard Preview](./dashboard_screenshot.png)

---

## 💡 Key Business Insights

1. **SKU Revenue Concentration:** Top 3 SKUs (*70% Dark Bar*, *Mixed Assortment*, and *Truffle Gift Box*) account for over **63%** of enterprise sales ($33.4M).
2. **Sales Rep Risk:** Lead rep *Arjun Mehta* generated **$17.8M** (34% of total revenue), presenting significant single-agent concentration risk.
3. **Marketing Efficiency:** Wholesale channel achieved the highest **5.53x ROAS**, making it the top candidate for reallocated ad spend.

---

### 📜 Copyright & Portfolio Disclaimer
© 2026 Tarush Nandan. All rights reserved. This repository and its contents are part of my personal data analytics portfolio for demonstration purposes only.
### 📜 Copyright & Portfolio Disclaimer
© 2026 Tarush Nandan. All rights reserved. This repository and its contents are part of my personal data analytics portfolio for demonstration purposes only.
