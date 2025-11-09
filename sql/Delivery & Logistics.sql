#Find out the top 5 states with the highest & lowest average delivery time.
SELECT 
c.customer_state,
AVG(EXTRACT (DATE from o.order_delivered_customer_date)-EXTRACT (DATE from o.order_purchase_timestamp)) AS avg_delivery_time
FROM `Target_Data.orders` AS o
JOIN `Target_Data.order_items` AS oi
ON o.order_id = oi.order_id
JOIN `Target_Data.customers` AS c
ON o.customer_id = c.customer_id
GROUP BY customer_state
ORDER BY avg_delivery_time DESC
LIMIT 5;

#& lowest average delivery time.
SELECT 
c.customer_state,
AVG(EXTRACT (DATE from o.order_delivered_customer_date)-EXTRACT (DATE from o.order_purchase_timestamp)) AS avg_delivery_time
FROM `Target_Data.orders` AS o
JOIN `Target_Data.order_items` AS oi
ON o.order_id = oi.order_id
JOIN `Target_Data.customers` AS c
ON o.customer_id = c.customer_id
GROUP BY customer_state
ORDER BY avg_delivery_time DESC
LIMIT 5;


#Find out the top 5 states where the order delivery is really fast as compared to the estimated date of delivery.
SELECT 
  c.customer_state,
  ROUND(AVG(TIMESTAMP_DIFF(o.order_estimated_delivery_date, o.order_delivered_customer_date, DAY)), 2) AS avg_days_early
FROM 
  `Target_Data.orders` AS o
JOIN 
  `Target_Data.customers` AS c
  ON o.customer_id = c.customer_id
WHERE 
  o.order_delivered_customer_date IS NOT NULL
  AND o.order_estimated_delivery_date IS NOT NULL
GROUP BY 
  c.customer_state
ORDER BY 
  avg_days_early DESC
LIMIT 5;
