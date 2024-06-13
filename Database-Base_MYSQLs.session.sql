SELECT * FROM parks_and_recreation.employee_demographics;

SELECT first_name,
last_name,
gender,
age,
 age + 10
FROM parks_and_recreation.employee_demographics;

SELECT DISTINCT gender 
FROM parks_and_recreation.employee_demographics;


SELECT * FROM parks_and_recreation.employee_salary;

SELECT *
FROM parks_and_recreation.employee_salary
WHERE first_name ='Leslie';

SELECT * 
FROM parks_and_recreation.employee_salary
WHERE salary > 50000;
SELECT * 
FROM parks_and_recreation.employee_demographics
WHERE gender = 'Female';

SELECT * 
FROM parks_and_recreation.employee_demographics
WHERE gender != 'Female';


SELECT * 
FROM parks_and_recreation.employee_demographics
WHERE birth_date >= '1985-01-01'
AND gender = 'Male';


SELECT * 
FROM parks_and_recreation.employee_demographics
WHERE gender = 'Female'
OR birth_date <= '1985-01-01';


SELECT *
FROM parks_and_recreation.employee_demographics
WHERE first_name LIKE '%Ap%';


SELECT *
FROM parks_and_recreation.employee_demographics
WHERE first_name LIKE '%a%';

SELECT *
FROM parks_and_recreation.employee_demographics
WHERE first_name LIKE 'Jer%';

SELECT *
FROM parks_and_recreation.employee_demographics
WHERE first_name LIKE 'a__';

SELECT *
FROM parks_and_recreation.employee_demographics
WHERE first_name LIKE 'a__%';

SELECT *
FROM parks_and_recreation.employee_demographics
WHERE first_name LIKE 'a___%';

SELECT *
FROM parks_and_recreation.employee_demographics
WHERE first_name LIKE '%a__';

-- LIKE operator use % AND _ for pattern matching % % meaning in b/w the "% %" conatis the character like "%a%" and "A%" means start with "a" and can be anything after that "%A" means should be end with "a" and "A__" means after "a" there should be atlest 2 charachters like so on.

SELECT gender , AVG(age)
FROM parks_and_recreation.employee_demographics
GROUP BY gender;

SELECT gender , AVG(age), MAX(age), MIN(age), COUNT(age)
FROM parks_and_recreation.employee_demographics
GROUP BY gender;



SELECT *
FROM parks_and_recreation.employee_demographics;

-- ORDER BY
SELECT *
FROM parks_and_recreation.employee_demographics
ORDER BY first_name ASC;

SELECT *
FROM parks_and_recreation.employee_demographics
ORDER BY first_name DESC;


SELECT *
FROM parks_and_recreation.employee_demographics
ORDER BY gender, age DESC;



SELECT *
FROM parks_and_recreation.employee_demographics
ORDER BY 5,4;


--having vs where

SELECT occupation, AVG(salary)
FROM parks_and_recreation.employee_salary
WHERE occupation LIKE "%manager%"
GROUP BY occupation
HAVING AVG(salary) > 75000;


SELECT * 
FROM parks_and_recreation.employee_demographics;

SELECT *
FROM parks_and_recreation.employee_salary;


SELECT * 
FROM parks_and_recreation.employee_demographics AS empd
INNER JOIN parks_and_recreation.employee_salary AS emps
    ON empd.employee_id = emps.employee_id;


SELECT * 
FROM parks_and_recreation.employee_demographics AS empd
LEFT JOIN parks_and_recreation.employee_salary AS emps
    ON empd.employee_id = emps.employee_id;


SELECT * 
FROM parks_and_recreation.employee_demographics AS empd
RIGHT JOIN parks_and_recreation.employee_salary AS emps
    ON empd.employee_id = emps.employee_id;


SELECT * 
FROM parks_and_recreation.employee_demographics
UNION
SELECT * 
FROM parks_and_recreation.employee_salary;



SELECT age, gender 
FROM parks_and_recreation.employee_demographics
UNION
SELECT first_name,last_name
FROM parks_and_recreation.employee_salary;


SELECT first_name,last_name 
FROM parks_and_recreation.employee_demographics
UNION All
SELECT first_name,last_name
FROM parks_and_recreation.employee_salary;


SELECT first_name,last_name, 'Buddha' AS Lable
FROM parks_and_recreation.employee_demographics
WHERE age > 40 AND gender = 'Male'
UNION
SELECT first_name,last_name, 'Buddhi' AS Lable
FROM parks_and_recreation.employee_demographics
WHERE age > 40 AND gender = 'Female'
UNION
SELECT first_name,last_name,  'Highly Paid Employee' AS Lable
FROM parks_and_recreation.employee_salary
WHERE salary > 70000
ORDER BY first_name,last_name;


SELECT LENGTH('sTRING');


SELECT first_name , LENGTH(first_name)
FROM parks_and_recreation.employee_demographics
ORDER BY 2;


SELECT first_name UPPER(first_name)
FROM parks_and_recreation.employee_demographics;


SELECT first_name,birth_date
SUBSTRING(birth_date,6,2) AS birth_month 
FROM parks_and_recreation.employee_demographics
