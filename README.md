# Retail Sales & Business Performance Analytics

## Project Overview

This project focuses on analyzing retail sales data to identify business trends, evaluate profitability, and generate meaningful insights using Python, MySQL, and Tableau.

The project uses the Sample Superstore dataset to perform data cleaning, exploratory data analysis, SQL-based analysis, and interactive data visualization.

## Objectives

- Analyze overall sales and profit performance.
- Identify the best-performing product categories.
- Compare sales and profitability across regions.
- Understand monthly and yearly sales trends.
- Analyze the relationship between discounts and profit.
- Identify top-performing and loss-making products.
- Build an interactive business performance dashboard.

## Tools & Technologies

| Tool | Purpose |
|---|---|
| Python | Data analysis and preprocessing |
| Pandas | Data manipulation |
| NumPy | Numerical operations |
| Matplotlib & Seaborn | Data visualization |
| Jupyter Notebook | Python analysis |
| MySQL | Database management |
| SQL | Business data analysis |
| Tableau Desktop | Interactive dashboard |

## Dataset

- Dataset: Sample Superstore
- Original Records: 9,994
- Original Columns: 21
- Processed Columns: 27

The dataset contains information about orders, customers, products, sales, discounts, profits, shipping, and geographical regions.

## Project Workflow

### 1. Data Cleaning & Preprocessing
- Loaded and inspected the dataset using Pandas.
- Checked for missing values and duplicate records.
- Converted date columns into appropriate formats.
- Created additional features such as Order Year, Order Month, Shipping Days, and Profit Margin.
- Exported the cleaned dataset.

### 2. Exploratory Data Analysis
Performed analysis to understand:
- Overall sales and profit.
- Category-wise performance.
- Regional performance.
- Monthly sales trends.
- Discount and profit relationship.
- Top products by sales and profit.

### 3. SQL Analysis using MySQL
Created a MySQL database and performed SQL queries to analyze:
- Business performance metrics.
- Category and sub-category performance.
- Regional sales and profit.
- Customer and segment analysis.
- Shipping mode performance.
- Discount analysis.
- Year-wise and monthly sales.
- Top-performing and loss-making products.

### 4. Data Visualization using Tableau
Connected Tableau Desktop to the MySQL database and created visualizations for business performance analysis.

The dashboard includes:
- Monthly Sales Trend
- Sales by Category
- Sales by Region
- Profit by Sub-Category
- Discount vs Profit Analysis

## Key Findings

- Technology was the highest-performing category in terms of sales and profit.
- The West region generated the highest sales and profit.
- November 2017 recorded the highest monthly sales in the original dataset.
- Discount and profit showed a weak negative correlation.
- Canon imageCLASS 2200 Advanced Copier was the top product by sales in the original dataset.

## Project Structure

```text
retail-sales-analytics/
│
├── data/
│   ├── raw/
│   └── processed/
│
├── notebooks/
│   ├── 01_data_exploration.ipynb
│   └── 02_sales_analysis.ipynb
│
├── reports/
│
├── sql/
│
├── tableau/
│   └── Retail_Sales_Analytics.twbx
│
├── .gitignore
└── README.md

##Technologies Used
Python | Pandas | NumPy | Matplotlib | Seaborn | MySQL | SQL | Tableau
<br><br>

##Conclusion
This project provided practical experience in data cleaning, exploratory data analysis, SQL querying, and business intelligence dashboard development.

It demonstrates how raw retail data can be transformed into meaningful business insights to support data-driven decision-making.<br><br>

##Author: Himani


LinkedIn Id: https://www.linkedin.com/in/himani-malankar/