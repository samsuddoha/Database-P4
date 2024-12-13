--Lecture 6--
--------------------------
--command for creating database
CREATE DATABASE lecture6;
--commmand for drop database
DROP DATABASE lecture6;

--create the following table and insert data
department(id, name, head, contact)
student(id, name, roll, phone, dob, cgpa, dept_id)
teacher(id, name, designation, salary, joining_date, dept_id)
course(id, title, code, credit_hours, instructor, dept)

--crceating department table
CREATE TABLE department(
    id INT PRIMARY KEY AUTO_INCREMENT,
     name VARCHAR(100) NOT NULL, 
     head VARCHAR(100),
      contact VARCHAR(15) NOT NULL UNIQUE
);

--INSERT DATA INTO DEPARTMENT TABLE
INSERT INTO department(id, name, head, contact)
VALUES(NULL, 'CSE', 'ME','09876543')

--creating student table
CREATE TABLE student(
    id INT PRIMARY KEY AUTO_INCREMENT,
     name VARCHAR(100) NOT NULL, 
     roll VARCHAR(10) NOT NULL UNIQUE,
    phone VARCHAR(15) NOT NULL UNIQUE,
    dob DATE,
    cgpa DECIMAL(4,2),
    dept_id INT,
    FOREIGN KEY(dept_id) REFERENCES department(id)
);

--inserting data into student table
INSERT INTO student(id, name, roll, phone, dob, cgpa, dept_id)
VALUES(NULL, 'Charlie', 'CSE001', '09876543','2000-10-10', 3.5, 1)