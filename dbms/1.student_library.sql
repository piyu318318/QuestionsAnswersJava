DROP TABLES student, membership, book, iss_rec;

CREATE TABLE student(STUD_NO VARCHAR(10) PRIMARY KEY, STUD_NAME VARCHAR(50));

CREATE TABLE membership(MEM_NO VARCHAR(10) PRIMARY KEY, STUD_NO VARCHAR(10), FOREIGN KEY (STUD_NO) REFERENCES student(STUD_NO));

CREATE TABLE book(BOOK_NO VARCHAR(10) PRIMARY KEY, BOOK_NAME TEXT, AUTHOR VARCHAR(100));

CREATE TABLE iss_rec(ISS_NO VARCHAR(10) PRIMARY KEY, ISS_DATE DATE, MEM_NO VARCHAR(10), FOREIGN KEY (MEM_NO) REFERENCES membership(MEM_NO), BOOK_NO VARCHAR(10), FOREIGN KEY (BOOK_NO) REFERENCES book(BOOK_NO));

INSERT INTO student VALUES('1', 'Tobey');
INSERT INTO student VALUES('2', 'Andrew');
INSERT INTO student VALUES('3', 'Tom');
INSERT INTO student VALUES('4', 'Zendaya');
INSERT INTO student VALUES('5', 'Jimmy');

INSERT INTO membership VALUES('101', '1');
INSERT INTO membership VALUES('201', '2');
INSERT INTO membership VALUES('301', '3');
INSERT INTO membership VALUES('401', '4');
INSERT INTO membership VALUES('501', '5');

INSERT INTO book VALUES('1001', 'A Game Of Thrones', 'George RR Martin');
INSERT INTO book VALUES('1002', 'Savarkar : Echoes Of A Forgotten Past', 'Vikram Sampath');
INSERT INTO book VALUES('1003', 'Database System Concepts', 'Korth');
INSERT INTO book VALUES('1004', 'Homo Sapiens', 'Yuval Noah Harari');
INSERT INTO book VALUES('1005', 'Elon Musk', 'Ashlee Vance');

INSERT INTO iss_rec VALUES('21', '2021/04/19', '101', '1001');
INSERT INTO iss_rec VALUES('22', '2021/05/11', '201', '1002');
INSERT INTO iss_rec VALUES('23', '2021/05/22', '301', '1003');
INSERT INTO iss_rec VALUES('24', '2021/06/1', '401', '1004');
INSERT INTO iss_rec VALUES('25', '2021/07/24', '501', '1005');
INSERT INTO iss_rec VALUES('26', '2021/08/12', '301', '1005');

SELECT * FROM student;
SELECT * FROM membership;
SELECT * FROM book;
SELECT * FROM iss_rec;

Q.What is the bookname whose author is 'Korth'?
SELECT B.BOOK_NAME
FROM book B
WHERE AUTHOR = 'Korth';

Q.What are the books listed in alphabetical order?
SELECT B.BOOK_NAME
FROM book B
ORDER BY B.BOOK_NAME;

Q.What are the student names listed in alphabetical order?
SELECT S.STUD_NAME
FROM student S
ORDER BY S.STUD_NAME;

Q.How many books has each student issued? List the student names along with the count of books.
SELECT S.STUD_NAME, COUNT(*) AS CNT_OF_BOOKS
FROM student S
JOIN membership M ON M.STUD_NO = S.STUD_NO
JOIN iss_rec ISS ON ISS.MEM_NO = M.MEM_NO
GROUP BY S.STUD_NAME;

Q.Books Issued by Student '5'
SELECT B.BOOK_NAME
FROM book B
JOIN iss_rec ISS ON ISS.BOOK_NO = B.BOOK_NO
JOIN membership M ON M.MEM_NO = ISS.MEM_NO
JOIN student S ON S.STUD_NO = M.STUD_NO
WHERE S.STUD_NO = '5';




second highest salary 
#select * from employee order by salary desc limit 1 offset 2   
#select * from employee order by salary desc limit 3,1
#Query to Find Duplicate Rows sql
select ENAME, count(*) as cnt from employee group by ename having cnt > 1
#get even and odd  empno from table 
select sum(case when empno % 2 = 0 then 1 else 0 end), sum(case when empno % 2 <> 0 then 1 else 0 end) from employee
#get employee names whose name not starts with M
select * from employee where ename not like "%M"
#replace names A to @ 
update employee set ename = REPLACE(ename , 'A', '@')
#uppser case name and lowecase
select upper(ename) from employee 
select lower(ename) from employee 
#unqiye enames
select DISTINCT(ename) from employee
select ename from employee group by ename
#print all enmaes 1  to 3 letters
select substring(ename,1,3) from employee
#concate the names 
select CONCAT(EMPNO, '      ', ENAME) FROM  employee 
#Write an SQL query to show only odd rows from Student table.
select * from employee where empno % 2 <> 0
#Write an SQL query to show the current date and time.
SELECT NOW();
SELECT CURDATE();

#window functions
select ename, empno f, rank()  over (partition by salary order by salary ) AS Rankedcols from employee
select ename, empno f, dense_rank()  over (partition by salary order by salary ) AS Rankedcols from employee
select empno , LEAD(salary) over (order by salary desc ) as prev  from employee ;
select empno , LAG(salary) over (order by salary desc ) as prev  from employee ;











