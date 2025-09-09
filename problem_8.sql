-- Find the category-wise distribution of pizzas.

SELECT category AS Category, COUNT(name) AS Pizza_Types FROM pizza_types
GROUP BY category;