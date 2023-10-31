-- Count of top 5 customers by countries

WITH top_5_cust_cte (customer_id, country, city, total_paid) AS 
	(SELECT A.customer_id, D.country , C.city, 
			sum(E.amount) AS total_paid
	FROM customer A 
	INNER JOIN address B ON A.address_id = B.address_id
	INNER JOIN city C ON B.city_id = C.city_id 
	INNER JOIN  country D ON C.country_id = D.country_id
	INNER JOIN  payment E ON E.customer_id = A.customer_id
	GROUP BY A.customer_id, D.country, C.city 
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
	ORDER BY total_paid DESC 
	LIMIT 5)
SELECT D.country, 
       COUNT (A.customer_id),
       COUNT (top_5_cust_cte) 
FROM customer A 
LEFT JOIN top_5_cust_cte ON A.customer_id = top_5_cust_cte.customer_id 
INNER JOIN address B on A.address_id = B.address_id 
INNER JOIN city C ON B.city_id = C.city_id 
INNER JOIN country D ON C.country_id =D.country_id
GROUP BY D.country 
HAVING COUNT (top_5_cust_cte)>0 
ORDER BY COUNT (top_5_cust_cte), COUNT (A.customer_id) DESC; 