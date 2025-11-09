# target-ecommerce-sql-analysis
#  Target Brazil E-commerce SQL Case Study

This project analyzes Target’s e-commerce operations in Brazil using SQL to uncover insights about customer behavior, delivery performance, and regional sales.

---

## 📘 Project Overview

**Goal:** Analyze customer, order, and payment data to extract valuable business insights.  
**Tools Used:**  BigQuery,  Tableau Public  

---

## 🧩 Key Tasks 
1. Data exploration (data types, structure, time range)
2. Trend and seasonality analysis
3. Regional order distribution
4. Order value and freight analysis
5. Delivery performance and efficiency
6. Payment analysis

---

## 💾 Example SQL Query

```sql
-- Top 5 fastest states by early delivery
SELECT 
  c.customer_state,
  ROUND(AVG(TIMESTAMP_DIFF(o.order_estimated_delivery_date, o.order_delivered_customer_date, DAY)), 2) AS avg_days_early
FROM 
  Target_Data.orders AS o
JOIN 
  Target_Data.customers AS c
  ON o.customer_id = c.customer_id
WHERE 
  o.order_delivered_customer_date IS NOT NULL
GROUP BY 
  c.customer_state
HAVING 
  AVG(TIMESTAMP_DIFF(o.order_estimated_delivery_date, o.order_delivered_customer_date, DAY)) > 0
ORDER BY 
  avg_days_early DESC
LIMIT 5;
