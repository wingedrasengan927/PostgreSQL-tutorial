/* 
*Each definition follows by a basic syntax example of

SELECT statement is the most fundamental and most widely used statement.
SELECT column_name FROM table_name;

The DISTINCT Keyword can be used to return only the distinct values in the column.
It operates on the column.
SELECT DISTINCT column FROM table_name;

The COUNT function returns the number of input rows that match a specific condition of a query.
COUNT is much more useful when combined with other commands, such as DISTINCT.
SELECT COUNT (DISTINCT column_name) FROM table; -- Remeber to keep parenthesis

The WHERE Statement allows us to specify conditions on columns for the rows to be returned.
The WHERE Clause appears Immediately after the FROM clause of the SELECT statement.
The conditions are used to filter the rows returned from the SELECT statement.
SELECT column1, column2 FROM table WHERE conditions;

You can use ORDER BY to sort rows based on a column value, in either ascending or descending order.
You can also order by multiple columns.
SELECT column1, column2
FROM table
ORDER BY column1 ASC/DESC 

The LIMIT command allows us to limit the number of rows returned by a query.
It is often used in conjunction with ORDER BY

The BETWEEN Operator can be used to match a value against a range of values:
value BETWEEN low AND high.
This is the same as value>=low AND value<=high.
You can also combine BETWEEN with the NOT logical operator:
value NOT BETWEEN low AND high.
The BETWEEN Operator can also be used with dates, 
but be careful here about inclusivity and exclusivity.

We can use te IN operator to create a condition that checks to see if a value
is included in a list of multiple operations.
value IN (option1, option2, option3...)

LIKE and ILIKE - string pattern matching
The LIKE operator allows us to perform pattern matching against
string data with the use of speacial wildcard characters
Percent % - Matches any sequence of characters
Underscore _ - Matches any single character
Percent &
example: All names that begin with A
WHERE name LIKE 'A%'
example: All names that end with an 'a'
WHERE name LIKE '%a'
LIKE is case-sensitive
ILIKE is case-insensitive
Underscore _
Using the underscore allows us to replace just a single character
example: get all Mission Impossible films
WHERE title LIKE 'Mission Impossible _'

PostgreSQL supports full regex capabilities
*/

-- Get customer name and email
SELECT first_name, last_name, email FROM customer;

-- How many unique types of ratings we have in our database
SELECT DISTINCT rating FROM film;

-- What is the email of customer whose name is Nancy Thomas
SELECT email FROM customer
WHERE first_name = 'Nancy' AND last_name = 'Thomas';

-- Get Description of the movie outlaw hanky
SELECT description FROM film
WHERE title = 'Outlaw Hanky';

-- ORDER BY Example
SELECT store_id, first_name, last_name 
FROM customer
ORDER BY store_id, first_name;

-- What are the customer_ids of first 10 customers who created a payment
SELECT customer_id
FROM payment
ORDER BY payment_date
LIMIT 10;

-- What are the titles of the 5 shortest (in length of runtime) movies
SELECT title FROM film
ORDER BY "length" ASC
LIMIT 5;

-- Get all the payments that happened on first half of February of 2007
SELECT * FROM payment
WHERE payment_date 
BETWEEN '2007-02-01' AND '2007-02-15';

-- IN operator example
SELECT * FROM customer
WHERE first_name IN ('Lisa', 'Karen', 'Helen');

-- LIKE and ILIKE examples
-- Get people who have 'er' in their first name and their last name doesn't start with D
SELECT first_name, last_name FROM customer
WHERE first_name LIKE '%er%'
AND last_name NOT LIKE 'D%';

