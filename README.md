# E-Commerce Analytics Dashboard (Power BI)

📊 **End-to-End Data Analytics Dashboard** built with **Power BI** to analyze a Brazilian e-commerce dataset.  
This dashboard provides actionable insights into sales performance, customer behavior, delivery efficiency, reviews & satisfaction, seller performance, and product analytics.

---

## 🚀 Project Overview

This project takes raw transactional data from a Brazilian e-commerce dataset and transforms it into meaningful business insights using:

- **SQL** for data cleaning, transformation, and modeling  
- **Power BI** for interactive dashboards and visual analytics  

The data model follows a **Star Schema** design to support efficient analysis.

---

## 📦 Dataset Summary

The dataset contains multiple tables:

| Table Name | Description |
|------------|-------------|
| Orders | Order-level metadata |
| Order Items | Item-level details per order |
| Order Payments | Payment method and value |
| Order Reviews | Ratings and customer feedback |
| Customers | Customer demographic data |
| Sellers | Seller demographic data |
| Products | Product information |
| Date Table | Created manually for time-based analysis |

<img width="1277" height="732" alt="image" src="https://github.com/user-attachments/assets/5b03a67e-0bd4-4be2-8d4f-cfa870c078e9" />

---

## 📊 Dashboard Pages / Analytical Views

### 1️⃣ Overview Page
**Key Metrics:**
- Total Orders  
- Total Revenue  
- Total Customers  
- Average Order Value  
- Average Delivery Time  

**Insights:**
- Revenue over time  
- Best-selling categories  
- Order trends by status  
- Regional performance  

**Business Questions Answered:**
- What is the overall business performance?
- What is the average customer spending and delivery efficiency?
- How does revenue change over time?
- Which product categories generate the most revenue?
- What is the distribution of order statuses?
- How do customers rate their orders?
- Where are the customers located?


**Recommendations:**
- Focus marketing on top-performing categories to increase revenue.  
- Monitor underperforming regions for growth opportunities.  
- Track overall business trends monthly for timely decision-making.
  
<img width="1312" height="722" alt="image" src="https://github.com/user-attachments/assets/e927bcb0-0c60-4dfa-af10-e7247e4d5ca8" />


---

### 2️⃣ Sales Performance
**KPIs & Visuals:**
- Revenue evolution trend  
- Top categories  
- Revenue by payment methods  

**Questions Answered:**
- Which payment methods are most popular?  
- Which regions produce the highest revenue?  

**Recommendations:**
- Use targeted promotions for high-revenue regions.  
- Optimize payment methods based on popularity to improve conversion.  
- Consider dynamic pricing for top-performing products.

<img width="1320" height="720" alt="image" src="https://github.com/user-attachments/assets/901810a6-416e-4bfe-a8f8-5efcea7ed152" />

---

### 3️⃣ Customer Insights
**KPIs:**
- Customer count  
- Revenue by customer segment  
- New vs returning customers  

**Questions Answered:**
- Who are the most valuable customers?  
- How is retention over time?  

**Recommendations:**
- Implement loyalty programs for high-value customers.  
- Run follow-up campaigns for low-retention segments.  
- Segment customers and personalize marketing strategies.

<img width="1313" height="722" alt="image" src="https://github.com/user-attachments/assets/de81c4db-1d36-4324-8e68-e4e4ebd39ca1" />


---

### 4️⃣ Orders & Delivery Analysis
**Metrics:**
- On-time delivery rate  
- Average and maximum delivery time  
- Delivery outlier trends  

**Questions Answered:**
- How effectively are deliveries managed?  
- Which regions show late delivery patterns?  

**Recommendations:**
- Optimize delivery routes to reduce average delivery times.  
- Investigate late deliveries by region and seller.  
- Use predictive models to plan for peak order periods.

<img width="1336" height="677" alt="image" src="https://github.com/user-attachments/assets/e6892982-6d9f-4122-8c88-72f373ff8d42" />


---

### 5️⃣ Reviews & Satisfaction
**KPIs:**
- Average rating  
- Net Promoter Score (NPS)  
- Review distribution  

**Questions Answered:**
- How does delivery performance influence reviews?  
- What percentage of customers are satisfied?  

**Recommendations:**
- Address recurring issues highlighted in negative reviews.  
- Encourage satisfied customers to leave reviews.  
- Correlate delivery time with review scores and improve areas with negative impact.

<img width="1230" height="718" alt="image" src="https://github.com/user-attachments/assets/a7323eec-a99c-44d2-92c4-fab2fa1cee0d" />


---

### 6️⃣ Seller Performance
**Metrics:**
- Total sellers  
- Seller revenue  
- Units sold by seller & category  

**Insights:**
- Top performing sellers  
- Revenue patterns per seller  

**Recommendations:**
- Support low-performing sellers with training.  
- Incentivize high-performing sellers for consistency.  
- Track seller KPIs continuously to maintain quality.

<img width="1335" height="662" alt="image" src="https://github.com/user-attachments/assets/ba98dfc7-1645-46f1-a22f-6722a7899a02" />


---

### 7️⃣ Products & Category Analysis
**Visuals:**
- Price distribution  
- Revenue by category  
- Product performance  

**Questions Answered:**
- Which products bring the most revenue?  
- What are the pricing trends across categories?  

**Recommendations:**
- Maintain sufficient stock of top-selling products.  
- Review low-selling products for discounting or removal.  
- Monitor pricing trends to remain competitive.

<img width="1332" height="622" alt="image" src="https://github.com/user-attachments/assets/71122f7a-f1db-43b9-bb8f-d20aceb6db77" />


---

## 🛠 Tools & Technologies Used

| Technology | Purpose |
|------------|---------|
| SQL | Data cleaning & transformation |
| Power BI | Dashboard visualization |
| Power Query | Data modeling & ETL |
| DAX | Custom analytics calculations |

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

## 📄 License

This project is shared under the **MIT License** (add LICENSE file).

---

## ⭐ Contributions

Contributions are welcome!  
Feel free to open issues or submit pull requests.
