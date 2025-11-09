# Is there a growing trend in the no. of orders placed over the past years?

SELECT
EXTRACT(YEAR from order_purchase_timestamp) as YEAR,
Count(order_id) as order_number
FROM `Target_Data.orders` 
Group by EXTRACT(YEAR from order_purchase_timestamp)
ORDER BY order_number DESC;


#Can we see some kind of monthly seasonality in terms of the no. of orders being placed?

SELECT
EXTRACT(month from order_purchase_timestamp) as Month,
Count(order_id) as order_number
FROM `Target_Data.orders` 
Group by Month
ORDER BY order_number DESC;


#During what time of the day, do the Brazilian customers mostly place
#their orders? (Dawn, Morning, Afternoon or Night)
#■ 0-6 hrs : Dawn
#■ 7-12 hrs : Mornings
#■ 13-18 hrs : Afternoon
#■ 19-23 hrs : Night

SELECT
EXTRACT(Hour from order_purchase_timestamp) as Hour,
Count(order_id) as order_number,
 CASE
  WHEN EXTRACT(Hour from order_purchase_timestamp) < 7 then 'Dawn'
  WHEN EXTRACT(Hour from order_purchase_timestamp) between 7 and 12 then 'Morning'
  WHEN EXTRACT(Hour from order_purchase_timestamp) between 13 and 18 then 'Afternoon'
  ELSE 'Night'
 END AS Time_period
 FROM `Target_Data.orders` 
Group by Hour, Time_period
ORDER BY order_number DESC;
