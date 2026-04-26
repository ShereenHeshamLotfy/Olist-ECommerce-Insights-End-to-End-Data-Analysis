# 🛒 Olist E-Commerce Analytics – End-to-End Business Intelligence Case Study

This project analyzes a real-world Brazilian e-commerce dataset to extract actionable insights across **sales performance, customer behavior, delivery efficiency, reviews, sellers, and products**.

The objective is to simulate a complete **business intelligence workflow** using SQL and Power BI to support data-driven decision-making.

---

## 🚀 Project Overview

This project follows a structured analytics pipeline:

- **SQL** → Data cleaning, transformation, and modeling  
- **Power BI** → Interactive dashboards and visual storytelling  
- **Star Schema Design** → Optimized data model for analysis  

---

## 📊 Business Domains Covered

- Executive Performance Overview  
- Sales & Revenue Analysis  
- Customer Behavior & Segmentation  
- Orders & Delivery Performance  
- Reviews & Customer Satisfaction  
- Seller Performance  
- Product & Category Analysis  

---

## 📦 Dataset Structure

The dataset includes multiple interconnected tables:

| Table Name | Description |
|------------|-------------|
| Orders | Order-level metadata |
| Order Items | Item-level transaction details |
| Order Payments | Payment method and values |
| Order Reviews | Customer feedback and ratings |
| Customers | Customer demographic information |
| Sellers | Seller data |
| Products | Product catalog |
| Date Table | Custom time dimension for analysis |

<img width="1277" height="732" alt="image" src="https://github.com/user-attachments/assets/5b03a67e-0bd4-4be2-8d4f-cfa870c078e9" />

---

## 📊 Dashboard Pages / Analytical Views
The analysis is divided into six core business areas:

---

# 1️⃣ Executive Overview

### Key KPIs
- Total Orders  
- Total Revenue  
- Total Customers  
- Average Order Value  
- Average Delivery Time  

### Key Insights
- Total revenue reached **16.01M**, with **99K orders** and **99K customers**.
- Revenue grew significantly:
  - 2016 → 2017: **+12,112.70%**
  - 2017 → 2018: **+20%**
- The top-performing category was **Healthy Beauty (9% of revenue)**.
- Most customers are concentrated in **Sao Paulo city (17.15%)**.
- Average delivery time is **11 days**, indicating moderate logistics performance.
- Customer satisfaction is generally high, with most ratings at **5 stars**.

### Business Recommendations
- Prioritize high-performing product categories for marketing investment.
- Optimize logistics during peak demand periods.
- Improve delivery performance in lower-performing regions.
- Monitor SLA compliance using delivery KPIs.
- Use this page as a **monthly executive dashboard snapshot**.

---
  
<img width="1312" height="722" alt="image" src="https://github.com/user-attachments/assets/e927bcb0-0c60-4dfa-af10-e7247e4d5ca8" />


---

### 2️⃣ Sales Performance
**KPIs & Visuals:**
- Revenue evolution trend  
- Top categories  
- Revenue by payment methods
  
### Key Insights
- Revenue grew sharply between 2016–2018:
  - +12,112.70% then +20%
- **Healthy Beauty** is the top category (9% revenue share).
- **Credit cards dominate payments (78.34%)**.
- Sao Paulo contributes **15.1% of total sales**.
- Average order value: **$161**

### Business Recommendations
- Focus on high-performing payment methods and categories.
- Expand successful product categories with consistent growth.
- Investigate declining categories and apply targeted campaigns.
- Optimize logistics in high-revenue regions.
- Bundle products to increase order value.

---

<img width="1320" height="720" alt="image" src="https://github.com/user-attachments/assets/901810a6-416e-4bfe-a8f8-5efcea7ed152" />

---

### 3️⃣ Customer Insights
**KPIs:**
- Customer count  
- Revenue by customer segment  
- New vs returning customers  

### Key Insights
- Customer base grew **16.3% (2016–2018)**.
- Strong acquisition growth:
  - 2017: 43,635 new customers  
  - 2018: 52,061 new customers + 687 returning
- Sao Paulo dominates customer base (15.1% revenue contribution).
- Customer segmentation:
  - High-value: 20.01%
  - Medium-value: 39.99%
  - Low-value: 40%

### Business Recommendations
- Strengthen loyalty programs for high-value customers.
- Improve onboarding conversion for new customers.
- Build retention strategies for returning users.
- Use regional targeting for marketing campaigns.
- Incentivize low-value customers to increase spending.

