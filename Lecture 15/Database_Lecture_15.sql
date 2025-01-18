
--Lecrture 15---
-----------------------
-- teachers(id, name, designation, city, salary)

--SELECT COMMAND
----------------------------------
--show the name, designation, city and salary of teachers
SELECT name, designation, city, salary FROM teachers;
--show all info of all teachers
SELECT * FROM teachers;

--find the name and city of all teachers
SELECT name,city FROM teachers;
-- find the name and salary of all teachers
SELECT name,salary FROM teachers;

--WHERE CLAUSE

--find the list of teachers who are from barishal
SELECT * from teachers WHERE city='Barishal';
--find the list of professor who get more than 80000
SELECT * from teachers WHERE designation='Professor' AND salary>80000;

--DISTINCT
-------------------------------------------
SELECT DISTINCT city from teachers;
--SELECT COUNT(DISTINCT city) from teachers;
SELECT DISTINCT designation from teachers;

--exercises
----------------------------
--Find the list of teachers whose salary are between 100000 and 70000.
SELECT * from teachers WHERE salary<=100000 AND salary>=70000;
--show the name, city and salary of all teachers who are from dhaka 
--or their salary less than 80000.
SELECT name, city, salary from teachers WHERE city='Dhaka' OR salary<80000;
--show the list of professors or lecturers.
SELECT * from teachers WHERE designation='Lecturer' OR designation='Professor';

--Order by (sorting any list based on any column)
-----------------------------------------------------
--show the list of teachers sorted by their name in alphabetically.
SELECT * from teachers Order by name;
--show the list of teachers sorted by their name and city in alphabetically.
SELECT * from teachers Order by name, city;
--show the list of teachers based on highest salary
SELECT * from teachers order by salary desc;

--LIMIT 
---------------------
--show the list of three teachers based on highest salary.
SELECT * from teachers order by salary desc LIMIT 3;

--OFFSET
----------------------
SELECT * from teachers order by salary desc LIMIT 100 OFFSET 2;

--aggregate functions
----------------------------
select count(id) from teachers;
select count(DISTINCT city) from teachers;
--find the maximum salary of assistant professor.
--find the average salary of all professors and lecturers.
--find minimum salary of all teachers.
--find the sum of salary of all associate Professor.
--find the number of teaches who are from khulna.

--find the list of teachers who get more salary than x.
select * from teachers where salary>(select avg(salary) from teachers);

--find the list of leacturers who get more salary than at least any 
--assistant professor.
