# 📦 E-Commerce Analytics Dashboard (Power BI)

A comprehensive end-to-end analytical dashboard built using **Power BI**, providing deep insights into sales, customers, delivery performance, reviews, sellers, and product behaviors and i used **SQL** to clean tables.

This project analyzes a Brazilian e-commerce dataset and transforms raw transactional data into actionable business knowledge.

---

# 🗂 Dataset Summary

The dataset contains the following tables:

- **Orders**
- **Order Items**
- **Order Payments**
- **Order Reviews**
- **Customers**
- **Sellers**
- **Products**
- **Date Table** (created manually)

The data model follows a **Star Schema**, with fact tables centered around orders, order items, and reviews.

---

# 🧩 Data Model (Star Schema)

<img width="1281" height="727" alt="image" src="https://github.com/user-attachments/assets/3e8f6974-7e9c-4a48-a8b9-fdd21bd2f487" />



# 📊 Dashboard Pages

The dashboard consists of **7 fully-designed analytical pages**.

---

# 1️⃣ **Overview Page**

This page summarizes the overall performance of the business.

## ⭐ KPIs:
- Total Orders  
- Total Revenue  
- Total Customers  
- Average Order Value  
- Average Delivery Time  

## 📊 Visuals:
- Revenue Over Time *(Line Chart)*  
- Best Seller Category *(Bar Chart)*  
- Order Status Over Time *(Line Chart)*  
- Reviews by Order *(Bar Chart)*  
- Revenue by Region *(Map or Bar)*  

## ❓ Business Questions Answered:
- How is the overall business performing?
- Which categories drive the most sales?
- What are the patterns in customer demand over time?
- Which regions contribute most to revenue?

> **Add Screenshot Here**  
<img width="1317" height="721" alt="image" src="https://github.com/user-attachments/assets/b767299c-b7f6-4bea-8f68-b8e8608fbaf5" />
---

# 2️⃣ **Sales Performance Page**

Focused on revenue, growth, and sales trends.

## ⭐ KPIs:
- Total Orders  
- Total Revenue  
- Average Order Value  
- Revenue Performance Indicator  

## 📊 Visuals:
- Revenue Trend Over Time (Line Chart)
- Gross Revenue by Year
- Top 10 Categories by Revenue
- Revenue by Payment Type
- Revenue by Region (Map / Bar)

## ❓ Business Questions Answered:
- What payment methods are most used?
- Which categories generate the highest revenue?
- How do sales evolve over time?
- Which regions have the highest purchasing activity?

> **Add Screenshot Here**  
<img width="1307" height="721" alt="image" src="https://github.com/user-attachments/assets/397717ce-662e-4176-97b2-cea8b33cf27c" />

---

# 3️⃣ **Customer Insights Page**

Provides behavioral and demographic customer insights.

## ⭐ KPIs:
- Total Customers  
- Total Customer Orders  
- Total Customer Revenue  
- Average Revenue Per Customer  

## 📊 Visuals:
- Customer Growth Over Time  
- New vs Returning Customers  
- Customers by Region  
- Top Customers by Revenue  
- Customer Segmentation (High / Medium / Low Value)

### 🎯 Segmentation Logic:
- **Top 20%** → High Value  
- **Middle 40%** → Medium Value  
- **Bottom 40%** → Low Value  

## ❓ Questions Answered:
- Who are the most valuable customers?
- How many customers return every year?
- Which states contain the most active customers?
- How valuable is each customer segment?

> **Add Screenshot Here**  
<img width="1307" height="722" alt="image" src="https://github.com/user-attachments/assets/3b92f4d0-18bf-430a-9361-783979078d1a" />

---

# 4️⃣ **Orders & Delivery Page**

Analyzes fulfillment performance and delivery efficiency.

## ⭐ KPIs:
- Total Orders  
- Delivered Orders  
- Cancelled Orders  
- On-Time Delivery Rate  
- Average Delivery Time  
- Maximum Delivery Time  

