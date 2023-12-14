DELIMITER //
CREATE PROCEDURE display_faculty_names() 
BEGIN  
	DECLARE done INT DEFAULT FALSE;
	DECLARE fac_name VARCHAR(100) ;
    DECLARE dept_name VARCHAR(100);
	DECLARE cur_face CURSOR FOR 
    SELECT faculy.first_name,department.name FROM faculty
	    JOIN department ON faculty.department_id = department.id;
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
	OPEN cur_face;
	read_loop: LOOP 
    FETCH cur_face INTO fac_name, dept_name;
	IF done THEN LEAVE read_loop;
	END IF;
	SELECT CONCAT (dept_name, ':', fac_name);
	END LOOP;
	CLOSE cur_face;
	END //
DELIMITER;

CALL display_faculty_names();


SELECT
 f.first_name,
 f.last_name,
 d.name AS department_name
 FROM faculty f
 INNER JOIN department d ON f.department_id = d.id;