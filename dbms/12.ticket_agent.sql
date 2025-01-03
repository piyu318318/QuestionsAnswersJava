USE ticket_agent;

DROP TABLES agent, ticket , ticket_agent;

CREATE TABLE agent(AGENTCODE VARCHAR(10) PRIMARY KEY, AGENTNAME VARCHAR(50));

CREATE TABLE ticket(TCODE VARCHAR(10) PRIMARY KEY, PASSENGERNAME VARCHAR(50), NUMBEROFTICKETS INT, AGENTCODE VARCHAR(10), FOREIGN KEY (AGENTCODE) REFERENCES agent(AGENTCODE), BOOKINGDATE DATE);

CREATE TABLE ticket_agent(AGENTCODE VARCHAR(10), FOREIGN KEY (AGENTCODE) REFERENCES agent(AGENTCODE), TCODE VARCHAR(10), FOREIGN KEY (TCODE) REFERENCES ticket(TCODE));

INSERT INTO agent VALUES('101', 'Mr. Stark');
INSERT INTO agent VALUES('102', 'Mr. Baratheon');
INSERT INTO agent VALUES('103', 'Mr. Greyjoy');
INSERT INTO agent VALUES('104', 'Mr. XXX');
INSERT INTO agent VALUES('105', 'Mr. Lannister');


INSERT INTO ticket VALUES('1', 'Cersei', 5, '101', '2021/05/19');
INSERT INTO ticket VALUES('2', 'Sansa', 1, '102', '2021/04/23');
INSERT INTO ticket VALUES('3', 'Arya', 7, '103', '2021/12/01');
INSERT INTO ticket VALUES('4', 'Margaery', 2, '104', '2021/08/11');
INSERT INTO ticket VALUES('5', 'Jeyne', 13, '105', '2020/02/14');
INSERT INTO ticket VALUES('6', 'Catelyn', 18, '104', '2021/02/24');


INSERT INTO ticket_agent VALUES('101', '1');
INSERT INTO ticket_agent VALUES('102', '2');
INSERT INTO ticket_agent VALUES('103', '3');
INSERT INTO ticket_agent VALUES('104', '4');
INSERT INTO ticket_agent VALUES('105', '5');
INSERT INTO ticket_agent VALUES('104', '6');

SELECT * FROM agent;
SELECT * FROM ticket;
SELECT * FROM ticket_agent;

Q.Which tickets were booked with less than 5 tickets? List the ticket code, passenger name, and agent name.
SELECT T.TCODE, T.PASSENGERNAME, A.AGENTNAME
FROM ticket T
JOIN ticket_agent TA ON TA.TCODE = T.TCODE
JOIN agent A ON A.AGENTCODE = TA.AGENTCODE
WHERE T.NUMBEROFTICKETS < 5; 

Q.How many tickets were booked by the agent 'Mr. XXX' in total?
SELECT SUM(T.NUMBEROFTICKETS) BOOKED_BY_XXX
FROM ticket T
JOIN ticket_agent TA ON TA.TCODE = T.TCODE
JOIN agent A ON A.AGENTCODE = TA.AGENTCODE
GROUP BY A.AGENTNAME
HAVING A.AGENTNAME = 'Mr. XXX';

Q.Which agents names contain the letter 'k'? List the agent code, agent name, and the ticket codes they are associated with.
SELECT A.AGENTCODE, A.AGENTNAME, T.TCODE
FROM agent A
JOIN ticket_agent TA ON TA.AGENTCODE = A.AGENTCODE
JOIN ticket T ON T.TCODE = TA.TCODE
WHERE AGENTNAME LIKE '%k';

Q.List all tickets ordered by booking date in descending order.
SELECT T.*
FROM ticket T
ORDER BY BOOKINGDATE DESC;

