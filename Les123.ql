

-- Bài 1
CREATE TABLE Students (
	studentId VARCHAR (20) PRIMARY KEY,
    studentName VARCHAR(250) NOT NULL,
    studentDate DATE NOT NULL,
    studentGender VARCHAR(20) NOT NULL DEFAULT 'KHAC' CHECK (studentGender IN ('TRAI', 'GAI', 'KHAC'))
);

SHOW CREATE TABLE Students;
-- Bài 2
CREATE TABLE products (
	idProduct VARCHAR(20) PRIMARY KEY NOT NULL,
    nameProduct VARCHAR(255) NOT NULL,
    price DECIMAL(9,3) NOT NULL,
    quantity INT UNSIGNED CHECK (quantity =>1)
);
-- Bài 3
CREATE TABLE Student3 (
	idStudent3 VARCHAR(200) PRIMARY KEY NOT NULL,
    nameStudent3 VARCHAR(255) NOT NULL,
    age INT NOT NULL CHECK (age >=18),
    emailStudent3 VARCHAR(50) UNIQUE NOT NULL
);
-- Bài 4
CREATE TABLE users (
	idUser BIGINT PRIMARY KEY,
    loginNameUser VARCHAR(255) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    status VARCHAR(10) NOT NULL DEFAULT 'ACTIVE' CHECK (status in ('ACTIVE', 'INACTIVE'))
);

-- Bài 5
CREATE TABLE classes (
	classId INT PRIMARY KEY,
    className VARCHAR(150) NOT NULL,
    schoolYear VARCHAR(10) NOT NULL
);

CREATE TABLE student4 (
    idStudent VARCHAR(255) PRIMARY KEY,
    nameStudent4 VARCHAR(255) NOT NULL,
    birthDate DATE CHECK (age >= 18),
    gender VARCHAR(10) NOT NULL DEFAULT 'KHAC' CHECK (gender in ('TRAI','GAI','KHAC')),
    email VARCHAR(100) UNIQUE NOT NULL,
    phone INT NOT NULL,
    address VARCHAR(255) NOT NULL,
    FOREIGN KEY (classId) REFERENCES classes (classId)
);

-- Bài 6 
CREATE TABLE orders (
orderId VARCHAR(255) PRIMARY KEY,
orderUserName VARCHAR(100) NOT NULL,
orderTime DATETIME NOT NULL,
orderStatus VARCHAR (10) NOT NULL CHECK (orderStatus in ('NEW','PAID'))
);

CREATE TABLE Products (
	productId VARCHAR(255) PRIMARY KEY,
    productName VARCHAR(255) NOT NULL,
    price DECIMAL(9,2) NOT NULL
);

CREATE TABLE order_items (
	orderId VARCHAR(255) NOT NULL,
    productId VARCHAR(255) NOT NULL,
    quantity INT NOT NULL CHECK (quantity BETWEEN 1 and 99 ),
	foreign key (orderId) references orders (orderId),
    foreign key (productid) references Products(productId),
	primary key (orderId, productId)
);