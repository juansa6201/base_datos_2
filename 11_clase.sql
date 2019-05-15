--1

SELECT
	f.title,
	i.film_id
FROM
	film f
LEFT JOIN inventory i ON
	f.film_id = i.film_id;

--2

 SELECT
	f.title,
	i.film_id,
	r.rental_date
FROM
	film f
INNER JOIN inventory i ON
	f.film_id = i.film_id
LEFT JOIN rental r ON
	i.inventory_id = r.inventory_id
WHERE
	r.inventory_id IS NULL;

--3

 SELECT
	c.first_name,
	c.last_name,
	c.store_id,
	f.title,
	r.rental_date,
	r.return_date
FROM
	customer c
INNER JOIN rental r
		USING (customer_id)
INNER JOIN inventory i
		USING (inventory_id)
INNER JOIN film f
		USING (film_id)
WHERE
	r.rental_date IS NOT NULL
	AND r.return_date IS NOT NULL
ORDER BY
	c.customer_id,
	c.last_name;

--4

 SELECT
	s.store_id,
	CONCAT_WS( " ", ci.city, co.country ) AS "City | Country",
	CONCAT_WS( " ", st.first_name, st.last_name ) AS "Manager",
	SUM( p.amount ) AS "total Sales"
FROM
	store s
INNER JOIN staff st ON
	s.manager_staff_id = st.staff_id
INNER JOIN rental r ON
	r.staff_id = st.staff_id
INNER JOIN payment p ON
	p.rental_id = r.rental_id
INNER JOIN address a ON
	a.address_id = s.address_id
INNER JOIN city ci
		USING (city_id)
INNER JOIN country co
		USING (country_id)
GROUP BY
	s.store_id;

-- 5
SELECT a.first_name, a.last_name, count(film_actor.film_id) AS "totalFilms" FROM actor a
	INNER JOIN film_actor USING (actor_id)
	GROUP BY a.actor_id
	HAVING totalFilms >= ALL (SELECT count(film_id) FROM film_actor GROUP BY actor_id);
