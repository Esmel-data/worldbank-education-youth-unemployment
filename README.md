# worldbank-education-youth-unemployment
End-to-end data analytics project exploring the relationship between secondary school enrollment and youth unemployment across 9 African countries (2000–2023) | Python → SQL → Power BI

# 📊 Education & Youth Unemployment — World Bank Analytics

> Does secondary school enrollment predict youth unemployment?  
> An end-to-end data analytics project across 9 African countries (2000–2023)


## 1. Project Overview

Governments and international institutions invest heavily in secondary education
with the assumption that higher enrollment reduces youth unemployment.
This project tests that assumption using real World Bank data across
9 countries in Sub-Saharan Africa and North Africa over 23 years.

The final deliverable is a 3-page Power BI decision dashboard designed
for non-technical managers and executives, supported by Python data preparation
and SQL analytical queries.


## 2. Dataset

| Attribute        | Details                                              |
|------------------|------------------------------------------------------|
| Source           | World Bank Open Data (manually downloaded by indicator and merged) |
| Rows             | 18,448                                               |
| Columns          | 5 raw → 11 after feature engineering                 |
| Period           | 2000 – 2023                                          |
| Countries        | Egypt, Ethiopia, Ghana, Kenya, Morocco, Nigeria, Senegal, Tanzania, Tunisia |


> ⚠️ The World Bank does not provide a single consolidated file.
> Each indicator was downloaded separately and merged manually using Python.


## 3. Tools & Technologies

| Tool                  | Role in the pipeline                                      |
|-----------------------|-----------------------------------------------------------|
| Python (pandas)   | Data loading, quality audit, cleaning, feature engineering, CSV export |
| SQL (MySQL Workbench) | 10 analytical queries covering all decision-making axes   |
| Power BI          | 3-page decision dashboard with DAX measures and slicers   |
| Gamma             | Executive presentation of the analytical report           |


## 4. Project Steps

1. Data loading & exploration (Python)  
   Loaded the merged World Bank CSV, audited variable types,
   identified missing values and outliers using the IQR method.

2. Cleaning & feature engineering (Python)  
   Filled missing values with country-level medians, capped outliers
   at IQR bounds, renamed all columns to business-friendly snake_case,
   and created 5 new analytical variables:
   `efficiency_ratio`, `schooling_segment`, `unemployment_segment`,
   `education_effort_segment`, `unemployment_variation`.

3. SQL analysis (MySQL Workbench) 
   Imported the clean dataset via SQLAlchemy and ran 10 analytical queries
   covering education-employment correlation, budget efficiency,
   country segmentation, temporal trends, and benchmarking.

4. Decision dashboard (Power BI)  
   Built a 3-page dashboard (Overview / Country Analysis /
   Efficiency & Benchmarking) with 11 DAX measures, 6 synchronized
   slicers, and 14 visuals including KPI cards, scatter plots,
   bar charts, and ranked tables.

5. Report & presentation (Gamma)  
   Produced a professional analytical report and a 12-slide
   executive presentation summarizing key findings and
   business recommendations.


## 5. Dashboard Preview

Page 1 — Overview  
4 KPI cards (avg unemployment 63.95% | avg enrollment 52.14% |
avg education spending 4.75% | 9 countries in critical unemployment)
+ decade trend line chart + unemployment by schooling segment bar chart.

Page 2 — Country Analysis  
Efficiency ratio ranking | Schooling vs unemployment scatter plot |
Segmentation matrix | Top critical countries in 2023.

Page 3 — Efficiency & Benchmarking  
Benchmark country table | Annual variation line chart |
Budget effort vs unemployment bar chart | 4 benchmark countries KPI card.


## 6. Key Results & Insights

1. Higher enrollment does not reduce unemployment mechanically
   Countries with high schooling rates (>80%) average 70.4% youth unemployment —
   higher than low-enrollment countries (61.2%). Curriculum-market alignment matters more.

2. Education spending has no direct short-term effect on employment
   High spenders (>5% GDP) average 65.5% youth unemployment vs 61.8%
   for low spenders. Spending efficiency outweighs spending volume.

3. Nigeria has the worst efficiency ratio (32.74)
   32.74 points of unemployment per GDP point invested in education,
   with only 1.92% average spending — the top priority for policy intervention.

4. Youth unemployment is rising in the 2020s despite enrollment gains 
   Enrollment grew from 45% (2000s) to 62% (2020s) while unemployment
   climbed back to 67.7% — structural gains erased by economic shocks.

5. 4 benchmark countries identified
   Egypt, Kenya, Tunisia, and Morocco combine high enrollment (>82%)
   with contained unemployment (<7%) — models for cross-country
   policy transfer.


## 7. How to Run

**Prerequisites**
- Python 3.8+ with `pandas`, `sqlalchemy`,
- MySQL Workbench (local instance)
- Power BI Desktop (free)

**Steps**
```bash
# 1. Clone the repository
git clone https://github.com/your-username/worldbank-education-youth-unemployment.git
cd worldbank-education-youth-unemployment

# 2. Install Python dependencies
pip install pandas sqlalchemy pymysql

# 3. Run the Python preparation script
jupyter notebook notebooks/eda_cleaning.ipynb

# 4. Import the clean CSV into MySQL
# Update credentials in the notebook then run the SQLAlchemy export cell

# 5. Run SQL queries
# Open MySQL Workbench and execute queries/analytical_queries.sql

# 6. Open the dashboard
# Open dashboard/worldbank_education_emploi.pbix in Power BI Desktop
```

Dataset  
Source: [World Bank Open Data](https://data.worldbank.org/)  
Indicators downloaded separately:
- Secondary school enrollment (gross, %)
- Youth unemployment rate (% of total labor force ages 15–24)
- Government expenditure on education (% of GDP)

---

## Author

ESMEL — Data Analyst  
[LinkedIn](www.linkedin.com/in/esmel-amari) 

Python · SQL · Power BI · Gamma*
