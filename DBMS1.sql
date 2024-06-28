
1) Create a table named 'students' with columns student id', 'first_name", "last_name', "department, and 'age' Insert 5 records into this table.

CREATE TABLE students (
    student_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    department VARCHAR(50),
    age INT);

INSERT INTO students (student_id, first_name, last_name, department, age)
VALUES 
    (1, 'Vyshnavi', 'Narreddy', 'Computer Science', 20),
    (2, 'Lakshmi', 'Annareddy', 'Mathematics', 22),
    (3, 'Bhavya', 'Kancherla', 'Physics', 21),
    (4, 'Chandrika', 'Maganti', 'Engineering', 23),
    (5, 'Vamshi', 'ThummalaReddy', 'Biology', 19);


2)Select all students from the 'students' table who are in the 'Computer Science department


SELECT student_id, first_name, last_name, department, age
FROM students
WHERE department = 'Computer Science';


Output:

student_id	first_name	last_name	department		age
1		Vyshnavi	Narreddy	Computer Science	20


3)Create a table named 'departments' with columns dept_id" and "dept_name. Insert 3 records. Perform an inner join between students' and 'departments to list all students with their department names.

-- Create the 'departments' table
CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);

-- Insert records into the 'departments' table
INSERT INTO departments (dept_id, dept_name)
VALUES
    (1, 'Computer Science'),
    (2, 'Mathematics'),
    (3, 'Physics');

-- Perform an inner join between 'students' and 'departments'
SELECT  students.student_id, students.first_name, students.last_name, departments.dept_name AS department_name, students.age
FROM students
INNER JOIN departments ON students.department = departments.dept_name;


output:
student_id	first_name	last_name	department_name	        age
1		Vyshnavi	Narreddy 	Computer Science	20
2		Lakshmi         Annareddy       Mathematics             22
3		Bhavya          Kancherla       Physics                 21



4) List all departments and their students using a left join between departments and 'students' Include departments with no students


SELECT departments.dept_id, departments.dept_name, students.student_id, students.first_name, students.last_name, students.age
FROM departments
LEFT JOIN students ON departments.dept_name = students.department;


Output:

dept_id	dept_name	student_id	first_name	last_name	age
1	Computer Science	1	Vyshnavi	Narreddy	20
2	Mathematics		2	Lakshmi 	Annareddy	22
2	Mathematics		NULL	NULL		NULL		NULL
3	Physics			3	Bhavya		Kancherla	21
4	Engineering		NULL	NULL		NULL		NULL
5	Biology			5	Vamshi		Thummalareddy	19

5)Calculate the average age of students in each department using the students' table

SELECT department, AVG(age) AS average_age
FROM students
GROUP BY department;


output:
department		average_age
Computer Science	20

6)Find departments with an average student age greater than 20 using the 'students' table

SELECT department, AVG(age) AS average_age
FROM students
GROUP BY department
HAVING AVG(age) > 20;


output:

department	average_age
Mathematics	22.0
Physics		21.0
Engineering	23.0

7) Select students whose age is higher than the average age of all students in the 'students table.

SELECT student_id, first_name, last_name, department, age
FROM students
WHERE age > (SELECT AVG(age) FROM students);

output:
student_id	first_name	last_name	department	age
2		Lakshmi		Narreddy	Mathematics	22
4		David		Wilson		Engineering	23

8)Increase the age of students in the 'Mechanical department by 1 year.

UPDATE students
SET age = age + 1
WHERE department = 'Mechanical';

9)Delete all students from the students' table who are younger than 18

DELETE FROM students
WHERE age < 18;

10)Create a view named senior_students' that includes students with age greater than 21.

CREATE VIEW senior_students AS
SELECT *
FROM students
WHERE age > 21;








