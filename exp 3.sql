-- Active: 1697951129960@@127.0.0.1@3306@universitydb
-- MAX

SELECT MAX(salary) AS max_salary FROM Faculty;

-- MIN

SELECT
    MIN(
        YEAR(CURRENT_DATE) - YEAR(date_of_birth)
    ) AS min_age
FROM Faculty;

-- COUNT

SELECT COUNT(*) AS faculty_count FROM Faculty;

-- AVG

SELECT
    AVG(
        YEAR(CURDATE()) - YEAR(date_of_birth)
    ) AS avg_student_age
FROM Student;