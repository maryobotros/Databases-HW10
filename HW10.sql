-- 3.
SELECT customer_email, category_name, num_films
FROM	
	(SELECT Customer.email AS customer_email, Category.name AS category_name, COUNT(Category.category_id) AS number, COUNT(Film.film_id) AS num_films
	FROM Film, Category, Customer, Rental, Inventory, Film_category
	WHERE Film.film_id = Film_category.film_id
	AND Film_category.category_id = Category.category_id
	AND Customer.customer_id = Rental.customer_id
	AND Rental.inventory_id = Inventory.inventory_id
	AND Inventory.film_id = Film.film_id
	GROUP BY Customer.email, Category.name) AS TEMP
GROUP BY customer_email, category_name
HAVING MAX(number)
ORDER BY MAX(number) DESC
LIMIT 5;


-- 4.  Using count, how many customers do we have? 
SELECT COUNT(customer_id)
FROM Customer;
-- Using count, how many emails do we have? 
-- Show your queries and your results.
SELECT COUNT(email)
FROM Staff;


-- 5. Using Having, you want to know how many popular actors are in the database. 
-- Popularity is defined as an actor taking part in at least 40 movies. 
-- Group by the actor-id, and display first name, last name, 
-- and the number of films the actor was in, limit by 5. 
-- Show your query and your results.
SELECT Actor.first_name, Actor.last_name, COUNT(Film_actor.film_id)
FROM Actor, Film_actor, Film
WHERE Actor.actor_id = Film_actor.actor_id
AND Film.film_id = Film_actor.film_id
GROUP BY Actor.actor_id
HAVING COUNT(Film_actor.film_id) >= 40
LIMIT 5;



-- 6.  Find the top 5 movies that were rented more than 30 times, 
-- together with the number of times they were rented, 
-- ordered by popularity in reverse. Display the title of the movie 
-- and the number of times it was rented, limited to top 5.
SELECT Film.title, COUNT(Rental.inventory_id)
FROM Film, Inventory, Rental
WHERE Inventory.inventory_id = Rental.inventory_id
AND Film.film_id = Inventory.film_id
GROUP BY Film.title
HAVING COUNT(Inventory.inventory_id) > 30
ORDER BY COUNT(Rental.inventory_id) DESC
LIMIT 5;



-- 7. Come up with your own query to ask of Sakila, write it in a sentence, translate it into SQL, and display the results.
-- Using Having, you want to know which movies have the most actors. 
-- Having the most actors is defined as having at least 10 actors. 
-- Group by the film_id, and display film title 
-- and the number of actors in each film, limit by 5. 
-- Order in descending order. Show your query and your results.
SELECT Film.title, COUNT(Actor.actor_id)
FROM Actor, Film_actor, Film
WHERE Actor.actor_id = Film_actor.actor_id
AND Film.film_id = Film_actor.film_id
GROUP BY Film.film_id
HAVING COUNT(Actor.actor_id) >= 10
ORDER BY COUNT(Actor.actor_id) DESC
LIMIT 5;




