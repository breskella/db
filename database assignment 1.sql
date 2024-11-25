CREATE DATABASE store_management COLLATE utf8mb4_unicode_ci;

USE store_management;

CREATE TABLE Governorates (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(10) NOT NULL 
);

CREATE TABLE Suppliers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    phone VARCHAR(20) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL UNIQUE,
    brief_data TEXT
);

CREATE TABLE Products (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    code VARCHAR(50) NOT NULL UNIQUE,
    description TEXT,
    price DECIMAL(10, 2) NOT NULL,
    supplier_id INT NOT NULL,
    FOREIGN KEY (supplier_id) REFERENCES Suppliers(id) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE Stores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(10) NOT NULL,
    address TEXT NOT NULL,
    Products_id INT NOT NULL,
    FOREIGN KEY (Products_id) REFERENCES Products(id) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE Store_Governorates (
    store_id INT NOT NULL,
    governorate_id INT NOT NULL,
    PRIMARY KEY (store_id, governorate_id),
    FOREIGN KEY (store_id) REFERENCES Stores(id),
    FOREIGN KEY (governorate_id) REFERENCES Governorates(id)
);





SELECT DISTINCT orderNumber 
FROM orderdetails 
WHERE productCode LIKE 'S18%' AND priceeach > 100;


SELECT * 
FROM payments
WHERE DAY(paymentDate) IN (5, 6);



SELECT customerName, creditLimit
FROM customers
WHERE country = 'USA' AND phone LIKE '%5555%'
ORDER BY creditLimit DESC
LIMIT 1 OFFSET 4;