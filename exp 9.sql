/* DECLARE CURSOR c_faculties IS
 SELECT
 f.first_name,
 f.last_name,
 d.name AS department_name
 FROM faculty f
 INNER JOIN department d ON f.department_id = d.id;
 v_faculty_record c_faculties % ROWTYPE;
 BEGIN OPEN c_faculties;
 LOOP FETCH c_faculties INTO v_faculty_record;
 EXIT WHEN c_faculties % NOTFOUND;
 DBMS_OUTPUT.PUT_LINE(
 v_faculty_record.first_name || ' ' || v_faculty_record.last_name || ' - ' || v_faculty_record.department_name
 );
 END LOOP;
 CLOSE c_faculties;
 END;S
 SELECT
 f.first_name,
 f.last_name,
 d.name AS department_name
 FROM faculty f
 INNER JOIN department d ON f.department_id = d.id;
 */

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