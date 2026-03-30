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
- Overall business performance is growing, as shown by the increase in total orders, revenue, and customer base.
- Revenue shows clear seasonality/trends over the year, indicating peak months and low-activity periods.
- Certain categories consistently outperform others, making them the main revenue drivers.
- Most orders fall under specific status types, revealing order management efficiency.
- Customer satisfaction varies across orders, shown by the distribution of review scores.
- Customer activity is concentrated in certain regions, indicating strong geographic markets.

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
- What is the overall sales performance?
- How much does an average customer spend per order?
- Is revenue increasing or decreasing over time?
- Which categories generate the highest revenue?
- Which payment methods are customers using the most?
- Which regions contribute the most to sales?
  
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
- How many customers does the business have?
- How much revenue do customers generate?
- How does the customer base grow over time?
- Are customers returning or mostly new?
- Which regions have the highest number of customers?
- Which customers are the most valuable?
- What are the customer segments based on spending levels?
  
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
- How many orders were placed?
- How many orders were successfully delivered vs canceled?
- How efficient is the delivery process?
- How long do deliveries take on average?
- What is the worst-case delivery delay?
- How do order statuses trend over time?
- How does delivery status relate to order status?
- Are there abnormal delivery delays?
- What is the overall delivery performance?
- What are the exact details of all orders?

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
- How many reviews were submitted?
- What is the sentiment distribution?
- What is the average customer rating?
- Which orders get the highest or lowest ratings?
- How does customer satisfaction change over time?
- How do delivered orders contribute to ratings?
- What is the NPS score? (Customer loyalty)
- What are the exact details of each review?

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

**Questions Answered:**
- How many active sellers does the marketplace have?
- Which sellers generate the most revenue?
- How much do sellers pay for freight costs?
- How many units does each seller sell?
- How does seller performance change over time?
- Which seller performs best in each product category?
- What are the detailed metrics for each seller?

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
- How many products and categories exist?
- How many units were sold in total?
- What is the average product price?
- Which products generate the most revenue?
- Which categories generate the most revenue?
- How are product prices distributed?
- What is the average price per category?
- How much freight cost does each category generate?
- What are the detailed product-level metrics? 

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
