--Chapter 5 -- JOIN TABLES
--INNER JOIN ,OUTER JOIN , CROSS JOIN ,SELF JOIN


---INNER JOIN

SELECT * FROM Categories
SELECT * FROM products


SELECT *
FROM products p INNER JOIN Categories c
ON p.CategoryID = c.CategoryID



SELECT p.ProductID ,p.ProductName ,p.CategoryID,c.CategoryName,p.UnitPrice
FROM products p INNER JOIN Categories c
ON p.CategoryID = c.CategoryID


SELECT p.ProductID ,p.ProductName ,p.CategoryID,c.CategoryName,p.UnitPrice
FROM products p  JOIN Categories c
ON p.CategoryID = c.CategoryID


SELECT ProductID ,p.ProductName ,p.CategoryID,c.CategoryName,p.UnitPrice
FROM products p  JOIN Categories c
ON p.CategoryID = c.CategoryID


---Ambiguous column name 'CategoryID'.

SELECT ProductID ,p.ProductName ,CategoryID,c.CategoryName,p.UnitPrice
FROM products p  JOIN Categories c
ON p.CategoryID = c.CategoryID


SELECT p.ProductID ,p.ProductName ,p.CategoryID,c.CategoryName,p.UnitPrice
FROM products p  JOIN Categories c
ON p.CategoryID = c.CategoryID
WHERE c.CategoryID=1
ORDER BY UnitPrice DESC



SELECT o.OrderID , c.CompanyName
FROM orders o JOIN customers c
ON o.CustomerID = c.CustomerID
WHERE c.CompanyName LIKE 'A%'


SELECT o.OrderID , c.CompanyName
FROM orders o JOIN customers c
ON o.CustomerID = c.CustomerID
WHERE LEFT(c.CompanyName,1) IN ('A')


--JOINING MORE THAN 2 TABLES


SELECT c.CustomerID, c.CompanyName ,o.OrderID,o.OrderDate,o.EmployeeID
,E.lastname, E.FirstName,od.ProductID,od.UnitPrice
FROM customers c JOIN orders o
ON c.CustomerID = o.CustomerID
	JOIN employees e
ON E.EmployeeID = O.EmployeeID
	JOIN [Order Details] od
ON od.OrderID =o.OrderID
WHERE o.OrderID =10248



---OUTER JOIN
--LEFT, RIGHT , FULL


CREATE TABLE Dep
(Depid INT,
 Depname VARCHAR(30)
 )


 SELECT * FROM dep

 INSERT INTO dep
 VALUES (10,'IT'),
		(20,'DA'),
		(30,'SALES')

CREATE TABLE emp
(empid INT,
 empname VARCHAR(10),
 depid INT)

 INSERT INTO emp
 VALUES (1,'Moshe',10),
		(2,'Yossi',10),
		(3,'David',NULL),
		(4,'Yeal',20)

 SELECT * FROM dep
  SELECT * FROM emp

SELECT *
FROM emp JOIN dep 
ON emp.depid =dep.depid

---LEFT =INNER+ ALL ROWS FROM EMP
SELECT *
FROM emp LEFT OUTER JOIN dep 
ON emp.depid =dep.depid

---RIGHT =INNER+ ALL ROWS FROM DEP
SELECT *
FROM emp RIGHT OUTER JOIN dep 
ON emp.depid =dep.depid


---FULL =INNER+ ALL ROWS FROM DEP&EMP
SELECT *
FROM emp FULL OUTER JOIN dep 
ON emp.depid =dep.depid


SELECT *
FROM emp RIGHT  JOIN dep 
ON emp.depid =dep.depid


SELECT *
FROM dep RIGHT  JOIN  emp
ON emp.depid =dep.depid


SELECT *
FROM emp RIGHT  JOIN dep 
ON emp.depid =dep.depid
WHERE emp.empid IS NULL



SELECT c.CompanyName, o.orderid
FROM customers c JOIN orders o
ON c.CustomerID = o.CustomerID


SELECT c.CompanyName, o.orderid
FROM customers c LEFT JOIN orders o
ON c.CustomerID = o.CustomerID


SELECT c.CompanyName, o.orderid
FROM customers c LEFT JOIN orders o
ON c.CustomerID = o.CustomerID
ORDER BY orderid 


SELECT c.CompanyName, o.orderid
FROM customers c LEFT JOIN orders o
ON c.CustomerID = o.CustomerID
WHERE o.OrderID IS NULL
ORDER BY orderid 


SELECT c.*
FROM customers c LEFT JOIN orders o
ON c.CustomerID = o.CustomerID
WHERE o.OrderID IS NULL
ORDER BY orderid 

--CROSS JOIN 

SELECT * FROM dep
SELECT * FROM emp


SELECT *
FROM emp CROSS JOIN dep



SELECT *
FROM emp  JOIN dep
ON emp.depid = dep.Depid


SELECT *
FROM emp  JOIN dep
ON emp.empid =1



SELECT *
FROM emp  JOIN dep
ON  1=1



SELECT *
FROM emp  JOIN dep
ON emp.depid  =emp.depid


SELECT c.CompanyName, o.orderid
FROM customers c JOIN orders o
ON c.CustomerID = c.CustomerID

SELECT c.CompanyName, o.orderid
FROM customers c JOIN orders o
ON o.CustomerID = o.CustomerID


--SELF JOIN


SELECT EmployeeID , LastName , ReportsTo
FROM Employees 


SELECT emp.EmployeeID AS empid , emp.LastName as empname, emp.ReportsTo empmng
,MNG.EmployeeID  mngid,mng.LastName mngname
FROM Employees emp JOIN employees mng
ON  emp.ReportsTo =mng.EmployeeID


SELECT emp.EmployeeID , emp.LastName , emp.ReportsTo
,mng.LastName
FROM Employees emp LEFT JOIN employees mng
ON  emp.ReportsTo =mng.EmployeeID


SELECT pro.ProductID , pro.ProductName , pro.UnitPrice
,alice.ProductName,alice.UnitPrice
FROM products pro JOIN products alice
ON alice.ProductName ='alice mutton'
AND pro.UnitPrice>alice.UnitPrice



SELECT C.CustomerID, C.CompanyName, O.OrderID, O.OrderDate
,e.EmployeeID ,e.LastName
FROM customers c LEFT  JOIN orders o
ON C.CustomerID = O.CustomerID
	LEFT JOIN employees e
ON e.EmployeeID = o.EmployeeID
ORDER BY orderid



SELECT C.CustomerID, C.CompanyName, O.OrderID, O.OrderDate
,e.EmployeeID ,e.LastName
FROM orders o RIGHT  JOIN  customers c
ON C.CustomerID = O.CustomerID
	LEFT JOIN employees e
ON e.EmployeeID = o.EmployeeID
ORDER BY orderid


SELECT C.CustomerID, C.CompanyName, O.OrderID, O.OrderDate
,e.EmployeeID ,e.LastName
FROM orders o   JOIN employees e
ON e.EmployeeID = o.EmployeeID
	RIGHT JOIN  customers c
ON C.CustomerID = O.CustomerID
ORDER BY orderid





