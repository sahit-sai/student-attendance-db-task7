-- views.sql
USE student_attendance;

-- 1. Simple view: only student names and emails
CREATE VIEW student_contacts AS
SELECT name, email FROM Students;

-- Query the view
SELECT * FROM student_contacts;

-- 2. View joining students with their courses
CREATE VIEW student_courses AS
SELECT s.name, c.title AS course_title
FROM Students s
JOIN Enrollments e ON s.id = e.student_id
JOIN Courses c ON e.course_id = c.id;

-- Query the view
SELECT * FROM student_courses;

-- 3. View for attendance summary per student
CREATE VIEW attendance_summary AS
SELECT s.name, COUNT(*) AS total_days,
       SUM(CASE WHEN a.status = 'Present' THEN 1 ELSE 0 END) AS present_days
FROM Students s
LEFT JOIN Attendance a ON s.id = a.student_id
GROUP BY s.name;

-- Query the view
SELECT * FROM attendance_summary;

-- 4. Dropping a view
DROP VIEW IF EXISTS student_contacts;
