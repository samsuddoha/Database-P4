-----------------------
---Lecture 21----
-------------------------
--write query for the following problems

--Q1: Find the name, phone number, department name, designation and 
--net salary of each employee.
SELECT employee.name, employee.phoneNumber, department.departmentName, 
designation.designationName, salary.NetSalary
FROM employee, department, designation, salary
WHERE employee.departmentId=department.departmentId
AND employee.designationId=designation.designationId
AND employee.employeeId=salary.employeeId;

--Q2: Find the name, designation and basic salary of each employee
-- who are from IT department and receive salary more than 50,000.
SELECT employee.name, designation.designationName, salary.basicSalary
FROM employee, department, designation, salary
WHERE employee.departmentId=department.departmentId
AND employee.designationId=designation.designationId
AND employee.employeeId=salary.employeeId
AND department.departmentName='IT' AND salary.basicSalary>50000;

--Q3: Count the number of employees in each department. [group by, count]
SELECT department.departmentName, Count(employee.departmentId)
from department, employee
WHERE department.departmentId=employee.employeeId
GROUP BY employee.departmentId;

--**Q3.1: Count the number of employees in each department 
--which has more than three employees. [group by, having, count]

SELECT department.departmentName, Count(employee.departmentId)
from department, employee
WHERE department.departmentId=employee.employeeId
GROUP BY employee.departmentId
HAVING Count(employee.departmentId)>3;

--Q4: Find the list of employee who received highest salary.
SELECT employee.name, salary.NetSalary
from employee, salary
where employee.employeeId=salary.employeeId
ORDER BY salary.NetSalary DESC LIMIT 1;

--**--Q: Find the name and net salary of the employee
-- who received 2nd highest salary.
SELECT employee.name, salary.NetSalary
from employee, salary
where employee.employeeId=salary.employeeId
ORDER BY salary.NetSalary DESC LIMIT 1 OFFSET 1;

--Q5: Show the name and salary of each employee with an 
--increment of 10% on Net salary.
SELECT employee.name, salary.NetSalary*1.1 AS Total_Salary
from employee, salary
where employee.employeeId=salary.employeeId;

--Q6: Find the list of employees who took more than 3 leaves.
SELECT employee.name, count(leaveapplication.employeeid) 
from employee, leaveapplication
where employee.employeeId=leaveapplication.employeeId
GROUP BY leaveapplication.employeeId
HAVING  count(leaveapplication.employeeid) >3;

--Q6.1: Find the list of employees who took more than 10 days leave.
 SELECT employee.name, sum(abs(DATEdiff(LeaveEndDate, LeaveStartDate))) 
from employee, leaveapplication
where employee.employeeId=leaveapplication.employeeId
GROUP BY leaveapplication.employeeId
HAVING sum(abs(DATEdiff(LeaveEndDate, LeaveStartDate))) >10;

--Q6.2 Find the number of days leave taken by employee.
SELECT esum(abs(DATEdiff(LeaveEndDate, LeaveStartDate))) 
fromleaveapplication;

--Q7: Display all employees who joined after January 1, 2020.

JOININGDATE> '2020-01-01'

--Q8: Fetch employees with the designation "Manager".

--Q9: Calculate the total salary paid to all employees. [sum]

--Q10: Find the highest and lowest net salary among all employees.
-- [max and min]

--Q11: Display the average salary for each department. [avg]

--Q12: Find the department with the maximum number of employees. [group by]

