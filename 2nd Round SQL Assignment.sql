create database second_round;
GO

use second_round;
GO

Create table Employees
(
EmployeeID INT,
FirstName VARCHAR(20), 
LastName VARCHAR(20), 
DepartmentID INT
);
GO


INSERT into Employees
values
(1, 'Santosh', 'Kumar', 101),
(2, 'Shashi', 'Ranjan', 102),
(3, 'Om', 'Prakash', 103),
(4, 'Hari', 'Om', 101),
(5, 'Prasanna', 'Kumar', 101),
(6, 'Mukesh', 'Singh', 102),
(7, 'Hitesh', 'Chugh', 101),
(8, 'Ritesh', 'Singh', 103);
GO

Create table Departments
(
DepartmentID INT,
DepartmentName VARCHAR(50)
);
GO

Insert into Departments
values
(101, 'Sales'),
(102, 'HR'),
(103, 'IT');
GO


Create table Orders
(
OrderID INT,
EmployeeID INT,
OrderDate DATE,
TotalAmount INT
);
GO

Insert into Orders
Values
(1001, 1, '2024-08-16', 550),
(1002, 2, '2024-08-16', 680),
(1003, 2, '2024-08-11', 1050),
(1004, 3, '2024-08-10', 1250),
(1005, 3, '2024-08-10', 800),
(1006, 6, '2024-08-11', 360),
(1007, 7, '2024-08-13', 508),
(1008, 8, '2024-08-12', 630),
(1009, 1, '2024-08-13', 780),
(1010, 4, '2024-08-01', 980),
(1011, 5, '2024-08-12', 260),
(1012, 6, '2024-08-16', 360),
(1013, 7, '2024-08-01', 450),
(1014, 1, '2024-08-03', 980),
(1015, 1, '2024-08-05', 550);
GO

select d.DepartmentName, SUM(o.TotalAmount) As TotalSalesAmount
from Departments as d
Join Employees as e on d.DepartmentID = e.DepartmentID
Join Orders as o ON e.EmployeeID = o.EmployeeID
Group by d.DepartmentName
