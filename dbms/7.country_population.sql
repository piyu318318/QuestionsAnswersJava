USE country_population;

DROP TABLES country, population;

CREATE TABLE country(CON_CODE VARCHAR(10) PRIMARY KEY, NAME VARCHAR(50), CAPITAL VARCHAR(100));
CREATE TABLE population(POP_CODE VARCHAR(10) PRIMARY KEY, CON_CODE VARCHAR(10), FOREIGN KEY (CON_CODE) REFERENCES country(CON_CODE),POPULATION INT);

INSERT INTO country VALUES('1', 'India', 'Delhi');
INSERT INTO country VALUES('2', 'USA', 'Washington, DC');
INSERT INTO country VALUES('3', 'Japan', 'Tokyo');
INSERT INTO country VALUES('4', 'Russia', 'Moscow');
INSERT INTO country VALUES('5', 'Azerbaijan', 'Baku');

INSERT INTO population VALUES('101', '1', 120);
INSERT INTO population VALUES('102', '2', 32);
INSERT INTO population VALUES('103', '3', 13);
INSERT INTO population VALUES('104', '4', 15);
INSERT INTO population VALUES('105', '5', 1);


Q.Which country has the highest population? Provide the countrys name.
SELECT C.NAME
FROM country C
JOIN population P ON P.CON_CODE = C.CON_CODE
ORDER BY P.POPULATION DESC
LIMIT 1;


Q.What is the population of the country whose capital is 'Tokyo'?
SELECT C.NAME, P.POPULATION
FROM country C 
JOIN population P ON C.CON_CODE = P.CON_CODE
WHERE C.CAPITAL = 'Tokyo';

Q.Which country has the lowest population? Provide the countrys name and its population.
SELECT C.NAME, P.POPULATION
FROM country C 
JOIN population P ON C.CON_CODE = P.CON_CODE
ORDER BY P.POPULATION 
LIMIT 1;

Q.List all countries along with their population.
SELECT C.NAME, P.POPULATION
FROM country C 
JOIN population P ON P.CON_CODE = C.CON_CODE;