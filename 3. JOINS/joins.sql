/*
AS
Allows us to create an "alias" for a column or result.
SELECT column AS new_name FROM table;
Note that the alias will be assigned at the very end
and hence we cannot use the alias inside, say, WHERE or HAVING clause.
Just think of them of having being used in the data output.

JOIN
JOINS Allow us to combine multiple tables together
An INNER JOIN results with the set of records that match in both tables
SELECT * FROM tableA
INNER JOIN tableB
ON tableA.col_match = tableB.col_match;
INNER JOIN is Symmetrical.

OUTER JOIN
They allow us to specify how to deal with values only present in one of the 
tables being joined.

FULL OUTER JOIN
Grab everything from the tables.
SELECT * FROM tableA
FULL OUTER JOIN tableB
ON tableA.col_match = tableB.col_match;
Full outer join is symmetrical as we are grabbing everything.

Grab only unique rows from tableA and tableB
i.e do not include the intersection of the tables
SELECT * FROM tableA
FULL OUTER JOIN tableB
ON tableA.col_match = tableB.col_match
WHERE tableA.id IS null OR
tableB.id IS null;

LEFT OUTER JOIN
A LEFT OUTER JOIN results in a set of records that are in the 
left table. If there is no match with the right table, the 
results are null.
SELECT * FROM tableA
LEFT OUTER JOIN tableB
ON tableA.col_match = tableB.col_match;
LEFT JOIN is Asymmetrical.

Grab rows unique only to the left table i.e
rows found in tableA and not found in tableB
SELECT * FROM tableA
LEFT OUTER JOIN tableB
ON tableA.col_match = tableB.col_match
WHERE tableB.id IS null;
 
RIGHT JOIN
A RIGHT JOIN is the same as a LEFT JOIN,
except the tables are switched.

UNION
The UNION operator is used to combine the result-set
of two or more SELECT statements.
It basically serves to directly concatenate two
results together, essentially "pasting" them together.
SELECT column_name FROM table1
UNION
SELECT column_name FROM table2;
*/

-- INNER JOIN Example
SELECT * FROM payment
INNER JOIN customer
ON payment.customer_id = customer.customer_id;

/* Selecting Specific Columns After INNER JOIN
PostgreSQL is smart enough to understand which column belongs to which table
and no need of explicitly mentioning it. However if the column is found on both tables,
you have the specify the table */
SELECT payment_id, payment.customer_id, first_name
FROM payment
INNER JOIN customer
ON payment.customer_id = customer.customer_id;

-- FULL OUTER JOIN Example
SELECT * FROM customer
FULL OUTER JOIN payment
ON customer.customer_id = payment.customer_id
WHERE customer.customer_id IS null
OR payment.payment_id IS null;

-- LEFT JOIN Example
SELECT film.film_id, title, inventory_id, store_id
FROM film
LEFT JOIN inventory
ON film.film_id = inventory.film_id
WHERE inventory.film_id IS null;