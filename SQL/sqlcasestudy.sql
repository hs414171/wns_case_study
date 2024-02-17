CREATE DATABASE IF NOT EXISTS Org;
USE Org;

CREATE TABLE IF NOT EXISTS Department (
    Department_id INT UNIQUE NOT NULL PRIMARY KEY,
    Department_name VARCHAR(255)
);
CREATE TABLE IF NOT EXISTS Employee (
    Emp_id INT UNIQUE NOT NULL PRIMARY KEY,
    Emp_Name VARCHAR(255),
    Department_id INT,
    Manager_id INT,
    Salary INT,
    email_Address VARCHAR(255),
    INDEX (Department_id),
    FOREIGN KEY (Department_id) REFERENCES Department(Department_id)
);

-- Inserting data into Department table
INSERT INTO Department (Department_id, Department_name) VALUES
(1, 'IT'),
(3, 'HR'),
(5, 'Payroll');

INSERT INTO Employee (Emp_Name, Emp_id, Department_id, Manager_id, Salary, email_Address)
VALUES ('Naved', 1, 1, 6, 1000, 'Naved@gmail.com'),
       ('Atul', 2, 1, 6, 1290, 'Atul@Hotmail.com'),
       ('Raja', 3, 3, 6, 1500, 'Raja@hotmail.com'),
       ('Akash', 4, 3, 5, 2000, 'Akash@Outlook.com'),
       ('Rajan', 6, 5, 6, 30000, 'Rajan@Outlook.com'),
       ('Balam', 5, 5, 6, 4000, 'Balam@outlook.com'),
       ('Ravi', 7, 1, 5, 2000, 'Ravi@gmail.com'),
       ('Ram', 9, 1, 4, 7000, 'Ram@Hotmail.com'),
       ('Paul', 8, 3, 5, 6000, 'Paul@gmail.com');



-- Count of employees in each department

SELECT e.Department_id,d.Department_name,COUNT(e.Emp_id) AS 'Employee Count'
FROM Employee as e
LEFT JOIN Department as d
ON e.Department_id = d.Department_id
GROUP BY e.Department_id,d.department_name;

-- Highest Salary by Department with Employee Name
SELECT d.Department_name, e.Emp_Name
FROM Department AS d
INNER JOIN(
    SELECT Department_id, MAX(Salary) AS 'Max_Salary'
    FROM Employee
    GROUP BY Department_id
) AS max_sal
ON d.Department_id = max_sal.Department_id
INNER JOIN Employee AS e ON e.Department_id = d.Department_id AND e.Salary = max_sal.Max_Salary;

-- Total Salary by Department
SELECT d.department_name, SUM(e.salary) AS 'Total Salary'
FROM Employee as e
JOIN Department as d on e.department_id=d.department_id
GROUP BY d.department_id;

-- Total Salary Paid

SELECT SUM(salary) AS 'Total Salary Paid' FROM Employee;

-- Distinct email domain and thier counts
SELECT SUBSTRING_INDEX(email_Address, '@', -1) AS 'Domain', COUNT(*) AS 'Count'
FROM Employee
GROUP BY Domain;

-- Name of Employee and its Manager
SELECT e.Emp_Name,m.Emp_Name AS 'Manager'
FROM Employee AS e
LEFT JOIN Employee AS m
ON e.Manager_id = m.Emp_id;

-- Replica of table without duplicating 
CREATE TABLE Employee_Replica LIKE Employee;


