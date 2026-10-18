#Week-1-Day-3
##1 Count fucntion; count total employees
SELECT COUNT(*) AS total_employees
FROM employees;

##2 Counting employee in each department
SELECT department, COUNT(*) AS employee_count
FROM staff
GROUP BY department;

##3 Calculate total salary period
SELECT SUM(salary) AS total_salary
FROM employees;

##4 calculating salary by department
SELECT department, SUM(salary) AS total_salary
FROM staff
GROUP BY department;

##5 calculating average salary from employee table
SELECT AVG(salary) AS average_salary
FROM employees;

##6 calculating averaging salary by department
SELECT department, AVG(salary) AS average_salary
FROM staff
GROUP BY department;

##7 Finding the highest salary
SELECT MAX(salary) AS highest_salary
FROM employees;

##8
SELECT MIN(salary) AS lowest_salary
FROM employees;

CREATE TABLE sales (
    sale_id INT PRIMARY KEY,
    region VARCHAR(30),
    category VARCHAR(30),
    month VARCHAR(20),
    sales_amount DECIMAL(10,2)
);

INSERT INTO sales
VALUES
(1, 'East', 'Furniture', 'January', 15000),
(2, 'East', 'Technology', 'January', 25000),
(3, 'West', 'Furniture', 'January', 12000),
(4, 'East', 'Furniture', 'February', 18000),
(5, 'West', 'Technology', 'February', 30000),
(6, 'North', 'Clothing', 'January', 10000),
(7, 'North', 'Furniture', 'February', 20000),
(8, 'West', 'Furniture', 'January', 8000),
(9, 'East', 'Technology', 'February', 22000),
(10, 'North', 'Clothing', 'January', 15000);

##9 sales group by according to region,category,month
SELECT
    region,
    category,
    month,
    SUM(sales_amount) AS total_sales
FROM sales
GROUP BY region, category, month;

##10 havig function used on sales by grouping regions.
SELECT
    region,
    SUM(sales_amount) AS total_sales
FROM sales
GROUP BY region
HAVING SUM(sales_amount) > 40000;

##11 Windows function used on total sales partion by region.
SELECT
    sale_id,
    region,
    category,
    sales_amount,
    SUM(sales_amount) OVER(partition by region) AS total_sales
FROM sales;

## output of window function
sale_id,region,category,sales_amount,total_sales
1,East,Furniture,15000.00,80000.00
2,East,Technology,25000.00,80000.00
4,East,Furniture,18000.00,80000.00
9,East,Technology,22000.00,80000.00
6,North,Clothing,10000.00,45000.00
7,North,Furniture,20000.00,45000.00
10,North,Clothing,15000.00,45000.00
3,West,Furniture,12000.00,50000.00
5,West,Technology,30000.00,50000.00
8,West,Furniture,8000.00,50000.00
