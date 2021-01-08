/*
Mathematical Functions and Operators:
https://www.postgresql.org/docs/9.5/functions-math.html

String Functions and Operators/:
https://www.postgresql.org/docs/9.1/functions-string.html

Subquery
----------
1. A Sub Query allows you to perform complex queries,
essentially performing a query on the results of another query.
Example:
2. Let's say you have a simple table containing student names and grades.
You want a list of students scoring better than the average grade.
Here's what it looks like:
SELECT student, grade 
FROM test_scores
WHERE grade > (SELECT AVG(grade)
FROM test_Scores)
3. The sub query is performed first since it is inside
the parenthesis.
4. We can alos use the IN operator in conjunction with a subquery to check
against multiple results returned.
5. A subquery can operate on a separate table:
SELECT student, grade
FROM test_scores
WHERE student IN
(SELECT student
FROM honor_roll_table)

EXISTS Operator
https://www.postgresqltutorial.com/postgresql-exists/

SELF JOIN
1. A self-join is a query in which a table is joined to itself
2. Self-joins are useful for comparing values in a column of rows
within the same table.
3. The self join can be viewed as a join of two copies of the same table
4. When using self join it is necessary to use an alias for the table,
otherwise the table names would be ambiguous.
SELECT tableA.col, tableB.col
FROM table AS tableA
JOIN table AS tableB ON
tableA.some_col = tableB.other_col;
*/

-- Mathematical Functions Examples

-- What percent of a replacement cost is a rental rate
SELECT ROUND(rental_rate/replacement_cost, 3) * 100
AS percent_cost FROM film;

-- String Operations Examples

-- Get string length
SELECT first_name, LENGTH(first_name)
AS name_length FROM customer;

-- Concat strings
SELECT first_name || ' ' || last_name
AS full_name
FROM customer;

-- Create custom emails using name
SELECT LOWER(LEFT(first_name, 1)) || LOWER(last_name) || '@company.com'
AS custom_email
FROM customer;

-- Subquery Examples

-- Get films whose rental rae is higher than the avg rental rate
SELECT title, rental_rate
FROM film
WHERE rental_rate > (SELECT AVG(rental_rate)
					FROM film);

-- EXISTS operator
-- Check the number of customers who have paid more than 11 dollars
SELECT first_name, last_name
FROM customer AS c
WHERE EXISTS
(SELECT * FROM payment AS p
WHERE p.customer_id = c.customer_id
AND amount > 11);

-- Self Join Example

-- Get films of equal length
SELECT f1.title, f2.title, f1.length
FROM film AS f1
INNER JOIN film AS f2 ON
(f1.film_id != f2.film_id
 AND f1.length = f2.length);
					



