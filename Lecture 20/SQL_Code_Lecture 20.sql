
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

--Lecture 20----
--------------------
--IN, BETWEEN
--GROUP by
--HAVING
--JOIN
--VIEW
------------------
--Q1: Find the list of teachrs who are from outside Dhaka.
SELECT * FROM teachers WHERE city NOT IN('Dhaka');

--Q1.1 Find the list of teachers who are from the same city of Ahmed.[Sub Query]
SELECT * FROM teachers WHERE city IN(SELECT city from teachers where name='Ahmed');

----Q1.2 Find the list of students who are from the same city of Ahmed sir. [Sub Query]

--Q2: Find the list of teachers who received salary between 50,000 and 1,00,000.
--try yourself
--Q3: Categorise number of teachers based on designation.

SELECT designation, COUNT(*) from teachers GROUP BY designation;
SELECT designation, COUNT(*)  AS Number_of_teachers from teachers GROUP BY designation;

 --Q: Show the list of students [return name, roll, city, department name, dept head].
 SELECT students.name, students.roll, students.city, department.name, department.hod
 FROM students INNER JOIN department ON students.dept_id=department.id;
 
 SELECT students.name, students.roll, students.city, department.name, department.hod
 FROM students, department 
 WHERE students.dept_id=department.id;
 

--Q5: Find the list of teachers who are from dhaka and work for CSE department.

SELECT teachers.name, department.name from teachers, department
where teachers.dept_id=department.id AND teachers.city='Dhaka' AND department.name='CSE';

--Q6: Show the numbers of teachers for each department.
--[return dept name and number of teachers]

--JOIN, Group by

SELECT department.name, Count(teachers.id)
FROM department,teachers
WHERE department.id=teachers.dept_id
GROUP BY department.name;








--Lecture 20-
-----------------------------------
department(id, name, hod, contact)
students(id, name, phone, roll, email, city,dept_id )
teachers(id, name, designation, city, salary, dept_id )


--Q1: Find the list of teachrs who are from outside Dhaka.
SELECT * FROM teachers 
WHERE city NOT IN('Dhaka');
--Q2 Find the list of teachers who are from the same city of Ahmed.[Sub Query]

WHERE city IN(SELECT city FROM teachers WHERE name='Ahmed');
--Q3 Find the list of students who are from the same city of Ahmed sir. [Sub Query]
SELECT * FROM students 
WHERE city IN(SELECT city FROM teachers WHERE name='Ahmed');

--Q4: Find the list of teachers who received salary between 50,000 and 1,00,000.
--try yourself [Between]


--Q6: Show the list of students [return name, roll, city, department name, dept head].
SELECT students.name, students.roll, students. city, department.name, department.hod
FROM students INNER JOIN department ON students.dept_id=department.id;

--traditional approach of JOIN
SELECT students.name, students.roll, students. city, department.name, department.hod
FROM students, department WHERE students.dept_id=department.id;


--Q6: Show the list of students who are from CSE[return name, roll, city, department name, dept head].
SELECT students.name, students.roll, students. city, department.name, department.hod
FROM students INNER JOIN department ON students.dept_id=department.id
WHERE department.name='CSE';

--traditional approach of JOIN
SELECT students.name, students.roll, students. city, department.name, department.hod
FROM students, department 
WHERE students.dept_id=department.id AND department.name='CSE';

--Q7: Find the list of teachers who are from dhaka and work for CSE department.
SELECT teachers.*, department.name
FROM teachers, department 
WHERE teachers.dept_id=department.id AND 
department.name='CSE' AND teachers.city='Dhaka';

--Group by
--Q5: Categorise number of teachers based on designation.
SELECT designation, COUNT(id)
FROm teachers
GROUP BY designation;

--Q: Find the number of students from each city.
SELECT city, COUNT(id)
FROm students
GROUP BY city;

----Q: Find the number of students from each city which has at least 2 students.

SELECT city, COUNT(id)
FROm students
GROUP BY city
HAVING COUNT(id)>=2;

--Q8: Show the numbers of teachers for each department [Join, group by]
--[return dept name and number of teachers]

select department.name, count(teachers.id)
FROM department,teachers
WHERE department.id=teachers.dept_id
GROUP BY department.name;

--Q8: Show the numbers of students for each department
--[return dept name and number of students]

select department.name, count(students.id)
FROM department,students
WHERE department.id=students.dept_id
GROUP BY department.name;