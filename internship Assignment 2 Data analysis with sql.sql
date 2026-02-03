DROP database studentmanagement; 
CREATE DATABASE STUDENTMANAGEMENT;
USE STUDENTMANAGEMENT;
CREATE TABLE Students (
    Student_id INT auto_increment primary KEY,
    Name VARCHAR(50),
    email VARCHAR(50)
);

INSERT INTO Students (Student_id, Name, email) VALUES
(1, 'Rohit', 'rohit@gmail.com'),
(2, 'Radhika', 'radhika@gmail.com'),
(3, 'Mohit', 'mohit@gmail.com'),
(4, 'Anya', 'anya@gmail.com'),
(5, 'keshav', 'keshav@gmail.com');

CREATE TABLE Courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(10),
    course_description VARCHAR(25)
);


INSERT INTO Courses (course_id, course_name, course_description) VALUES
(101, 'Database', 'Database concepts'),
(102, 'Java', 'Java programming'),
(103, 'Python', 'Python basics'),
(104, 'Web Dev', 'HTML CSS '),
(105, 'AI', 'Artificial Intelligence');



CREATE TABLE Enrolments (
    enrolment_id INT auto_increment PRIMARY KEY,
    student_id INT,
    course_id INT,
    enrolment_date DATE,
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);


INSERT INTO Enrolments (enrolment_id, student_id, course_id, enrolment_date) VALUES
(1, 1, 101, '2026-01-10'),
(2, 1, 102, '2026-01-15'),
(3, 2, 101, '2026-01-21'),
(4, 3, 103, '2026-01-25'),
(5, 4, 104, '2026-01-27'),
(6, 5, 105, '2026-01-30');



SELECT  Students.name AS student_name, Courses.course_name
FROM Enrolments
INNER JOIN Students
    ON Enrolments.student_id = Students.student_id
INNER JOIN Courses
    ON Enrolments.course_id = Courses.course_id;

SELECT Courses.course_id, 
Courses.course_name,
    COUNT(Enrolments.student_id) AS total_students
FROM Courses
LEFT JOIN Enrolments
    ON Courses.course_id = Enrolments.course_id
GROUP BY 
    Courses.course_id,
    Courses.course_name;
    
    
    
    
    SELECT student_id,
    COUNT(course_id) AS total_courses FROM Enrolments
GROUP BY student_id
HAVING COUNT(course_id) > 1;





SELECT Courses.course_id, Courses.course_name
FROM Courses
LEFT JOIN Enrolments
    ON Courses.course_id = Enrolments.course_id
WHERE Enrolments.enrolment_id IS NULL;