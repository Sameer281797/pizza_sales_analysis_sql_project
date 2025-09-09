-- Analyze the cumulative revenue generated over time.

SELECT order_date,
ROUND(SUM(Revenue) over (ORDER BY order_date), 2) AS Cum_Revenue
FROM
(SELECT orders.order_date,
ROUND(SUM(order_details.quantity * pizzas.price), 2) AS Revenue
FROM order_details JOIN pizzas
ON order_details.pizza_id = pizzas.pizza_id
JOIN orders
ON orders.order_id = order_details.order_id
GROUP BY orders.order_date) AS Sales;