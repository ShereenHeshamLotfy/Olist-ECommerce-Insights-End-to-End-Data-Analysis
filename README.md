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

**Business Questions Answered:**
- What is the overall business performance?
- What is the average customer spending and delivery efficiency?
- How does revenue change over time?
- Which product categories generate the most revenue?
- What is the distribution of order statuses?
- How do customers rate their orders?
- Where are the customers located?

**Insights:**
- Total revenue reached 16.01 M, with 99K total orders and 99K customers.
- Revenue increased from 2016 to 2017 by 12,112,70%, and from 2017 to 2018 by 20%.
- The best-selling category was Healthy Beauty, contributing 9% of total revenue.
- The highest number of customers came from Sao Paulo city, representing 17.15% of all customers.
- The average delivery time is 11 days, indicating a generally average logistics performance.
- Most reviews are concentrated around 5 stars, reflecting positive customer satisfaction.

**Recommendations:**
- Focus marketing efforts on the top-performing categories, as they contribute the highest share of total revenue.
- Allocate delivery resources more efficiently in months with higher order volumes.
- Improve customer experience in regions with lower contribution to total sales by optimizing shipping and support.
- Track average delivery time closely to ensure it aligns with business SLA targets.
- Maintain this page as the executive snapshot for quick monthly monitoring.
  
<img width="1312" height="722" alt="image" src="https://github.com/user-attachments/assets/e927bcb0-0c60-4dfa-af10-e7247e4d5ca8" />


---

### 2️⃣ Sales Performance
**KPIs & Visuals:**
- Revenue evolution trend  
- Top categories  
- Revenue by payment methods
  
**Business Questions Answered:**
- What is the overall sales performance?
- How much does an average customer spend per order?
- Is revenue increasing or decreasing over time?
- Which categories generate the highest revenue?
- Which payment methods are customers using the most?
- Which regions contribute the most to sales?
  
**Insights:**
- Total Revenue increased from 2016 to 2017 by 12,112,70%, and from 2017 to 2018 by 20%.
- The top revenue-generating category was Healthy Beauty, contributing 9% of total revenue.
- Payment behavior shows 78.34% of customers preferred credit card.
- The region with the highest revenue was  Sao Paulo city generating 15.1% of total sales.
- Average order value is $161, indicating customers typically spend moderate amounts per order.

**Recommendations:**
- Invest more in payment methods that produce the highest revenue share (e.g., if credit card contributes the most).
- Extend promotions to categories with stable year-over-year growth.
- Monitor categories with declining sales and run targeted marketing campaigns to revive demand.
- Optimize logistics for states generating high revenue but facing delivery delays.
- Consider bundling slow-moving products with high-performing categories.

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

**Insights:**
- The customer base grew by 16.3% from 2016 to 2018.
- New customers from 2016 to 2017 represented 43635 customers and returning was 5 customers, while from 2017 to 2018 new customers raised to 52061 customers and returning customers raised to 687 customers.
- Most customers are located in Sao Paulo city, contributing 15.1% of total revenue.
- Top customer with id 0a0a92112bd4c708ca5fde585afaa872 contributed 0.8% of seller revenue.
- Customer segmentation shows:
  - High-value customers: 20.01%
  - Medium-value customers:39.99%
  - Low-value customers: 40%
  
**Recommendations:**
- Increase loyalty programs for high-value customers (top revenue contributors).
- Improve onboarding and targeted ads for new customers to increase their first-purchase conversion rate.
- Build retention strategies for returning customers, as they generate more consistent revenue.
- Personalize marketing by region to boost engagement in underperforming states.
- Target low-value customer segments with discounts to increase activity.

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

**Insights:**
- Out of 99K orders, 97.03% were successfully delivered.
- On-time delivery rate is 95.92%, showing strong delivery performance.
- Late deliveries represent 4.08%, while early deliveries represent 95.92%.
- Maximum delivery delay reached 188 days, while average delivery time is 11 days.
- Delivery outliers account for 5.46% of delivered orders.
- Canceled orders represent 1.24%.

**Recommendations:**
- Reduce delivery delays by working with carriers or optimizing routes in regions with high late-delivery rates.
- Monitor outlier orders (> upper limit days) to detect operational issues or supplier delays.
- Increase communication with customers when estimated vs. actual delivery time shows a high gap.
- Improve warehouse processing to increase the on-time delivery rate.
- Create SLA standards based on historical performance .

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

**Insights:**
- Total reviews: 99K, with:
 - Positive: 77.07%
 - Neutral: 8.24%
 - Negative:14.69%
- Average rating is 4.52 / 5, reflecting excellent satisfaction.
- NPS score is 43.09, which indicates Promoter customer behavior.
- On-time deliveries received an average rating of 4.3, while late deliveries received only 2.6, showing the impact of delivery delays on satisfaction.
- Review volume increased by 16.5% from 2016 to 2018.
  
**Recommendations:**
- Encourage satisfied customers (4–5 stars) to leave more reviews to boost overall rating.
- Address common customer complaints seen in 1–2-star reviews to improve product quality and delivery experience.
- Reduce detractors by improving packaging, delivery time, and product accuracy.
- Track rating trends monthly to quickly detect product or fulfillment issues.

<img width="1230" height="718" alt="image" src="https://github.com/user-attachments/assets/a7323eec-a99c-44d2-92c4-fab2fa1cee0d" />


---

### 6️⃣ Seller Performance
**Metrics:**
- Total sellers  
- Seller revenue  
- Units sold by seller & category  

**Questions Answered:**
- How many active sellers does the marketplace have?
- Which sellers generate the most revenue?
- How much do sellers pay for freight costs?
- How many units does each seller sell?
- How does seller performance change over time?
- Which seller performs best in each product category?
- What are the detailed metrics for each seller?

**Insights:**
- There are 3K sellers, generating a total revenue of 13.59 M.
- Top seller with ID 4869f7a5dfa277a7dca6462dcf3b52b2 contributed 1.85% of seller revenue.
- Freight cost increased by 16.9 % over the period.
- Sellers in the Sao Paulo City perform best, with 19.89% of total sales.
- Average freight cost per seller is $ 19.99, indicating efficient shipping behavior.

**Recommendations:**
- Increase stock availability for high-revenue and high-unit-sold products.
- Review pricing strategies for categories with low average price but high demand—possible opportunity to adjust margins.
- Prioritize marketing for profitable product categories with high revenue contribution.
- Analyze expensive products with low sales—reduce price or run promotions.
- Reduce freight cost on categories with unusually high shipping charges.

<img width="1378" height="686" alt="image" src="https://github.com/user-attachments/assets/70894f17-6143-440e-a25f-c01824517e67" />


---

### 7️⃣ Products & Category Analysis
**Visuals:**
- Price distribution  
- Revenue by category  
- Product performance

**Insights:**
- There are 33K products across 74 categories, generating 13.59 M total revenue.
- Top product with ID bb50f2e236e5eea0100680137654686c of health_beauty category, representing 1.19 % of total product revenue.
- The highest-selling category was bed bath table, with 13665 units sold.
- Price distribution shows:
 - Min: $ 0.85
 - Max: $ 6735
 - Median: $ 75
 - Average: $12.65
- Freight cost is highest in Baby category with $409.68, which may indicate higher shipping complexity.
- Most products fall within the price range 0 to $50.

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

<img width="1374" height="574" alt="image" src="https://github.com/user-attachments/assets/d80cf8b7-c649-420f-8a5c-468ce04e1470" />


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
