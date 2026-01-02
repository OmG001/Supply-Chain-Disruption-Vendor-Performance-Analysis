# 🚚 Supply Chain Disruption Analysis and Vendor Performance Optimization

This project focuses on analyzing **supply chain operations data** to identify **inefficiencies, risks, and performance gaps** using **SQL and Python**.
The objective is to transform raw operational data into **structured, business-ready insights** that help improve **supplier performance, inventory planning, and operational decision-making**.

The project follows a **real-world analytics workflow**, starting from raw data cleaning, progressing through SQL queries of increasing complexity, creating reusable views, optimizing queries, and finally extracting actionable business insights.

---

## 📌 Project Objectives

The main objectives of this project are to:

* Understand supply chain data through structured analysis
* Identify inefficiencies and operational risks
* Practice SQL queries at **easy, medium, hard, and advanced** levels
* Demonstrate real-world **SQL analytics skills**
* Create reusable SQL views and optimized queries
* Generate insights useful for business decision-making

---

## 📂 Dataset Description

### **Raw Dataset**

**`supply_chain_data.csv`**

* Raw supply chain dataset
* Contains operational and transactional data related to:

  * Products
  * Suppliers
  * Orders
  * Inventory
  * Shipping & logistics

### **Cleaned Dataset**

**`cleaned_supply_chain_data.csv`**

* Cleaned and standardized dataset
* Used for accurate SQL querying and analysis
* Prepared using Python to remove inconsistencies and improve data quality

---

## 🧹 Data Cleaning (Python)

### **File: `main.py`**

**Purpose**

* Clean raw supply chain data
* Prepare data for SQL-based analysis

**Why Python**

* Efficient for data cleaning and preprocessing
* Automates repetitive tasks
* Ensures consistent and reliable datasets before SQL analysis

---

## 🛠 Tools & Technologies Used

* **SQL**

  * Primary tool for analysis
  * Used for joins, aggregations, subqueries, window functions, views, and optimization

* **Python**

  * Used for data cleaning and preprocessing

* **CSV Files**

  * Lightweight data storage format
  * Compatible with both Python and SQL

* **VS Code**

  * Development environment for Python and SQL scripts

---

## 🧱 Project Structure

```bash
.
│
├── data/
│   ├── supply_chain_data.csv
│   ├── cleaned_supply_chain_data.csv
│   └── main.py
│
├── results/
│   ├── easy/
│   ├── medium/
│   ├── hard/
│   ├── advance/
│   ├── views/
│
├── sql/
│   ├── schema.sql
│   ├── insert_schema.sql
│   ├── easy-queries.sql
│   ├── medium_queries.sql
│   ├── hard_queries.sql
│   ├── advanced_queries.sql
│   ├── views.sql
│   └── query_optimization.sql
│
└── insights.txt
```

---

## 📊 SQL Analysis Levels

### ✅ Easy Queries

* Basic aggregations
* Counts and averages
* Simple filtering

**Purpose:**
Understand dataset structure and build SQL fundamentals.

---

### ⚙️ Medium Queries

* Grouping and joins
* Performance comparison across entities
* Intermediate business logic

**Purpose:**
Identify patterns and trends.

---

### 🔴 Hard Queries

* Complex joins
* Subqueries
* Advanced filtering logic

**Purpose:**
Analyze deeper operational problems.

---

### 🔥 Advanced Queries

* Window functions
* Ranking and comparisons
* Analytical logic

**Purpose:**
Simulate real-world business analytics scenarios.

---

## 📈 Views & Query Optimization

### SQL Views

* Created reusable SQL views
* Simplify complex logic
* Improve readability and maintainability

### Query Optimization

* Optimized queries to improve performance
* Reduced redundancy
* Improved efficiency

📌 These techniques are critical in **production-grade SQL systems**.

---

## 📄 Results Folder

* Each SQL query generates output as `.csv` files
* Enables easy review and verification
* Supports sharing and reporting

---

## 🧠 Insights Summary

### **File: `insights.txt`**

Contains:

* Key findings from the analysis
* Business-oriented conclusions
* Observations on supply chain risks and inefficiencies

---

## ▶️ How to Use This Project

1. Clean the dataset using `main.py`
2. Load the cleaned data into your SQL database
3. Connect to PostgreSQL:

   * Install PostgreSQL or the VS Code PostgreSQL extension
   * Connect using database credentials
4. Create tables using `schema.sql`
5. Insert data using `insert_schema.sql`
6. Run SQL queries level-wise (Easy → Advanced)
7. Review outputs in the `results/` folder
8. Read summarized insights in `insights.txt`

---

## ✅ What This Project Demonstrates

* Strong SQL fundamentals
* Ability to write complex analytical queries
* Structured, real-world problem-solving approach
* Supply chain analytics mindset
* Clean and professional project organization

---

## 🧩 Entity Relationship (ER) Diagram – Conceptual Explanation

The database design follows a **relational model** representing real-world supply chain operations.

### 🔹 Main Entities

* **Suppliers**

  * Supplier ID, location, performance metrics
  * One supplier → many products

* **Products**

  * Product ID, category, cost
  * One product → many orders

* **Customers**

  * Customer ID, region, segment
  * One customer → many orders

* **Orders**

  * Central fact table
  * Connects customers, products, suppliers, and shipping
  * Includes quantity, revenue, cost, and risk indicators

### 🔗 Relationship Summary

| Entity                  | Relationship | Description                              |
| ----------------------- | ------------ | ---------------------------------------- |
| Product → Supply Chain  | One-to-Many  | Product appears in multiple transactions |
| Supplier → Supply Chain | One-to-Many  | Supplier handles multiple orders         |
| Customer → Supply Chain | One-to-Many  | Customer places multiple orders          |
| Shipping → Supply Chain | One-to-Many  | Shipping mode used across orders         |

📌 This structure enables **deep SQL-based supply chain analysis**.

---

## 🚀 Future Enhancements

* Add indexing for faster queries
* Integrate visualization tools (Power BI / Tableau)
* Automate data refresh
* Convert analysis into an interactive dashboard
* Extend dataset with real-time data

---

## 📜 Final Note

This project demonstrates how **SQL and Python** can be combined to analyze real-world supply chain data and extract **business-ready insights**. It reflects **practical analytical thinking**, not just query writing.

---

Upload the next file whenever you’re ready 🚀
