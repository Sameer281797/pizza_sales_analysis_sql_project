-- Calculate the percentage contribution of each pizza type to total revenue.

SELECT pizza_types.category AS Category,
ROUND(SUM(order_details.quantity * pizzas.price) / (SELECT 
ROUND(SUM(order_details.quantity * pizzas.price), 2) AS Total_Sales
FROM order_details JOIN pizzas
ON order_details.pizza_id = pizzas.pizza_id) *100,2) AS Revenue
FROM pizza_types JOIN pizzas
ON pizza_types.pizza_type_id = pizzas.pizza_type_id
JOIN order_details
ON order_details.pizza_id = pizzas.pizza_id
GROUP BY Category
ORDER BY Revenue DESC;