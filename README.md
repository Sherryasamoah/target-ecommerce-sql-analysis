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

---


Visuals

### 1. Impact on Economy
- **Interactive Report:** [View in Looker Studio](https://lookerstudio.google.com/reporting/27eaab03-07dc-4791-a2f1-507babffb6c3)
- **PDF Version:** [Download](visuals/impact_on_economy.pdf)

### 2. Delivery Status
- **Interactive Report:** [View in Looker Studio](https://lookerstudio.google.com/reporting/540373eb-5bb8-4f14-8997-c4d185a37dd7)
- **PDF Version:** [Download](visuals/delivery_status.pdf)

### 3. Payment Analysis
- **Interactive Report:** [View in Looker Studio](https://lookerstudio.google.com/reporting/88f0a3f7-6a9c-4975-b287-8872e20cb696)
- **PDF Version:** [Download](visuals/payment_analysis.pdf)

### 4. Trend Across Years
- **Interactive Report:** [View in Looker Studio](https://lookerstudio.google.com/reporting/c67abdd2-69d4-46ad-93a9-b80ee41151a7)
- **PDF Version:** [Download](visuals/trend_across_years.pdf)

### 5. Order Times
- **Interactive Report:** [View in Looker Studio](https://lookerstudio.google.com/reporting/f15c4f7e-57b5-40ce-9b99-af4ea0cab1d0)
- **PDF Version:** [Download](visuals/order_times.pdf)

