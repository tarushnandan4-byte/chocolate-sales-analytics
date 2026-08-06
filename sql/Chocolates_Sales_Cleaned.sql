/*
===============================================================================
PROJECT      : Chocolate Sales & Revenue Performance Analytics
AUTHOR       : Tarush Nandan
TOOLS USED   : Excel (Power Query, Pivot Tables) | SQL Server (SSMS) | Power BI
DATA PIPELINE: 
  1. Excel / Power Query : Initial Data Cleaning, Type Casting & Deduplication
  2. Excel Pivot Tables  : Exploratory Data Analysis (EDA) & Validation
  3. SQL Server (SSMS)   : Advanced Aggregations, Window Functions & Fact Views
  4. Power BI            : Interactive Dashboarding & Strategic Insights
===============================================================================
*/

use ChocolateProject;
GO

-- ============================================================================
-- STEP 1: INFRASTRUCTURE / BI DATA PREPARATION LAYER
-- ============================================================================

CREATE OR ALTER VIEW FactSales AS
SELECT 
    Salesperson,
    Country,
    Product,
    Order_Date,
    YEAR(Order_Date) AS Order_Year,
    MONTH(Order_Date) AS Order_Month,
    DATENAME(month, Order_Date) AS Month_Name,
    Boxes_Shipped,
    Price_per_Box,
    Amount,
    Marketing_Spend,
    Channel,
    Discount_Pct
FROM Chocolates_Sales_cleaned;
GO

-- Sanity Checks
SELECT TOP 1000 * FROM FactSales;
Go

SELECT 
    COUNT(*) AS Total_Rows,
    ROUND(SUM(Amount), 2) AS Overall_Total_Revenue
FROM Chocolates_Sales_cleaned;
Go 
-- ============================================================================
-- STEP 2: MACRO LEVEL (Overall Company Annual Performance)
-- ============================================================================

SELECT 
    YEAR(order_date) AS [Year],
    ROUND(SUM(amount), 2) AS [Total_Revenue],
    SUM(Boxes_Shipped) AS [Boxes_Shipped],
    ROUND(SUM(marketing_spend), 2) AS [Marketing_Spend],
    ROUND(AVG(Discount_Pct) * 100, 2) AS [Avg_Discount_Pct]
FROM Chocolates_Sales_cleaned
WHERE YEAR(order_date) IN (2022, 2023)
GROUP BY YEAR(order_date)
ORDER BY [Year];

/*
MACRO INSIGHTS:
- Overall revenue grew from $50.28M (2022) to $52.28M (2023).
- Total boxes shipped increased from 13.6M to 14.2M.
- Marketing spend was reduced slightly while revenue increased, showing improved overall efficiency.
*/


-- ============================================================================
-- STEP 3: MID-LEVEL (Geographic & Channel Breakdown)
-- ============================================================================

-- 3A. Geographic Performance
SELECT 
    country,
    YEAR(order_date) AS sales_year,
    COUNT(*) AS total_orders,
    SUM(boxes_shipped) AS total_boxes,
    ROUND(SUM(amount), 2) AS total_revenue
FROM chocolates_sales_cleaned
GROUP BY country, YEAR(order_date)
ORDER BY country ASC, sales_year DESC;

/* GEOGRAPHIC INSIGHTS:
- Market Leaders: Australia ($21.55M) and Brazil ($18.68M) drive over 75% of total revenue.
- Universal Growth: All regions achieved positive YoY revenue growth in 2023.
- Top Growth Rate: Japan led in growth percentage at +6.60% YoY ($2.74M -> $2.92M).
- Order Efficiency: Australia's orders dropped slightly (-2.5%), but revenue and box volume grew, showing larger average order sizes.
*/


-- 3B. Channel & ROAS Performance
SELECT
    Channel,
    YEAR(Order_Date) AS Sales_Year,
    COUNT(*) AS TotalOrders,
    ROUND(SUM(Marketing_Spend), 2) AS TotalMarketingSpend,
    ROUND(SUM(Amount), 2) AS TotalRevenue,
    ROUND(SUM(Amount) - SUM(Marketing_Spend), 2) AS NetProfit,
    ROUND(SUM(Amount) / NULLIF(SUM(Marketing_Spend), 0), 2) AS ROAS
FROM Chocolates_Sales_cleaned
GROUP BY Channel, YEAR(Order_Date)
ORDER BY TotalRevenue DESC;

/*
CHANNEL INSIGHTS:
- Retail brings in the most total revenue ($27.4M in 2023).
- Wholesale is the most efficient channel with a 6.8x ROAS.
*/


-- ============================================================================
-- STEP 4: MICRO LEVEL (Products & Sales Rep Performance)
-- ============================================================================

-- 4A. Top 10 Products Overall
SELECT *
FROM (
    SELECT
        product,
        ROUND(SUM(amount), 2) AS Total_revenue,
        SUM(boxes_shipped) AS Total_boxes,
        ROUND(AVG(price_per_box), 2) AS Avg_price,
        DENSE_RANK() OVER (ORDER BY SUM(amount) DESC) AS rnk
    FROM chocolates_sales_cleaned
    GROUP BY product
) t
WHERE rnk <= 10;

/*
PRODUCT INSIGHTS:
- "70% Dark Bar" is the #1 top-selling product overall ($26.3M).
- The top 3 products generate the vast majority of company revenue.
*/


-- 4B. Top 10 Salespeople (2022)
SELECT TOP 10
    Salesperson,
    ROUND(SUM(amount), 2) AS Total_Revenue_2022,
    SUM(boxes_shipped) AS Total_Boxes,
    ROUND(AVG(price_per_box), 2) AS Avg_Price
FROM chocolates_sales_cleaned
WHERE YEAR(Order_Date) = 2022
GROUP BY Salesperson
ORDER BY Total_Revenue_2022 DESC;


-- 4C. Top 10 Salespeople (2023)
SELECT TOP 10
    Salesperson,
    ROUND(SUM(amount), 2) AS Total_Revenue_2023,
    SUM(boxes_shipped) AS Total_Boxes,
    ROUND(AVG(price_per_box), 2) AS Avg_Price
FROM chocolates_sales_cleaned
WHERE YEAR(Order_Date) = 2023
GROUP BY Salesperson
ORDER BY Total_Revenue_2023 DESC;

/*
SALESPERSON INSIGHTS:
- Arjun Mehta is the top salesperson in both years, bringing in ~$17.7M in 2023.
- The top 10 rankings remained identical between 2022 and 2023.
*/










