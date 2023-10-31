-- The genre for the movie African Egg needs to be updated to thriller. 

UPDATE category 
SET name = 'Thriller' 
WHERE category_id = 
	(SELECT category_id 
	FROM film_category 
	WHERE film_id = 
		(SELECT film_id 
		FROM film 
		WHERE title = 'African Egg' ));
