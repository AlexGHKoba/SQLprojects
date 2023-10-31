-- The average amount paid by the top 5 customers 

SELECT AVG(total_amount_paid)
FROM  
(SELECT  SUM(amount) AS total_amount_paid
FROM payment a 
INNER JOIN customer b on a.customer_id = b.customer_id 
INNER JOIN address c on b.address_id = c.address_id 
INNER JOIN city d on c.city_id = d.city_id 
INNER JOIN country e on d.country_id = e.country_id 
GROUP BY a.customer_id, e.country, d.city 
HAVING city IN 
	(SELECT C.city
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
 	GROUP BY country, city
	ORDER BY COUNT(A.customer_id) DESC
	LIMIT 10)
ORDER BY SUM(amount) DESC
LIMIT 5) total_amount_paid;