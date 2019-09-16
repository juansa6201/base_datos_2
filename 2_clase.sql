CREATE DATABASE IF NOT EXISTS imbd;
USE imbd;
CREATE TABLE film (film_id INT NOT NULL AUTO_INCREMENT,
title VARCHAR(15) NOT NULL,
description VARCHAR(50),
release_year DATE NOT NULL,
CONSTRAINT film_pk PRIMARY KEY (film_id));
CREATE TABLE actor (actor_id INT NOT NULL AUTO_INCREMENT,
first_name VARCHAR(15) NOT NULL,
last_name VARCHAR(15) NOT NULL,
CONSTRAINT actor_pk PRIMARY KEY (actor_id));
CREATE TABLE film_actor (film_actor_id INT NOT NULL AUTO_INCREMENT,
actor_id INT NOT NULL,
film_id INT NOT NULL,
CONSTRAINT film_actor_pk PRIMARY KEY (film_actor_id));
ALTER TABLE film ADD last_update TIMESTAMP NOT NULL;
ALTER TABLE actor ADD last_update TIMESTAMP NOT NULL;
ALTER TABLE film_actor ADD CONSTRAINT fk_actor_film FOREIGN KEY (actor_id) REFERENCES actor (actor_id);
ALTER TABLE film_actor ADD CONSTRAINT fk_film_actor FOREIGN KEY (film_id) REFERENCES film (film_id);
INSERT INTO film (title, description, release_year) VALUES ('Iron Man', 'Basuea', '2008-10-3');
INSERT INTO actor (first_name, last_name) VALUES ('Cube', 'Tona');
INSERT INTO film_actor (film_id, actor_id) VALUES (1, 1);

