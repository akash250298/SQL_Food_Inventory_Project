-- DATA ANALYSIS PROJECT FOR FOOD_RESTAURANT_BUSINESS


USE food_restaurant_business;

-- EXPLORATORY DATA ANALYSIS --
-- UNDERSTANDING THE SCHEMA --


-- Q1 Show all restaurants with their cuisine types.

SELECT restaurant_name, cuisine
 FROM restaurants;

-- Q2 List all Indian restaurants in the database.

SELECT restaurant_name, city 
FROM restaurants 
WHERE cuisine = 'Indian';

-- Q3 Count how many riders use bikes versus cars.

SELECT vehicle, COUNT(*) as count
 FROM riders
 GROUP BY vehicle;

-- Q4 Find all customers from cities starting with "Port".

SELECT customer_name, city
 FROM customers 
 WHERE city LIKE 'Port%';
 
-- Q5 Display the top 5 most expensive menu items.

SELECT item_name, price 
FROM menu_items 
ORDER BY price 
DESC LIMIT 5;

--- Intermediate SQL Questions:-

-- Q6 Find the average rating given by customers.

SELECT AVG(rating) as average_rating 
FROM ratings; 

-- Q7 List orders with their restaurant names and customer names.

SELECT o.order_id, r.restaurant_name, c.customer_name
FROM orders AS o
JOIN restaurants AS r ON o.restaurant_id = r.restaurant_id
JOIN customers AS c ON o.customer_id = c.customer_id;

-- Q8 Show the total amount spent by each customer.

SELECT c.customer_name, SUM(p.amount) as total_spent
FROM customers AS c
JOIN orders AS o ON c.customer_id = o.customer_id
JOIN payments AS p ON o.order_id = p.order_id
GROUP BY c.customer_name;

-- Q9 Calculate the total amount spent by each customer.

SELECT 
    c.customer_id,
    c.customer_name,
    ROUND(SUM(p.amount), 2) AS total_spent
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN payments p ON o.order_id = p.order_id
GROUP BY c.customer_id, c.customer_name
ORDER BY total_spent DESC;

-- Q10 Calculate the average delivery time in minutes for each rider.

SELECT r.rider_name, 
       AVG(TIMESTAMPDIFF(MINUTE, d.pickup_time, d.delivery_time)) as avg_delivery_time
FROM delivery_logs AS d
JOIN orders AS o ON d.order_id = o.order_id
JOIN riders AS r ON o.rider_id = r.rider_id
GROUP BY r.rider_name;

----- ADVANCED SQL QUESTIONS:-----

-- Q11 Find customers who have placed more than 3 orders.

SELECT c.customer_name, COUNT(o.order_id) as order_count
FROM customers AS c
JOIN orders AS O ON c.customer_id = o.customer_id
GROUP BY c.customer_name
HAVING COUNT(o.order_id) > 3;

-- Q12 Show the most popular cuisine based on order count.

SELECT r.cuisine, COUNT(o.order_id) as order_count
FROM restaurants AS r
JOIN orders o ON r.restaurant_id = o.restaurant_id
GROUP BY r.cuisine
ORDER BY order_count DESC
LIMIT 5;

-- Q13 Find riders who have delivered orders with an average rating below 3.

SELECT r.rider_name,
AVG(rt.rating) as avg_rating
FROM riders as r
JOIN orders as o ON r.rider_id = o.rider_id
JOIN ratings as rt ON o.order_id = rt.order_id
GROUP BY r.rider_name
HAVING AVG(rt.rating) < 3; 

-- Q14 Calculate the percentage of orders paid by each payment method.

SELECT payment_method, 
       COUNT(*) * 100.0 / (SELECT COUNT(*) FROM payments) as percentage
FROM payments
GROUP BY payment_method; 

-- Q15 Find the busiest hour for order pickups.

SELECT pickup_time as hour, COUNT(*) as pickup_count
FROM delivery_logs
GROUP BY pickup_time
ORDER BY pickup_count DESC
LIMIT 3; 

-- Q16 Find the month with the highest revenue.

SELECT payment_date as month, SUM(amount) as total_revenue
FROM payments
GROUP BY payment_date
ORDER BY total_revenue DESC
LIMIT 3; 

-- Q17 Find menu items that are priced above the average price of their restaurant's cuisine.

SELECT mi.item_name, mi.price, r.cuisine
FROM menu_items mi
JOIN restaurants r ON mi.restaurant_id = r.restaurant_id
WHERE mi.price > (
    SELECT AVG(mi2.price)
    FROM menu_items mi2
    JOIN restaurants r2 ON mi2.restaurant_id = r2.restaurant_id
    WHERE r2.cuisine = r.cuisine
);

-- Q18: Identify restaurants with consistently high ratings (average rating > 4 from at least 5 reviews)
SELECT 
    r.restaurant_name,
    COUNT(rt.rating) AS total_reviews,
    AVG(rt.rating) AS avg_rating
FROM restaurants AS r
JOIN orders AS o ON r.restaurant_id = o.restaurant_id
JOIN ratings AS rt ON o.order_id = rt.order_id
GROUP BY r.restaurant_name
HAVING AVG(rt.rating) > 4 AND COUNT(rt.rating) >= 1;

-- Q19:  Find riders whose average delivery rating is below 3.

SELECT 
    rd.rider_id,
    rd.rider_name,
    ROUND(AVG(rt.rating), 2) AS avg_rating
FROM riders rd
JOIN orders o ON rd.rider_id = o.rider_id
JOIN ratings rt ON o.order_id = rt.order_id
GROUP BY rd.rider_id, rd.rider_name
HAVING avg_rating < 3;

-- Q20: List all orders with their associated customer names, restaurant names, and rider names.
SELECT 
    o.order_id,
    c.customer_name,
    r.restaurant_name,
    rd.rider_name,
    o.order_date
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
JOIN restaurants r ON o.restaurant_id = r.restaurant_id
JOIN riders rd ON o.rider_id = rd.rider_id
ORDER BY o.order_date DESC;

