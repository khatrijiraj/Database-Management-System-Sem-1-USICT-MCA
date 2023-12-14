-- GROUPBY

-- Find total number of courses for each department

SELECT
    d.name AS department_name,
    COUNT(c.id) AS total_courses
FROM Department d
    JOIN Courses c ON d.id = c.department_id
GROUP BY d.id, d.name;

--

-- HAVING -- 
-- Find departments WITH more than one faculty member
SELECT
    d.name AS department_name,
    COUNT(f.id) AS faculty_count
FROM Department d
    JOIN Faculty f ON d.id = f.department_id
GROUP BY d.id, d.name
HAVING COUNT(f.id) > 1;

-- ORDERBY
-- Order courses by credit score IN descending order

SELECT * FROM Courses ORDER BY credits DESC;