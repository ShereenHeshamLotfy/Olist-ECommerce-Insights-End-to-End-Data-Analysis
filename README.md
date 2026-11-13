# 🛒 Olist E-Commerce Analytics  
### End-to-End Business Intelligence & Data Analysis Case Study

An end-to-end **Business Intelligence project** analyzing a real-world Brazilian e-commerce dataset (~100K orders) to uncover revenue drivers, diagnose customer retention bottlenecks, and deliver **actionable business recommendations**.

**Analytics Pipeline:**  
`Raw Data (CSV)` ➔ `SQL Server (Cleaning & ETL)` ➔ `Star Schema Modeling` ➔ `DAX Measures` ➔ `Power BI Dashboards`

---

## 🚀 Executive Summary

| 📦 Total Orders | 👥 Unique Customers | 💰 Total Revenue | 🏪 Active Sellers | 📊 Product Categories |
| :---: | :---: | :---: | :---: | :---: |
| **99K** | **96K** | **$16.01M** | **~3K** | **74** |

### Key Takeaways & Business Risks
* **Growth Trajectory:** Experienced **explosive growth in 2017 (+12,112%)**, followed by a sharp deceleration in 2018 (~68%), signaling market saturation and retention challenges.
* **Retention Bottleneck:** Revenue relies heavily on **new customer acquisition**, with minimal repeat purchases.
* **Logistics Impact:** While overall delivery success is high (~97%), **extreme delivery outliers** severely degrade customer review scores.

---

## 🧠 Business Objectives

1. **Revenue & Growth Analysis:** Track sales trends, payment preferences, and high-performing product categories.
2. **Customer Behavior & Retention:** Measure customer acquisition vs. repeat purchase rates.
3. **Logistics & Delivery Efficiency:** Evaluate on-time delivery rates and identify bottlenecks causing delays.
4. **Seller & Product Performance:** Segment products by price tiers and evaluate seller contribution to revenue and freight costs.

---

## 🧱 Data Architecture & Modeling

Designed a scalable **Star Schema** in Power BI to optimize query performance and eliminate filter ambiguity:

* **Fact Tables:** `Orders`, `Order_Items`, `Order_Payments`, `Order_Reviews`
* **Dimension Tables:** `Customers`, `Products`, `Sellers`, `Date` (Custom Calendar Table)

**Technical Highlights:**
* Utilized `Orders` as a central bridge table to resolve many-to-many relationship ambiguities.
* Implemented advanced **DAX measures** using `CALCULATE`, `CROSSFILTER`, and dynamic **Price Binning** to accurately evaluate category distribution across price tiers.

---

## 📊 Dashboard Walkthrough & Insights

### 1️⃣ Executive Overview
* **KPIs:** 99K Orders | $16.01M Gross Revenue | $161 Avg Order Value (AOV) | 11 Days Avg Delivery Time *(excluding outliers)*.
* **Insights:** ~97% successful delivery rate with strong overall satisfaction (majority 5⭐ reviews).

<img width="1307" height="723" alt="image" src="https://github.com/user-attachments/assets/a5bc4e04-33be-49c1-a309-fe31a831b45b" />


---

### 2️⃣ Sales Performance
* **Insights:** Revenue peaked in 2017 (+12,112%) before slowing to ~68% in 2018. **Credit Cards account for 78%** of total payment volume.
* **Top Revenue Categories:**
  1. **Health & Beauty:** $1.45M
  2. **Watches & Gifts:** $1.31M
  3. **Bed, Bath & Table:** $1.27M
* **Recommendation:** Launch targeted installment offers on credit cards for top-performing categories and introduce loyalty incentives to stabilize growth.

<img width="1325" height="727" alt="image" src="https://github.com/user-attachments/assets/7387115c-adcd-4823-a9de-7807f00170d8" />


---

