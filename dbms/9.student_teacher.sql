USE student_teacher;

DROP TABLES student, teacher, student_teacher;

CREATE TABLE student(ROLLNO VARCHAR(10) PRIMARY KEY, NAME VARCHAR(50), MARKS INT);

CREATE TABLE teacher(TNO VARCHAR(10) PRIMARY KEY, TNAME VARCHAR(50), SUBJECT VARCHAR(50));

CREATE TABLE student_teacher(ROLLNO VARCHAR(10), FOREIGN KEY (ROLLNO) REFERENCES student(ROLLNO), TNO VARCHAR(10), FOREIGN KEY (TNO) REFERENCES teacher(TNO), CLASS VARCHAR(10));

INSERT INTO student VALUES('1', 'Rahul', 79);
INSERT INTO student VALUES('2', 'Raj', 83);
INSERT INTO student VALUES('3', 'Karan', 91);
INSERT INTO student VALUES('4', 'Ram', 81);
INSERT INTO student VALUES('5', 'Laxman', 76);

INSERT INTO teacher VALUES('101', 'Mr YYY', 'Web Technologies');
INSERT INTO teacher VALUES('102', 'Tushar', 'Python');
INSERT INTO teacher VALUES('103', 'Ankur', 'OS');
INSERT INTO teacher VALUES('104', 'Jeevan', 'Java');
INSERT INTO teacher VALUES('105', 'Mr XXX', 'DBMS');
INSERT INTO teacher VALUES('106', 'Mr XXX', 'Maths Foundation');
INSERT INTO teacher VALUES('107', 'Mr XXX', 'Theory of Computation');

INSERT INTO student_teacher VALUES('1', '101', 'TY');
INSERT INTO student_teacher VALUES('2', '102', 'SY');
INSERT INTO student_teacher VALUES('3', '103', 'FY');
INSERT INTO student_teacher VALUES('4', '104', 'TY');
INSERT INTO student_teacher VALUES('5', '105', 'SY');
INSERT INTO student_teacher VALUES('2', '106', 'SY');
INSERT INTO student_teacher VALUES('2', '107', 'SY');

SELECT * FROM student;
SELECT * FROM teacher;
SELECT * FROM student_teacher;

Which teachers have more than two students? List the teachers name and the count of students associated with them.
SELECT S.NAME, COUNT(*) CNT
FROM student S 
JOIN student_teacher ST ON ST.ROLLNO = S.ROLLNO
JOIN teacher T ON T.TNO = ST.TNO
GROUP BY T.TNAME
HAVING CNT > 2;

Which students in the 'TY' class have marks greater than 75 and are taught by 'Mr YYY'?
SELECT S.NAME
FROM student S 
JOIN student_teacher ST ON S.ROLLNO = ST.ROLLNO
JOIN teacher T ON T.TNO = ST.TNO
WHERE ST.CLASS = 'TY' AND S.MARKS > 75 AND T.TNAME = 'Mr YYY';

Who is the teacher teaching the subject 'Python'?
SELECT T.TNAME
FROM teacher T
WHERE T.SUBJECT = 'Python';


How many students are in each class? Provide the class name and the student count.
SELECT ST.CLASS, COUNT(*) CNT
FROM student_teacher ST
GROUP BY ST.CLASS;




