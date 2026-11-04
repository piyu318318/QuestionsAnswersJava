1.OVER():The OVER() clause is used with window functions to calculate values across rows without combining them into a single row.

  1. Imagine this employee table
Employee	Salary
Rahul	10000
Amit	20000
Priya	30000

Total salary = 60000

Now suppose you want to display each employee's salary AND the total salary.
2. Without OVER()
SELECT SUM(salary)
FROM employee;


Output:
SUM(salary)
60000

Here, SQL gives you only the total salary. You don't see individual employees.
3. With OVER()
SELECT
    emp_name,
    salary,
    SUM(salary) OVER() AS total_salary
FROM employee;


Output:
emp_name	salary	total_salary
Rahul	10000	60000
Amit	20000	60000
Priya	30000	60000

What happened here?
SQL calculates the total salary of all employees, but keeps every employee's row visible.
- Rahul's salary = 10000
- Amit's salary = 20000
- Priya's salary = 30000
- Total salary = 60000



2.