### 3️⃣ Customer Analysis
* **Insights:** Customer base grew from `0 → 44K (2017) → 53K (2018)`, driven almost entirely by one-time buyers. Returning customer rates dropped sharply in 2018.
* **Recommendation:** Implement post-purchase email marketing flows, personalized discount vouchers for second orders, and a tiered loyalty program.

<img width="1316" height="721" alt="image" src="https://github.com/user-attachments/assets/d261a13d-bafb-44b7-a9b1-5a4e1b7891f4" />


---

### 4️⃣ Orders & Delivery Logistics
* **KPIs:** 96K Delivered | ~1K Cancelled | **93.23% On-Time Delivery** | 210 Days Max Delivery Time *(Extreme Outlier)*.
* **Insights:** Logistics performance is generally reliable, but a small percentage of extreme delays heavily impacts brand perception.
* **Recommendation:** Audit underperforming regional carriers, enforce stricter seller dispatch SLAs, and flag delayed orders proactively.

<img width="1424" height="728" alt="image" src="https://github.com/user-attachments/assets/b909d802-4338-4bab-aa81-313f3bea581a" />


---

### 5️⃣ Reviews & Customer Satisfaction
* **KPIs:** 99K Reviews | **4.09 / 5.0 Avg Rating** | 77% Positive (4–5⭐) | 14.7% Negative (1–2⭐).
* **Insights:** Strong negative correlation between **delivery delays and review scores**—late orders are the primary driver of 1⭐ ratings.
* **Recommendation:** Trigger automated customer support outreach and compensation vouchers whenever an order breaches its estimated delivery date.

<img width="1246" height="719" alt="image" src="https://github.com/user-attachments/assets/9f78d6c8-d160-4107-804a-8effee9ad30a" />


---

### 6️⃣ Sellers Performance
* **KPIs:** ~3K Sellers | **$13.59M Product Sales** | **$2.25M Freight Cost** | 135K Units Sold.
* **Insights:** Revenue is well-distributed across the seller base with no single-seller monopoly risk, though freight costs represent ~14% of total order value.
* **Recommendation:** Introduce a Seller Scorecard ranking merchants by on-time dispatch and review ratings, rewarding top performers with featured placement.

<img width="1448" height="728" alt="image" src="https://github.com/user-attachments/assets/c2e983cb-459a-4801-9730-87fb1c3404f5" />


---

### 7️⃣ Products & Price Segmentation
* **KPIs:** 33K Unique Products | 74 Categories | **$120.65 Avg Item Price**.
* **Insights:** **Bed, Bath & Table** leads in unit volume, while **Computers** commands the highest average price (~$1,098).
* **Recommendation:** Apply **price-tier segmentation** to bundle low-cost high-volume items (increasing AOV) and run targeted promotions on high-ticket electronics.

<img width="1307" height="725" alt="image" src="https://github.com/user-attachments/assets/4e0150ca-4442-4e54-a421-5e22c3f0b494" />


---

## ⚠️ Data Challenges & Engineering Solutions

| Challenge | Engineering Solution |
| :--- | :--- |
| **Missing Numeric Values** | Imputed missing fields using statistical averages in SQL/Power Query to preserve dataset integrity. |
| **Extreme Delivery Outliers** | Isolated statistical outliers (up to 210 days) when calculating baseline KPIs so averages reflect true operational performance. |
| **Null Product Categories** | Standardized unclassified items under an `"Other"` category to prevent blank visuals and broken filters. |
| **Schema & Filter Ambiguity** | Architected a clean Star Schema and leveraged DAX `CROSSFILTER` to ensure accurate multi-table filtering. |
| **Multiple Reviews/Items per Order** | Preserved granularity at the `Order_Items` level while using `DISTINCTCOUNT` for accurate order-level aggregations. |

---

## 🛠️ How to Run Locally

1. **Clone the repository:**
   ```bash
   git clone [https://github.com/ShereenHeshamLotfy/Olist-ECommerce-Insights-End-to-End-Data-Analysis.git](https://github.com/ShereenHeshamLotfy/Olist-ECommerce-Insights-End-to-End-Data-Analysis.git)
