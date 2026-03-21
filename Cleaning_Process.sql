CREATE DATABASE Olist_Project;

USE Olist_Project;

---------------------------------------------------------
-- STEP 1: ORDERS TABLE CLEANING
---------------------------------------------------------
SELECT TOP 10 *
FROM olist_orders_dataset;

--Create table to copy data in to it to start cleaning data without affecting raw data
SELECT TOP 0* INTO Orders_Cleaned
FROM olist_orders_dataset;

--Copy data to that table
INSERT INTO Orders_Cleaned(order_id,customer_id,order_status,order_purchase_timestamp,order_approved_at,order_delivered_carrier_date,order_delivered_customer_date,order_estimated_delivery_date)
SELECT order_id,customer_id,order_status,order_purchase_timestamp,order_approved_at,order_delivered_carrier_date,order_delivered_customer_date,order_estimated_delivery_date
FROM olist_orders_dataset;

SELECT * FROM Orders_Cleaned;

--Check if there are any dublications in this table
--There are no dublications 
SELECT 
    order_id,
    customer_id,
    order_status,
    order_purchase_timestamp,
    order_approved_at,
    order_delivered_carrier_date,
    order_delivered_customer_date,
    order_estimated_delivery_date,
    COUNT(*) AS occurrence
FROM Orders_Cleaned
GROUP BY 
    order_id,
    customer_id,
    order_status,
    order_purchase_timestamp,
    order_approved_at,
    order_delivered_carrier_date,
    order_delivered_customer_date,
    order_estimated_delivery_date
HAVING COUNT(*) > 1;

-- Check if there are any duplications in order_id
-- there are no dublications in order_id column
SELECT order_id,COUNT(*)
FROM Orders_Cleaned
GROUP BY order_id
HAVING COUNT(*)>1;