## 📊 Visuals:
- Order Status Over Time  
- Delivery Status Distribution (Delivered / Pending / Cancelled)
- Delivery Time Outlier Distribution  
- Delivery Performance (Early vs On-Time vs Late Delivery)  
- Detailed Order Table  

## ❓ Business Questions Answered:
- Are deliveries happening on time?
- How many deliveries are late or extremely late (outliers)?
- How many orders get cancelled?
- How does delivery time affect customer experience?

> **Add Screenshot Here**  
<img width="1328" height="682" alt="image" src="https://github.com/user-attachments/assets/dc2915f3-90da-4ccf-b750-432ee6f4b4e3" />

---

# 5️⃣ **Reviews & Satisfaction Page**

Focuses on customer feedback and satisfaction levels.

## ⭐ KPIs:
- Total Reviews  
- Positive Reviews %  
- Neutral Reviews %  
- Negative Reviews %  
- Average Rating  
- Net Promoter Score (NPS)  

## 📊 Visuals:
- Reviews by Order  
- Average Rating Over Time  
- Ratings for On-Time vs Late Delivery  
- Detailed Reviews Table  
- NPS Indicator Card  

## ❓ Questions Answered:
- What is our customer satisfaction level?
- How does delivery performance impact reviews?
- How do ratings trend across time?
- What percentage of reviews are negative or neutral?

> **Add Screenshot Here**  
<img width="1225" height="721" alt="image" src="https://github.com/user-attachments/assets/da121781-c8e1-4478-a4eb-b5d237d84f81" />

---

# 6️⃣ **Seller Performance Page**

Evaluates the efficiency and performance of individual sellers.

## ⭐ KPIs:
- Total Sellers  
- Seller Revenue  
- Freight Cost Per Seller  
- Units Sold  

## 📊 Visuals:
- Top Sellers by Revenue  
- Seller Revenue Over Time  
- Freight Cost Trend  
- Units Sold Per Category Per Seller  
- Detailed Seller Table  

## ❓ Questions Answered:
- Which sellers generate the most revenue?
- How does freight cost vary between sellers?
- What categories do sellers perform best in?
- How consistent are sellers across months?

> **Add Screenshot Here**  
<img width="1327" height="660" alt="image" src="https://github.com/user-attachments/assets/a4177551-34d3-4f68-846c-d9f1e1219b26" />

---

# 7️⃣ **Products Page**

Deep dive into product pricing, revenue, and distribution.

## ⭐ KPIs:
- Total Products  
- Total Units Sold  
- Total Categories  
- Average Product Price  
- Product Revenue  

## 📊 Visuals:
- Revenue by Product  
- Revenue by Product Category  
- Price Distribution Histogram  
- Average Price per Category  
- Average Freight Cost per Category  
- Detailed Product Table  

## ❓ Questions Answered:
- Which products are most profitable?
- How do prices vary across categories?
- Are certain categories more expensive or cheaper?
- Which products bring the most revenue?

> **Add Screenshot Here**  
<img width="1332" height="622" alt="image" src="https://github.com/user-attachments/assets/2f8fb35c-5707-49ab-a779-45876e5b8fd8" />

---

# 🧮 Key DAX Measures

> Add a file `/dax/measures.md` or paste your measures here.

Examples:

```DAX
Average Delivery Time =
AVERAGEX(
    FILTER(Orders, Orders[Is_Outlier] = 0),
    Orders[Delivery_Time_Days]
)

Customer_Segment =
SWITCH(
    TRUE(),
    [Customer Revenue] >= [High_Value_Threshold], "High",
    [Customer Revenue] >= [Medium_Value_Threshold], "Medium",
    "Low"
)

------
🛠 Tools & Technologies Used 
SQL
Power BI Desktop
Power Query
DAX
Star Schema Modeling
GitHub
Data Visualization Principles
