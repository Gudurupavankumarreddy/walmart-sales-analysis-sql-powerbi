# Walmart Sales Analysis – SQL & Power BI

## 📌 Project Overview
This project presents an **end-to-end data analytics solution** built on Walmart’s historical weekly sales data.  
The analysis focuses on understanding **sales trends, seasonality, holiday impact, and store-level performance** using an **industry-style workflow**.

All **core business logic, aggregations, and analytics are performed using SQL**, while **Power BI** is used exclusively for visualization and reporting.

---

## 🎯 Business Objectives
- Analyze long-term sales trends and performance
- Identify seasonal patterns in weekly sales
- Measure the impact of holidays on revenue
- Rank stores based on total sales contribution
- Deliver executive-ready KPIs and dashboards

---

## 🛠 Tech Stack
- **SQL (MySQL)** – Data modeling, aggregations, window functions, analytical views  
- **Power BI** – Interactive dashboards and KPI reporting  
- **Python (Pandas)** – Data validation and initial data understanding  

---

## 🔄 Project Workflow

### 1️⃣ Data Validation (Python)
- Loaded raw Walmart sales data
- Validated schema, data types, and missing values
- Converted date fields for time-based analysis
- Ensured data quality before analytics

> Python was used only for validation and understanding, following industry best practices.

---

### 2️⃣ SQL Analytics & Business Logic
- Designed relational schema in MySQL
- Loaded cleaned data into the database
- Performed all **business aggregations using SQL**, including:
  - Yearly sales trend analysis
  - Monthly sales seasonality analysis
  - Holiday vs non-holiday sales comparison
  - Store-wise revenue aggregation
  - Store ranking using **window functions**
- Created reusable **SQL views** as a semantic layer for reporting

> SQL served as the **primary analytics engine** for this project.

---

### 3️⃣ SQL Queries Implemented
The following production-style SQL logic was implemented:

- Yearly total sales aggregation using `GROUP BY YEAR(Date)`
- Monthly seasonality analysis using `GROUP BY MONTH(Date)`
- Holiday vs non-holiday sales comparison using conditional aggregation
- Store ranking using `RANK() OVER (ORDER BY SUM(Weekly_Sales) DESC)`
- Store-wise holiday lift calculation
- Reusable reporting views:
  - `vw_yearly_sales`
  - `vw_monthly_seasonality`
  - `vw_store_performance`

---

### 4️⃣ Data Export for Reporting
- SQL views were exported as CSV files
- This approach ensures:
  - Portability of the dataset
  - Lightweight Power BI model
  - Clear separation of analytics and visualization layers

---

### 5️⃣ Visualization (Power BI)
- Imported SQL-generated CSV views into Power BI
- Built an executive-level Power BI dashboard featuring business KPIs and insights including:
  - Total Sales KPI
  - Average Weekly Sales KPI
  - Yearly Sales Trend (2010–2012)
  - Monthly Sales Seasonality
  - Top 10 Stores by Total Sales
  - Store Performance Ranking table

> Power BI was used strictly as a **visualization and presentation layer**.

---

## 📊 Key Insights
- Sales peaked in **2011** and declined in **2012**
- **December** shows the highest average weekly sales due to holiday demand
- Top 10 stores contribute a significant share of total revenue
- Holiday weeks generate approximately **8% higher average sales** than non-holiday weeks

---

## 📁 Repository Structure

walmart-sales-analysis-sql-powerbi/
├── data/
│ ├── walmart_raw.csv
│ ├── vw_yearly_sales.csv
│ ├── vw_monthly_seasonality.csv
│ └── vw_store_performance.csv
│
├── sql/
│ ├── walmart_schema.sql
│ ├── walmart_analysis_queries.sql
│ └── walmart_views.sql
│
├── powerbi/
│ └── walmart_sales_dashboard.pbix
│
├── notebook/
│ └── walmart_data_validation.ipynb
│
├── images/
│ └── dashboard_preview.png
│
└── README.md

