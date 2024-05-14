create database Elan
use Elan

create table markalar(
Id int primary key identity,
[Name] nvarchar(50) not null
)
create table modeller(
Id int primary key identity,
[Name] nvarchar(50) not null,
MarkaId int FOREIGN KEY REFERENCES markalar(Id)
)
create table Rengler(
Id int primary key identity,
[Name] nvarchar(50) not null,
)
create table Oturucu(
Id int primary key identity,
[Name] nvarchar(50) not null,
)
create table Suretler_qutusu(
Id int primary key identity,
[Name] nvarchar(50) not null,
)
create table il(
Id int primary key identity,
value int unique
)
create table Mühərrikin_həcmi(
Id int primary key identity,
value int unique
)

create table Mühərrikin_gücü(
Id int primary key identity,
value int unique
)
create table Hansı_bazar_üçün_yığılıb(
Id int primary key identity,
[Name] nvarchar(50) not null
)
create table Ban_novu(
Id int primary key identity,
[Name] nvarchar(50) not null
)
create table Yanacaq_növü(
Id int primary key identity,
[Name] nvarchar(50) not null
)
create table Images (
Id int primary key identity,
[Name] nvarchar(50) not null
)
create table Details(
Id int primary key identity,
[Name] nvarchar(50) not null)

create table Elan(
Id int primary key identity,
[Name] nvarchar(50) not null,
ModelId int foreign key REFERENCES modeller(Id),
RenglerId int foreign key REFERENCES Rengler(Id),
OturucuId int foreign key REFERENCES Oturucu(Id),
Suretler_qutusuId int foreign key REFERENCES  Suretler_qutusu(Id),
 ilId int foreign key REFERENCES il(Id),
 Mühərrikin_həcmiId int foreign key REFERENCES   Mühərrikin_həcmi(Id),
 Mühərrikin_gücüId int foreign key REFERENCES  Mühərrikin_gücü(Id),
 Hansı_bazar_üçün_yığılıbId    int foreign key REFERENCES   Hansı_bazar_üçün_yığılıb(Id),
 Ban_novuId int foreign key REFERENCES  Ban_novu(Id),
 Yanacaq_növüId int  foreign key REFERENCES Yanacaq_növü(Id),
 Images int  foreign key REFERENCES Images(Id)
)

create table  ElanDetails (
Id int primary key identity,
ElanId  int  foreign key REFERENCES Elan(Id),
DetailsId int  foreign key REFERENCES Details(Id)
)
INSERT INTO Markalar ([Name]) VALUES 
    ('Toyota'),
    ('Honda'),
    ('Ford');

INSERT INTO Modeller ([Name], MarkaId) VALUES 
    ('Camry', 1),
    ('Civic', 2),
    ('F-150', 3);

INSERT INTO Rengler ([Name]) VALUES 
    ('Red'),
    ('Blue'),
    ('Black');

INSERT INTO Oturucu ([Name]) VALUES 
    ('Front-Wheel Drive'),
    ('Rear-Wheel Drive'),
    ('All-Wheel Drive');

INSERT INTO Suretler_qutusu ([Name]) VALUES 
    ('Automatic'),
    ('Manual'),
    ('CVT');

INSERT INTO il (value) VALUES 
    (2020),
    (2021),
    (2022);

INSERT INTO Mühərrikin_həcmi (value) VALUES 
    (2000),
    (2500),
    (3000);

INSERT INTO Mühərrikin_gücü (value) VALUES 
    (150),
    (200),
    (250);

INSERT INTO Hansı_bazar_üçün_yığılıb ([Name]) VALUES 
    ('Domestic'),
    ('Imported'),
    ('Both');

INSERT INTO Ban_novu ([Name]) VALUES 
    ('Sedan'),
    ('SUV'),
    ('Truck');

INSERT INTO Yanacaq_növü ([Name]) VALUES 
    ('Petrol'),
    ('Diesel'),
    ('Hybrid');

INSERT INTO Images ([Name]) VALUES 
    ('image1.jpg'),
    ('image2.jpg'),
    ('image3.jpg');

INSERT INTO Details ([Name]) VALUES 
    ('Detail 1'),
    ('Detail 2'),
    ('Detail 3');

INSERT INTO Elan ([Name], ModelId, RenglerId, OturucuId, Suretler_qutusuId, ilId, Mühərrikin_həcmiId, Mühərrikin_gücüId, Hansı_bazar_üçün_yığılıbId, Ban_novuId, Yanacaq_növüId, Images) VALUES 
    ('Toyota Camry 2020 Red Sedan', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
    ('Honda Civic 2021 Blue Sedan', 2, 2, 1, 1, 2, 2, 2, 2, 2, 2, 2),
    ('Ford F-150 2022 Black Truck', 3, 3, 3, 2, 3, 3, 3, 3, 3, 3, 3);

INSERT INTO ElanDetails (ElanId, DetailsId) VALUES 
    (1, 1),
    (1, 2),
    (2, 3);

SELECT 
    Elan.Id AS ElanID,
    Elan.[Name] AS ElanName,
    Modeller.[Name] AS ModelName,
    markalar.[Name] AS MarkaName,
    Rengler.[Name] AS RengName,
    Oturucu.[Name] AS OturucuName,
    Suretler_qutusu.[Name] AS SuretlerQutusuName,
    il.value AS IlValue,
    Mühərrikin_həcmi.value AS MuharrikHecmiValue,
    Mühərrikin_gücü.value AS MuharrikGucuValue,
    Hansı_bazar_üçün_yığılıb.[Name] AS HansiBazarName,
    Ban_novu.[Name] AS BanNovuName,
    Yanacaq_növü.[Name] AS YanacaqNovuName,
    Images.[Name] AS ImageName,
    Details.[Name] AS DetailName
FROM 
    Elan
JOIN 
    Modeller ON Elan.ModelId = Modeller.Id
JOIN 
    markalar ON Modeller.MarkaId = markalar.Id
JOIN 
    Rengler ON Elan.RenglerId = Rengler.Id
JOIN 
    Oturucu ON Elan.OturucuId = Oturucu.Id
JOIN 
    Suretler_qutusu ON Elan.Suretler_qutusuId = Suretler_qutusu.Id
JOIN 
    il ON Elan.ilId = il.Id
JOIN 
    Mühərrikin_həcmi ON Elan.Mühərrikin_həcmiId = Mühərrikin_həcmi.Id
JOIN 
    Mühərrikin_gücü ON Elan.Mühərrikin_gücüId = Mühərrikin_gücü.Id
JOIN 
    Hansı_bazar_üçün_yığılıb ON Elan.Hansı_bazar_üçün_yığılıbId = Hansı_bazar_üçün_yığılıb.Id
JOIN 
    Ban_novu ON Elan.Ban_novuId = Ban_novu.Id
JOIN 
    Yanacaq_növü ON Elan.Yanacaq_növüId = Yanacaq_növü.Id
JOIN 
    Images ON Elan.Images = Images.Id
JOIN 
    ElanDetails ON Elan.Id = ElanDetails.ElanId
JOIN 
    Details ON ElanDetails.DetailsId = Details.Id;
