# 🛒 Walmart Sales Analysis
### End-to-End Data Analytics Project | Python · SQL · Power BI

<div align="center">

![Python](https://img.shields.io/badge/Python-3.10+-3776AB?style=for-the-badge&logo=python&logoColor=white)
![MySQL](https://img.shields.io/badge/MySQL-Database-4479A1?style=for-the-badge&logo=mysql&logoColor=white)
![PowerBI](https://img.shields.io/badge/Power_BI-Dashboard-F2C811?style=for-the-badge&logo=powerbi&logoColor=black)
![Pandas](https://img.shields.io/badge/Pandas-Data_Analysis-150458?style=for-the-badge&logo=pandas&logoColor=white)
![Status](https://img.shields.io/badge/Status-Completed-2ea44f?style=for-the-badge)

</div>

---

## 📌 Repository Name
```
walmart-sales-analysis
```

## 📝 Repository Description
```
End-to-end Walmart sales analysis | Python EDA → MySQL KPI Queries → Power BI Dashboards | Seasonality, Holiday Impact & Economic Risk Analysis
```

---

## 🧠 Business Problem

> **Walmart operates 45 stores across different regions. What drives sales performance — and what's the real impact of holidays, seasonality, and economic conditions like unemployment and inflation?**

This project answers:
- 📅 **When** do sales peak — and why?
- 🏪 **Which stores** perform best, and which carry economic risk?
- 🎄 **Do holidays actually boost sales** — by how much, and in which months?
- 📉 **How do external factors** (unemployment, fuel prices, CPI) affect revenue?

---

## 📊 Key Results at a Glance

| Metric | Result |
|---|---|
| 💰 Total Revenue (2010–2012) | **$6,737.22M** |
| 📅 Avg Weekly Sales | **$1.05M** |
| 🎄 Holiday Sales Lift | **+8% overall** (up to **+42% in November**) |
| 🏆 Top Store (#20) | **$301M** total revenue |
| ⚠️ Highest Economic Risk Store | Store 12 & 28 (Unemployment: 13.12%) |
| 📉 Dec Holiday Anomaly | **-29% lift** (post-Thanksgiving pull-forward) |

---

## 🗂️ Project Structure

```
walmart-sales-analysis/
│
├── 📁 data/
│   ├── Walmart.csv                     # Raw dataset
│   └── walmart_cleaned.csv             # Cleaned output from Python
│
├── 📁 sql/
│   └── walmart_analysis.sql            # All SQL queries + views
│
├── 📁 dashboards/
│   ├── Dashboard_1.png                 # Executive Sales Overview
│   ├── Dashboard_2.png                 # Seasonality & Holiday Analysis
│   └── Dashboard_3.png                 # External Market & Economic Impact
│
├── walmart_sales_analysis.ipynb        # 📓 Python EDA notebook
├── requirements.txt
└── README.md
```

---

## 🔧 Three-Layer Analytics Stack

```
Layer 1: Python (Jupyter Notebook)
    └── Data cleaning, validation, feature engineering, EDA

Layer 2: MySQL
    └── KPI queries, store rankings, holiday lift, SQL Views

Layer 3: Power BI
    └── 3 interactive dashboards with slicers and drill-down
```

---

## 🔍 Project Walkthrough

### 🐍 Layer 1 — Python: Data Cleaning & EDA

**Data Validation**
- Loaded and inspected 6,435 records across 45 stores
- Checked for missing values, duplicates, invalid sales entries
- Enforced business rules: `Weekly_Sales > 0`, `Holiday_Flag ∈ {0,1}`

**Feature Engineering**
- Converted `Date` from string → datetime (`%d-%m-%Y`)
- Extracted `Year`, `Month`, `Month_Name`, `Week` for time intelligence
- Exported cleaned dataset for SQL ingestion

**EDA Visualizations**
- Yearly sales trend line chart
- Monthly seasonality bar chart
- Sales heatmap (Year × Month)
- Weekly sales trend over time
- Holiday vs Non-Holiday average comparison

---

### 🗃️ Layer 2 — MySQL: KPI Analysis & Views

**Core Queries**
| Query | Purpose |
|---|---|
| Yearly Sales Trend | `GROUP BY Year` — YoY performance |
| Monthly Seasonality | `GROUP BY Month` — seasonal patterns |
| Holiday vs Non-Holiday | `AVG` split by `Holiday_Flag` |
| Holiday Lift % | Conditional `AVG` with `NULLIF` division protection |
| Top 10 Stores | `ORDER BY SUM DESC LIMIT 10` |
| Store Rankings | `RANK() OVER` window function |
| Store-Wise Holiday Lift | Per-store lift with `HAVING` data sufficiency guard |

**SQL Views Created**
```sql
vw_yearly_sales          -- Annual performance summary
vw_monthly_seasonality   -- Monthly avg sales pattern
vw_store_performance     -- Store rankings
vw_dim_date              -- Date dimension with Holiday/Regular flag
```

---

### 📊 Layer 3 — Power BI: Interactive Dashboards

#### Dashboard 1 — Walmart Executive Sales Overview
![Executive Dashboard](dashboards/Dashboard_1.png)

**KPI Cards:** Total Sales · Avg Weekly Sales · Avg Holiday Sales · Holiday Lift %  
**Charts:** Annual sales trend · Monthly seasonality bar · Holiday vs Regular donut · Top 10 stores

> *Slicers: Year (2010/2011/2012) · Store*

---

#### Dashboard 2 — Seasonality & Holiday Performance Analysis
![Seasonality Dashboard](dashboards/Dashboard_2.png)

**Highlights:**
- Matrix: Avg weekly sales by Month × Year (with conditional formatting)
- Multi-year monthly trend line (2010–2012 overlay)
- Holiday vs Regular total sales trend
- **Holiday Sales Impact by Month (Lift %)** — November peaks at **+42%**, December shows **-29%** (demand pull-forward effect)

> *Slicers: Year · Store · Date Type (Holiday/Regular)*

---

#### Dashboard 3 — External Market & Economic Impact Analysis
![Economic Dashboard](dashboards/Dashboard_3.png)

**Highlights:**
- Scatter: Sales vs Unemployment (risk zone highlighted at >8%)
- Scatter: Sales vs Fuel Price fluctuations
- Table: Store Economic Exposure Ranking (unemployment-weighted)
- Dual-axis: Sales stability vs CPI trend

> *Slicers: Year · Store*

---

## 💡 Key Business Insights

```
🔴  November holiday lift = +42% — highest impact month by far
🔴  December = -29% lift — customers pull purchases forward to Nov
🟡  Stores 12, 28, 38 face highest economic risk (13.12% unemployment)
🟡  Fuel price shows weak correlation with sales — not a primary driver
🟢  Store 20 leads revenue at $301M — strong operational benchmark
🟢  July and April are peak non-holiday months ($650M and $647M)
🟢  Sales are stable relative to CPI movement — inflation-resilient
```

---

## 🛠️ Tech Stack

```
Python          pandas, numpy, matplotlib, seaborn, pathlib
MySQL 8.0       DDL, DML, Window Functions, Views, LOAD DATA INFILE
Power BI        DAX measures, slicers, matrix, scatter, line/bar charts
```

---

## 🚀 How to Run This Project

**Step 1 — Clone the repository**
```bash
git clone https://github.com/YOUR_USERNAME/walmart-sales-analysis.git
cd walmart-sales-analysis
```

**Step 2 — Install Python dependencies**
```bash
pip install -r requirements.txt
```

**Step 3 — Download the dataset**

📥 Dataset: [Walmart Store Sales — Kaggle](https://www.kaggle.com/datasets/yasserh/walmart-dataset)

Place it at: `data/Walmart.csv`

**Step 4 — Run the Python notebook**
```bash
jupyter notebook walmart_sales_analysis.ipynb
```
> Kernel → Restart & Run All  
> This generates `data/walmart_cleaned.csv`

**Step 5 — Load into MySQL**
```sql
-- Update the INFILE path in walmart_analysis.sql to match your system
-- Then run the full SQL file in MySQL Workbench
```

**Step 6 — Open Power BI**
- Connect to `walmart_cleaned.csv` or MySQL views
- Refresh data model
- Explore all 3 dashboard pages

---

## 📦 Requirements

```
pandas>=1.5.0
numpy>=1.23.0
matplotlib>=3.6.0
seaborn>=0.12.0
jupyter>=1.0.0
```

---

## 🏢 About This Project

This project demonstrates a **real-world, multi-tool analytics workflow** used in industry:

- ✅ Python for data engineering and exploratory analysis
- ✅ SQL for scalable KPI computation and reusable views
- ✅ Power BI for executive-level interactive reporting
- ✅ Business storytelling — every chart answers a real business question

---

## 👤 Author

**G. Pavan Kumar Reddy**

[![LinkedIn](https://img.shields.io/badge/LinkedIn-Connect-0A66C2?style=for-the-badge&logo=linkedin&logoColor=white)](https://linkedin.com/in/pavankumar0415/)
[![GitHub](https://img.shields.io/badge/GitHub-Follow-181717?style=for-the-badge&logo=github&logoColor=white)](https://github.com/Gudurupavankumarreddy)
[![Email](https://img.shields.io/badge/Email-Contact-EA4335?style=for-the-badge&logo=gmail&logoColor=white)](mailto:gudurupavanpavankumarreddy@gmail.com)

---

<div align="center">

*⭐ If this project helped you, give it a star — it helps others find it too!*

</div>
