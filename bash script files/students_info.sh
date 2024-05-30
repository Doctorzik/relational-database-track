#!/bin/bash

# Info about my computer science students from students database

echo -e "\n~~ My Computer Science Students ~~\n"

PSQL="psql -X --username=freecodecamp --dbname=students --no-align --tuples-only -c"

echo -e "\nFirst name, last name, and GPA of students with a 4.0 GPA:"
echo "$($PSQL "SELECT first_name, last_name, gpa FROM students WHERE gpa = 4.0")"

echo -e "\nAll course names whose first letter is before 'D' in the alphabet:"
echo "$($PSQL "SELECT course FROM courses WHERE course < 'D'")"

echo -e "\nFirst name, last name, and GPA of students whose last name begins with an 'R' or after and have a GPA greater than 3.8 or less than 2.0:"
echo "$($PSQL "SELECT first_name, last_name, gpa FROM students WHERE last_name >= 'R' AND (gpa > 3.8 OR gpa < 2.0)")"

echo -e "\nLast name of students whose last name contains a case insensitive 'sa' or have an 'r' as the second to last letter:"

echo  "$($PSQL "select last_name from students where last_name  ilike '%sa%' or last_name like '%r_'")"

echo -e "\nFirst name, last name, and GPA of students who have not selected a major and either their first name begins with 'D' or they have a GPA greater than 3.0:"

echo "$($PSQL "select first_name,last_name, gpa from students where major_id  is null and (first_name like 'D%' or gpa > 3.0)")"

echo -e "\nCourse name of the first five courses, in reverse alphabetical order, that have an 'e' as the second letter or end with an 's':"

echo -e "$($PSQL "select course from courses where course like '_e%' or course like  '%s' order by course desc Limit 5")"

echo -e "\nAverage GPA of all students rounded to two decimal places:"

echo "$($PSQL "select round(avg(gpa),2) from students")"

echo -e "\nMajor ID, total number of students in a column named 'number_of_students', and average GPA rounded to two decimal places in a column name 'average_gpa', for each major ID in the students table having a student count greater than 1:"

echo  "$($PSQL "select major_id, count(*) as number_of_students, round(avg(gpa), 2) as average_gpa from students group by major_id having count(*) > 1")"


echo -e "\nList of majors, in alphabetical order, that either no student is taking or has a student whose first name contains a case insensitive 'ma':"


echo "$($PSQL "SELECT major FROM students FULL JOIN majors ON students.major_id = majors.major_id WHERE major IS NOT NULL AND (student_id IS NULL OR first_name ILIKE '%ma%') ORDER BY major")"


echo -e "\nList of unique courses, in reverse alphabetical order, that no student or 'Obie Hilpert' is taking:"

echo "$($PSQL "SELECT DISTINCT(course) FROM students RIGHT JOIN majors USING(major_id) INNER JOIN majors_courses USING(major_id) INNER JOIN courses USING(course_id) WHERE (first_name = 'Obie' AND last_name = 'Hilpert') OR student_id IS NULL ORDER BY course DESC")"

echo -e "\nList of courses, in alphabetical order, with only one student enrolled:"

echo "$($PSQL "SELECT course FROM students INNER JOIN majors_courses USING(major_id) INNER JOIN courses USING(course_id) GROUP BY course HAVING COUNT(student_id) = 1 ORDER BY course")"
# courses without a space.
# select * from courses where course not like '% %'

# Coures where there is an 'A' in 
# select * from courses where course like '%A%'
# ILIKE will ignore upper and lower cases;

# The NOT ILIKE will ignore cases.
#select * from courses where course not ilike  '%A%';

#View the courses that don't have a capital or lowercase A and have a space.
# select * from courses where course NOT like '%a%' AND  course like '% %';

#All the fields that are empty or blank are null. You can access them using IS NULL as a condition like this: WHERE <column> IS NULL
#Inversely, you can use IS NOT NULL to see rows that aren't null. View all the info on students that do have a GPA.
# View the students who don't have a major, but don't include students without a GPA.
# Select * from students where major_id is null and gpa is not null;
#View the students who don't have a major and gpa.

# select * from students where major_id is null and gpa is not null

#Many times, you only want to return a certain number of rows. You can add LIMIT <number> at the end of the query to only get the amount you want.

# select * from students order by gpa desc, first_name limit 10;

# There's a number of mathematic functions to use with numerical columns. One of them is MIN, you can use it when selecting a column like this: SELECT MIN(<column>) FROM <table>. It will find the lowest value in the column.

# select min(column) from students;

# select max(column) from students

# select sum(column)from students;

# select avg(column) from students;
# select ceil(avg(column)) from students;
# select round(avg(column)) from students;


#You can round to a specific number of decimal places by adding a comma and number to ROUND, like this: ROUND(<number_to_round>, <decimals_places>).

# select round(avg(column), 5) from students;

# Another function is COUNT. You can use it like this: COUNT(<column>). It will tell you how many entries are in a table for the column. 
# Count(*)  from <table>  counts all the entries in all tables; total rows;

# DISTINCT is a function that will show you only unique values. You can use it like this: DISTINCT(<column>)
# select distinct(major_id) from students;

