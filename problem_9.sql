-- Group the orders by date and calculate the average number of pizzas ordered per day.


SELECT ROUND(AVG(Pizzas_Sold),0) AS Average_Pizza_Sold_Per_Day FROM
(SELECT orders.order_date AS Date, SUM(order_details.quantity) AS Pizzas_Sold
FROM orders JOIN order_details
ON orders.order_id = order_details.order_id
GROUP BY Date) AS Order_Quantity; 