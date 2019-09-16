--1

 SELECT
	c.first_name,
	c.last_name,
	COUNT(r.rental_id) AS rentas,
	SUM(p.amount) AS pago
FROM
	customer c
INNER JOIN rental r ON
	r.customer_id = c.customer_id
INNER JOIN payment p ON
	p.rental_id = r.rental_id
GROUP BY
	c.customer_id
HAVING
	pago BETWEEN 100 AND 150
ORDER BY
	pago;
	
--2

 SELECT
	co.country AS Pais,
	cat.name AS Categoria,
	COUNT(r.rental_id) AS Cantidad
FROM
	rental r
INNER JOIN customer c ON
	r.customer_id = c.customer_id
INNER JOIN address ad ON
	c.address_id = ad.address_id
INNER JOIN city ci ON
	ad.city_id = ci.city_id
INNER JOIN country co ON
	ci.country_id = co.country_id
INNER JOIN inventory inv ON
	r.inventory_id = inv.inventory_id
INNER JOIN film f ON
	inv.film_id = f.film_id
INNER JOIN film_category fc ON
	f.film_id = fc.film_id
INNER JOIN category cat ON
	cat.category_id = fc.category_id
GROUP BY
	cat.category_id,
	co.country_id
ORDER BY
	Pais,
	Categoria;
	
--3

 SELECT
	f.rating,
	COUNT(r.rental_id) AS Rentas
FROM
	film f
INNER JOIN inventory inv ON
	inv.film_id = f.film_id
INNER JOIN rental r ON
	inv.inventory_id = r.inventory_id
WHERE
	r.return_date IS NULL
GROUP BY
	f.rating;
	
--4

 SELECT
	a.actor_id,
	a.first_name,
	a.last_name,
	COUNT(fa.actor_id),
	c.customer_id,
	c.first_name,
	c.last_name
FROM
	actor a
INNER JOIN film_actor fa ON
	fa.actor_id = a.actor_id
RIGHT JOIN customer c ON
	c.last_name = a.last_name
GROUP BY
	a.actor_id ,
	c.customer_id