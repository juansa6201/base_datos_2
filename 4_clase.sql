USE sakila;
SELECT title, special_features FROM film WHERE rating='PG-13';
SELECT DISTINCT `length` FROM film ORDER BY `length`;
SELECT title, rental_rate, replacement_cost FROM film WHERE replacement_cost BETWEEN 20 AND 40;
SELECT title, c.name ,rating FROM film f INNER JOIN film_category fc ON f.film_id=fc.film_id INNER JOIN category c ON fc.category_id=c.category_id WHERE special_features LIKE '%Behind the Scenes%'
SELECT first_name, last_name, film_id FROM actor a INNER JOIN film_actor fa ON a.actor_id=fa.actor_id WHERE fa.film_id=999;
SELECT a.address, c.city, co.country FROM store s INNER JOIN address a ON s.address_id=a.address_id INNER JOIN city c ON a.city_id=c.city_id INNER JOIN country co ON c.country_id=co.country_id WHERE store_id=1
SELECT title, rating FROM film ORDER BY rating;
SELECT DISTINCT f.title, m.first_name, m.last_name FROM film f INNER JOIN inventory inv ON f.film_id=inv.film_id INNER JOIN store s ON s.store_id=inv.store_id INNER JOIN staff m ON s.manager_staff_id=m.staff_id WHERE s.store_id=2;
