# Student Attendance DB – Task 7

This project is an extension of the **Student Attendance Database** for practicing  
**Creating and Using Views in SQL**.

---

## 📂 Files
- **schema.sql** → Base tables (Students, Courses, Enrollments, Attendance)
- **views.sql** → Examples of creating and querying views
- **sample_output.txt** → Notes / Expected results

---

## 🚀 How to Use
1. Open MySQL Workbench or DB Browser for SQLite.
2. Run `schema.sql` to create tables and sample data.
3. Run queries from `views.sql`.

---

## 🔑 Concepts Covered
- Creating simple and complex views
- Using views for abstraction and security
- Querying views like regular tables
- Updating data through updatable views
- Dropping views

---

## 📝 Example Queries
```sql
-- Create a view for student emails only
CREATE VIEW student_contacts AS
SELECT name, email FROM Students;

-- Create a view joining students and courses
CREATE VIEW student_courses AS
SELECT s.name, c.title
FROM Students s
JOIN Enrollments e ON s.id = e.student_id
JOIN Courses c ON e.course_id = c.id;

-- Query a view
SELECT * FROM student_courses;

-- Drop a view
DROP VIEW student_contacts;
