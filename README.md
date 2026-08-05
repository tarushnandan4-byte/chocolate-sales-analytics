# chocolate-sales-analytics
End-to-end sales analytics pipeline built using Excel (Power Query & Pivot Tables) for data cleaning and exploratory analysis, SQL for querying aggregations, and an interactive Power BI dashboard featuring DAX measures and Star Schema data modeling.
---

```mermaid```

flowchart LR
    A["🟢 Microsoft Excel<br>Power Query & EDA"] --> B["🔵 Microsoft SQL Server<br>Queries & Aggregations"]
    B --> C["🟡 Power BI Desktop<br>Star Schema & DAX"] **Enter**
**```** **Enter**



# 🍫 Chocolate Sales & Revenue Analytics

## 📊 Executive Summary
An end-to-end data analytics project evaluating **$52.3M in enterprise revenue**, product portfolio efficiency, seasonal trends, and salesforce performance. 

Key analytical highlights include identifying **cash cow products** (e.g., *70% Dark Chocolate Bar*), isolating **zombie SKUs** with low velocity, uncovering a major **Q4 seasonal demand spike**, and pin-pointing **underperforming sales staff** to optimize resource allocation and revenue growth.

---

## 🛠️ Data Pipeline & Technical Architecture

### 1. Data Cleaning & Exploratory Analysis (Microsoft Excel)
* **Data Auditing & Cleaning:** Extracted raw datasets, resolved and handled missing values across **700+ cells**, adjusted data types, and standardized date formats using **Power Query**.
* **Exploratory Data Analysis (EDA):** Built dynamic **Pivot Tables** and integrated **Slicers** for interactive cross-filtering, quick spot-checking, revenue aggregation, and rapid preliminary insights.

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

