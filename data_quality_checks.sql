-- 1. Перевірка цілісності зв'язку (чи всі ресторани з чеків є в довіднику)
SELECT
COUNT(*) AS missing_restaurants
FROM supple-lock-514823-f5.food_delivery.orders_fact AS f
LEFT JOIN supple-lock-514823-f5.food_delivery.restaurants_dim AS d
ON f.Restaurant_ID = d.Restaurant_ID
WHERE d.Restaurant_ID IS NULL;

-- 2. Аналітичний звіт по містах через JOIN фактів і довідника
SELECT
d.City,
COUNT(f.Order_ID) AS total_orders,
ROUND(SUM(f.Total_Price), 2) AS total_revenue
FROM supple-lock-514823-f5.food_delivery.orders_fact AS f
LEFT JOIN supple-lock-514823-f5.food_delivery.restaurants_dim AS d
ON f.Restaurant_ID = d.Restaurant_ID
GROUP BY d.City
ORDER BY total_revenue DESC;
