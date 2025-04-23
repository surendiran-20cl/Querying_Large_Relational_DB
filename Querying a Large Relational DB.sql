/*
a. Get all details from the person table including email, phone number, and phone type
*/

-- Query to get person details along with their email address, phone number, and phone type
-- Joining Person, EmailAddress, PersonPhone, and PhoneNumberType tables

SELECT 
    p.FirstName, 
    p.LastName,
    e.EmailAddress,
    ph.PhoneNumber,
    pt.Name AS PhoneNumberType
FROM Person.Person p
JOIN Person.EmailAddress e 
    ON p.BusinessEntityID = e.BusinessEntityID
JOIN Person.PersonPhone ph 
    ON p.BusinessEntityID = ph.BusinessEntityID
JOIN Person.PhoneNumberType pt 
    ON ph.PhoneNumberTypeID = pt.PhoneNumberTypeID;

/* 
 Explanation:

Person.Person has the names and IDs

EmailAddress gives the emails

PersonPhone provides phone numbers

PhoneNumberType defines the type like "Mobile", "Home", etc.

We're using JOIN to combine these related tables using the BusinessEntityID and PhoneNumberTypeID
*/


--b. Get sales header orders made in May 2011

-- Query to fetch order headers (general order info) for May 2011

SELECT *
FROM Sales.SalesOrderHeader
WHERE OrderDate BETWEEN '2011-05-01' AND '2011-05-31';

/*
 Explanation:

SalesOrderHeader contains order-level information.

We filter by OrderDate to get only orders made in May 2011.
*/

--c. Get sales order details made in May 2011

-- Query to fetch order item details for orders made in May 2011
-- SalesOrderDetail contains line items, and is linked to SalesOrderHeader by SalesOrderID

SELECT sod.*
FROM Sales.SalesOrderDetail sod
JOIN Sales.SalesOrderHeader soh 
    ON sod.SalesOrderID = soh.SalesOrderID
WHERE soh.OrderDate BETWEEN '2011-05-01' AND '2011-05-31';

/*
Explanation:

SalesOrderDetail stores line-by-line order details.

We join with SalesOrderHeader to filter only those made in May 2011.
*/

-- d. Get total sales in May 2011

-- Query to calculate total sales in May 2011 using SUM on TotalDue

SELECT 
    SUM(TotalDue) AS TotalSalesMay2011
FROM Sales.SalesOrderHeader
WHERE OrderDate BETWEEN '2011-05-01' AND '2011-05-31';

/*
Explanation:

TotalDue is the amount due for each order.

We sum it for all orders in May 2011 to get the total monthly sales.
*/

--e. Get total monthly sales in 2011 ordered by increasing sales

-- Query to get total sales per month for 2011
-- Grouping by month and sorting by sales in ascending order

SELECT 
    MONTH(OrderDate) AS SaleMonth,
    SUM(TotalDue) AS TotalSales
FROM Sales.SalesOrderHeader
WHERE YEAR(OrderDate) = 2011
GROUP BY MONTH(OrderDate)
ORDER BY TotalSales;

/*
 Explanation:

We group orders by month using MONTH(OrderDate)

We sum TotalDue for each group

Ordered by TotalSales from lowest to highest
*/

--f. Get total sales made to customer Gustavo Achong

-- Query to find total sales made to a specific customer (Gustavo Achong)
-- Joining Customer → Person to get name, and then SalesOrderHeader for sales

SELECT 
    p.FirstName,
    p.LastName,
    SUM(soh.TotalDue) AS TotalSales
FROM Sales.Customer c
JOIN Person.Person p 
    ON c.PersonID = p.BusinessEntityID
JOIN Sales.SalesOrderHeader soh 
    ON c.CustomerID = soh.CustomerID
WHERE p.FirstName = 'Gustavo' AND p.LastName = 'Achong'
GROUP BY p.FirstName, p.LastName;

/*
Explanation:

We identify the customer using their name

Join with SalesOrderHeader to get their sales

SUM(TotalDue) gives the total amount purchased by this customer
*/



