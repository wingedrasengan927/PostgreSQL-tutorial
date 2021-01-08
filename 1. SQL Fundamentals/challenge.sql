/*
CHALLENGES
*/

-- How many payment transactions were greater than $5
SELECT COUNT(*) FROM payment
WHERE amount>5;

-- How many actors have a first name that starts with letter P
SELECT COUNT(*) FROM actor
WHERE first_name ILIKE 'p%';

-- How many unique districts are our customers from
SELECT COUNT(DISTINCT district) FROM address;

-- How many films have a rating of R and a replacement cost between
-- $5 and %15
SELECT COUNT(*) FROM film
WHERE rating='R'
AND replacement_cost BETWEEN 5 AND 15;

-- How many films have 'truman' somewhere in title
SELECT COUNT(*) FROM film
WHERE title LIKE '%Truman%';