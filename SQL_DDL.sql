CREATE DATABASE Checkpoint_DDL; -- db creation

GO

USE Checkpoint_DDL; -- selecting db

-- creating Department table
CREATE TABLE Department (
Num_S INT PRIMARY KEY,
Label VARCHAR(255),
Manager_Name VARCHAR(255)
);

-- creating Employee table
CREATE TABLE  Employee(
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
