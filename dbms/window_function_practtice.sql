CREATE DATABASE window_function_practice;

USE window_function_practice;

CREATE TABLE student_marks (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50),
    subject VARCHAR(30),
    marks INT,
    exam_date DATE
);


INSERT INTO student_marks
(student_id, student_name, subject, marks, exam_date)
VALUES
(1, 'Rahul', 'Maths', 85, '2026-01-10'),
(2, 'Amit', 'Maths', 92, '2026-01-10'),
(3, 'Priya', 'Maths', 78, '2026-01-10'),
(4, 'Sneha', 'Maths', 92, '2026-01-10'),
(5, 'Raj', 'Maths', 65, '2026-01-10'),
(6, 'Neha', 'Science', 88, '2026-01-11'),
(7, 'Karan', 'Science', 75, '2026-01-11'),
(8, 'Pooja', 'Science', 95, '2026-01-11'),
(9, 'Vikas', 'Science', 82, '2026-01-11'),
(10, 'Anjali', 'Science', 75, '2026-01-11'),
(11, 'Rohan', 'English', 90, '2026-01-12'),
(12, 'Meera', 'English', 80, '2026-01-12'),
(13, 'Arjun', 'English', 70, '2026-01-12'),
(14, 'Kavya', 'English', 95, '2026-01-12'),
(15, 'Nikhil', 'English', 85, '2026-01-12');




Q1. Display all students with a unique row number based on marks in descending order.


select *, row_number() over (order by marks desc ) as maxmarks from student_marks;

Q2. Assign row numbers separately for each subject, starting from 1.

select *, row_number() over (partition by subject) as rankedsubjects from student_marks;  


RANK
Q3. Rank all students based on their marks, highest marks first.

select *, rank() over(order by marks ) as maxmarks from student_marks;


Q4. Rank students separately within each subject.


select *, rank() over (partition by subject order by marks desc  ) as ranked from student_marks;


Q5. Find students who secured rank 1 in each subject.

select * from (select *,rank() over(partition by subject order by marks ) as ranked from student_marks) as temp where ranked =1;


Q6. Rank students based on marks using DENSE_RANK().

select *, DENSE_RANK() over(order by marks) as rankedmarkes  from student_marks;


Q7. Find the second-highest distinct marks in each subject.


select * from (
    select *,DENSE_RANK() over (partition by subject order by marks) as ranked from student_marks
) as temp where ranked =2;


Q8. Display each students marks along with the total marks of all students.

select *,sum(marks) over() as total_marks from student_marks;


Q9. Display each students marks along with the total marks obtained in their subject.

select *, sum(marks) over(partition by subject) as sumofmarks from student_marks;

Q10. Display each students marks along with the overall average marks.

select *, avg(marks) over() as avrageamarks from student_marks;


Q11. Find the average marks of each subject along with student details.

select *, avg(marks) over(partition by subject) as avrageamarks from student_marks;


Q12. Display each students marks and the highest marks in their subject.


select *, max(marks) over(partition by subject) as maxmarks from student_marks;



Q13. Display each students marks and the lowest marks in their subject.

select *, min(marks) over(partition by subject) as maxmarks from student_marks;


Q14. Display each students details along with the total number of students in their subject.


select *, sum(marks) over(partition by subject) as summmed from student_marks;


Q15. Display each students name, marks, and the next students marks.

select * , marks,  lead(marks) over() as next_student_marks  FROM student_marks;

Q16. Display each students name, marks, and the two rows ahead  students marks.

select *, lead(marks,2 ) over() as next_2_students_salary from student_marks;

Q17. Display each students name, marks, and the two rows ahead  students marks also replace null values to 0

select *, lead(marks,2,0 ) over() as next_2_students_salary from student_marks;


Q18. Display each students name, marks, and previous students marks

select * , marks, lag(marks) over() as previous_student_marks from student_marks;

Q19. Display each students name, marks, and previous 2 students marks

select * , lag(marks, 2) over() as previou_2_student_marks from student_marks;

Q20. Display each students name, marks, and previous 2 students marks also replace null values to 0

select * , lag(marks, 2, 0) over() as previou_2_student_marks from student_marks;


****************************************************************************************************************************
