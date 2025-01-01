-- 1. Create the database
CREATE DATABASE CompanyDB;

-- Use the database
USE CompanyDB;

-- 2. Clean up old tables if they exist
DROP TABLE IF EXISTS Employee;

-- Create the Employee table
CREATE TABLE Employee (
    emp_id INT PRIMARY KEY,
    emp_title VARCHAR(7),
    emp_lname VARCHAR(50) NOT NULL,
    emp_fname VARCHAR(50) NOT NULL,
    emp_initial CHAR(1),
    emp_dob DATE,
    emp_hire_date DATE,
    emp_statecode CHAR(3),
    emp_areacode CHAR(4) DEFAULT '3000',
    emp_phone VARCHAR(12),
    emp_mgr INT
);

DESC Employee;

-- Rename the manager column to make it clearer
ALTER TABLE Employee 
RENAME COLUMN emp_mgr TO emp_mgr_id;

DESC Employee;

-- Add a foreign key constraint to link employees to their managers
ALTER TABLE Employee
ADD CONSTRAINT fk_manager
FOREIGN KEY (emp_mgr_id) REFERENCES Employee(emp_id)
ON DELETE SET NULL; -- Ensures manager deletion sets emp_mgr_id to NULL instead of cascading delete

SELECT column_name, constraint_name, referenced_column_name, referenced_table_name
FROM information_schema.key_column_usage
WHERE TABLE_NAME = 'Employee';


INSERT INTO Employee (emp_id, emp_title, emp_lname, emp_fname, emp_initial, emp_dob, emp_hire_date, emp_statecode, emp_areacode, emp_phone, emp_mgr_id)
VALUES
(100, 'Mr.', 'Kolmycz', 'George', 'D', '1942-06-15', '1985-03-15', 'VIC', '3615', '324-5456', NULL),
(105, 'Mr.', 'Williams', 'Robert', 'D', '1975-03-14', '1998-11-08', 'VIC', '3615', '890-3220', NULL),
(108, 'Mr.', 'Wiesenbach', 'Paul', 'R', '1966-02-14', '1992-11-18', 'SA', '5615', '897-4358', NULL);

INSERT INTO Employee (emp_id, emp_title, emp_lname, emp_fname, emp_initial, emp_dob, emp_hire_date, emp_statecode, emp_areacode, emp_phone, emp_mgr_id)
VALUES
(101, 'Ms.', 'Lewis', 'Rhonda', 'G', '1965-03-19', '1986-04-25', 'ACT', '2615', '324-4472', 100),
(102, 'Mr.', 'Vandam', 'Rhett', NULL, '1958-11-14', '1990-12-20', 'VIC', '3901', '675-8993', 100),
(103, 'Ms.', 'Jones', 'Anne', 'M', '1974-10-16', '1994-08-28', 'NSW', '1615', '898-3456', 100),
(104, 'Mr.', 'Lange', 'John', 'P', '1971-11-08', '1994-10-20', 'NT', '0901', '504-4430', 105),
(106, 'Mrs.', 'Smith', 'Jeanine', 'K', '1968-02-12', '1989-01-05', 'QLD', '4615', '324-7883', 105),
(107, 'Mr.', 'Diante', 'Jorge', 'D', '1974-08-21', '1994-07-02', 'SA', '5615', '890-4567', 105),
(109, 'Mr.', 'Smith', 'George', 'K', '1961-06-12', '1989-04-14', 'NT', '0901', '504-3339', 108),
(110, 'Mrs.', 'Genkazi', 'Leighla', 'W', '1970-05-19', '1990-12-01', 'NT', '0901', '569-0093', 108),
(111, 'Mr.', 'Washington', 'Rupert', 'E', '1966-01-03', '1993-06-21', 'QLD', '5615', '890-4925', 105),
(112, 'Mr.', 'Johnson', 'Edward', 'E', '1961-05-14', '1983-12-01', 'QLD', '5615', '890-4387', 100),
(113, 'Ms.', 'Smythe', 'Melanie', 'P', '1970-09-15', '1999-05-11', 'NT', '0901', '324-9006', 100),
(114, 'Mrs.', 'Brandon', 'Marie', 'G', '1956-11-02', '1975-11-15', 'NT', '0901', '882-0485', 108),
(115, 'Mrs.', 'Saranda', 'Hermine', 'R', '1972-07-25', '1993-04-23', 'QLD', '5615', '324-5505', 105),
(116, 'Mr.', 'Smith', 'George', 'A', '1965-11-08', '1993-12-10', 'QLD', '5615', '890-2984', 108);

SELECT * FROM Employee;

-- Update a specific employee's manager
UPDATE Employee
SET emp_mgr_id = 105
WHERE emp_id = 103;

SELECT * FROM Employee WHERE emp_id = 103;

-- Delete employees whose manager has emp_id = 108
DELETE FROM Employee
WHERE emp_mgr_id = 108;

SELECT * FROM Employee;



