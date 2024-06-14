-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema university
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema university
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `university` DEFAULT CHARACTER SET utf8mb3 ;
USE `university` ;

-- -----------------------------------------------------
-- Table `university`.`college`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `university`.`college` (
  `college_id` INT NOT NULL,
  `college_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`college_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `university`.`department`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `university`.`department` (
  `department_id` INT NOT NULL,
  `department_name` VARCHAR(45) NOT NULL,
  `department_code` VARCHAR(45) NOT NULL,
  `college_id` INT NOT NULL,
  PRIMARY KEY (`department_id`),
  INDEX `fk_department_ college1_idx` (`college_id` ASC) VISIBLE,
  CONSTRAINT `fk_department_ college1`
    FOREIGN KEY (`college_id`)
    REFERENCES `university`.`college` (`college_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `university`.`course`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `university`.`course` (
  `course_id` INT NOT NULL AUTO_INCREMENT,
  `course_num` INT NOT NULL,
  `course_title` VARCHAR(45) NOT NULL,
  `credits` INT NOT NULL,
  `department_id` INT NOT NULL,
  PRIMARY KEY (`course_id`),
  INDEX `fk_course_department1_idx` (`department_id` ASC) VISIBLE,
  CONSTRAINT `fk_course_department1`
    FOREIGN KEY (`department_id`)
    REFERENCES `university`.`department` (`department_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `university`.`faculty`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `university`.`faculty` (
  `faculty_id` INT NOT NULL,
  `faculty_fname` VARCHAR(45) NOT NULL,
  `faculty_lname` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`faculty_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `university`.`term`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `university`.`term` (
  `term_id` INT NOT NULL,
  `term` VARCHAR(10) NOT NULL,
  `year` YEAR NOT NULL,
  PRIMARY KEY (`term_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `university`.`section`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `university`.`section` (
  `section_id` INT NOT NULL AUTO_INCREMENT,
  `capacity` INT NOT NULL,
  `section_num` INT NOT NULL,
  `term_id` INT NOT NULL,
  `course_id` INT NOT NULL,
  `faculty_id` INT NOT NULL,
  PRIMARY KEY (`section_id`),
  INDEX `fk_section_course_idx` (`course_id` ASC) VISIBLE,
  INDEX `fk_section_term1_idx` (`term_id` ASC) VISIBLE,
  INDEX `fk_section_faculty1_idx` (`faculty_id` ASC) VISIBLE,
  CONSTRAINT `fk_section_course`
    FOREIGN KEY (`course_id`)
    REFERENCES `university`.`course` (`course_id`),
  CONSTRAINT `fk_section_faculty1`
    FOREIGN KEY (`faculty_id`)
    REFERENCES `university`.`faculty` (`faculty_id`),
  CONSTRAINT `fk_section_term1`
    FOREIGN KEY (`term_id`)
    REFERENCES `university`.`term` (`term_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `university`.`student`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `university`.`student` (
  `student_id` INT NOT NULL AUTO_INCREMENT,
  `fname` VARCHAR(45) NOT NULL,
  `lname` VARCHAR(45) NOT NULL,
  `gender` VARCHAR(1) NOT NULL,
  `city` VARCHAR(20) NOT NULL,
  `state` VARCHAR(2) NOT NULL,
  `dob` DATE NOT NULL,
  PRIMARY KEY (`student_id`),
  UNIQUE INDEX `student_id_UNIQUE` (`student_id` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 21
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `university`.`enrollment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `university`.`enrollment` (
  `student_id` INT NOT NULL,
  `section_id` INT NOT NULL,
  PRIMARY KEY (`student_id`, `section_id`),
  INDEX `fk_student_has_section_section1_idx` (`section_id` ASC) VISIBLE,
  INDEX `fk_student_has_section_student1_idx` (`student_id` ASC) VISIBLE,
  CONSTRAINT `fk_student_has_section_section1`
    FOREIGN KEY (`section_id`)
    REFERENCES `university`.`section` (`section_id`),
  CONSTRAINT `fk_student_has_section_student1`
    FOREIGN KEY (`student_id`)
    REFERENCES `university`.`student` (`student_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
use university;
insert into student(fname,lname,gender,city,state,dob) values('Paul', 'Miller', 'M', 'Dallas', 'TX', '1996-02-22'), ('Katie', 'Smith', 'F', 'Provo', 'UT', '1995-07-22'),
('Kelly', 'Jones', 'F', 'Provo', 'UT', '1998-06-22'), ('Devon', 'Miller', 'M', 'Mesa', 'AZ', '2000-07-22'), ('Mandy', 'Murdock', 'F', 'Topeka', 'KS', '1996-11-22'),
('Alece', 'Adams', 'F', 'Rigby', 'ID', '1997-05-22'), ('Bryce', 'Carlson', 'M', 'Bozeman', 'MT', '1997-11-22'), ('Preston', 'Larsen', 'M', 'Decatur', 'TN', '1996-09-22'),
('Julia', 'Madsen', 'F', 'Rexburg', 'ID', '1998-09-22' ), ('Susan', 'Sorensen', 'F', 'Mesa',  'AZ', '1998-08-09');

insert into term(term_id, term, year) values( 1, 'Fall', '2018'), (2, 'Winter', '2018'), (3, 'Fall', '2019'), (4, 'Winter', '2019');

insert into college(college_id, college_name) values( 1,'College of Physical Science and Engineering'), (2, 'College of Business and Communication')
, (3, 'College of Language and Letters');


select * from college;

select * from department;
insert into department(department_id, department_name, department_code, college_id) values( 1,'Computer Information Technology', 'ITM', 1)
, (2,'Economics', 'ECON', 2), (3 ,'Humanities and Philosophy', 'HUM', 3);
select * from course; 
select college_name,course_num, department_name, department_code, course_title, credits  from college c join department d on c.college_id = d.college_id 
join course co on co.department_id = d.department_id;
insert into course(course_num, course_title, credits, department_id) values(111, 'Intro to Databases', 3, 1), (388, 'Economics', 4, 2)
,(150, 'Micro Economics', 3, 2), (376,'Classical Heritage', 2, 3);

insert into faculty(faculty_id, faculty_fname, faculty_lname) values(10, 'Marty', 'Morring'), (11,'Nate', 'Norris'), (12,'Ben', 'Barrus'), (13, 'John', 'Jensen'), (14, 'Bill', 'Barney')
;
select * from term;
select * from section;
insert into section(capacity, section_num, term_id, course_id, faculty_id) values(30,1,1,1,10), (50,1,3,3,11),(50,2,3,3,11),(35,1,3,2,12),
(30,1,3,4,13),(30,2,2,1,10),(35,3,2,1,14),(50,1,2,3,11),(50,2,2,3,11),(30,1,2,4,13);
update   section set term_id = 3 where section_id = 1;
insert into enrollment(student_id, section_id) values(26, 7), (27, 6), (27, 8), (27, 10), (24, 5), (29,9), (22,4), (23, 4), (25,4), (25,5), (21,1), (21,3), (28,9), (30,6);




SELECT 
    year,
    term,
    course_title,
    section_num,
    faculty_fname,
    faculty_lname,
    capacity
FROM
    course c
        JOIN
    section s ON s.course_id = c.course_id
        JOIN
    term t ON s.term_id = t.term_id
        JOIN
    faculty f ON s.faculty_id = f.faculty_id
    order by year desc;
    
# Step 4
use university;

#1
select fname, lname , date_format(dob, '%M %d %Y') as 'Sept Birthdays' from student where month(dob) = 9 ;

#2
SELECT 
    lname,
    fname,
    floor(datediff('2017-01-05', dob) / 365) AS 'Years',
    TIMESTAMPDIFF(DAY, dob, '2017-01-05') % 365 AS Days,
    CONCAT(TIMESTAMPDIFF(YEAR, dob, '2017-01-05'),
            '- Yrs',
            ' ',
            TIMESTAMPDIFF(DAY, dob, '2017-01-05') % 365,
            '- Days') AS 'Years and Days'
FROM
    student
ORDER BY datediff('2017-01-05', dob) DESC;

#3 
SELECT 
    fname, lname
FROM
    enrollment e
        JOIN
    student s ON e.student_id = s.student_id
        JOIN
    section se ON se.section_id = e.section_id
      where faculty_id = (select faculty_id from faculty where faculty_fname = "John" and faculty_lname = "Jensen")
      order by lname;
      
#4 

SELECT 
    faculty_fname as fname, faculty_lname as lname
FROM
    enrollment e
        JOIN
    student s ON e.student_id = s.student_id
        JOIN
    section se ON se.section_id = e.section_id
    join faculty f on f.faculty_id = se.faculty_id
    where fname like '%Bryce'
    order by faculty_lname;
    
#5


SELECT 
   fname, lname
FROM
    enrollment e
        JOIN
    student s ON e.student_id = s.student_id
        JOIN
    section se ON se.section_id = e.section_id
    join term t on t.term_id = se.term_id
    join course c on c.course_id = se.course_id
    where t.term_id = (select term_id from term where term like "%Fall" and year = 2019)
    and c.course_id = (select course_id from course where course_title like "Economics");
    
    #6
    select * from department;
    
SELECT 
   department_code, course_num, course_title as name
FROM
    enrollment e
        JOIN
    student s ON e.student_id = s.student_id
        JOIN
    section se ON se.section_id = e.section_id
    join term t on t.term_id = se.term_id
    join course c on c.course_id = se.course_id
    join department  d on d.department_id = c.department_id
    where s.student_id = (select student_id from student where fname like "Bryce" and lname like "Carlson")
    order by c.course_title;
    
    #7
    SELECT 
    t.term, t.year, COUNT(student_id)  as Enrollment
FROM
    enrollment e
        JOIN
    section s ON e.section_id = s.section_id
        JOIN
    term t ON s.term_id = t.term_id
WHERE
	year = 2019 and term = 'Fall' ;
    
    
#8 come back to this;

select co.college_name , count(d.college_id) from college co join department d on co.college_id = co.college_id
join course c on c.department_id = d.department_id group by co.college_name ;
select * from department;

#9
SELECT 
 distinct(faculty_fname), faculty_lname ,  capacity
FROM
    enrollment e
        JOIN
    student s ON e.student_id = s.student_id
        JOIN
    section se ON se.section_id = e.section_id
    join term t on t.term_id = se.term_id
    join course c on c.course_id = se.course_id
    join department  d on d.department_id = c.department_id
    join faculty f on f.faculty_id = se.faculty_id
   #  where t.year = 2018 and t.term = "Winter"
      where se.term_id = 2
     
      
   order by capacity;
     select * from section;
     select * from faculty;
   
   
   #10 
     SELECT 
 fname, lname, sum(credits)
FROM
    enrollment e
        JOIN
    student s ON e.student_id = s.student_id
        JOIN
    section se ON se.section_id = e.section_id
    join term t on t.term_id = se.term_id
    join course c on c.course_id = se.course_id
    join department  d on d.department_id = c.department_id
      where t.year = 2019 and t.term = "Fall"
    group by e.student_id having sum(credits) > 3
     order by sum(credits) desc
  
   
    
	
    
   
    

    
    
    





