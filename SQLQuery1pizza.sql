--1using database
USE pizzaSales;
--2Selecting whole data from table
SELECT * FROM pizza_sales$;

--3Total number of orders, average quantity, sum of total price 
SELECT 
   COUNT(DISTINCT order_id) AS total_orders,
   AVG(quantity) AS avg_order_quantity,
   SUM(total_price) AS total_revenue
FROM pizza_sales$

--4Identifying most popular pizza on the basis of sum of quantity 
SELECT 
   pizza_name,
   SUM(quantity) AS total_quantity_ordered
FROM pizza_sales$
GROUP BY pizza_name
ORDER BY total_quantity_ordered DESC;

--5Analyzing Revenue distribution as total revenue on the basis of pizza size
SELECT 
   pizza_size,
   SUM(total_price) AS total_revenue
FROM pizza_sales$
GROUP BY pizza_size;

--6Analyzing monthly revenue trend
SELECT 
   MONTH(order_date) AS month,
   SUM(total_price) AS monthly_revenue
FROM pizza_sales$
GROUP BY MONTH(order_date)
ORDER BY month;

--7Exploring pizza with their respective ingredients
SELECT 
   pizza_category,
   STRING_AGG(pizza_ingredients, ', ') AS unique_ingredients
FROM (
   SELECT DISTINCT pizza_category, pizza_ingredients
   FROM pizza_sales$
) AS distinct_pizzas
GROUP BY pizza_category;

--8Customer segmentation based on frequency of orders
SELECT 
   order_id,
   COUNT(order_id) AS order_frequency
FROM pizza_sales$
GROUP BY order_id
ORDER BY order_frequency DESC;

--9Average unit price
SELECT 
   pizza_name,
   AVG(unit_price) AS avg_unit_price
FROM pizza_sales$
GROUP BY pizza_name;

--10Analyzing peak hours
SELECT 
   DATEPART(HOUR, order_time) AS hour,
   COUNT(order_id) AS order_count
FROM pizza_sales$
GROUP BY DATEPART(HOUR, order_time)
ORDER BY hour;

--11Identify customers with the highest order frequency.
SELECT 
   order_id,
   COUNT(order_id) AS order_frequency
FROM pizza_sales$
GROUP BY order_id
ORDER BY order_frequency DESC


--12Busiest hour of the day 
SELECT DATEPART(HOUR, order_time) AS hour_of_day, COUNT(*) AS orders_count
FROM pizza_sales$
GROUP BY DATEPART(HOUR, order_time)
ORDER BY orders_count DESC;

--13Revenue by day of the week
SELECT DATEPART(DW, order_date) AS day_of_week, SUM(total_price) AS daily_revenue
FROM pizza_sales$
GROUP BY DATEPART(DW, order_date)
ORDER BY day_of_week;

