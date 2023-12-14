-- A) Retrieve the names of the students who belong to cities Delhi,

-- Gujarat, AND Haryana USING the IN keyword.

SELECT
    first_name AS student_first_name,
    last_name AS student_last_name,
    state
FROM Student
WHERE
    state IN ('Delhi', 'Gujarat', 'Haryana');

-- B) Retrieve the names of the students who

-- do not belong to cities Delhi, Gujarat,

-- AND Haryana USING the NOTIN keyword.

SELECT
    first_name AS student_first_name,
    last_name AS student_last_name,
    state
FROM Student
WHERE
    state NOT IN ('Delhi', 'Gujarat', 'Haryana');

-- C) Retrieve the name of the Faculty AND the students along WITH their respective cities

-- WHERe the department ID is 2 USING the UNION keyword.

SELECT
    first_name AS faculty_or_student_first_name,
    last_name AS faculty_or_student_last_name,
    NULL AS state
FROM Faculty
WHERE department_id = 2

-- UNION

SELECT
    first_name AS faculty_or_student_first_name,
    last_name AS faculty_or_student_last_name,
    state
FROM Student
WHERE department_id = 2;

-- D) Retrieve the names of all the students who are enrolled IN courses

-- WITH credit scores > 7 USING the EXISTS keyword.

SELECT
    s.first_name AS student_first_name,
    s.last_name AS student_last_name
FROM Student s
WHERE EXISTS (
        SELECT 1
        FROM Courses c
        WHERE
            c.department_id = s.department_id
            AND c.credits > 7
    );