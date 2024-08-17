Create database third_round;
GO

Use third_round;
GO

--1. Write SQL statement select to display customer Full Name in one column, their City and Amount of sales. We need data only for customers whose mother has brown eyes.

--Create table Sales
--(
--ID INT,
--CustomerID INT,
--CityID INT,
--Amount INT
--);
--GO

--INSERT INTO Sales (ID, CustomerID, CityID, Amount)
--VALUES
--(1, 3, 2, 500),
--(2, 1, 1, 10000),
--(3, 4, 4, 800),
--(4, 2, 3, 600),
--(5, 3, 1, 10000),
--(6, 1, 1, 630),
--(7, 3, 1, 960);
--GO

--CREATE TABLE Customer (
--ID INT,
--Gender VARCHAR(10),
--FirstName VARCHAR(50),
--LastName VARCHAR(50),
--EyeColor VARCHAR(10),
--IDNumber VARCHAR(20),
--MotherIDNumber VARCHAR(20) NULL,
--FatherIDNumber VARCHAR(20) NULL
--);
--GO

--INSERT INTO Customer (ID, Gender, FirstName, LastName, EyeColor, IDNumber, MotherIDNumber, FatherIDNumber)
--VALUES
--(1, 'Male', 'Peter', 'Cina', 'Blue', 'SK-156-232', NULL, NULL),
--(2, 'Female', 'Adela', 'Cinova', 'Brown', 'SK-216-897', NULL, NULL),
--(3, 'Female', 'Petra', 'Atkinson', 'Blue', 'SK-258-321', 'SK-216-897', 'SK-156-232'),
--(4, 'Male', 'Andrej', 'Nowak', 'Brown', 'SK-244-221', 'SK-411-897', 'SK-226-233'),
--(5, 'Female', 'Andrea', 'Atkinson', 'Green', 'SK-411-897', NULL, NULL),
--(6, 'Male', 'Jozef', 'Jovanovic', 'Green', 'SK-226-233', NULL, NULL);
--GO

--CREATE TABLE Address (
--ID INT,
--Country VARCHAR(50),
--City VARCHAR(50)
--);
--GO

--INSERT INTO Address (ID, Country, City)
--VALUES
--(1, 'Slovakia', 'Presov'),
--(2, 'England', 'London'),
--(3, 'Slovakia', 'Bratislava'),
--(4, 'Slovakia', 'Trnava');
--GO

select CONCAT(C.FirstName,' ', C.LastName) As FullName, A.City, S.Amount
From Customer As C
JOIN Sales AS S ON C.ID = S.CustomerID
JOIN Address AS A on S.CityID = A.ID
Where C.EyeColor = 'Brown' AND C.MotherIDNumber IS NOT Null;
GO;

select CONCAT(C.FirstName,' ', C.LastName) As FullName, A.City, S.Amount
From Customer As C
JOIN Sales AS S ON C.ID = S.CustomerID
JOIN Address AS A on S.CityID = A.ID
JOIN Customer AS M ON C.MotherIDNumber = M.IDNumber
Where C.EyeColor = 'Brown';
GO

--2. Write SQL statement select to display First Name and Last Name of users which ordered 3 and more courses. Use tables from below.

--CREATE TABLE Course (
--    CourseID INT PRIMARY KEY,
--    Name VARCHAR(50)
--);
--GO

--INSERT INTO Course (CourseID, Name)
--VALUES
--(1, 'Course A'),
--(2, 'Course B'),
--(3, 'Course C'),
--(4, 'Course D');
--GO

--CREATE TABLE Orders (
--    OrderID INT PRIMARY KEY,
--    UserID INT,
--    CourseID INT,
--    FOREIGN KEY (UserID) REFERENCES Users(UserID),
--    FOREIGN KEY (CourseID) REFERENCES Course(CourseID)
--);
--GO

--INSERT INTO Orders(OrderID, UserID, CourseID)
--VALUES
--(1, 1, 1),
--(2, 2, 1),
--(3, 3, 1),
--(4, 2, 2),
--(5, 4, 2),
--(6, 5, 3),
--(7, 6, 4),
--(8, 7, 3),
--(9, 3, 4),
--(10, 5, 4),
--(11, 6, 2),
--(12, 2, 3);
--GO

--CREATE TABLE Users (
--    UserID INT PRIMARY KEY,
--    FirstName VARCHAR(50),
--    LastName VARCHAR(50)
--);
--GO

--INSERT INTO Users (UserID, FirstName, LastName)
--VALUES
--(1, 'Peter', 'Jovanovic'),
--(2, 'Jozef', 'Djordjevic'),
--(3, 'Milan', 'Atkinson'),
--(4, 'Maria', 'Armstrong'),
--(5, 'Slavomir', 'Cina'),
--(6, 'Robert', 'Varga'),
--(7, 'Peter', 'Nowak');
--GO


select U.FirstName, U.LastName, COUNT(C.Name) As No_Of_Order_Courses
from Users as U
JOIN Orders AS O ON U.UserID = O.UserID
JOIN Course AS C ON O.CourseID = C.CourseID
Group BY U.FirstName, U.LastName
Having COUNT(C.Name) >=3

--3. What will be the result of the select below

CREATE TABLE Clients (
ClientId INT PRIMARY KEY,
Name VARCHAR(50),
Age INT
);
GO

INSERT INTO Clients (ClientId, Name, Age)
VALUES
(1, 'Fero', 14),
(2, 'Jozo', 16),
(3, 'Miro', 22),
(4, 'David', 10),
(5, 'Vlado', 35);
GO


CREATE TABLE Payments (
PaymentId INT PRIMARY KEY,
DueDate DATE,
Amount DECIMAL(10, 2),
ClientId INT,
FOREIGN KEY (ClientId) REFERENCES Clients(ClientId)
);
GO

INSERT INTO Payments (PaymentId, DueDate, Amount, ClientId)
VALUES
(1, '2016-07-08', 100, 1),
(2, '2016-07-25', 200, 1),
(3, '2016-09-08', 300, 2),
(4, '2016-07-11', 400, 2),
(5, '2016-11-12', 500, 3);
GO

CREATE TABLE Addresses (
AddressId INT PRIMARY KEY,
Line1 VARCHAR(100),
City VARCHAR(50),
IsPrimary BIT,
ClientId INT,
FOREIGN KEY (ClientId) REFERENCES Clients(ClientId)
);
GO

INSERT INTO Addresses (AddressId, Line1, City, IsPrimary, ClientId)
VALUES
(1, 'Fucikova 1', 'Bratislava', 0, 1),
(2, 'Jesenskeho 2', 'Trnava', 1, 1),
(3, 'Odborarska 3', 'Senec', 0, 1),
(4, 'Bottova 4', 'Malacky', 0, 3),
(5, 'Holleho 5', 'Topolcany', 1, 3);
GO


SELECT SUM(p.Amount) AS Amount
FROM Payments as p
INNER JOIN Clients as c ON p.ClientId = c.ClientId
INNER JOIN Addresses as a ON c.ClientId = a.ClientId
WHERE c.Name LIKE '%iro'

---ANS-- Amount - 1000- because the client had book order in two different addresses




