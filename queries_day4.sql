##week-1-day-4

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    region VARCHAR(30),
    sales_amount DECIMAL(10,2)
);
INSERT INTO employees
(emp_id, emp_name, region, sales_amount)
VALUES
(1, 'Arun', 'North', 5000),
(2, 'Bala', 'North', 9000),
(3, 'Charan', 'North', 7000),
(4, 'Divya', 'North', 4000),
(5, 'Esha', 'South', 6000),
(6, 'Farhan', 'South', 8000),
(7, 'Gokul', 'South', 4000),
(8, 'Hari', 'South', 10000),
(9, 'Indu', 'East', 7000),
(10, 'Jaya', 'East', 3000),
(11, 'Kiran', 'East', 9000),
(12, 'Lakshmi', 'East', 5000),
(13, 'Manoj', 'West', 6000),
(14, 'Nisha', 'West', 11000),
(15, 'Praveen', 'West', 8000);

##1 Non-Correlated subquery to find above-average sales
SELECT *
FROM sales
WHERE sales_amount > (
    SELECT AVG(sales_amount)
    FROM sales
);

##2 Correlated subquery to find top perfomer per region
SELECT *
FROM employees e1
WHERE sales_amount =(
    SELECT MAX(e2.sales_amount)
    FROM employees e2
    WHERE e2.region = e1.region
);

##3 CTE function using with function.
WITH avg_sales AS (
    SELECT AVG(sales_amount) AS average_amount
    FROM employees
)
SELECT *
FROM employees
WHERE sales_amount > (
    SELECT average_amount
    FROM avg_sales
);

##4 adding 2 chain cte's function
WITH region_avg AS (
    SELECT region, AVG(sales_amount) AS avg_sales
    FROM employees
    GROUP BY region
),
high_performers AS (
    SELECT e.emp_id, e.emp_name, e.region, e.sales_amount
    FROM employees e
    JOIN region_avg r
        ON e.region = r.region
    WHERE e.sales_amount > r.avg_sales
)
SELECT *
FROM high_performers;

###5 Output fot the 2 cte's function
emp_id,emp_name,region,sales_amount
2,Bala,North,9000.00
3,Charan,North,7000.00
6,Farhan,South,8000.00
8,Hari,South,10000.00
9,Indu,East,7000.00
11,Kiran,East,9000.00
14,Nisha,West,11000.00
