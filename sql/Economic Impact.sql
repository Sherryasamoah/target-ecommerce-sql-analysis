# Impact on Economy: 
# 1. Get the % increase in the cost of orders from year 2017 to 2018 (include months between Jan to Aug only).
With yearly_totals as (
SELECT 
EXTRACT (Year from o.order_purchase_timestamp) as Year,
SUM(p.payment_value) as total_payment
FROM `Target_Data.payments` as p
JOIN `Target_Data.orders` as o
on p.order_id = o.order_id
WHERE EXTRACT(Year from order_purchase_timestamp) in (2017,2018)
AND EXTRACT(Month from order_purchase_timestamp) between 1 and 8
GROUP BY Year
),


# Use LEAD window function to compare each years payment with the previous year 

WITH yearly_comparison as (
Select 
year, total_payment,
LEAD(total_payment) over (order by year desc) as prev_year_payment
from yearly_totals
)

# Calculate % increase

SELECT
round(((yearly_comparison.total_payment-prev_year_payment)/prev_year_payment)*100,2) as Percentage_increase
from yearly_comparison;

# 2. Calculate the Total & Average value of order price and freight for each state.

SELECT 
c.customer_state,
ROUND(SUM(price),2) as sum_price,
ROUND(AVG(price),2) as avg_price,
ROUND(SUM(freight_value),2) as sum_freight,
ROUND(AVG(freight_value),2) as avg_freight

FROM `Target_Data.orders` as o
Join `Target_Data.order_items` as oi
on o.order_id = oi.order_id
JOIN `Target_Data.customers` as c
on o.customer_id = c.customer_id
GROUP BY customer_state;
