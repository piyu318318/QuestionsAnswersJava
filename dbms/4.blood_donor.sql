DROP TABLES donor, blood;

CREATE TABLE donor(DONOR_NO VARCHAR(10) PRIMARY KEY, NAME VARCHAR(30), CITY VARCHAR(30));

CREATE TABLE blood(BLOOD_ID VARCHAR(10) PRIMARY KEY, DONOR_NO VARCHAR(10), FOREIGN KEY (DONOR_NO)  REFERENCES donor(DONOR_NO),BLOODGROUP VARCHAR(3), QUANTITY INT, RHFACTOR VARCHAR(20), DATE_OF_COLLECTION DATE);

INSERT INTO donor VALUES('1', 'Stephen', 'Pune');
INSERT INTO donor VALUES('2', 'Steven', 'Mumbai');
INSERT INTO donor VALUES('3', 'Mark', 'New York');
INSERT INTO donor VALUES('4', 'Trevor', 'Mumbai');
INSERT INTO donor VALUES('5', 'John', 'Delhi');
INSERT INTO donor VALUES('6', 'Tobey', 'Nagpur');

INSERT INTO blood VALUES('101', '1', 'A', 100, 'Negative', '2008/04/11');
INSERT INTO blood VALUES('102', '2', 'AB', 225, 'Negative', '2007/01/31');
INSERT INTO blood VALUES('103', '3', 'B', 134, 'Negative', '2005/05/12');
INSERT INTO blood VALUES('104', '4', 'A', 354, 'Positive', '2001/10/21');
INSERT INTO blood VALUES('105', '5', 'O', 411, 'Negative', '2000/01/31');
INSERT INTO blood VALUES('106', '3', 'B', 298, 'Negative', '2008/04/11');
INSERT INTO blood VALUES('107', '1', 'A', 300, 'Negative', '1999/09/03');
INSERT INTO blood VALUES('108', '6', 'A', 326, 'Negative', '1999/09/03');


SELECT * FROM donor;
SELECT * FROM blood;

How many donors contributed blood on '2008/04/11'? Provide the count.
SELECT COUNT(*) AS DONOR_COUNT
FROM blood
WHERE DATE_OF_COLLECTION = '2008/04/11';

Which donors have donated blood with blood group 'A' and RH factor 'Negative'? List their names and cities.
SELECT D.NAME, D.CITY
FROM donor D 
JOIN blood B ON B.DONOR_NO = D.DONOR_NO
WHERE B.BLOODGROUP = 'A' AND B.RHFACTOR = 'Negative'
GROUP BY D.NAME, D.CITY;

What is the total quantity of blood donated for each blood group on '2007/01/31'? Provide the blood group, RH factor, and the sum of the donated quantities.
SELECT B.BLOODGROUP, B.RHFACTOR, SUM(B.QUANTITY) AS SUM
FROM blood B
WHERE B.DATE_OF_COLLECTION = '2007/01/31'
GROUP BY B.BLOODGROUP, B.RHFACTOR;

Which donors have donated blood, and what is their blood group and RH factor? Provide distinct names, blood group, and RH factor.
SELECT DISTINCT(D.NAME), B.BLOODGROUP, B.RHFACTOR
FROM donor D 
JOIN blood B ON B.DONOR_NO = D.DONOR_NO;

