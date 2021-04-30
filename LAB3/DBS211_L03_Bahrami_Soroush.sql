/* 
Name: Soroush Bahrami
Student Number: 152499182
Date: 2020-06-09
DBS211-LAB3
*/
SET AUTOCOMMIT ON;

--1.
SELECT * FROM offices;

--2.
SELECT employeenumber FROM employees WHERE officecode = 1;

--3.
SELECT customernumber, customername, contactfirstname, contactlastname, phone FROM customers WHERE CITY = 'Paris';

--4.a
SELECT customernumber, customername, contactlastname ||','|| contactfirstname AS fullname, phone FROM customers WHERE city = 'Paris';
--4.b
SELECT customernumber, customername, contactlastname ||','|| contactfirstname AS fullname, phone FROM customers WHERE country = 'Canada';

--5.
SELECT DISTINCT customernumber FROM payments WHERE amount is NOT NULL;

--6.
SELECT DISTINCT customernumber, checknumber, amount FROM payments WHERE amount NOT BETWEEN 30000 AND 65000 ORDER BY amount DESC;

--7.
SELECT ordernumber, orderdate, requireddate, shippeddate, comments, customernumber FROM orders WHERE status = 'Cancelled';

--8.
SELECT productcode, productname, buyprice, msrp - buyprice AS "markup", round (100 * (msrp - buyprice) / buyprice, 1) AS "percmarkup" FROM products;

--9.
SELECT * FROM products WHERE LOWER(productname) LIKE '%co%';

--10.
SELECT customername FROM customers WHERE LOWER(contactfirstname) LIKE 's%e%';

--11.
INSERT INTO employees(lastname, firstname, extension, employeenumber, email, jobtitle, officecode, reportsto) 
VALUES('Bahrami', 'Soroush', 'x1950', 1950, 'sbahrami7@myseneca.ca', 'cashier', 4, 1088);

--12.
SELECT * FROM employees WHERE employeenumber = 1950;

--13.
UPDATE employees SET jobtitle = 'Head Cashier' WHERE employeenumber = 1950;

--14.
INSERT INTO EMPLOYEES(lastname, firstname, extension, employeenumber, email, jobtitle, officecode, reportsto)
VALUES('Mercury', 'Freddie', 'x1980', 1980, 'bohemianrhapsody@myseneca.ca', 'Cashier', 6, 1950);

--15.
DELETE FROM employees WHERE employeenumber = 1950; 
-- NO, it did not work. Because I have a child record. Because Freddie Mercury reports to me so if I delete myself his reportsto value will point to nothing and will be invalid

--16. 
DELETE FROM employees WHERE employeenumber = 1980;
--Yes

--17.
INSERT ALL INTO employees 
VALUES(1980, 'Mercury', 'Freddie', 'x1980', 'bohemianrhapsody@myseneca.ca', 6, 1088, 'Cashier')
INTO employees VALUES(1950, 'Bahrami', 'Soroush', 'x1950', 'sbahrami7@myseneca.ca', 4, 1088, 'Head Cashier')
SELECT * FROM dual;

--18.
DELETE FROM employees WHERE employeenumber = 1950 OR employeenumber = 1980;



