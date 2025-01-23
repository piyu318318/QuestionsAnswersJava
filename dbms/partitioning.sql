/**
Partitioning in SQL is a database design technique used to divide a large table into smaller, more manageable pieces, called partitions. 
Each partition can store a subset of the table's rows based on specific criteria, such as ranges of values, list values, or even hash functions.
The PARTITION BY clause in your CREATE TABLE statement is an example of Range Partitioning, where the rows are divided into partitions based on a range of values in the marks column.
**/
/**
CREATE TABLE student (
    student_id INT ,
    name VARCHAR(50),
    marks INT,
    CHECK (city IN ('pune', 'mumbai', 'nashik')) 
)
partition by range(marks)
(
	partition p1 values less than (20),
    partition p2 values less than (40),
    partition p3 values less than (60)
)



INSERT INTO student VALUES (1, 'Piyush', 45,'pune');
INSERT INTO student VALUES (2, 'Alice', 19,'mumbai');
INSERT INTO student VALUES (3, 'Bob', 2,'pune');
INSERT INTO student VALUES (4, 'Charlie', 32,'pune');
INSERT INTO student VALUES (5, 'David', 5,'pune');
INSERT INTO student VALUES (6, 'Emma', 55,'mumbai');
INSERT INTO student VALUES (7, 'Frank', 30,'mumbai');
INSERT INTO student VALUES (8, 'George', 48,'pune');
INSERT INTO student VALUES (9, 'Helen', 28,'pune');
INSERT INTO student VALUES (10, 'Ian', 38,'nashik');
INSERT INTO student VALUES (11, 'Jane', 20,'nashik');
INSERT INTO student VALUES (12, 'Karen', 52,'nashik');
INSERT INTO student VALUES (13, 'Leo', 34,'nashik');
INSERT INTO student VALUES (14, 'Mona', 27,'pune');



select * from student;
select * from student partition(p4);
select * from student partition(p1);
select * from student partition(p3);
**/

/***
CREATE TABLE student (
    student_id INT,
    name VARCHAR(50),
    marks INT,
    city VARCHAR(30),
    CHECK (city IN ('pune', 'mumbai', 'nashik')) -- Restrict to specific cities
)
PARTITION BY LIST COLUMNS(city) (
    PARTITION p_pune VALUES IN ('pune'),
    PARTITION p_mumbai VALUES IN ('mumbai'),
    PARTITION p_nashik VALUES IN ('nashik')
);

INSERT INTO student VALUES (1, 'Piyush', 45,'pune');
INSERT INTO student VALUES (2, 'Alice', 19,'mumbai');
INSERT INTO student VALUES (3, 'Bob', 2,'pune');
INSERT INTO student VALUES (4, 'Charlie', 32,'pune');
INSERT INTO student VALUES (5, 'David', 5,'pune');
INSERT INTO student VALUES (6, 'Emma', 55,'mumbai');
INSERT INTO student VALUES (7, 'Frank', 30,'mumbai');
INSERT INTO student VALUES (8, 'George', 48,'pune');
INSERT INTO student VALUES (9, 'Helen', 28,'pune');
INSERT INTO student VALUES (10, 'Ian', 38,'nashik');
INSERT INTO student VALUES (11, 'Jane', 20,'nashik');
INSERT INTO student VALUES (12, 'Karen', 52,'nashik');
INSERT INTO student VALUES (13, 'Leo', 34,'nashik');
INSERT INTO student VALUES (14, 'Mona', 27,'pune');

select * from student p_pune ;
select * from student p_mumbai ;
**/

