-- A ) Retrieve the name of the Faculty along WITH their

-- departments grouped by department name

-- WHERE the Faculty 's year of joining = 2015

-- AND Salary > 50,000.

SELECT
    d.name AS department_name,
    f.first_name AS faculty_first_name,
    f.last_name AS faculty_last_name,
    f.date_of_joining,
    f.salary
FROM Faculty f
    JOIN Department d ON f.department_id = d.id
WHERE
    YEAR(f.date_of_joining) = 2015
    AND f.salary > 50000
GROUP BY
    department_name,
    faculty_first_name,
    faculty_last_name,
    date_of_joining,
    salary;

-- B) Retrieve the name of the Faculty along WITH the course name taught by them WHERE the course name can be either DBMS or SE.

SELECT
    f.first_name AS faculty_first_name,
    f.last_name AS faculty_last_name,
    c.course_name
FROM Faculty f
    JOIN Courses c ON f.id = c.faculty_id
WHERE
    c.course_name = ' Database Management System '
    OR c.course_name = ' Software Engineering ';

--/*  C) Retrieve the names of students who are enrolled IN courses

-- WITH credit scores BETWEEN 5 AND 10. */

SELECT
    s.first_name AS student_first_name,
    s.last_name AS student_last_name
FROM Student s
    JOIN Courses c ON s.department_id = c.department_id
WHERE c.credits BETWEEN 5 AND 10;

-- D) Retrieve all the fields of the student TABLE whose name either startsWITH "a" or "s".

SELECT *
FROM Student
WHERE
    first_name LIKE ' a % '
    OR first_name LIKE ' s % ';