-- Bài 1
CREATE TABLE classes (
	classId INT PRIMARY KEY,
    className VARCHAR(100) UNIQUE NOT NULL,
    schoolYear VARCHAR(10) NOT NULL
);

CREATE TABLE students (
	studentId VARCHAR(20) PRIMARY KEY,
    studentName VARCHAR(100) NOT NULL,
    age INT NOT NULL CHECK (age between 18 and 99),
    birthday DATE,
    studentEmail VARCHAR(100) UNIQUE NOT NULL,
    studentPhone VARCHAR(20) NOT NULL,
    classId INT NOT NULL,
    FOREIGN KEY (classId) REFERENCES classes(classId)
);


-- Bài 2
CREATE TABLE readers (
	readerId VARCHAR(100) PRIMARY KEY,
    readerName VARCHAR(255) NOT NULL,
    readerPhone VARCHAR(100) UNIQUE NOT NULL,
    readerAddress VARCHAR(255) NOT NULL
);

CREATE TABLE books (
	bookId VARCHAR(255) PRIMARY KEY,
    bookName VARCHAR(255) NOT NULL,
    author VARCHAR(200) NOT NULL
);

CREATE TABLE borrowings (
	borrowingId VARCHAR(255) NOT NULL,
	borrowStatus VARCHAR(100) NOT NULL DEFAULT 'INACTIVE' CHECK (borrowStatus in ('ACTIVE', 'INACTIVE')),
	borrowDate DATE,
    returnDate DATE NOT NULL,
	readerId VARCHAR(100) NOT NULL,
    FOREIGN KEY (readerId) REFERENCES readers(readerId),
    bookId VARCHAR(255) NOT NULL,
    FOREIGN KEY (bookId) REFERENCES books(bookId)    
);
ALTER TABLE borrowings
MODIFY borrowDate DATE NOT NULL;


-- Bài 3
CREATE TABLE orders (
	order_id VARCHAR(255) NOT NULL PRIMARY KEY,
    order_datetime DATETIME NOT NULL,
    order_address VARCHAR(255) NOT NULL DEFAULT 'VN'
);

CREATE TABLE products (
	product_id VARCHAR(255) NOT NULL PRIMARY KEY,
    product_stock MEDIUMINT NOT NULL CHECK (order_stock >= 1),
    product_price  BIGINT NOT NULL,
    product_discount CHAR(2) NOT NULL
);

CREATE TABLE order_items (
    quantity VARCHAR(255) NOT NULL,
    order_id VARCHAR(255) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    product_id VARCHAR(255) NOT NULL,
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- Bài 4
CREATE TABLE users (
	user_id VARCHAR(255) NOT NULL PRIMARY KEY,
    user_name VARCHAR(100) UNIQUE NOT NULL,
    user_password VARCHAR(150) NOT NULL,
    user_email VARCHAR(255) UNIQUE NOT NULL,
    user_status VARCHAR(100) NOT NULL DEFAULT 'othor'
);
ALTER TABLE users
MODIFY user_status VARCHAR(100) NOT NULL CHECK (user_status in ('ACTIVE', 'INACTIVE','othor'));

DROP TABLE users;

-- Bài 5
CREATE TABLE intructors (
	intructor_id INT NOT NULL PRIMARY KEY,
    intructor_name VARCHAR(255) NOT NULL,
    intructor_email VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE courses (
	course_id INT NOT NULL PRIMARY KEY,
    course_name VARCHAR(200) NOT NULL,
    description VARCHAR(255) NOT NULL,
    price BIGINT NOT NULL,
    intructor_id INT NOT NULL,
    FOREIGN KEY (intructor_id) REFERENCES intructors(intructor_id)
);

CREATE TABLE students (
	student_id INT NOT NULL PRIMARY KEY,
    student_name VARCHAR(255) NOT NULL,
    student_email VARCHAR(255) UNIQUE NOT NULL
);

CREATE TABLE enrollments (
	student_id INT NOT NULL,
    course_id INT NOT NULL,
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    foreign key (course_id) references courses(course_id)
);

ALTER TABLE courses
MODIFY price BIGINT NOT NULL CHECK (price > 0);

DROP TABLE enrollments;