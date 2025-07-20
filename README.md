# 📘 Checkpoint_DQL

## 📝 Project Overview

This project demonstrates a simple **relational database design** for managing departments, employees, projects, and their assignments. It includes three main SQL components:

- **DDL (Data Definition Language)**: Database and table creation
- **DML (Data Manipulation Language)**: Data insertion, updates, and deletions
- **DQL (Data Query Language)**: Analytical queries for reporting

---

## ⚙️ Technologies Used

- **SQL Server** (or any compatible RDBMS like MySQL/PostgreSQL with minor syntax adjustments)
- SQL tools such as **SSMS**, **DBeaver**, or **MySQL Workbench**

---

## 🧱 1. DDL – Database & Table Creation

The following tables are created:

| Table Name         | Description                                       |
|--------------------|---------------------------------------------------|
| `Department`       | Stores department details                         |
| `Employee`         | Stores employee information                       |
| `Project`          | Contains project information                      |
| `Employee_Project` | Many-to-many relationship between employees & projects with their roles |

### 🔗 Relationships

- Each **employee** belongs to one **department**
- Each **project** is managed by one **department**
- Each **employee** can participate in multiple **projects**

---

## ✏️ 2. DML – Data Manipulation

The script includes:

- **INSERT**: Populating the `Department`, `Employee`, `Project`, and `Employee_Project` tables with sample data.
- **UPDATE**: Updating an employee's role in a project.
- **DELETE**: Deleting an employee and their project assignments while maintaining referential integrity.

---

## 🔍 3. DQL – Data Query Language (Analytics)

### 📊 Query List

| # | Query Objective |
|---|-----------------|
| 1 | Retrieve employees involved in more than one project with total project count |
| 2 | List all projects along with their managing department and manager name |
| 3 | Retrieve employee names and roles working on the project *"Website Redesign"* |
| 4 | Identify the department with the highest number of employees |
| 5 | Retrieve names and positions of employees with a salary > 60,000, including department |
| 6 | Count of employees assigned to each project |
| 7 | Summary of employee roles across projects |
| 8 | Total salary expense per department |

---

## 💡 Usage Instructions

1. Copy and paste the SQL script into your SQL environment.
2. Run the **DDL** section first to create the structure.
3. Run the **DML** section to insert and manipulate data.
4. Run the **DQL** queries to explore and analyze the data.
5. If using MySQL, replace `TOP 1` with `LIMIT 1`.

---

## 📁 File Structure

```plaintext
Checkpoint_DQL.sql   -- Main SQL script (DDL + DML + DQL)
README.md            -- This documentation
