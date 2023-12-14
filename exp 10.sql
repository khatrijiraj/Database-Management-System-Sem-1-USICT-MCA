 CREATE TABLE subjects (
	subject_code INT PRIMARY KEY,
	subject_name VARCHAR(100)
 );

DELIMITER //
 CREATE TRIGGER check_duplicates
 BEFORE INSERT ON subjects
 FOR EACH ROW
 BEGIN
 DECLARE v_count INT;
 SELECT COUNT(*)
 INTO v_count FROM subjects
 WHERE subject_name = NEW.subject_name;

 IF v_count>0 THEN ADD SIGNAL SQLSTATE '45000'
 SET MESSAGE_TEXT = 'Subject name already exits.';
 END IF;
 END//
 DELIMITER;

 INSERT INTO subjects (subject_code, subject_name)
  VALUES ('1024','MATHS'),
  ('1025','ENGLISH'),
  ('1026','CHEMISTRY'),
  ('1027','PHYSICS');

  SELECT * FROM subjects;