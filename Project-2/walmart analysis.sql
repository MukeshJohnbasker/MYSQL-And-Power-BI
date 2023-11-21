create database walmart;

use walmart;
select*from w_sales_;

-- How many unique cities does the data have?
SELECT DISTINCT city
FROM W_sales_;

-- In which city is each branch?
SELECT DISTINCT city,branch
FROM W_sales_;

-- How many unique product lines does the data have?
SELECT DISTINCT product_line
FROM W_sales_;


-- What is the most selling product line
SELECT SUM(quantity) as qty,product_line FROM W_sales_
GROUP BY product_line
ORDER BY qty DESC;

-- What is the total revenue by month
SELECT month,SUM(total) AS total_revenue
FROM W_sales_
GROUP BY month 
ORDER BY total_revenue;


-- What month had the largest COGS?
SELECT month ,SUM(cogs) AS cogs
FROM W_sales_
GROUP BY month
ORDER BY cogs;

-- What product line had the largest revenue?
SELECT product_line,SUM(total) as total_revenue
FROM W_sales_
GROUP BY product_line
ORDER BY total_revenue DESC;

-- What is the city with the largest revenue?
SELECT branch,city,SUM(total) AS total_revenue
FROM W_sales_
GROUP BY city, branch 
ORDER BY total_revenue;

-- Which branch sold more products than average product sold?
SELECT branch, SUM(quantity) AS quantity
FROM W_sales_
GROUP BY branch
HAVING SUM(quantity) > (SELECT AVG(quantity) FROM W_sales_);


-- What is the most common product line by gender
SELECT gender,product_line, COUNT(gender) AS total_count
FROM W_sales_
GROUP BY gender, product_line
ORDER BY total_count DESC;

-- What is the average rating of each product line
SELECT product_line,ROUND(AVG(rating), 1) as avg_rating
FROM W_sales_
GROUP BY product_line
ORDER BY avg_rating DESC;

-- How many unique customer types does the data have?
SELECT DISTINCT customer_type
FROM W_sales_;

-- How many unique payment methods does the data have?
SELECT DISTINCT payment
FROM W_sales_;


-- What is the most common customer type?
SELECT customer_type,count(*) as count
FROM W_sales_
GROUP BY customer_type
ORDER BY count DESC;

-- What is the gender of most of the customers?
SELECT gender,COUNT(*) as gender_count
FROM W_sales_
GROUP BY gender
ORDER BY gender_count DESC;

-- Which time of the day do customers give most ratings?
SELECT time_of_day,AVG(rating) AS avg_rating
FROM W_sales_
GROUP BY time_of_day
ORDER BY avg_rating DESC;

-- Which day fo the week has the best avg ratings?
SELECT day,AVG(rating) AS avg_rating
FROM W_sales_
GROUP BY day 
ORDER BY avg_rating DESC;

-- Number of sales made in each time of the day 
SELECT time_of_day,COUNT(*) AS total_sales
FROM W_sales_
GROUP BY time_of_day 
ORDER BY total_sales DESC;


-- Which of the customer types brings the most revenue?
SELECT customer_type,SUM(total) AS total_revenue
FROM W_sales_
GROUP BY customer_type
ORDER BY total_revenue;


