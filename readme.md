## SQL-Employee-Analytics

A repository containing SQL queries for employee data analysis and SQL challenges.

### Table Structure

Table Structure

```
  CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department VARCHAR(50),
    salary INT,
    join_date DATE
);
```

#### Sample Data

The repository includes sample employee data:

| emp_id | emp_name | department | salary | join_date   |
|--------|----------|------------|--------|-------------|
| 101    | Alice    | HR         | 50000  | 2022-05-10  |
| 102    | Bob      | IT         | 60000  | 2021-08-15  |
| 103    | Charlie  | IT         | 75000  | 2019-06-20  |
| 104    | David    | Finance    | 65000  | 2020-09-25  |
| 105    | Eve      | HR         | 48000  | 2023-02-18  |
| 106    | Frank    | IT         | 72000  | 2018-11-30  |

### SQL Challenge Solutions
This repository contains solutions to various SQL challenges:

1. Finding the second highest salary
2. Retrieving the top 3 highest-paid employees by department
3. Calculating total salary for employees who joined before 2021
4. Identifying employees who earn more than their department average
