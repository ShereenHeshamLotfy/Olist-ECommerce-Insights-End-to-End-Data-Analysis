CREATE DATABASE Olist_Project;

USE Olist_Project;

---------------------------------------------------------
-- STEP 1: ORDERS TABLE CLEANING
---------------------------------------------------------
SELECT TOP 10 *
FROM olist_orders_dataset;

-- Check if there are any duplications in data
-- there are no dublications in this table
SELECT order_id,COUNT(*)
FROM olist_orders_dataset
GROUP BY order_id
HAVING COUNT(*)>1;

--Check datatype of each column
-- Each column has it`s data type right
SELECT 
    COLUMN_NAME,
    DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'olist_orders_dataset';

ALTER TABLE olist_orders_dataset
ALTER COLUMN order_purchase_timestamp DATETIME ;

ALTER TABLE olist_orders_dataset
ALTER COLUMN  order_approved_at DATETIME;

ALTER TABLE olist_orders_dataset
ALTER COLUMN order_delivered_carrier_date DATETIME;

ALTER TABLE olist_orders_dataset
ALTER COLUMN order_delivered_customer_date DATETIME ;

ALTER TABLE olist_orders_dataset
ALTER COLUMN order_estimated_delivery_date DATETIME ;

--Check if there are nulls in customer_id column
-- There are no nulls in customer_id column
SELECT customer_id
FROM olist_orders_dataset
WHERE customer_id is null;

SELECT DISTINCT order_status
FROM olist_orders_dataset;

--Check if there are nulls in order_status column
-- There are no nulls in order_status column
SELECT order_status
FROM olist_orders_dataset
WHERE order_status is null;

--Check if there are nulls in order_purchase_timestamp column
--There are no nulls in order_purchase_timestamp column
SELECT order_purchase_timestamp
FROM olist_orders_dataset
WHERE order_purchase_timestamp is null;

--Check if there are nulls in order_approved_at column
-- There are 160 order with order_approved_at is null some of them canceled,created or delivered
SELECT order_approved_at
FROM olist_orders_dataset
WHERE order_approved_at is null;

SELECT distinct order_status, order_approved_at
FROM olist_orders_dataset
WHERE order_approved_at is null;

-- There are 14 orders delivered with no approved date 
SELECT order_status, order_approved_at,order_purchase_timestamp
FROM olist_orders_dataset
WHERE order_approved_at is null AND order_status='delivered';

--Replace null approved date with purchase timestamp
UPDATE olist_orders_dataset
SET order_approved_at=order_purchase_timestamp
WHERE order_approved_at IS NULL 
AND order_status='delivered';

--Check if there are nulls in order_delivered_carrier_date column
-- There are 1,783 orders with order_delivered_carrier_date is null some of them canceled,created ,delivered,processing,invoiced,unavaliable or approved
SELECT order_delivered_carrier_date
FROM olist_orders_dataset
WHERE order_delivered_carrier_date is null;

SELECT DISTINCT order_status,order_delivered_carrier_date
FROM olist_orders_dataset
WHERE order_delivered_carrier_date is null;

-- There are two delivered orders with unknown order carrier timestamp
SELECT order_status,order_delivered_carrier_date ,order_approved_at
FROM olist_orders_dataset
WHERE order_delivered_carrier_date is null AND order_status='delivered';

----Replace null order_delivered_carrier_date with approved timestamp
UPDATE olist_orders_dataset
SET order_delivered_carrier_date=order_approved_at
WHERE order_delivered_carrier_date IS NULL 
AND order_status='delivered';

--Check if there are nulls in order_delivered_customer_date column
-- There are 2,965 orders with order_delivered_customer_date is null some of them canceled,created ,delivered,processing,invoiced,unavaliable or approved
SELECT order_delivered_customer_date
FROM olist_orders_dataset
WHERE order_delivered_customer_date is null;

SELECT DISTINCT order_status,order_delivered_customer_date
FROM olist_orders_dataset
WHERE order_delivered_customer_date is null;

-- There are 8 delivered orders with unknown customer delivered date
SELECT order_status, order_delivered_customer_date,order_estimated_delivery_date
FROM olist_orders_dataset
WHERE order_delivered_customer_date is null AND order_status='delivered';

--Make column to flag delivered orders with no customer delivered date as i will exclude them in some cases 
ALTER TABLE olist_orders_dataset
ADD delivery_data_quality NVARCHAR(50);

UPDATE olist_orders_dataset
SET delivery_data_quality='Data Missing'
WHERE order_delivered_customer_date IS NULL AND order_status ='delivered';

----Replace null order_delivered_carrier_date with estimated_delivery_date
UPDATE olist_orders_dataset
SET order_delivered_customer_date=order_estimated_delivery_date
WHERE order_delivered_customer_date IS NULL 
AND order_status='delivered';

----Check if there are nulls in order_estimated_delivery_date column
-- There are no nulls in order_estimated_delivery_date column
SELECT order_estimated_delivery_date
FROM olist_orders_dataset
WHERE order_estimated_delivery_date is null;

SELECT *
FROM olist_orders_dataset;

---------------------------------------------------------
-- STEP 2: PAYMENTS TABLE CLEANING
---------------------------------------------------------
SELECT *
FROM olist_order_payments_dataset;








