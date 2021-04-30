--1. 1. when the user establish a new connection to the server and has a blank sheet, it starts a new transaction 2. The user uses the BEGIN statement in Oracle SQL 3. The user executes a COMMIT statement 4. THe user executes any DDL statement.

--2.
CREATE TABLE newEmployees AS
SELECT * FROM employees
WHERE 1=2;

--3.
SET AUTOCOMMIT OFF;
	SET TRANSACTION READ WRITE;
    
--4.
INSERT ALL
INTO newEmployees VALUES (100, 'Patel', 'Ralph', '22333', 'rpatel@mail.com', '1', NULL, 'Sales Rep')
INTO newEmployees Values (101, 'Denis', 'Betty', '33444', 'bdenis@mail.com', '4', NULL, 'Sales Rep')
INTO newEmployees Values (102, 'Biri', 'Ben', '44555', 'bbirir@mail.com', '2', NULL, 'Sales Rep')
INTO newEmployees Values (103, 'Newman', 'Chad', '66777', 'cnewman@mail.com', '3', NULL, 'Sales Rep')
INTO newEmployees Values (104, 'Ropeburn', 'Audrey', '77888', 'aropebur@mail.com', '1', NULL, 'Sales Rep')
SELECT * FROM dual;

--5. 5 ROWS
SELECT * FROM newEmployees;

--6. 0 ROWS
ROLLBACK;
SELECT * FROM newEmployees;

--7. 5 ROWS
INSERT ALL
INTO newEmployees VALUES (100, 'Patel', 'Ralph', '22333', 'rpatel@mail.com', '1', NULL, 'Sales Rep')
INTO newEmployees Values (101, 'Denis', 'Betty', '33444', 'bdenis@mail.com', '4', NULL, 'Sales Rep')
INTO newEmployees Values (102, 'Biri', 'Ben', '44555', 'bbirir@mail.com', '2', NULL, 'Sales Rep')
INTO newEmployees Values (103, 'Newman', 'Chad', '66777', 'cnewman@mail.com', '3', NULL, 'Sales Rep')
INTO newEmployees Values (104, 'Ropeburn', 'Audrey', '77888', 'aropebur@mail.com', '1', NULL, 'Sales Rep')
SELECT * FROM dual;

SELECT * FROM newEmployees;

--8.
UPDATE newEmployees SET jobTitle = 'unknown';

--9.
COMMIT;

--10.
ROLLBACK;

SELECT * FROM newEmployees WHERE jobTitle = 'unknown';

--10b. No. IT WAS NOT EFFECTIVE.

--10c. The difference was that in task 6 the ROLLBACK command was effective, contrary to the 
--previous task. the reason is that, in task 9 we used COMMIT and made changes permanant, so now
-- the ROLLBACK is not effective anymore.

--11.
COMMIT;
DELETE FROM newEmployees
WHERE employeeNumber BETWEEN 100 and 104;

--12.
CREATE VIEW vwNewEmps AS
SELECT *
FROM newEmployees
ORDER BY lastname, firstname;

--13.
ROLLBACK;

--13a. 0 employees.
SELECT * FROM newEmployees;
--13b. it was not effective because in task 12 we started a new transaction, which means the delete statement was made permanant.

--14.
COMMIT;
INSERT ALL
INTO newEmployees VALUES (100, 'Patel', 'Ralph', '22333', 'rpatel@mail.com', '1', NULL, 'Sales Rep')
INTO newEmployees Values (101, 'Denis', 'Betty', '33444', 'bdenis@mail.com', '4', NULL, 'Sales Rep')
INTO newEmployees Values (102, 'Biri', 'Ben', '44555', 'bbirir@mail.com', '2', NULL, 'Sales Rep')
INTO newEmployees Values (103, 'Newman', 'Chad', '66777', 'cnewman@mail.com', '3', NULL, 'Sales Rep')
INTO newEmployees Values (104, 'Ropeburn', 'Audrey', '77888', 'aropebur@mail.com', '1', NULL, 'Sales Rep')
SELECT * FROM dual;
--15.
SAVEPOINT insertion;

--16.
UPDATE newEmployees SET jobTitle = 'unknown';
SELECT * FROM newEmployees;

--17. 
ROLLBACK TO insertion;
SELECT * FROM newEmployees;

--18.The data is there but the job title is the same as it was before task 16, which means that ROLLBACK statement actually had an effect until the point we specified by using SAVEPOINT

--19.
REVOKE ALL ON newEmployees FROM public;

--20.
GRANT SELECT ON newEmployees TO dbs211_202a03;

--21.
GRANT INSERT, UPDATE, DELETE ON newEmployees TO dbs211_202a03;

--22.
REVOKE ALL ON newEmployees FROM dbs211_202a01;

--23.
DROP TABLE newEmployees;
DROP VIEW nwNewEmps;


