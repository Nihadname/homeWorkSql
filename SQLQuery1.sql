create database restoran;
use restoran;

create table meals (
    Id int primary key identity,
    [Name] nvarchar(50) not null,
    Price DECIMAL(10, 2) NOT NULL
);

create table [tables] (
    Id int primary key identity,
    [Name] nvarchar(50) not null
);

create table customers (
    Id int primary key identity,
    [Name] nvarchar(50) not null,
    SurName nvarchar(50) not null
);

ALTER TABLE customers
ALTER COLUMN [Name] nvarchar(50) NOT NULL;
ALTER TABLE customers
ALTER COLUMN SurName nvarchar(50) NOT NULL;

create table orders (
    Id int primary key identity,
    TableId int foreign key references [tables](Id),
    MealsId int foreign key references meals(Id),
    customerId int foreign key references customers(Id),
    OrderDateTime DATETIME
);

INSERT INTO meals ([Name], Price) VALUES
('Spaghetti Carbonara', 12.99),
('Grilled Salmon', 15.99),
('Chicken Alfredo', 10.99),
('Caesar Salad', 8.99);

INSERT INTO [tables] ([Name]) VALUES
('first'), ('second'), ('third'), ('fourth'), ('fifth');

INSERT INTO customers ([Name], SurName) VALUES
('John', 'Doe'),
('Jane', 'Smith'),
('Alice', 'Johnson');

INSERT INTO orders (TableId, MealsId, customerId, OrderDateTime) VALUES
(1, 1, 1, '2024-05-14 12:00:00'),
(1, 3, 2, '2024-05-14 12:30:00'),
(2, 2, 3, '2024-05-14 13:00:00'),
(2, 4, 1, '2024-05-14 13:15:00'),
(3, 1, 1, '2024-05-14 13:30:00'),
(4, 3, 3, '2024-05-14 14:00:00');


SELECT *
FROM [tables]
INNER JOIN orders ON [tables].Id = orders.TableId;

SELECT meals.Id, meals.Name, meals.Price, COUNT(orders.MealsId) AS OrdersCount
FROM meals
INNER JOIN orders ON meals.Id = orders.MealsId
GROUP BY meals.Id, meals.Name, meals.Price;

SELECT o.*,  m.[Name]
FROM orders o
INNER JOIN meals m ON m.Id = o.MealsId 


SELECT o.*,  m.[Name],t.Id
FROM orders o
INNER JOIN meals m ON m.Id = o.MealsId 
INNER JOIN [tables] t on t.Id=o.TableId
 
SELECT o.Id AS OrderId, o.TableId, o.MealsId, o.customerId, o.OrderDateTime, 
       SUM(m.Price) AS TotalPrice 
FROM orders o 
INNER JOIN meals m ON m.Id = o.MealsId 
GROUP BY o.Id, o.TableId, o.MealsId, o.customerId, o.OrderDateTime;

SELECT TOP 1 *,
       DATEDIFF(minute, (SELECT TOP 1 OrderDateTime 
                         FROM orders 
                         WHERE TableId = 1 
                         ORDER BY Id ASC), 
                         o.OrderDateTime) AS TimeDifferenceInMinutes
FROM orders o
WHERE o.TableId = 1
ORDER BY o.Id DESC;


INSERT INTO [tables] ([Name]) VALUES
('six')
SELECT t.*
FROM [tables] t
LEFT JOIN orders o ON t.Id = o.TableId
WHERE o.TableId IS NULL;
