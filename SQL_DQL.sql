CREATE DATABASE Checkpoint_DQL;
GO
 
USE Checkpoint_DQL;
GO
-- creating Department table
CREATE TABLE Department (
Num_S INT PRIMARY KEY,
Label VARCHAR(255),
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
FOREIGN KEY (Project_Num_P) REFERENCES Project(Num_P), 
Role VARCHAR(255)
);

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


