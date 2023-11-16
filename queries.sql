-- How many drivers she has.

SELECT COUNT(*) FROM Drivers;

-- How many deliveries has each store made?

SELECT COUNT(*), Stores.location FROM Drivers
JOIN Deliveries 
ON Drivers.id=Deliveries.driver_id
JOIN Orders 
ON Deliveries.order_id=Orders.id
JOIN Stores
ON Orders.store_id=Stores.id
GROUP BY Stores.location;

-- How many deliveries has each driver made?

SELECT COUNT(*), Drivers.full_name AS Drivers_Name FROM Drivers
JOIN Deliveries
ON Deliveries.driver_id=Drivers.id
GROUP BY Drivers.full_name;

-- Which driver did the shortest delivery?

SELECT Drivers.full_name, Deliveries.completed_delivery-Deliveries.started_delivery
AS delivery_time
FROM Drivers
JOIN Deliveries
ON Drivers.id=Deliveries.driver_id
ORDER BY delivery_time 
LIMIT 1;

-- Which driver did the longest delivery?

SELECT Drivers.full_name, Deliveries.completed_delivery-Deliveries.started_delivery
AS delivery_time
FROM Drivers
JOIN Deliveries
ON Drivers.id=Deliveries.driver_id
ORDER BY delivery_time desc
LIMIT 1;


--How many times was each topping in an order? 
SELECT COUNT(Available_Toppings.id),Available_Toppings.topping_name 
FROM Available_Toppings 
JOIN Order_Toppings
ON Available_Toppings.id=Order_Toppings.topping_id
GROUP BY Available_Toppings.topping_name
ORDER BY COUNT(Available_Toppings.id) desc;


-- How much did money did they make on each order?
SELECT Orders.id, (Available_Pizzas.cost + SUM(Available_Toppings.cost_per_pizza)) AS pizza_cost
FROM Orders 
JOIN Available_Pizzas 
ON Orders.pizza_type_id=Available_Pizzas.id
JOIN Order_Toppings 
ON Order_Toppings.order_id=Orders.id
JOIN Available_Toppings
ON Available_Toppings.id=Order_Toppings.topping_id
GROUP BY Orders.id, Available_Pizzas.cost
ORDER BY pizza_cost desc;

--Which Store made the most money?
SELECT Stores.id AS store_id, (SUM(Available_Pizzas.cost)+SUM(Available_Toppings.cost_per_pizza)) AS order_cost
FROM Orders
JOIN Stores
ON Orders.store_id=Stores.id
JOIN Available_Pizzas
ON Available_Pizzas.id=Orders.pizza_type_id
JOIN Order_Toppings
ON Order_Toppings.order_id=Orders.id
JOIN Available_Toppings
ON Available_Toppings.id=Order_Toppings.topping_id
GROUP BY Stores.id
ORDER BY order_cost desc
LIMIT 1;

--Which customer spent the most?
SELECT Customers.id AS customers_id, (SUM(Available_Pizzas.cost)+SUM(Available_Toppings.cost_per_pizza)) AS pizza_cost
FROM Customers
JOIN Orders
ON Customers.id=Orders.customer_id
JOIN Available_Pizzas 
ON Available_Pizzas.id=Orders.pizza_type_id
JOIN Order_Toppings
ON Order_Toppings.order_id=Orders.id
JOIN Available_Toppings
ON Available_Toppings.id=Order_Toppings.topping_id
GROUP BY Customers.id
ORDER BY pizza_cost desc
LIMIT 1;

/* How much did they make each month */
SELECT DATE_TRUNC('month', Orders.ordered_date) AS month, (SUM(Available_Pizzas.cost)+SUM(Available_Toppings.cost_per_pizza)) AS total_cost
FROM Orders
JOIN Available_Pizzas
ON Orders.pizza_type_id=Available_Pizzas.id
JOIN Order_Toppings
ON Order_Toppings.order_id=Orders.id
JOIN Available_Toppings
ON Order_Toppings.topping_id=Available_Toppings.id
GROUP BY month
ORDER BY month desc;

--Which driver takes the longest average time?--
SELECT Drivers.full_name, AVG(Deliveries.completed_delivery-Deliveries.started_delivery) AS average_time
FROM Drivers
JOIN Deliveries
ON Deliveries.driver_id=Drivers.id
GROUP BY Drivers.full_name
ORDER BY average_time desc
LIMIT 1;

--Driver with shortest average time
SELECT Drivers.full_name, AVG(Deliveries.completed_delivery-Deliveries.started_delivery) AS average_time
FROM Drivers
JOIN Deliveries
ON Deliveries.driver_id=Drivers.id
GROUP BY Drivers.full_name
ORDER BY average_time asc
LIMIT 1;