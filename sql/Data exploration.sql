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
