-- create database data_analyticsdb;

-- use data_analyticsdb;

-- CREATE TABLE
create table employees (
  emp_id INT PRIMARY KEY,
  emp_name VARCHAR(50),
  department VARCHAR(50),
  salary INT,
  join_date DATE);
  
 -- INSERT DATA INTO TABLE 
  INSERT INTO employees (emp_id, emp_name, department, salary, join_date) VALUES
  (101, 'Alice', 'HR', 50000, '2022-05-10'),
  (102, 'Bob', 'IT', 60000, '2021-08-15'),
  (103, 'Charlie', 'IT', 75000, '2019-06-20'),
  (104, 'David', 'Finance', 65000, '2020-09-25'),
  (105, 'Eve', 'HR', 48000, '2023-02-18'),
  (106, 'Frank', 'IT', 72000, '2018-11-30');
  

-- Q.1 Find the second highest salary from the table
-- Query 1: Using CTE

with the_second_highest_salary AS(
  SELECT 
  	salary
  	,ROW_NUMBER()OVER(ORDER BY salary DESC) rn
  FROM
  	employees
  )
  SELECT 
  	salary
  FROM
  	the_second_highest_salary
  WHERE
  	rn = 2;

-- OR
SELECT 
	salary
FROM
	employees
ORDER BY
	salary DESC
LIMIT 1 OFFSET 1;

-- OR

SELECT 
	MAX(salary)
FROM
	employees
WHERE
	salary < (SELECT MAX(salary) FROM employees);

-- Q.2 Retrieve the top 3 highest-paid employees in each department.



WITH highest_paid_employees AS (
  	SELECT
  		emp_id
  		,emp_name
  		,department
  		,salary
  		,ROW_NUMBER()OVER(PARTITION BY department ORDER BY salary DESC) rn
  	FROM
  		employees
  )
  SELECT
  	 emp_id
  	,emp_name
  	,department
    	,salary
 FROM
 	highest_paid_employees
 WHERE
 	rn <= 3;

-- Q.3  Find the total salary paid to employees who joined before 2021?
SELECT
	SUM(salary) AS 'Total Salary'
FROM
	employees
WHERE
	YEAR(join_date) < 2021;

-- OR

SELECT
	SUM(salary) AS 'Total Salary'
FROM
	employees
WHERE
	join_date < '2021-01-01';

-- Q.4 Display employees who earn more than the department average salary

 with dept_average_salary AS(
  	SELECT
   		department
  		,AVG(salary) as avg_salary
  	FROM
  		employees
  	GROUP BY
  		department
  )
  SELECT
  	emp.emp_id
    ,emp.emp_name
    ,emp.department
    ,emp.salary
  FROM
  	employees AS emp
  JOIN
  	dept_average_salary AS ads
  ON
  	emp.department = ads.department
  WHERE
  	emp.salary > ads.avg_salary;
