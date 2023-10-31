--  Statistics of numerical fields 

SELECT 
	MIN (rental_duration) AS minimum_rental_duration, 
	MAX(rental_duration) AS maximum_rental_duration, 
	AVG(rental_duration) AS mean_rental_duration,
	
	MIN (rental_rate) AS minimum_rental_rate, 
	MAX(rental_rate) AS maximum_rental_rate, 
	AVG(rental_rate) AS mean_rental_rate,

	MIN (length) AS minimum_length, 
	MAX(length) AS maximum_length, 
	AVG(length) AS mean_length,
	
	MIN (replacement_cost) AS minimum_replacement_cost, 
	MAX(replacement_cost) AS maximum_replacement_cost, 
	AVG(replacement_cost) AS mean_replacement_cost
FROM film; 
	
