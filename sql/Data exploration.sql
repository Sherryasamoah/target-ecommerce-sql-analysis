#Import the dataset and do usual exploratory analysis steps like checking the structure & characteristics of the dataset:
#1. Data type of all columns in the "customers" and "geolocation" tables.
#2. Get the time range between which the orders were placed.
#3. Count the Cities & States of customers who ordered during the given period.

SELECT * 
FROM `Target_Data.customers`
LIMIT 10;

SELECT * 
FROM `Target_Data.geolocation`
LIMIT 10;

#2. Get the time range between which all
  the orders were placed.
SELECT 
MIN(order_purchase_timestamp) as start_date,
MAX (order_purchase_timestamp) as end_date
FROM `Target_Data.orders`;

#3. Count the Cities & States of customers who ordered during the given period.

SELECT 
COUNT(c.customer_city),count(c.customer_state)

FROM `Target_Data.orders` as o
JOIN `Target_Data.customers` as c 
ON o.customer_id = c.customer_id
  WHERE EXTRACT (YEAR FROM o.order_purchase_timestamp) = 2017
  AND EXTRACT (MONTH FROM o.order_purchase_timestamp) between 1 and 12;
