-- 1
INSERT
	INTO
		customer (
			store_id,
			first_name,
			last_name,
			email,
			address_id
		) SELECT
			1,
			'Juan',
			'Mare',
			'jcmare18@gmail.com',
			address_id
		FROM
			address a
		INNER JOIN city c ON
			c.city_id = a.city_id
		INNER JOIN country co ON
			co.country_id = c.country_id
		WHERE
			co.country = 'United States'
		ORDER BY
			a.address_id DESC
		LIMIT 1;

-- 2
SELECT * FROM rental ORDER BY rental_id DESC;
SELECT * FROM inventory ORDER BY inventory_id DESC;
SELECT * FROM customer ORDER BY customer_id DESC;
SELECT * FROM staff WHERE store_id = 2;
SELECT * FROM rental ORDER BY rental_id DESC;

DELETE FROM rental WHERE rental_id = 16050;

INSERT INTO rental
    (rental_id, inventory_id, customer_id, staff_id)
    VALUES
    (16050, 4581, 600, 2);
    
-- 3
SELECT f.film_id, f.title, f.release_year, f.rating FROM film f ORDER BY rating;
UPDATE film SET release_year=2000 WHERE rating='G';
UPDATE film SET release_year=2002 WHERE rating='PG';
UPDATE film SET release_year=2004 WHERE rating='PG-13';
UPDATE film SET release_year=2006 WHERE rating='R';
UPDATE film SET release_year=2010 WHERE rating='NC-17';

SELECT rental_id, rental_date, return_date
    FROM rental r
    WHERE r.return_date IS NULL
    ORDER BY r.rental_date DESC
    LIMIT 1;
 
-- 4
SELECT rental_id, rental_date, return_date FROM rental WHERE rental_id = 11739;
UPDATE rental SET return_date=NULL WHERE rental_id=11739;

-- 5
SELECT * FROM film f ORDER BY f.film_id DESC;
DELETE FROM film f WHERE f.film_id = 1000;

-- 6
SELECT *
    FROM store s
    INNER JOIN inventory i ON s.store_id = i.store_id
    INNER JOIN rental r ON i.inventory_id = r.inventory_id;





