# Data Analytics & Business Intelligence – Task 2

## Overview

This project performs end-to-end business data analysis using **SQL, Microsoft Excel, and Power BI**. The objective is to combine related sales and customer data, calculate key business KPIs, identify trends, and build an interactive dashboard for decision-making.

## Objectives

* Perform SQL JOIN operations on related datasets
* Calculate business KPIs using SQL
* Analyse data using Excel PivotTables
* Build an interactive Power BI dashboard
* Identify regional, category, customer, discount, and seasonal trends
* Provide actionable business recommendations

## Tools & Technologies

* **SQL / SQLite**
* **Microsoft Excel**
* **Power BI Desktop**
* **CSV**
* **GitHub**

## Project Structure

```text
data-analytics-business-intelligence-task2/
│
├── data/
│   ├── Orders.csv
│   └── Customers.csv
│
├── sql/
│   └── task2_analysis.sql
│
├── excel/
│   └── cleaned_sales_dataSetWithPivot.xlsx
│
├── powerbi/
│   └── task2_dashboard.pbix
│
├── screenshots/
│   └── dashboard_overview.png
│
├── report/
│   └── business_performance_report.pdf
│
└── README.md
```

## Dataset

The project uses sales transaction data containing fields such as:

* Order ID
* Order Date
* Customer
* Customer Segment
* Product Category
* Region
* Sales
* Quantity
* Profit
* Discount

The data was prepared into related **Orders** and **Customers** tables for SQL analysis.

## SQL Analysis

The SQL analysis includes:

* INNER JOIN between Orders and Customers
* Total Sales by Region
* Profit Margin by Category
* Monthly Sales Trend
* Top 5 Customers by Revenue
* Overall Business KPIs
* Customer Segment Analysis
* Discount Impact Analysis
* Seasonal Sales Analysis

## Excel Analysis

Excel was used for:

* Sales by Region and Segment
* Profit by Category and Region
* Monthly Sales Trend
* Top 10 Customers by Sales
* Discount-level classification
* KPI calculations
* Average Order Value analysis

## Power BI Dashboard

The interactive dashboard contains:

### KPI Cards

* Total Sales
* Total Profit
* Profit Margin
* Total Customers

### Visualisations

* Sales by Region
* Profit by Category
* Monthly Sales Trend
* Top Customers
* Sales Distribution by Segment

### Interactive Filters

* Region
* Product Category
* Order Date
* Customer Segment

## Key Business Findings

* **Total Sales:** 2,296,919.49
* **Total Profit:** 286,409.08
* **Profit Margin:** 12.47%
* **Total Orders:** 5,009
* **Total Customers:** 793
* **Average Order Value:** 458.56

Additional findings:

* The **West region** generated the highest revenue.
* **Technology** achieved the highest profit margin at 17.40%.
* The **Consumer segment** generated the highest total sales and profit.
* High-discount transactions produced a **negative profit margin of -37.34%**.
* Sales showed a strong seasonal peak between **September and December**.
* **Sean Miller** was the highest-revenue customer.

## Business Recommendations

* Reduce excessive discounting, particularly high-discount transactions.
* Prioritise high-margin Technology and Office Supplies products.
* Review Furniture pricing and cost structure.
* Strengthen retention efforts for high-value customers.
* Focus on the Consumer segment while maintaining Corporate growth.
* Prepare inventory and marketing campaigns before year-end seasonal demand peaks.

## Deliverables

* SQL query file
* Excel workbook with PivotTable analysis
* Power BI dashboard
* Dashboard screenshot
* Business performance report PDF

## Author

**Adithya Madhupal**

---
