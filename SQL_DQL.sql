CREATE DATABASE Checkpoint_DQL;
GO
 
USE Checkpoint_DQL;
GO
-- creating Department table
CREATE TABLE Department (
Num_S INT PRIMARY KEY,
Department VARCHAR(255),
Manager_Name VARCHAR(255)
);

-- creating Employee table
CREATE TABLE  Employee (
Num_E INT PRIMARY KEY,
Name VARCHAR(255),
Position VARCHAR(255),
Salary DECIMAL(10, 2),
Department_Num_S INT,
FOREIGN KEY (Department_Num_S) REFERENCES Department(Num_S)
);

-- creating Project table
CREATE TABLE  Project(
Num_P INT PRIMARY KEY,
Title VARCHAR(255),
Start_Date DATE,
End_Date DATE,
Department_Num_S INT,
FOREIGN KEY (Department_Num_S) REFERENCES Department(Num_S)
);

-- creating Employee_Project table
CREATE TABLE Employee_Project(
Employee_Num_E INT,
FOREIGN KEY (Employee_Num_E) REFERENCES Employee(Num_E), 
Project_Num_P INT,
FOREIGN KEY (Employee_Num_E) REFERENCES Project(Num_P), 
Role VARCHAR(255)
);
 
 -- ** DML PART ** --


-- Inserting the informations in the tables
INSERT INTO Department(Num_S,Label,Manager_Name)
VALUES
(1,'IT','Alice Johnson'),
(2,'HR','Bob Smith'),
(3,'Marketing','Clara Bennett');


INSERT INTO Employee(Num_E,Name,Position,Salary,Department_Num_S)
VALUES
(101,'John Doe','Developer',60000.00,1),
(102,'Jane Smith','Analyst',55000.00,2),
(103,'Mike Brown','Designer',50000.00,3),
(104,'Sarah Johnson','Data Scientist',70000.00,1),
(105,'Emma Wilson','HR Specialist',52000.00,2);


INSERT INTO Project(Num_P,Title,Start_Date,End_Date,Department_Num_S)
VALUES
(201,'Website Redesign','2024-01-15','2024-06-30',1),
(202,'Employee Onboarding','2024-03-01','2024-09-01',2),
(203,'Market Research','2024-02-01','2024-07-31',3),
(204,'IT Infrastructure Setup','2024-04-01','2024-12-31',1);


INSERT INTO Employee_Project(Employee_Num_E,Project_Num_P,Role)
VALUES
(101,201,'Frontend Developer'),
(104,201,'Backend Developer'),
(102,202,'Trainer'),
(105,202,'Coordinator'),
(103,203,'Research Lead'),
(101,204,'Network Specialist');

--Updating the Employee_Project Table
UPDATE Employee_Project
SET 
	Role= 'Full Stack Developer'
WHERE Employee_Num_E = 101;

--Deletion of Num_E=101
DELETE FROM Employee_Project
WHERE Employee_Num_E = 103; 

DELETE FROM Employee
WHERE Num_E = 103;

SELECT * FROM Employee_Project;
GO
SELECT * FROM Employee;
GO

-- ** DQL PART **--
 
USE Checkpoint_DQL;
GO


-- 1/- Retrieve the names of employees who are assigned to more than one project,
-- along with the total number of projects for each employee.
SELECT Name, COUNT(Project_Num_P) AS total_projects
FROM Employee
JOIN Employee_Project
ON Employee.Num_E = Employee_Project.Employee_Num_E
GROUP BY Name
HAVING COUNT(Project_Num_P) > 1;


-- 2/- retrieve the list of projects managed by each department, including the department label and manager’s name.
SELECT 
  p.Num_P,p.Title,
  d.Label, d.Manager_Name 
FROM Project AS p
JOIN Department AS d  
ON p.Department_Num_S =d.Num_S 


-- 3/- retrieve the names of employees working on the project "Website Redesign," including their roles in the project.
SELECT e.Name, ep.Role
FROM Employee AS e
JOIN Employee_Project AS ep
ON e.Num_E = ep.Employee_Num_E
JOIN Project AS p
ON p.Num_P = ep.Project_Num_P
WHERE p.Title = 'Website Redesign'

-- 4/- Retrieve the department with the highest number of employees, including the department label, manager name, and the total number of employees.
SELECT TOP 1 d.Label, d.Manager_Name, COUNT(e.Num_E) AS total_employees
FROM Department AS d 
JOIN Employee AS e ON d.Num_S = e.Department_Num_S
GROUP BY d.Label, d.Manager_Name
ORDER BY total_employees DESC 


-- 5/-  retrieve the names and positions of employees earning a salary greater than 60,000, including their department names.
SELECT e.Name, e.Position, d.Label 
FROM Employee AS e 
JOIN Department AS d  ON d.Num_S = e.Department_Num_S
WHERE Salary > 60000.00

-- 6/- retrieve the number of employees assigned to each project, including the project title.

SELECT p.Title, 
       COUNT(ep.Employee_Num_E) AS total_employees -- Count the number of employees assigned to each project
FROM Project p
JOIN Employee_Project ep 
  ON ep.Project_Num_P = p.Num_P -- Link projects to employee assignments via project number
GROUP BY p.Title -- Group the results by project title to get a count per project


-- 7/- retrieve a summary of roles employees have across different projects, including the employee name, project title, and role.
SELECT e.Name, 
       p.Title, 
       ep.Role
FROM Employee_Project ep -- Start with the associative table containing roles and links
JOIN Project p
  ON p.Num_P = ep.Project_Num_P -- Match project numbers between Project and Employee_Project
JOIN Employee e
  ON e.Num_E = ep.Employee_Num_E -- Match employee numbers between Employee and Employee_Project


  --8/-  retrieve the total salary expenditure for each department, including the department label and manager name.
  
  SELECT d.Label, d.Manager_Name, SUM(e.Salary) AS total_salary
  FROM Employee e
  Join Department  d 
    ON d.Num_S = e.Department_Num_S
  GROUP BY d.Label, d.Manager_Name
