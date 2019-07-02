
-- 1
 SELECT
	CONCAT_WS(', ', first_name, last_name) AS customer,
	CONCAT_WS('-', a.address, ci.city) AS direccion
FROM
	customer c
INNER JOIN address a ON
	c.address_id = a.address_id
INNER JOIN city ci ON
	a.city_id = ci.city_id
INNER JOIN country co ON
	co.country_id = ci.country_id
WHERE
	co.country = 'Argentina';
-- 2
 SELECT
	f.title,
	f.rating,
	l.name,
	CASE
		WHEN f.rating = 'G' THEN 'General Audiences'
		WHEN f.rating = 'PG' THEN 'Parental Guidance Suggested'
		WHEN f.rating = 'PG-13' THEN 'Parents Strongly Cautioned'
		WHEN f.rating = 'R' THEN 'Restricted'
		ELSE 'Adults Only'
	END
FROM
	film f
INNER JOIN `language` l ON
	f.language_id = l.language_id;
-- 3
 SELECT
	f.title,
	f.release_year,
	CONCAT_WS(" ", a.first_name, a.last_name) AS 'name'
FROM
	film f
INNER JOIN film_actor fa ON
	f.film_id = fa.film_id
INNER JOIN actor a ON
	fa.actor_id = a.actor_id
WHERE
	LOWER(CONCAT_WS(" ", a.first_name, a.last_name)) = 'penelope guiness';

-- 4
 SELECT
	f.title,
	c.first_name,
	c.last_name,
	IF(r.return_date,
	'SI',
	'NO') AS returned,
	r.return_date
FROM
	film f
INNER JOIN inventory inv ON
	inv.film_id = f.film_id
INNER JOIN rental r ON
	r.inventory_id = inv.inventory_id
INNER JOIN customer c ON
	r.customer_id = c.customer_id
	WHERE r.return_date IS NOT NULL AND MONTH(r.return_date) BETWEEN '5' AND '6'
ORDER BY r.return_date;
	
SELECT MONTH(return_date) FROM rental;

-- 5
-- NVL() and IFNULL() functions work in the same way: 
-- they check whether an expression is NULL or not; if it is, they return a second expression (a default value).

-- NVL() is an Oracle function, so here is an IFNULL() example:

SELECT rental_id, IFNULL(return_date, 'La pelicula no fue devuelta aun') as fecha_de_devolucion
  FROM rental
WHERE rental_id = 12610
  OR rental_id = 12611;

-- 6
SELECT rental_id, ISNULL(return_date) as pelicula_faltante
  FROM rental
WHERE rental_id = 12610
  OR rental_id = 12611;

-- COALESCE() function returns the first non-NULL argument of the passed list.

SELECT COALESCE(NULL,
                NULL,
                (SELECT return_date
                FROM rental
                WHERE rental_id = 12610), -- null date
                (SELECT return_date
                FROM rental
                WHERE rental_id = 12611)) as primer_valor_no_nulo;