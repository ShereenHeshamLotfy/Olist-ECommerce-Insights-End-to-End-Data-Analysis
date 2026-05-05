# 🛒 Olist E-Commerce Analytics  
## End-to-End Business Intelligence Case Study

A full-scale **Business Intelligence project** analyzing a real-world Brazilian e-commerce dataset to deliver **data-driven insights and actionable business recommendations**.

This project demonstrates a complete analytics workflow:  
**Raw Data → SQL Cleaning → Data Modeling → Power BI Dashboards → Business Insights**

---

# 🚀 Executive Summary

- 📦 **99K Orders**
- 👥 **96K Customers**
- 💰 **$16.01M Revenue**
- 🏪 **~3K Sellers**
- 📊 **74 Product Categories**

📈 The business experienced **explosive growth in 2017 (+12,112%)**, followed by a **significant slowdown**, indicating potential challenges in **customer retention and market saturation**.

⚠️ Key risks identified:
- Low **customer retention**
- Delivery **outliers impacting satisfaction**
- Revenue **dependency on new customers**

---

# 🧠 Business Objectives

This analysis aims to:

- Understand **revenue growth patterns**
- Analyze **customer behavior & retention**
- Evaluate **delivery performance efficiency**
- Identify **top-performing products & sellers**
- Improve **customer satisfaction & experience**

---

# 🛠 Tech Stack

- **SQL Server** → Data Cleaning & Transformation  
- **Power BI** → Data Visualization & Dashboards  
- **DAX** → KPI Calculations  
- **Power Query** → ETL  
- **Star Schema** → Data Modeling  

---

# 🧱 Data Model (Star Schema)

### ⭐ Fact Tables
- Orders  
- Order Items  

### 📊 Dimension Tables
- Customers  
- Products  
- Sellers  
- Date  

✔ Built using **best practices**  
✔ Eliminated ambiguity using **Orders as a bridge table**  
✔ Optimized for **scalability & performance**

---

# 📊 Dashboard Insights

---

## 1️⃣ Executive Overview

### 📌 KPIs
- Total Orders → **99K**
- Total Revenue → **$16.01M**
- Customers → **96K**
- Avg Order Value → **$161**
- Avg Delivery Time → **11 Days** *(Excluding Outliers)*

### 🔍 Insights
- Strong growth from **2016 → 2017 → 2018**
- ~**97% successful deliveries**
- High customer satisfaction (majority **5⭐ reviews**)

<img width="1323" height="724" alt="image" src="https://github.com/user-attachments/assets/1f2ad18e-231d-43c7-9271-155b424526f5" />

---

## 2️⃣ Sales Performance

### 🔍 Insights
- Revenue growth peaked at **+12,112% (2017)**
- Growth dropped to **~68% (2018)** → ⚠️ slowdown
- **Credit Cards = 78%** of total revenue

### 🏆 Top Categories by Revenue
- Health & Beauty → **$1.45M**
- Watches & Gifts → **$1.31M**
- Bed & Bath Table → **$1.27M**

### ❗ Problem
- Growth is **not sustainable**

### 💡 Recommendation
- Launch **retention-focused campaigns**
- Improve **customer acquisition strategy**
- Invest in **high-performing categories**

<img width="1316" height="728" alt="image" src="https://github.com/user-attachments/assets/c38af6aa-7c9e-4c38-8134-051fc9538b82" />

---

## 3️⃣ Customer Analysis

### 🔍 Insights
- Customer growth:
  - **0 → 44K → 53K**
- Majority are **new customers**
- Returning customers **decline sharply in 2018**

### ❗ Problem
- **Weak customer retention strategy**

### 💡 Recommendation
- Implement:
  - Loyalty programs  
  - Personalized offers  
  - Email marketing campaigns
    
<img width="1313" height="726" alt="image" src="https://github.com/user-attachments/assets/3862e2bb-7003-41e6-89d0-15a735bf5c0b" />

---

## 4️⃣ Orders & Delivery

### 📌 KPIs
- Delivered Orders → **96K**
- Cancelled Orders → **~1K**
- On-Time Delivery → **93.23%**
- Max Delivery Time → **210 Days (!!)**

### 🔍 Insights
- Most deliveries are on time  
- Small % of **extreme delays (outliers)**

### ❗ Problem
- Outliers significantly harm **customer experience**

### 💡 Recommendation
- Identify:
  - Slow sellers  
  - Problematic regions  
- Optimize **logistics & SLAs**

<img width="1311" height="673" alt="image" src="https://github.com/user-attachments/assets/ff895a2d-1be4-455c-b6e9-000c7bb63ea0" />

---

## 5️⃣ Reviews & Satisfaction

### 📌 KPIs
- Total Reviews → **99K**
- Avg Rating → **4.09 / 5**
- Positive Reviews → **77%**
- Negative Reviews → **14.7%**

### 🔍 Insights
- Strong correlation:
  👉 **Late delivery → Low ratings**

### 💡 Recommendation
- Improve delivery performance  
- Monitor low-rated orders proactively  

<img width="1314" height="769" alt="image" src="https://github.com/user-attachments/assets/c388b3f3-26b8-4917-b81c-0701cbc027e6" />

---

## 6️⃣ Sellers Performance

### 📌 KPIs
- Total Sellers → **~3K**
- Revenue → **$13.59M**
- Freight Cost → **$2.25M**
- Units Sold → **135K**

### 🔍 Insights
- Revenue distributed across many sellers  
- No heavy seller dominance  

### 💡 Recommendation
- Rank sellers based on:
  - Delivery performance  
  - Customer satisfaction  
- Incentivize top sellers  

<img width="1315" height="661" alt="image" src="https://github.com/user-attachments/assets/c5f9e546-c86f-4cfd-b643-19f09c5e50d9" />

---

## 7️⃣ Products & Categories

### 📌 KPIs
- Total Products → **33K**
- Categories → **74**
- Avg Price → **$120.65**

### 🔍 Insights
- Top category by volume → **Bed Bath Table**
- Highest avg price → **Computers (~$1098)**

### ❗ Problem
- High price variation  

### 💡 Recommendation
- Apply **price segmentation strategy**
- Focus on **high-margin products**

<img width="1312" height="550" alt="image" src="https://github.com/user-attachments/assets/fd1779e8-f972-4202-af25-ffbafe935a7e" />

---

# ⚠️ Data Challenges & Solutions

| Challenge | Solution |
|----------|--------|
| Missing values | Replaced with averages |
| Delivery outliers | Removed using statistical thresholds |
| Null categories | Replaced with "Other" |
| Relationship ambiguity | Designed Star Schema |
| Duplicate reviews/orders | Treated as valid business behavior |

---

# 📈 Key Business Insights

- 🚀 Explosive growth in 2017  
- 💳 Credit cards dominate payments  
- 👤 Customer retention is weak  
- 🚚 Delivery directly impacts satisfaction  
- 📦 Product performance varies significantly  

---

# 💡 Final Recommendations

1. Improve **customer retention strategies**  
2. Optimize **delivery & logistics performance**  
3. Focus on **top-performing categories**  
4. Monitor & evaluate **seller performance**  
5. Use **customer segmentation for targeted marketing**  

---

# 📁 How to Run

```bash
git clone https://github.com/ShereenHeshamLotfy/Olist-ECommerce-Insights-End-to-End-Data-Analysis.git
```

1. Open `.pbix` file in Power BI  
2. Reconnect data sources (Excel/CSV)  
3. Click **Refresh**  

---

# 📌 Data Source

**Olist Brazilian E-Commerce Dataset (Kaggle)**

---
