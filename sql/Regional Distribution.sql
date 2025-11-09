#3. Evolution of E-commerce orders in the Brazil region:
#1. Get the month on month no. of orders placed in each state.

SELECT 
EXTRACT(month from order_purchase_timestamp) as month,
EXTRACT(year from order_purchase_timestamp) as year,
count(*) AS order_number
from `Target_Data.orders`
Group by year, month
Order by year, month;

# How are the customers distributed across all the states?
SELECT customer_city, customer_state,
COUNT (DISTINCT customer_id) as customer_count
FROM `Target_Data.customers`
GROUP BY customer_city,customer_state
ORDER BY customer_count DESC;
