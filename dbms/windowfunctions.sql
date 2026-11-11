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


****************************************************************************************************************************************************************************************************************************************************************
2.PARTITION BY

The PARTITION BY clause in SQL divides a querys result set into smaller groups (partitions) to perform calculations. It is always used inside the OVER() clause alongside window functions (like SUM(), AVG(), ROW_NUMBER(), or RANK())


Question: Display the number of employees in each department along with employee details.


select emp_id,emp_name, department ,count(*) over(partition by department) as total_emp from employee ;



Find the highest salary in each department and display all employee details.

select department, max(salary) from employee group by (department);

select emp_id, emp_name, department , max(salary) over(partition by department) as max_salary from employee;

Display each employees salary and the total salary of their department.

select emp_id, emp_name, department,  sum(salary ) over(partition by department) as sumsalary from employee;


Display each employees salary and the number of employees in their department.

select emp_id , emp_name ,department, count(*) over(partition by department) as totalcount from employee;



************************************************************************************************************************************************************************************************


3.ORDER BY

ORDER BY is used to sort the records in ascending or descending order.



Question 1: Display employees in ascending order of salary.

select * from employee order by salary;

#for desceding order 
select * from employee order by salary desc ;



************************************************************************************************************************************************************************************************




RANK():
RANK() is a window function used to assign a rank to each employee based on their salary.

Question 1: Find the highest-paid employee using RANK()

select * , rank() over(order by salary desc ) as rankedsalary from employee;

Question 2: Rank employees according to salary within each department.

select * , rank() over (partition by department ORDER BY salary DESC) as ranking  from employee;


************************************************************************************************************************************************************************************************



DENSE_RANK() in SQL

DENSE_RANK() is a window function used to assign ranks to rows based on a specified column.

Important: If two employees have the same salary, they get the same rank. Unlike RANK(), it does not skip the next rank.


Question 1: Rank all employees based on salary (highest first).

select * , DENSE_RANK() over(order by salaryd desc ) as ranking from employee;


Question 1: display only the employee with the maximum salary (highest salary) using DENSE_RANK():

select * from (
select *, DENSE_RANK() over(order by salary desc ) as ranking from employee
) 
as temp where ranking = 1;


*************************************************************************************************************************************************


ROW_NUMBER

ROW_NUMBER() is a window function that assigns a unique sequential number to each row based on the specified ordering.

Even if two employees have the same salary, they will get different row numbers.


select *, row_number() over(order by salary) as hisghestsalary from employee;
*************************************************************************************************************************************************





****************************************************************************************************************************
LEAD() Window Function in SQL

The LEAD() function is a window function in SQL that allows you to access the value from the next row without performing a self-join.

syntax :
LEAD(column_name, offset, default_value)
OVER (
    PARTITION BY column_name
    ORDER BY column_name
);


The LEAD() function is a window function in SQL that allows you to access the value from the next row without performing a self-join.

Q1. Display each students name, marks, and the next students marks.

select * , marks,  lead(marks) over() as next_student_marks  FROM student_marks;


Q2. Display each students name, marks, and the two rows ahead  students marks.

select *, lead(marks,2 ) over() as next_2_students_salary from student_marks;

Q3. Display each students name, marks, and the two rows ahead  students marks also replace null values to 0

select *, lead(marks,2,0 ) over() as next_2_students_salary from student_marks;

****************************************************************************************************************************


LAG() Window Function in SQL
The LAG() function is a SQL window function that allows you to access the value from the previous row without performing a self-join.

Q4. Display each students name, marks, and previous students marks

select * , marks, lag(marks) over() as previous_student_marks from student_marks;

Q5. Display each students name, marks, and previous 2 students marks

select * , lag(marks, 2) over() as previou_2_student_marks from student_marks;

Q6. Display each students name, marks, and previous 2 students marks also replace null values to 0

select * , lag(marks, 2, 0) over() as previou_2_student_marks from student_marks;


****************************************************************************************************************************
