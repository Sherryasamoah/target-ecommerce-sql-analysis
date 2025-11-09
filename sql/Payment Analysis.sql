#Find the month on month no. of orders placed using different payment types.

SELECT
payment_type,
EXTRACT (YEAR FROM o.order_purchase_timestamp) as year,
EXTRACT(MONTH FROM o.order_purchase_timestamp) as month,
COUNT(DISTINCT o.order_id) as order_count
FROM `Target_Data.orders` as o
JOIN `Target_Data.payments` as p
ON o.order_id = p.order_id
GROUP BY payment_type,year,month
ORDER BY payment_type,year,month;


#Find the no. of orders placed on the basis of the payment installments that have been paid.
SELECT payment_installments,
COUNT(order_id) as count_orders
FROM `Target_Data.payments`
GROUP BY payment_installments;
