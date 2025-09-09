-- Determine the top 3 most ordered pizza types
-- based on revenue for each pizza category.

SELECT category, name, Revenue
FROM
(SELECT category, name, Revenue,
RANK() OVER (PARTITION BY category ORDER BY Revenue DESC) AS Final_Rank
FROM
(SELECT pizza_types.category, pizza_types.name,
SUM(order_details.quantity * pizzas.price) AS Revenue
FROM pizza_types JOIN pizzas
ON pizza_types.pizza_type_id = pizzas.pizza_type_id
JOIN order_details
ON order_details.pizza_id = pizzas.pizza_id
GROUP BY pizza_types.category, pizza_types.name) AS A) AS B
WHERE Final_Rank <=3;