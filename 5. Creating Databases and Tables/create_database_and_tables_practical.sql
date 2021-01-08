-- CREATING TABLES

-- Create accounts table
CREATE TABLE account (
	user_id SERIAL PRIMARY KEY,
	username VARCHAR(50) UNIQUE NOT NULL,
	password VARCHAR(50) NOT NULL,
	email VARCHAR(250) UNIQUE NOT NULL,
	created_on TIMESTAMP NOT NULL,
	last_login TIMESTAMP
)

-- Create job table
CREATE TABLE job (
	job_id SERIAL PRIMARY KEY,
	job_name VARCHAR(200) UNIQUE NOT NULL
)

-- Create account job table
CREATE TABLE account_job (
	user_id INTEGER REFERENCES account(user_id),
	job_id INTEGER REFERENCES job(job_id),
	hire_date TIMESTAMP
)

-- INSERTING VALUES
INSERT INTO account(username, password, email, created_on)
VALUES 
('wingedrasengan927', 'notkin', 'neeraj@gmail.com', CURRENT_TIMESTAMP)

INSERT INTO job(job_name)
VALUES
('Writer'),
('Developer'),
('Analyst')

INSERT INTO account_job(user_id, job_id, hire_date)
VALUES
(1, 1, CURRENT_TIMESTAMP)

-- UPDATE Examples
UPDATE account
SET last_login = CURRENT_TIMESTAMP
WHERE
last_login is NULL;

UPDATE account_job
SET hire_date = account.created_on
FROM account
WHERE
account_job.user_id = account.user_id;

-- DELETE Examples
DELETE FROM job
WHERE job_name = 'Developer'
RETURNING job_id, job_name;

-- ALTER Examples
CREATE TABLE information (
	info_id SERIAL PRIMARY KEY,
	title VARCHAR(500) NOT NULL,
	person VARCHAR(50) NOT NULL UNIQUE
	
)

-- Rename Table
ALTER TABLE information
RENAME TO informationv2


-- Rename Column
ALTER TABLE informationv2
RENAME COLUMN person TO people;

-- Drop Constraints
-- Use SET to set the constraint
ALTER TABLE informationv2
ALTER COLUMN people DROP NOT NULL;

-- Drop column
ALTER TABLE informationv2
DROP COLUMN IF EXISTS people;

CHECK Examples:
CREATE TABLE employees (
	emp_id SERIAL PRIMARY KEY,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	birthdate DATE CHECK (birthdate > '1900-01-01'),
	hire_date DATE CHECK (hire_date > birthdate),
	salary INTEGER CHECK (salary > 0)
)

INSERT INTO employees(
	first_name,
	last_name,
	birthdate,
	hire_date,
	salary
)
VALUES
(
	'Neeraj',
	'Krishna',
	'1997-11-30',
	'2019-06-01',
	'60000'
)



















