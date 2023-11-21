create database shopping;
use shopping;

select*from shopping_trends;
# What is the average age of customers in the dataset?

SELECT AVG(age) AS average_age FROM shopping_trends;

# What are the top 5 most purchased product categories?
SELECT category, COUNT(*) AS total_purchases 
FROM shopping_trends 
GROUP BY category
ORDER BY total_purchases DESC 
LIMIT 5;

SELECT GENDER, COUNT(*) AS total_purchases 
FROM shopping_trends 
GROUP BY gender
ORDER BY total_purchases DESC 
LIMIT 5;#gender wise purchases

# How many customers made purchases using a credit card?

SELECT COUNT(*) AS credit_card_purchases 
FROM shopping_trends 
WHERE Payment_Method = 'Credit Card';

#What is the average order value for each season?

SELECT season, round(avg(customer_id)) AS average_order_value 
FROM shopping_trends 
GROUP BY season;

#What is the distribution of payment methods used by customers?

SELECT  category,payment_method, COUNT(*) AS total_customers 
FROM shopping_trends 
GROUP BY category,payment_method;

# How many customers opted for express shipping?
SELECT category,COUNT(*) AS express_shipping_customers 
FROM shopping_trends 
WHERE shipping_type = 'Express'
group by category;

#What is the average rating for each product category?

SELECT category, substring(AVG(review_rating),1,3) AS average_rating 
FROM shopping_trends 
GROUP BY category;

# What is the average order value for each location?

SELECT location, substring(AVG(customer_id),1,3) AS average_order_value 
FROM shopping_trends 
GROUP BY location;

# What is the average order value for each product category
SELECT category, AVG(customer_id) AS average_order_value 
FROM shopping_trends 
GROUP BY category;

#What are the top 5 locations with the highest average order values?

SELECT location, substring(AVG(customer_id),1,4) AS average_order_value 
FROM shopping_trends 
GROUP BY location
ORDER BY average_order_value DESC 
LIMIT 5;