--Check datatype of each column
-- Each column has it`s data type right
SELECT 
    COLUMN_NAME,
    DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'Orders_Cleaned';

--Check if there are nulls in customer_id column
-- There are no nulls in customer_id column
SELECT customer_id
FROM Orders_Cleaned
WHERE customer_id is null;

-- Check if there are any duplications in customer_id
-- there are no dublications in customer_id column
SELECT customer_id,COUNT(*)
FROM Orders_Cleaned
GROUP BY customer_id
HAVING COUNT(*)>1;

SELECT DISTINCT order_status
FROM Orders_Cleaned;

--Check if there are nulls in order_status column
-- There are no nulls in order_status column
SELECT order_status
FROM Orders_Cleaned
WHERE order_status is null;

SELECT order_status,order_purchase_timestamp,order_approved_at,order_delivered_carrier_date,order_delivered_customer_date,order_estimated_delivery_date
FROM Orders_Cleaned
WHERE order_status ='unavailable' or order_status ='canceled' ;

--Check if there are nulls in order_purchase_timestamp column
--There are no nulls in order_purchase_timestamp column
SELECT order_purchase_timestamp
FROM Orders_Cleaned
WHERE order_purchase_timestamp is null;

--Check if there are nulls in order_approved_at column
-- There are 160 order with order_approved_at is null some of them canceled,created or delivered
SELECT order_status,order_purchase_timestamp,order_approved_at,order_delivered_carrier_date,order_delivered_customer_date,order_estimated_delivery_date
FROM Orders_Cleaned
WHERE order_approved_at is null;

SELECT distinct order_status, order_approved_at
FROM Orders_Cleaned
WHERE order_approved_at is null;

-- There are 14 orders delivered with no approved date 
SELECT order_status, order_approved_at,order_purchase_timestamp
FROM Orders_Cleaned
WHERE order_approved_at is null AND order_status='delivered';

--Make column to flag delivered orders with no approved date as i will exclude them in some cases 
ALTER TABLE Orders_Cleaned
ADD approved_date_source NVARCHAR(50);

UPDATE Orders_Cleaned
SET approved_date_source=
    CASE 
        WHEN order_approved_at is null AND order_status='delivered'
        THEN 'purchase_date'
        ELSE 'actual'
    END

SELECT order_status, order_approved_at,order_purchase_timestamp,approved_date_source
FROM Orders_Cleaned
WHERE order_approved_at is null AND order_status='delivered';

--Replace null approved date with purchase timestamp
UPDATE Orders_Cleaned
SET order_approved_at=
    CASE 
        WHEN order_approved_at IS NULL AND order_status='delivered'
        THEN order_purchase_timestamp
        ELSE order_approved_at
    END

--Check cleaning is done right or not
SELECT order_status, order_approved_at,order_purchase_timestamp,approved_date_source
FROM Orders_Cleaned
WHERE order_approved_at IS NULL AND order_status='delivered';

SELECT order_status, order_approved_at,order_purchase_timestamp,approved_date_source
FROM Orders_Cleaned
WHERE approved_date_source='purchase_date';

--Check if there are nulls in order_delivered_carrier_date column
-- There are 1,783 orders with order_delivered_carrier_date is null some of them canceled,created ,delivered,processing,invoiced,unavaliable or approved
SELECT order_delivered_carrier_date
FROM Orders_Cleaned
WHERE order_delivered_carrier_date is null;

SELECT DISTINCT order_status,order_delivered_carrier_date
FROM Orders_Cleaned
WHERE order_delivered_carrier_date is null;

SELECT order_status,order_purchase_timestamp,order_approved_at,order_delivered_carrier_date,order_delivered_customer_date,order_estimated_delivery_date
FROM Orders_Cleaned
WHERE order_delivered_carrier_date is null;

-- There are 5 created orders with unknown order carrier timestamp
SELECT order_status,order_purchase_timestamp,order_approved_at,order_delivered_carrier_date,order_delivered_customer_date,order_estimated_delivery_date
FROM Orders_Cleaned
WHERE order_delivered_carrier_date is null AND order_status='created';

-- There are two delivered orders with unknown order carrier timestamp
SELECT order_status,order_purchase_timestamp,order_approved_at,order_delivered_carrier_date,order_delivered_customer_date,order_estimated_delivery_date
FROM Orders_Cleaned
WHERE order_delivered_carrier_date is null AND order_status='delivered';

--Make column to flag delivered ,invoiced, processing or approved with no delivered_carrier_date date as i will exclude them in some cases 
ALTER TABLE Orders_Cleaned
ADD delivered_carrier_date_source NVARCHAR(50);

UPDATE Orders_Cleaned
SET  delivered_carrier_date_source=
    CASE 
        WHEN order_delivered_carrier_date is null AND order_status ='delivered'
        THEN 
            CASE 
                WHEN order_delivered_customer_date IS NOT NULL
                THEN 'From Customer Date'
                ELSE 'From Estimated Delivery Date'
            END
        WHEN order_delivered_carrier_date is null AND order_status IN ('processing','invoiced','approved') 
        THEN 'Approved Date'
        ELSE 'Actual'
    END

SELECT order_status,order_purchase_timestamp,order_approved_at,order_delivered_carrier_date,order_delivered_customer_date,order_estimated_delivery_date,delivered_carrier_date_source
FROM Orders_Cleaned
WHERE order_delivered_carrier_date is null;

--Replace null order_delivered_carrier_date with order_delivered_customer_date or order_estimated_delivery_date if order_status is delivered
--Replace null order_delivered_carrier_date with order_approved_at if order_status is 'processing','invoiced' or 'approved'
UPDATE Orders_Cleaned
SET order_delivered_carrier_date=
    CASE 
        WHEN order_delivered_carrier_date IS NULL AND order_status ='delivered'
        THEN 
        COALESCE(order_delivered_customer_date,order_estimated_delivery_date)
        WHEN order_delivered_carrier_date IS NULL AND order_status IN ('processing','invoiced','approved') 
        THEN order_approved_at
        ELSE order_delivered_carrier_date
    END

--Check if there are nulls in order_delivered_customer_date column
-- There are 2,965 orders with order_delivered_customer_date is null some of them canceled,created ,delivered,processing,invoiced,unavaliable ,approved or shipped
SELECT order_status,order_delivered_carrier_date,order_delivered_customer_date,order_estimated_delivery_date
FROM Orders_Cleaned
WHERE order_delivered_customer_date is null;

SELECT DISTINCT order_status,order_delivered_customer_date
FROM olist_orders_dataset
WHERE order_delivered_customer_date is null;

-- There are 8 delivered orders with unknown customer delivered date
SELECT order_status, order_delivered_customer_date,order_estimated_delivery_date
FROM Orders_Cleaned
WHERE order_delivered_customer_date is null AND order_status='delivered';

--Make column to flag delivered orders with no customer delivered date as i will exclude them in some cases 
ALTER TABLE Orders_Cleaned
ADD delivered_customer_date_quality NVARCHAR(50);

UPDATE Orders_Cleaned
SET delivered_customer_date_quality=
   CASE
        WHEN order_delivered_customer_date IS NULL AND order_status IN ('delivered','approved','invoiced','processing','shipped')
        THEN 'Estimated_Date'
        ELSE 'Actual'
    END

SELECT order_status, order_delivered_customer_date,order_estimated_delivery_date,delivered_customer_date_quality
FROM Orders_Cleaned
WHERE order_delivered_customer_date is null;

----Replace null order_delivered_customer_date with estimated_delivery_date
UPDATE Orders_Cleaned
SET order_delivered_customer_date=
    CASE 
        WHEN order_delivered_customer_date IS NULL AND order_status IN ('delivered','approved','invoiced','processing','shipped')
        THEN order_estimated_delivery_date
        ELSE order_delivered_customer_date
    END

--Check cleaning is done right or not
SELECT order_status,order_delivered_customer_date 
FROM Orders_Cleaned
WHERE order_delivered_carrier_date is null;

----Check if there are nulls in order_estimated_delivery_date column
-- There are no nulls in order_estimated_delivery_date column
SELECT order_estimated_delivery_date
FROM Orders_Cleaned
WHERE order_estimated_delivery_date is null;

SELECT *
FROM Orders_Cleaned;

---------------------------------------------------------
-- STEP 2: PAYMENTS TABLE CLEANING
---------------------------------------------------------
SELECT *
FROM olist_order_payments_dataset;

SELECT TOP 0 * INTO Payments_Cleaned
FROM olist_order_payments_dataset;

SELECT * FROM Payments_Cleaned;

--Copy data to payment_cleaned table to start cleaning data
INSERT INTO Payments_Cleaned(order_id,payment_sequential,payment_type,payment_installments,payment_value)
SELECT order_id,payment_sequential,payment_type,payment_installments,payment_value
FROM olist_order_payments_dataset;

-- Check if there are any dublications in table
-- There are no dublications
SELECT order_id,payment_sequential,payment_type,payment_installments,payment_value,COUNT(*) AS occurrence
FROM Payments_Cleaned
GROUP BY order_id,payment_sequential,payment_type,payment_installments,payment_value
HAVING COUNT(*) > 1;

--Check if there are nulls in order_id
-- There are no nulls in order_id
SElECT order_id
FROM Payments_Cleaned
WHERE order_id IS NULL;

--Check if there are nulls in payment_sequential
-- There are no nulls in payment_sequential
SElECT order_id,payment_sequential
FROM Payments_Cleaned
WHERE payment_sequential IS NULL;

SELECT DISTINCT payment_sequential
FROM Payments_Cleaned;

SELECT MIN(payment_sequential),MAX(payment_sequential)
FROM Payments_Cleaned;

--Check if there are nulls in payment_type
-- There are no nulls in payment_type
SElECT order_id,payment_type
FROM Payments_Cleaned
WHERE payment_type IS NULL;

SELECT DISTINCT payment_type
FROM olist_order_payments_dataset;

--There are 3 orders with undefined payment method with 0 payment_value that means canceled orders so i will drop them 
SElECT order_id,payment_type,payment_value
FROM Payments_Cleaned
WHERE payment_type ='not_defined';

--Delete this rows
DELETE FROM Payments_Cleaned
WHERE payment_type ='not_defined';

--Check if there are nulls in payment_installments
-- There are no nulls in payment_installments
SElECT order_id,payment_installments
FROM Payments_Cleaned
WHERE payment_installments IS NULL;

SELECT DISTINCT payment_installments
FROM Payments_Cleaned;

SELECT MIN(payment_installments),MAX(payment_installments)
FROM Payments_Cleaned;

--Check if there are nulls in payment_value
-- There are no nulls in payment_value and zero values their payment type are voucher and it is logical
SElECT order_id,payment_value,payment_type
FROM Payments_Cleaned
WHERE payment_value IS NULL OR payment_value<=0;

SELECT MIN(payment_value),MAX(payment_value)
FROM Payments_Cleaned;

SELECT * FROM Payments_Cleaned;

---------------------------------------------------------
-- STEP 3: PRODUCTS TABLE CLEANING
---------------------------------------------------------

SELECT * FROM olist_products_dataset;

--Create table to get a copy of data to start cleaning
SELECT TOP 0* INTO Products_Cleaned
FROM olist_products_dataset;

--COPY DATA TO THAT TABLE
INSERT INTO Products_Cleaned(product_id,product_category_name,product_name_lenght,product_description_lenght,
product_photos_qty,product_weight_g,product_length_cm,product_height_cm,product_width_cm)
SELECT product_id,product_category_name,product_name_lenght,product_description_lenght,
product_photos_qty,product_weight_g,product_length_cm,product_height_cm,product_width_cm
FROM olist_products_dataset;

SELECT * FROM Products_Cleaned;

-- Check if there are any dublications in table
-- There are no dublications
SELECT product_id,product_category_name,product_name_lenght,product_description_lenght,product_photos_qty,product_weight_g,product_length_cm,product_height_cm,product_width_cm,COUNT(*) AS occurrence
FROM Products_Cleaned
GROUP BY product_id,product_category_name,product_name_lenght,product_description_lenght,product_photos_qty,product_weight_g,product_length_cm,product_height_cm,product_width_cm
HAVING COUNT(*) > 1;

--​Drop column like product_name_length and product_description_lenght as they are not necessary in analysis
ALTER TABLE Products_Cleaned
DROP COLUMN product_name_lenght ,product_description_lenght;

--CHECK IF THERE ARE NULLS OR DUPLICATION IN PRODUCT_ID COULMN
-- THERE ARE NO DUBLICATIONS OR NULLS IN product_id column
SELECT product_id
FROM Products_Cleaned
WHERE product_id IS NULL;

SELECT product_id,COUNT(*)
FROM Products_Cleaned
GROUP BY product_id
HAVING COUNT(*)>1;

--CHECK IF THERE ARE NULLS IN product_category_name COULMN
-- THERE ARE 610 OF PRODUCTS WITH UNKOWN NAME
SELECT product_id,product_category_name
FROM Products_Cleaned
WHERE product_category_name IS NULL;

SELECT DISTINCT product_category_name
FROM Products_Cleaned;

--REPLACE NULL VALUES WITH OTHER
UPDATE Products_Cleaned
SET product_category_name='Other'
WHERE product_category_name IS NULL;

--CHECK IF THERE ARE NULLS IN product_photos_qty COULMN
-- THERE ARE 610 OF PRODUCTS WITH QUNATITY OF PHOTOS OF PRODUCT
SELECT product_id,product_photos_qty
FROM Products_Cleaned
WHERE product_photos_qty IS NULL;

SELECT DISTINCT product_photos_qty
FROM Products_Cleaned;

--REPLACE NULL VALUES WITH 0
UPDATE Products_Cleaned
SET product_photos_qty=0
WHERE product_photos_qty IS NULL;

SELECT MIN(product_photos_qty),MAX(product_photos_qty)
FROM Products_Cleaned;

--CHECK IF THERE ARE NULLS IN product_weight_g COULMN
-- THERE ARE 2 OF PRODUCTS WITH NULL WEIGHT
SELECT product_category_name,product_weight_g
FROM Products_Cleaned
WHERE product_weight_g IS NULL;

--REPLACE NULLS WITH AVERAGE WEIGHT OF ITS CATEORGY
WITH Average_weight AS(
SELECT product_category_name,AVG(product_weight_g) as avg_weight
FROM Products_Cleaned
GROUP BY product_category_name)

UPDATE pc
SET product_weight_g = av.avg_weight 
FROM Products_Cleaned pc
JOIN Average_weight av ON pc.product_category_name = av.product_category_name
WHERE pc.product_weight_g IS NULL;

--CHECK IF THERE ARE WEIGHTS WITH ZERO VALUE IN product_weight_g COULMN
-- CAMA_MESA_BENHO CATEOGRY IS WITH ZERO VALUES(4 ROWS)
SELECT product_category_name,product_weight_g
FROM Products_Cleaned
WHERE product_weight_g <=0;

--GET AVERAGE OF ALL PRODUCTS WEIGHT
DECLARE @GlobalAvgWeight FLOAT;
SELECT @GlobalAvgWeight=AVG(product_weight_g)
FROM Products_Cleaned
WHERE product_weight_g>0;

--REPLACE ZEROS VALUE WITH AVERAGE OF ALL PRODUCTS WEIGHT
UPDATE Products_Cleaned
SET product_weight_g=@GlobalAvgWeight
WHERE product_weight_g=0;

SELECT MIN(product_weight_g),MAX(product_weight_g)
FROM Products_Cleaned;

--CHECK IF THERE ARE NULLS IN product_length_cm COULMN
-- THERE ARE 2 OF PRODUCTS WITH NULL HEIGHT
SELECT product_category_name,product_length_cm
FROM Products_Cleaned
WHERE product_length_cm IS NULL;

--REPLACE NULLS WITH AVERAGE LENGTH OF ITS CATEORGY
WITH Average_length AS(
SELECT product_category_name,AVG(product_length_cm) as avg_length
FROM Products_Cleaned
GROUP BY product_category_name)

UPDATE pc
SET product_length_cm = aL.avg_length 
FROM Products_Cleaned pc
JOIN Average_length al ON pc.product_category_name = al.product_category_name
WHERE pc.product_length_cm IS NULL;

--CHECK IF THERE ARE LENGTH WITH ZERO VALUE IN product_length_cm COULMN
-- THERE ARE NO PRODUCTS WITH ZERO OR NEGATIVE VALUES
SELECT product_category_name,product_length_cm
FROM Products_Cleaned
WHERE product_length_cm <=0;

SELECT MIN(product_length_cm),MAX(product_length_cm)
FROM Products_Cleaned;

--CHECK IF THERE ARE NULLS IN product_height_cm COULMN
-- THERE ARE 2 OF PRODUCTS WITH NULL HEIGHT
SELECT product_category_name,product_height_cm
FROM Products_Cleaned
WHERE product_height_cm IS NULL;

--REPLACE NULLS WITH AVERAGE HEIGHT OF ITS CATEORGY
WITH Average_height AS(
SELECT product_category_name,AVG(product_height_cm) as avg_height
FROM Products_Cleaned
GROUP BY product_category_name)

UPDATE pc
SET product_height_cm = ah.avg_height
FROM Products_Cleaned pc
JOIN Average_height ah ON pc.product_category_name = ah.product_category_name
WHERE pc.product_height_cm IS NULL;

--CHECK IF THERE ARE LENGTH WITH ZERO VALUE IN product_height_cm COULMN
-- THERE ARE NO PRODUCTS WITH ZERO OR NEGATIVE VALUES
SELECT product_category_name,product_height_cm
FROM Products_Cleaned
WHERE product_height_cm <=0;

SELECT MIN(product_height_cm),MAX(product_height_cm)
FROM Products_Cleaned;

--CHECK IF THERE ARE NULLS IN product_width_cm COULMN
-- THERE ARE 2 OF PRODUCTS WITH NULL WIDTH
SELECT product_category_name,product_width_cm
FROM Products_Cleaned
WHERE product_width_cm IS NULL;

--REPLACE NULLS WITH AVERAGE HEIGHT OF ITS CATEORGY
WITH Average_width AS(
    SELECT product_category_name,AVG(product_width_cm) as avg_width
    FROM Products_Cleaned
    GROUP BY product_category_name)

UPDATE pc
SET product_width_cm = aw.avg_width
FROM Products_Cleaned pc
JOIN Average_width aw ON pc.product_category_name = aw.product_category_name
WHERE pc.product_width_cm IS NULL;

--CHECK IF THERE ARE LENGTH WITH ZERO VALUE IN product_width_cm COULMN
-- THERE ARE NO PRODUCTS WITH ZERO OR NEGATIVE VALUES
SELECT product_category_name,product_width_cm
FROM Products_Cleaned
WHERE product_width_cm <=0;

SELECT MIN(product_width_cm),MAX(product_width_cm)
FROM Products_Cleaned;

SELECT * FROM Products_Cleaned;

---------------------------------------------------------
-- STEP 4: JOIN PRODUCTS TABLE WITH PRODUCTS NAME TRANSLATION
---------------------------------------------------------
SELECT * FROM product_category_name_translation;

DELETE FROM product_category_name_translation
WHERE product_category_name_EN='product_category_name_english';

--TRANSLATE CATEGORY NAME FROM PORTUGUESE TO ENGLISH
UPDATE pc
SET product_category_name=pt.product_category_name_EN
FROM Products_Cleaned pc
JOIN product_category_name_translation pt ON pc.product_category_name=pt.product_category_name;

---------------------------------------------------------
-- STEP 5: CUSTOMERS TABLE CLEANING
---------------------------------------------------------
SELECT * FROM olist_customers_dataset;

--Create table to copy data in to it to start cleaning data without affecting raw data
SELECT TOP 0* INTO Customers_Cleaned
FROM olist_customers_dataset;

--Copy data to that table
INSERT INTO Customers_Cleaned(customer_id,customer_unique_id,customer_zip_code_prefix,customer_city,customer_state)
SELECT customer_id,customer_unique_id,customer_zip_code_prefix,customer_city,customer_state
FROM olist_customers_dataset;

SELECT * FROM Customers_Cleaned;

-- Check if there are any dublications in table
-- There are no dublications
SELECT customer_id,customer_unique_id,customer_zip_code_prefix,customer_city,customer_state,COUNT(*) AS occurrence
FROM Customers_Cleaned
GROUP BY customer_id,customer_unique_id,customer_zip_code_prefix,customer_city,customer_state
HAVING COUNT(*) > 1;

--Check nulls and duplications in customer_id
-- There are no nulls in customer_id and no duplications in it as it should be unique key for each customer order
SELECT customer_id
FROM Customers_Cleaned
WHERE customer_id IS NULL;

SELECT customer_id,COUNT(*)
FROM Customers_Cleaned
GROUP BY customer_id
HAVING COUNT(*) >1;

--Check nulls and duplications in customer_unique_id
-- There are no nulls in customer_unique_id 
--There are duplications in it as it means customer make more than one order and it is good thing and as customer_unique_id related to customer
--But customer_id related to orders s and it creates with every new order
SELECT customer_unique_id
FROM Customers_Cleaned
WHERE customer_unique_id IS NULL;

SELECT customer_unique_id,COUNT(*)
FROM Customers_Cleaned
GROUP BY customer_unique_id
HAVING COUNT(*) >1;

--Check nulls in customer_zip_code_prefix
-- There are no nulls in customer_zip_code_prefix 
SELECT customer_zip_code_prefix
FROM Customers_Cleaned
WHERE customer_unique_id IS NULL;

SELECT DISTINCT customer_zip_code_prefix,customer_city,customer_state
FROM Customers_Cleaned;

--Check nulls in customer_city
-- There are no nulls in customer_city
SELECT customer_city
FROM Customers_Cleaned
WHERE customer_city IS NULL;

--Check nulls in customer_state
-- There are no nulls in customer_state
SELECT customer_state
FROM Customers_Cleaned
WHERE customer_state IS NULL;

--Get sales of each city
SELECT c.customer_city,COUNT(DISTINCT oc.order_id) AS total_orders,ROUND(SUM(pc.payment_value),2) AS total_sales
FROM Customers_Cleaned c
JOIN Orders_Cleaned oc ON c.customer_id=oc.customer_id
JOIN Payments_Cleaned pc ON oc.order_id=pc.order_id
GROUP BY c.customer_city
ORDER BY total_sales DESC

---------------------------------------------------------
-- STEP 6: ORDER_ITEMS TABLE CLEANING
---------------------------------------------------------
SELECT * FROM olist_order_items_dataset;

--Create table to copy data in to it to start cleaning data without affecting raw data
SELECT TOP 0* INTO Order_items_Cleaned
FROM olist_order_items_dataset;

--Copy data to that table
INSERT INTO Order_items_Cleaned(order_id,order_item_id,product_id,seller_id,shipping_limit_date,price,freight_value)
SELECT order_id,order_item_id,product_id,seller_id,shipping_limit_date,price,freight_value
FROM olist_order_items_dataset;

SELECT * FROM Order_items_Cleaned;

-- Check if there are any dublications in table
-- There are no dublications
SELECT order_id,order_item_id,product_id,seller_id,shipping_limit_date,price,freight_value,COUNT(*) AS occurrence
FROM Order_items_Cleaned
GROUP BY order_id,order_item_id,product_id,seller_id,shipping_limit_date,price,freight_value
HAVING COUNT(*) > 1;

--Check nulls in order_id
-- There are no nulls in order_id
SELECT order_id
FROM Order_items_Cleaned
WHERE order_id IS NULL;

--Check nulls in order_item_id
-- There are no nulls in order_item_id
SELECT order_item_id
FROM Order_items_Cleaned
WHERE order_item_id IS NULL;

--Check nulls in product_id
-- There are no nulls in product_id
SELECT product_id
FROM Order_items_Cleaned
WHERE product_id IS NULL;

--Check nulls in seller_id
-- There are no nulls in seller_id
SELECT seller_id
FROM Order_items_Cleaned
WHERE seller_id IS NULL;

--Check nulls in seller_id
-- There are no nulls in seller_id
SELECT shipping_limit_date
FROM Order_items_Cleaned
WHERE shipping_limit_date IS NULL;

SELECT DISTINCT shipping_limit_date
FROM Order_items_Cleaned;

--Check nulls in price column
-- There are no nulls in price column
SELECT price
FROM Order_items_Cleaned
WHERE price IS NULL;

--Check nulls in price
-- There are no negative values or zero in price column
SELECT price
FROM Order_items_Cleaned
WHERE price <=0;

SELECT MIN(price),MAX(price)
FROM Order_items_Cleaned;

--Check nulls in freight_value column
-- There are no nulls in freight_value column
SELECT freight_value
FROM Order_items_Cleaned
WHERE freight_value IS NULL;

--Check nulls in freight_value
-- There are no negative values or 
-- There are zeros in freight_value column and it is considered logical as they represent promotional strategies 
--like free shipping offeres or the use of discount coupons
SELECT order_id,order_item_id,product_id,shipping_limit_date,freight_value
FROM Order_items_Cleaned
WHERE freight_value <=0;

SELECT MIN(freight_value),MAX(freight_value)
FROM Order_items_Cleaned;

--Get Best seller
SELECT seller_id,COUNT(order_id) AS number_of_orders
FROM Order_items_Cleaned
GROUP BY seller_id
ORDER BY COUNT(order_id) DESC;

--Get Best Product
--Furniture_decor category is the best seller product category
SELECT oi.product_id,pc.product_category_name,COUNT(order_id) AS number_of_orders
FROM Order_items_Cleaned oi
JOIN Products_Cleaned pc ON oi.product_id=pc.product_id
GROUP BY oi.product_id,pc.product_category_name
ORDER BY COUNT(oi.product_id) DESC;

---------------------------------------------------------
-- STEP 7: ORDER_ITEMS TABLE CLEANING
---------------------------------------------------------
SELECT * FROM olist_sellers_dataset;

--Create table to copy data in to it to start cleaning data without affecting raw data
SELECT TOP 0* INTO Sellers_Cleaned
FROM olist_sellers_dataset;

--Copy data to that table
INSERT INTO Sellers_Cleaned(seller_id,seller_zip_code_prefix,seller_city,seller_state)
SELECT seller_id,seller_zip_code_prefix,seller_city,seller_state
FROM olist_sellers_dataset;

SELECT * FROM Sellers_Cleaned;

-- Check if there are any dublications in table
-- There are no dublications
SELECT seller_id,seller_zip_code_prefix,seller_city,seller_state,COUNT(*) AS occurrence
FROM Sellers_Cleaned
GROUP BY seller_id,seller_zip_code_prefix,seller_city,seller_state
HAVING COUNT(*) > 1;

--Check nulls and dublications in seller_id column
-- There are no nulls or dublications in seller_id column as it is the primary key of table
SELECT seller_id
FROM Sellers_Cleaned
WHERE seller_id IS NULL;

SELECT seller_id,COUNT(*)
FROM Sellers_Cleaned
GROUP BY seller_id
HAVING COUNT(*)>1 ;

--Check nulls in seller_zip_code_prefix column
-- There are no nulls in seller_zip_code_prefix column 
SELECT seller_zip_code_prefix
FROM Sellers_Cleaned
WHERE seller_zip_code_prefix IS NULL;

--Check nulls in seller_city column
-- There are no nulls in seller_city column 
SELECT seller_city
FROM Sellers_Cleaned
WHERE seller_city IS NULL;

--Check nulls in seller_state column
-- There are no nulls in seller_state column 
SELECT seller_state
FROM Sellers_Cleaned
WHERE seller_state IS NULL;

--Get best 10 seller and his city and state
SELECT TOP 10 s.seller_id,s.seller_city,s.seller_state,COUNT(oi.order_id) AS number_of_orders
FROM Sellers_Cleaned s
JOIN Order_items_Cleaned oi ON oi.seller_id=s.seller_id
GROUP BY s.seller_id,s.seller_city,s.seller_state
ORDER BY COUNT(oi.order_id) DESC;

---------------------------------------------------------
-- STEP 8: ORDER_REVIEWS TABLE CLEANING
---------------------------------------------------------
SELECT * FROM olist_order_reviews_dataset;

--Create table to copy data in to it to start cleaning data without affecting raw data
SELECT TOP 0* INTO Order_Reviews_Cleaned
FROM olist_order_reviews_dataset;

--Copy data to that table
INSERT INTO Order_Reviews_Cleaned(review_id,order_id,review_score,review_comment_title,review_comment_message,review_creation_date,review_answer_timestamp)
SELECT review_id,order_id,review_score,review_comment_title,review_comment_message,review_creation_date,review_answer_timestamp
FROM olist_order_reviews_dataset;

SELECT * FROM Order_Reviews_Cleaned;

-- Check if there are any dublications in table
-- There are no dublications
SELECT review_id,order_id,review_score,review_comment_title,review_comment_message,review_creation_date,review_answer_timestamp,COUNT(*) AS occurrence
FROM Order_Reviews_Cleaned
GROUP BY review_id,order_id,review_score,review_comment_title,review_comment_message,review_creation_date,review_answer_timestamp
HAVING COUNT(*) > 1;

--Check nulls and dublications in review_id column
-- There are no nulls in review_id column
-- Multiple identical review_ids combined with different order_ids within the same timestamp 
-- indicate that customers may have received a single review survey link for separate orders, 
-- leading to multiple entries for one review. This is considered systematic data behavior, not an error
SELECT review_id
FROM Order_Reviews_Cleaned
WHERE review_id IS NULL;

SELECT review_id,COUNT(*)
FROM Order_Reviews_Cleaned
GROUP BY review_id
HAVING COUNT(*)>1 ;

SELECT *
FROM Order_Reviews_Cleaned
WHERE review_id IN (
    SELECT review_id
    FROM Order_Reviews_Cleaned
    GROUP BY review_id
    HAVING COUNT(*) > 1
)

--Check nulls and dublications in order_id column
-- There are no nulls in order_id column
--Multiple identical order_ids with distinct review_ids and the different answer_timestamp 
-- reflect a systematic behavior where the system generated separate review requests for different items 
-- within the same order, likely due to variations in product categories, shipping terms, or sellers. 
-- This is considered an acceptable data phenomenon.
SELECT order_id
FROM Order_Reviews_Cleaned
WHERE order_id IS NULL;

SELECT order_id,COUNT(*)
FROM Order_Reviews_Cleaned
GROUP BY order_id
HAVING COUNT(*)>1 ;

SELECT *
FROM Order_Reviews_Cleaned
WHERE order_id IN (
    SELECT order_id
    FROM Order_Reviews_Cleaned
    GROUP BY order_id
    HAVING COUNT(*) > 1
)

SELECT * 
FROM Order_Reviews_Cleaned
WHERE order_id='826221f0c1a1915308dccb83b841eb2f'

--Check nulls in review_score
--There are no nulls in review_score column
SELECT review_score
FROM Order_Reviews_Cleaned
WHERE review_score IS NULL;

SELECT DISTINCT review_score
FROM Order_Reviews_Cleaned;

--Check nulls in review_comment_title and review_comment_message
-- There are nulls in review_comment_title column
-- As Nulls in review_comment_title and review_comment_message are logically expected, 
-- as customers may provide a review score without adding written feedback. 
-- This is common behavior for optional fields
SELECT review_comment_title
FROM Order_Reviews_Cleaned
WHERE review_comment_title IS NULL;

SELECT review_comment_message
FROM Order_Reviews_Cleaned
WHERE review_comment_message IS NULL;

--Check nulls in review_creation_date
--There are no nulls in review_creation_date column
SELECT review_creation_date
FROM Order_Reviews_Cleaned
WHERE review_creation_date IS NULL;

--Check nulls in review_answer_timestamp
--There are no nulls in review_answer_timestamp column
SELECT review_answer_timestamp
FROM Order_Reviews_Cleaned
WHERE review_answer_timestamp IS NULL;

SELECT * FROM Order_Reviews_Cleaned;















