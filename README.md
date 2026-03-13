# ​🛒 Olist E-Commerce Data Analysis Project 📊
## 🌟 Project Overview
​This project focuses on analyzing the Olist Brazilian E-Commerce dataset, a complex relational database containing over 100k orders from 2016 to 2018. The goal is to perform a complete Data Analytics lifecycle—from raw data to actionable business insights.

## 🛠️ Tech Stack & Tools
​SQL Server 🗄️ (Data Cleaning & Complex Joins)                                                                                                                      
​Power BI / DAX 📈 (Interactive Dashboards & Metrics)                                                                                                               
​Excel 📑 (Initial Data Inspection)                                                                                                                                 
​GitHub 🐙 (Version Control & Documentation)

## 🧹 Data Cleaning Highlights (The "Hard" Part)
​Unique Identity Mapping: 🆔 Resolved the difference between customer_id and customer_unique_id to track repeat customers.                                          
​Payment Consolidation: 💳 Handled orders with multiple payment methods by aggregating values per order_id.                                                         
​Data Integrity: ✅ Removed duplicates and handled NULL values across 7+ relational tables.                                                                         
​Geospatial Logic: 📍 Verified and cleaned zip_code_prefix to ensure accurate mapping of cities like São Paulo and Rio de Janeiro.
​
## 💡 Key Business Insights
​Revenue by City: 💰 Identifying the top-performing regions.                                                                                                        
​Customer Retention: 🔄 Analyzing the Retention Rate through unique IDs.                                                                                            
​Average Order Value (AOV): 📈 Calculating how much customers spend on average per transaction.                                                                     
​Shipping Efficiency: 🚚 Monitoring shipping_limit_date vs. actual delivery.

## 📁 Repository Structure
​/SQL_Scripts 📜: All cleaning and analysis queries.                                                                                                                
​/Cleaned_Data ✨: Excel files after processing.                                                                                                                      
​/PowerBI_Dashboard 📊: The final .pbix file.
