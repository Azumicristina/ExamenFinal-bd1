CREATE DATABASE ventaropas;
USE ventaropas;
-- Suppliers
CREATE TABLE Suppliers (
    RUC CHAR(13) PRIMARY KEY,
    Name VARCHAR(100),
    Address VARCHAR(255),
    Phone VARCHAR(20),
    Website VARCHAR(100)
);

-- Customers
CREATE TABLE Customers (
    DNI CHAR(8) PRIMARY KEY,
    Name VARCHAR(100),
    Street VARCHAR(100),
    District VARCHAR(50),
    Province VARCHAR(50)
);

-- Customer Phones
CREATE TABLE CustomerPhones (
    ID INT PRIMARY KEY auto_increment,
    DNI CHAR(8),
    Phone VARCHAR(20),
    FOREIGN KEY (DNI) REFERENCES Customers(DNI)
);

-- Categories
CREATE TABLE Categories (
    ID INT PRIMARY KEY auto_increment,
    Name VARCHAR(50),
    Description VARCHAR(255)
);

-- Products
CREATE TABLE Products (
    Code INT PRIMARY KEY,
    Name VARCHAR(100),
    Price DECIMAL(10, 2),
    Stock INT,
    CategoryID INT,
    FOREIGN KEY (CategoryID) REFERENCES Categories(ID)
);


CREATE TABLE Sales (
    ID INT PRIMARY KEY auto_increment,
    Date DATETIME,
    CustomerDNI CHAR(8),
    TotalAmount DECIMAL(10, 2),
    FOREIGN KEY (CustomerDNI) REFERENCES Customers(DNI)
);

-- Sales Details
CREATE TABLE SalesDetails (
    ID INT PRIMARY KEY auto_increment,
    SaleID INT,
    ProductCode INT,
    Quantity INT,
    UnitPrice DECIMAL(10, 2),
    FOREIGN KEY (SaleID) REFERENCES Sales(ID),
    FOREIGN KEY (ProductCode) REFERENCES Products(Code)
);
-- Suppliers
INSERT INTO Suppliers (RUC, Name, Address, Phone, Website)
VALUES 
('1234567890123', 'Jesus', 'Miraflores', '123456789', 'www.Jesus.com'),
('2345678901234', 'Maria', ' San Jose', '234567890', 'www.Maria.com'),
('3456789012345', 'Valentina', 'Los libertadores', '345678901', 'www.Valentina.com'),
('4567890123456', 'Juan', 'Huaca de lo chinos', '456789012', 'www.Juan.com'),
('5678901234567', 'Fabrizio', 'San Agustin', '567890123', 'www.Fabrizio.com');
DELETE FROM Suppliers
WHERE RUC IN ('1234567890123', '2345678901234','3456789012345','4567890123456','5678901234567');
SELECT * FROM Suppliers;
-- Customers
INSERT INTO Customers (DNI, Name, Street, District, Province)
VALUES 
('12345678', 'Juan Pérez', 'Calle Principal 123', 'Centro', 'Ciudad Capital'),
('23456789', 'María Rodríguez', 'Avenida Norte 456', 'Norte', 'Ciudad Norteña'),
('34567890', 'Carlos Gómez', 'Calle Sur 789', 'Sur', 'Ciudad Sureña'),
('45678901', 'Ana Martínez', 'Avenida Este 012', 'Este', 'Ciudad del Este'),
('56789012', 'Luis González', 'Calle Oeste 345', 'Oeste', 'Ciudad del Oeste');
-- Customer Phones
INSERT INTO CustomerPhones (DNI, Phone)
VALUES 
('12345678', '987654321'),
('23456789', '876543210'),
('34567890', '765432109'),
('45678901', '654321098'),
('56789012', '543210987');
INSERT INTO Categories (Name, Description)
VALUES 
('Electrónica', 'Productos electrónicos y tecnológicos'),
('Ropa', 'Prendas de vestir y accesorios'),
('Hogar', 'Artículos para el hogar y decoración'),
('Alimentos', 'Productos alimenticios y bebidas'),
('Libros', 'Libros y materiales educativos');
-- Products
INSERT INTO Products (Code, Name, Price, Stock, CategoryID)
VALUES 
(1, 'Smartphone', 799.99, 50, 1),
(2, 'Camiseta', 29.99, 200, 2),
(3, 'Mesa de Centro', 149.99, 30, 3),
(4, 'Arroz', 2.99, 500, 4),
(5, 'Introducción a la Programación', 39.99, 100, 5);
-- Sales
INSERT INTO Sales (Date, CustomerDNI, TotalAmount)
VALUES 
('2024-07-04 09:00:00', '12345678', 299.99),
('2024-07-04 10:30:00', '23456789', 159.96),
('2024-07-04 11:45:00', '34567890', 449.97),
('2024-07-04 13:15:00', '45678901', 89.95),
('2024-07-04 15:00:00', '56789012', 799.98);
-- Sales Details
INSERT INTO SalesDetails (SaleID, ProductCode, Quantity, UnitPrice)
VALUES 
(1, 1, 1, 799.99),
(2, 2, 4, 29.99),
(3, 3, 3, 149.99),
(4, 4, 30, 2.99),
(5, 5, 2, 39.99);
select * from SalesDetails;