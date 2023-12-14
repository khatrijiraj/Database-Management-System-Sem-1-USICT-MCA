-- Active: 1697951129960@@127.0.0.1@3306@universitydb

-- Creating the database

CREATE DATABASE universitydb;

USE universitydb;

-- Creating Department TABLE

SELECT * FROM courses;

SELECT * FROM department;

SELECT * FROM faculty;

SELECT * FROM student;

CREATE TABLE
    Department (
        id INT NOT NULL AUTO_INCREMENT,
        name VARCHAR(255) NOT NULL UNIQUE,
        PRIMARY KEY (id)
    );

-- Creating Student TABLE

CREATE TABLE
    Student (
        id INT NOT NULL AUTO_INCREMENT,
        first_name VARCHAR(50) NOT NULL,
        last_name VARCHAR(50) NOT NULL,
        date_of_birth DATE,
        gender CHAR(1),
        state VARCHAR(50),
        department_id INT,
        PRIMARY KEY (id),
        FOREIGN KEY (department_id) REFERENCES Department(id)
    );

-- Creating Faculty TABLE

CREATE TABLE
    Faculty (
        id INT NOT NULL AUTO_INCREMENT,
        first_name VARCHAR(50) NOT NULL,
        last_name VARCHAR(50) NOT NULL,
        date_of_birth DATE,
        gender CHAR(1),
        date_of_joining DATE,
        department_id INT,
        salary DECIMAL(10, 2),
        PRIMARY KEY (id),
        FOREIGN KEY (department_id) REFERENCES Department(id)
    );

-- Creating Courses TABLE

CREATE TABLE
    Courses (
        id INT NOT NULL AUTO_INCREMENT,
        course_name VARCHAR(100) NOT NULL,
        credits INT,
        department_id INT,
        faculty_id INT,
        PRIMARY KEY (id),
        FOREIGN KEY (department_id) REFERENCES Department(id),
        FOREIGN KEY (faculty_id) REFERENCES Faculty(id)
    );

INSERT INTO Department (name)
VALUES (
        'Master of Computer Applications'
    ), (
        'Computer Science and Engineering'
    ), ('Information Technology'), ('Mechanical Engineering');

--

INSERT INTO
    Student (
        first_name,
        last_name,
        date_of_birth,
        gender,
        state,
        department_id
    )
VALUES (
        'Amit',
        'Patel',
        '1999-03-15',
        'M',
        'Delhi',
        2
    ), (
        'Priya',
        'Sharma',
        '1996-07-22',
        'F',
        'Delhi',
        2
    ), (
        'Raj',
        'Verma',
        '1998-11-10',
        'M',
        'Uttarakhand',
        4
    ), (
        'Sneha',
        'Singh',
        '1997-05-18',
        'F',
        'Bihar',
        4
    ), (
        'Rahul',
        'Kumar',
        '2002-02-25',
        'M',
        'Uttar Pradesh',
        1
    ), (
        'Neha',
        'Gupta',
        '1999-08-12',
        'F',
        'Haryana',
        1
    ), (
        'Rakesh',
        'Singh',
        '1998-04-30',
        'M',
        'Gujarat',
        3
    ), (
        'Asha',
        'Yadav',
        '1997-10-05',
        'F',
        'Gujarat',
        3
    );

--

INSERT INTO
    Faculty (
        first_name,
        last_name,
        date_of_birth,
        gender,
        date_of_joining,
        department_id,
        salary
    )
VALUES (
        'Dr. Ananya',
        'Desai',
        '1980-02-28',
        'F',
        '2019-06-01',
        2,
        50000.00
    ), (
        'Prof. Rajesh',
        'Joshi',
        '1975-09-14',
        'M',
        '2020-03-12',
        4,
        45000.00
    ), (
        'Dr. Neha',
        'Reddy',
        '1982-07-03',
        'F',
        '2015-01-20',
        1,
        55000.00
    ), (
        'Prof. Vikram',
        'Kumar',
        '1978-12-05',
        'M',
        '2018-08-18',
        2,
        60000.00
    ), (
        'Dr. Meera',
        'Singh',
        '1985-06-15',
        'F',
        '2022-12-10',
        1,
        55000.00
    ), (
        'Prof. Sunil',
        'Sharma',
        '1981-03-20',
        'M',
        '2017-05-05',
        3,
        58000.00
    ), (
        'Dr. Ritu',
        'Verma',
        '1979-11-08',
        'F',
        '2013-09-18',
        4,
        62000.00
    ), (
        'Prof. Anil',
        'Yadav',
        '1984-09-02',
        'M',
        '2016-11-25',
        3,
        47000.00
    );

--

INSERT INTO
    Courses (
        course_name,
        credits,
        department_id,
        faculty_id
    )
VALUES (
        'Database Management System',
        5,
        1,
        3
    ), ('Software Engineering', 7, 2, 1), (
        'Data Structures and Algorithms',
        10,
        1,
        4
    ), (
        'Object-Oriented Programming',
        7,
        1,
        2
    ), ('Machine Learning', 9, 2, 5), ('Web Development', 6, 3, 6), ('Fluid Mechanics', 8, 4, 7), ('Heat Transfer', 7, 4, 8);