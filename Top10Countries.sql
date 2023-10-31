-- Top 10 countries by count of customers

SELECT COUNT(A.customer_id) AS customer_count,
D.country
FROM customer A
INNER JOIN address B ON A.address_id = B.address_id
INNER JOIN city C ON B.city_id = C.city_id
INNER JOIN country D ON C.country_id = D.country_ID
WHERE country IN 
	(SELECT d.country
	FROM customer a
	INNER JOIN address b ON a.address_id = b.address_id
	INNER JOIN city c ON b.city_id = c.city_id
	INNER JOIN country d ON c.country_ID = d.country_ID
	GROUP BY country
	ORDER BY COUNT(customer_id) DESC
	LIMIT 10)
GROUP BY country 	
ORDER BY COUNT(customer_id) DESC
LIMIT 10	