<img width="1313" height="722" alt="image" src="https://github.com/user-attachments/assets/de81c4db-1d36-4324-8e68-e4e4ebd39ca1" />


---

### 4️⃣ Orders & Delivery Analysis
**Metrics:**
- On-time delivery rate  
- Average and maximum delivery time  
- Delivery outlier trends
  
### Key Insights
- Total orders: **99K**
- Delivered orders: **97.03%**
- On-time delivery rate: **95.92%**
- Late deliveries: **4.08%**
- Average delivery time: **11 days**
- Maximum delay: **188 days**
- Delivery outliers: **5.46%**
- Canceled orders: **1.24%**

### Business Recommendations
- Reduce late deliveries through logistics optimization.
- Investigate extreme delay outliers.
- Improve warehouse processing time.
- Enhance customer communication during delays.
- Define SLA benchmarks based on historical performance.

<img width="1336" height="677" alt="image" src="https://github.com/user-attachments/assets/e6892982-6d9f-4122-8c88-72f373ff8d42" />


---

### 5️⃣ Reviews & Satisfaction
**KPIs:**
- Average rating  
- Net Promoter Score (NPS)  
- Review distribution  

### Key Insights
- Total reviews: **99K**
- Sentiment distribution:
  - Positive: 77.07%
  - Neutral: 8.24%
  - Negative: 14.69%
- Average rating: **4.52 / 5**
- NPS score: **43.09**
- On-time delivery rating: **4.3**
- Late delivery rating: **2.6**
- Review volume increased by **16.5%**

### Business Recommendations
- Increase review engagement from satisfied customers.
- Address root causes of negative feedback.
- Improve delivery and packaging quality.
- Monitor rating trends regularly.
- Reduce detractors through service improvements.

<img width="1230" height="718" alt="image" src="https://github.com/user-attachments/assets/a7323eec-a99c-44d2-92c4-fab2fa1cee0d" />


---

### 6️⃣ Seller Performance
**Metrics:**
- Total sellers  
- Seller revenue  
- Units sold by seller & category
  
### Key Insights
- Total sellers: **3K**
- Total revenue: **13.59M**
- Top seller contribution: **1.85%**
- Freight cost increased by **16.9%**
- Sao Paulo sellers dominate with **19.89% sales share**
- Average freight cost: **$19.99**

### Business Recommendations
- Support high-performing sellers with better inventory flow.
- Adjust pricing strategies for low-margin high-demand items.
- Promote profitable product categories.
- Optimize freight cost efficiency.
- Improve logistics for high-cost shipping categories.


<img width="1378" height="686" alt="image" src="https://github.com/user-attachments/assets/70894f17-6143-440e-a25f-c01824517e67" />


---

### 7️⃣ Products & Category Analysis
**Visuals:**
- Price distribution  
- Revenue by category  
- Product performance

### Key Insights
- Total products: **33K across 74 categories**
- Total revenue: **13.59M**
- Top category: **bed bath table (13,665 units)**
- Price range:
  - Min: $0.85
  - Max: $6735
  - Median: $75
  - Average: $12.65
- Freight cost highest in Baby category ($409.68)

### Business Recommendations
- Maintain inventory of top-selling products.
- Optimize pricing for low-performing products.
- Monitor freight-heavy categories for cost reduction.
- Focus marketing on high-performing categories.
- Remove or discount underperforming products.
  
<img width="1374" height="574" alt="image" src="https://github.com/user-attachments/assets/d80cf8b7-c649-420f-8a5c-468ce04e1470" />


---

## 🛠 Tools & Technologies Used

| Technology | Purpose |
|------------|---------|
| SQL | Data cleaning & transformation |
| Power BI | Dashboard visualization |
| Power Query | Data modeling & ETL |
| DAX | Custom analytics calculations |
| Star Schema | Data modeling |

---


## 📁 How to Run the Dashboard

1. Clone the repository  
   `git clone https://github.com/ShereenHeshamLotfy/Olist-ECommerce-Insights-End-to-End-Data-Analysis.git`
2. Open the `.pbix` Power BI file  
3. Connect to the provided dataset files (.csv)
4. Refresh all visuals to load data

---

## 📎 References & Data Source

The dataset is based on the **Olist Brazilian E‑commerce dataset**, publicly available on Kaggle (orders, products, reviews, customers, sellers, etc.).:contentReference[oaicite:1]{index=1}

---


