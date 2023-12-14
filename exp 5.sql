--

-- INNER JOIN Retrieve id AND name of students IN the MCA department USING Inner Join

SELECT
    s.id AS student_id,
    CONCAT(s.first_name, ' ', s.last_name) AS student_name
FROM Student s
    JOIN Department d ON s.department_id = d.id
WHERE
    d.name = 'Master of Computer Applications';

-- LEFT OUTER JOIN Retrieve names of departments offering courses

-- WITH credits > 5 USING LEFT OUTER JOIN

SELECT
    d.name AS department_name,
    c.course_name
FROM Department d
    LEFT JOIN Courses c ON d.id = c.department_id AND c.credits > 5;

--

-- RIGHT OUTER JOIN Retrieve names of courses taught by faculties who joined after 2005 USING

-- RIGHT OUTER JOIN

SELECT
    c.course_name,
    f.first_name AS faculty_first_name,
    f.last_name AS faculty_last_name
FROM Courses c
    RIGHT JOIN Faculty f ON c.faculty_id = f.id
WHERE
    f.date_of_joining > '2005-01-01'
    OR f.date_of_joining IS NULL;

--

-- FULL OUTER Join MySQL do not support full outer join.

-- However this functionality can be achieved by USING  LEFT JOIN, RIGHT JOIN AND UNION together.

SELECT
    Student.*,
    Department.name AS department_name,
    Faculty.first_name AS faculty_first_name,
    Courses.course_name
FROM Student
    LEFT JOIN Department ON Student.department_id = Department.id
    LEFT JOIN Courses ON Student.id = Courses.id
    LEFT JOIN Faculty ON Courses.faculty_id = Faculty.id

-- UNION

SELECT
    Student.*,
    Department.name AS department_name,
    Faculty.first_name AS faculty_first_name,
    Courses.course_name
FROM Student
    RIGHT JOIN Department ON Student.department_id = Department.id
    RIGHT JOIN Courses ON Student.id = Courses.id
    RIGHT JOIN Faculty ON Courses.faculty_id = Faculty.id;