-- Multi-Table Query Practice

-- Display the ProductName and CategoryName for all products in the database. Shows 77 records.

SELECT p.ProductName, c.CategoryName
FROM Product as p
JOIN Category as c ON p.Categoryid = c.id;

-- Display the order Id and shipper CompanyName for all orders placed before August 9 2012. Shows 429 records.

SELECT o.id, s.CompanyName
FROM [Order] as o 
JOIN Shipper as s On o.ShipVia = s.id
WHERE o.OrderDate < '2012-08-09';

-- Display the name and quantity of the products ordered in order with Id 10251. Sort by ProductName. Shows 3 records.

SELECT p.ProductName, od.quantity
FROM [OrderDetail] as od
JOIN [Product] as p ON od.Productid = p.id
WHERE od.Orderid = 10251
ORDER BY ProductName;

-- Display the OrderID, Customer's Company Name and the employee's LastName for every order. All columns should be labeled clearly. Displays 16,789 records.

SELECT o.id , c.CompanyName as 'Company Name', e.LastName as 'Employees Last Name'
FROM [Order] as o
JOIN Customer as c ON o.Customerid = c.id
JOIN Employee as e ON o.EmployeeId = e.id;