#Here's an example of how to use it: SELECT <column> FROM <table> GROUP BY <column>

#The output was the same as DISTINCT, but with GROUP BY you can add any of the aggregate functions (MIN, MAX, COUNT, etc) to it to find more information. For instance, if you wanted to see how many students were in each major you could use SELECT COUNT(*) FROM students GROUP BY major_id.

# SELECT COUNT(*) FROM students GROUP BY major_id


# When using GROUP BY, any columns in the SELECT area must be included in the GROUP BY area. Other columns must be used with any of the aggregate functions (MAX, AVG, COUNT, etc).

# SELECT major_id, MIN(gpa) FROM students GROUP BY major_id;

# Another option with GROUP BY is HAVING. You can add it at the end like this: SELECT <column> FROM <table> GROUP BY <column> HAVING <condition>. The condition must be an aggregate function with a test. An example to might be to use HAVING COUNT(*) > 0 to only show what whatever column is grouped that have at least one row.

# select major_id, min(gpa), max(gpa) from students group by major_id having max(gpa) = 4.0

# use the AS keyword will rename a column when displaying the result.

#That's more descriptive. View the major_id and number of students in each major_id in a column named number_of_students.

# select major_id, count(*) as number_of_students from students group by major_id;

# The majors and students table are linked with the major_id foreign key. If you want to see the name of a major that a student is taking, you need to JOIN the two tables into one. Here's an example of how to do that:
# SELECT * FROM <table_1> FULL JOIN <table_2> ON <table_1>.<foreign_key_column> = <table_2>.<foreign_key_column>;

# It's showing all the columns from both tables, the two major_id columns are the same in each row for the ones that have it. You can see that there are some students without a major, and some majors without any students. The FULL JOIN you used will include all rows from both tables, whether or not they have a row using that foreign key in the other. From there, you could use any of the previous methods to narrow down, group, order, etc. Use a LEFT JOIN to join the same two tables in the same way.

#There's a few less rows than the last query. In the LEFT JOIN you used, the students table was the left table since it was on the left side of the JOIN. majors was the right table. A LEFT JOIN gets all rows from the left table, but only rows from the right table that are linked to from the left one. Looking at the data, you can see that every student was returned, but the majors without any students were not. Join the same two tables with a RIGHT JOIN this time.

# The right join showed all the rows from the right table (majors), but only rows from the left table (students) if they have a major. There's one more type you should know about. Join the two tables with an INNER JOIN.

# The INNER JOIN only returned students if they have a major and majors that have a student. In other words, it only returned rows if they have a value in the foreign key column (major_id) of the opposite table. You should know a little about the four main types of joins now. Try using a LEFT JOIN to show all the majors but only students that have a major.

# Lets do some more experiments with joins. Say you wanted to find a list of majors that students are taking. Use the most efficient JOIN to join the two tables you need. Only join the tables for now, don't use any other conditions.

# There's your list of majors that students are taking 😄 Next, say you wanted a list of majors that students aren't taking. Use the most efficient JOIN to join the two tables you need. Only join the tables for now, don't use any other conditions.


# That got you all the majors, you can see the ones that don't have any students. Add a WHERE condition to only see the majors without students, use student_id in it's condition.
# select * from majors left join students on majors.major_id = students.major_id where student_id is null;

# You're doing great. Next, use the most efficient 'JOIN' to join the tables you would need if you were asked to get the first name, last name, major, and GPA of students who are taking Data Science or have a gpa of 3.8 or greater. Only join the tables for now, don't use any other conditions.

# select * from majors right join students on majors.major_id = students.major_id

# Enter the same command, but use WHERE to only get the students that meet the requirements. As a reminder, the goal was to find students who are taking Data Science or have a gpa of 3.8 or greater.

# select * from majors right join students on majors.major_id = students.major_id where major = 'Data Science' or gpa >= 3.8;

#  SELECT first_name, last_name, major, gpa FROM students LEFT JOIN majors ON students.major_id = majors.major_id WHERE major='Data Science' OR gpa >= 3.8;

# From there, you could put them in a specific order if you wanted or limit the results to a certain number among other things. Lastly, use the most efficient 'JOIN' to join the tables you would need if you were asked to get the first name and major for students whose first_name, or the major, contains ri. Only join the tables for now, don't use any other conditions.

# select * from students  full  join majors using (major_id);

# Note that the two major_id columns were turned into one with USING. In order to find out what courses a student is taking, you will need to join all the tables together. You can add a third table to a join like this: SELECT * FROM <table_1> FULL JOIN <table_2> USING(<column>) FULL JOIN <table_3> USING(<column>). This example will join the first two tables into one, turning it into the left table for the second join. Use this method to join the two tables from the previous query with the majors_courses table.

# select * from students full join majors using (major_id) full join majors_courses using(major_id);

# You may need to adjust the terminal size to align the output. What you're seeing is every unique combination of rows in the database. Students with a major are listed multiple times, one for each course included in the major. The majors without any students are there along with the courses for them. The students without a major are included, they have no courses and are only listed once. You can join as many tables together as you want. Join the last table to the previous command to get the names of the courses with all this info.

# select * from students full join majors using (major_id) full join majors_courses using(major_id) full join courses using (course_id);