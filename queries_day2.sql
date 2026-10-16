CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department_id INT,
    salary INT,
    city VARCHAR(50)
);

CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50),
    manager_name VARCHAR(50)
);

INSERT INTO employees VALUES
(1, 'Arun', 101, 30000, 5),
(2, 'Bala', 102, 45000, 5),
(3, 'Charan', 103, 50000, 6),
(4, 'Deepa', 104, 35000, 6),
(5, 'Eshan', 101, 60000, NULL),
(6, 'Farah', 102, 65000, NULL),
(7, 'Gokul', 105, 40000, 5),
(8, 'Hari', 106, 55000, 6),
(9, 'Isha', NULL, 32000, 5),
(10, 'Jeevan', 103, 48000, 6);
INSERT INTO departments VALUES
(101, 'HR', 'Bangalore'),
(102, 'IT', 'Chennai'),
(103, 'Finance', 'Mumbai'),
(104, 'Marketing', 'Pune'),
(105, 'Sales', 'Delhi'),
(106, 'Analytics', 'Hyderabad'),
(107, 'Support', 'Kolkata'),
(108, 'Research', 'Bangalore'),
(109, 'Security', 'Chennai'),
(110, 'Operations', 'Mumbai');
select * from departments;
##1 Inner join; combinning both the table with department_id to display their names according to which department they work
SELECT
    e.emp_name,
    e.salary,
    d.department_name
FROM employees AS e
INNER JOIN departments AS d
    ON e.department_id = d.department_id;

##2 Left join; selecting employees who is earning more than 45,000 with thier department
select 
	e.emp_name,
    e.salary,
    d.department_name
from employees as e
left join departments as d
    ON e.department_id = d.department_id
WHERE e.salary > 40000;

##3 Right join; Right join is to find out, do we have employees in all department. this give all values from right table and only matching value from left table.
SELECT
    d.department_id,
    d.department_name
FROM employees AS e
RIGHT JOIN departments AS d
    ON e.department_id = d.department_id
WHERE e.emp_id IS NULL;
## creating new table for inner join
CREATE TABLE staff (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    salary INT,
    manager_id INT,
    department VARCHAR(50)
);
INSERT INTO staff
VALUES
(1, 'Arun', 30000, 5, 'IT'),
(2, 'Bala', 35000, 5, 'IT'),
(3, 'Charan', 40000, 6, 'HR'),
(4, 'Deepa', 32000, 6, 'HR'),
(5, 'Eshan', 60000, NULL, 'IT'),
(6, 'Farah', 65000, NULL, 'HR'),
(7, 'Gokul', 28000, 5, 'IT'),
(8, 'Hari', 45000, 6, 'HR'),
(9, 'Isha', 38000, 5, 'Finance'),
(10, 'Jeevan', 42000, 6, 'Finance');
select * from staff;
##4 
SELECT
    e.emp_name AS employee_name,
    m.emp_name AS manager_name
FROM staff AS e
LEFT JOIN staff AS m
    ON e.manager_id = m.emp_id;


##5 query table with alias
SELECT
    s.emp_name,
    s.salary,
    s.department
FROM staff AS s
WHERE s.salary > 40000;