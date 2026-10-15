CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department VARCHAR(30),
    city VARCHAR(30),
    salary DECIMAL(10,2),
    age INT,
    joining_date DATE,
    manager_id INT
);
INSERT INTO employees VALUES
(1, 'Arun Kumar', 'IT', 'Bangalore', 45000, 25, '2023-01-15', 101),
(2, 'Priya Sharma', 'HR', 'Chennai', 35000, 28, '2022-06-10', 102),
(3, 'Rahul Verma', 'Sales', 'Mumbai', 30000, 24, '2024-02-20', 103),
(4, 'Sneha Reddy', 'IT', 'Hyderabad', 60000, 29, '2021-03-12', 101),
(5, 'Karthik Raj', 'Finance', 'Bangalore', 50000, 32, '2020-11-05', 104),
(6, 'Ananya Das', 'HR', 'Kolkata', 32000, 26, '2023-07-18', NULL),
(7, 'Vikram Singh', 'IT', 'Pune', 75000, 35, '2019-05-22', 101),
(8, 'Meena Iyer', 'Sales', 'Chennai', 28000, 23, '2024-01-08', 103),
(9, 'Suresh Babu', 'Finance', 'Mumbai', 55000, 31, '2021-09-14', NULL),
(10, 'Divya Nair', 'IT', 'Bangalore', 48000, 27, '2022-12-01', 101),
(11, 'Ajay Patel', 'Marketing', 'Ahmedabad', 40000, 30, '2020-04-17', 105),
(12, 'Kavya Rao', 'HR', 'Hyderabad', 36000, 25, '2023-08-25', 102),
(13, 'Manoj Kumar', 'Sales', 'Pune', 33000, 28, '2022-02-11', NULL),
(14, 'Pooja Menon', 'Marketing', 'Chennai', 42000, 29, '2021-06-30', 105),
(15, 'Ramesh Gupta', 'Finance', 'Bangalore', 65000, 38, '2018-10-09', 104),
(16, 'Neha Kapoor', 'IT', 'Mumbai', 52000, 26, '2023-04-03', NULL),
(17, 'Sanjay Das', 'Sales', 'Kolkata', 29000, 22, '2024-05-16', 103),
(18, 'Asha Thomas', 'Marketing', 'Hyderabad', 46000, 33, '2019-12-21', 105),
(19, 'Deepak Shah', 'Finance', 'Pune', 58000, 34, '2020-08-13', 104),
(20, 'Nithya Bose', 'IT', 'Chennai', 39000, 24, '2024-03-19', NULL);

select * from employees limit 10;
##1
select * from employees where city = 'Bangalore';
##2
select * from employees where city = 'Bangalore' and department = 'IT';
##3 
select * from employees where city = 'Hyderabad' and department ='Marketing';
##4
select * from employees where department='IT' and not salary < 50000;
##5 
select * from employees where emp_name Like 'A%';
##6
select * from employees 
where department IN ('Marketing','Finance','Sales') and salary between 20000 and 50000;
##7  
SELECT * FROM employees
WHERE manager_id IS  NULL;
##8
select * from employees
where (department ='Finance' or department = 'Sales')
and salary between 20000 and 50000
and not city = 'Ahmedabad';
##9
select * from employees
where emp_name like 'A%'
and city in ('kolkata','Chennai','Pune')
and salary between 20000 and 50000
and manager_id is null;
##10
select * from employees
where age between 20 and 50
and department = 'IT'
and salary > 30000
and not city = 'pune'
