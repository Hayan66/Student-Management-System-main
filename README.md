##Hayan Tech

##Developers
---Pavithra Musunuri

# Student-Management-System
Student Management System is a web application which can be used for managing the data of a school related to students, teachers, and courses.

The application has 3 user roles: student, teacher, and admin. Each role has access to different pages and operations which is described below:

<ul>
  <li><b>Admin:</b> The admin can add/delete courses, students, and teachers. Furthermore, it can enroll students to courses or remove students from courses. The admin
  can view statistics of the school such as the number of students and teachers at the school.</li>
  <li><b>Student:</b> The student can view all of the courses enrolled. By clicking on each course, the student can view the course details which consist of exam grades and 
  assignments. The student should click on the "mark as completed" button for each assignment he/she completed so that the teacher of the course can 
  track students' assignment status.</li>
  <li><b>Teacher:</b> The teacher can view the student list, create new assignments and view the students' assignment status, and grade exams.</li>
</ul>

<img src="https://user-images.githubusercontent.com/93772280/160869303-dc4db60e-df04-49bf-845d-cf34f3325b3f.PNG" width="700">

###SQL schems

CREATE TABLE role (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL
);

CREATE TABLE teacher (
    id INT PRIMARY KEY AUTO_INCREMENT,
    email VARCHAR(255) UNIQUE NOT NULL,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    username VARCHAR(255) UNIQUE NOT NULL,
    role_id INT,
    FOREIGN KEY (role_id) REFERENCES role(id)
);

CREATE TABLE student (
    id INT PRIMARY KEY AUTO_INCREMENT,
    email VARCHAR(255) UNIQUE NOT NULL,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    username VARCHAR(255) UNIQUE NOT NULL,
    role_id INT,
    FOREIGN KEY (role_id) REFERENCES role(id)
);

CREATE TABLE course (
    id INT PRIMARY KEY AUTO_INCREMENT,
    code VARCHAR(255) UNIQUE NOT NULL,
    name VARCHAR(255) NOT NULL,
    teacher_id INT,
    FOREIGN KEY (teacher_id) REFERENCES teacher(id)
);

CREATE TABLE grade_details (
    id INT PRIMARY KEY AUTO_INCREMENT,
    grade_one INT,
    grade_two INT,
    grade_three INT
);

CREATE TABLE student_course_details (
    id INT PRIMARY KEY AUTO_INCREMENT,
    course_id INT,
    student_id INT,
    grade_details_id INT,
    FOREIGN KEY (course_id) REFERENCES course(id),
    FOREIGN KEY (student_id) REFERENCES student(id),
    FOREIGN KEY (grade_details_id) REFERENCES grade_details(id)
);

CREATE TABLE assignment (
    id INT PRIMARY KEY AUTO_INCREMENT,
    days_remaining INT,
    description VARCHAR(255),
    due_date VARCHAR(255),
    name VARCHAR(255)
);

CREATE TABLE assignment_details (
    id INT PRIMARY KEY AUTO_INCREMENT,
    assignment_id INT,
    student_course_details_id INT,
    is_done INT,
    FOREIGN KEY (assignment_id) REFERENCES assignment(id),
    FOREIGN KEY (student_course_details_id) REFERENCES student_course_details(id)
);


## Registration View
<img src="https://user-images.githubusercontent.com/93772280/160870174-85f88ce8-b3b4-4185-9cc0-7136bfe38c9a.PNG" width="700">

## Admin View

<img src="https://user-images.githubusercontent.com/93772280/160870030-35ca1bf8-8dbd-4390-9430-cc97ea217609.PNG" width="700">

<img src="https://user-images.githubusercontent.com/93772280/160871524-01f549b2-27d5-4612-b05c-4114b74a6de2.PNG" width="700">

## Student View
<img src="https://user-images.githubusercontent.com/93772280/160871806-7d3a45f1-0896-426e-8fb7-4357847c27cb.PNG" width="700">

## Teacher View
<img src="https://user-images.githubusercontent.com/93772280/160871896-6e12678c-d159-4916-b02c-d6d85967c30c.PNG" width="700">

## Built With
<ul>
  <li>Java</li>
  <li>Spring Boot</li>
  <li>Spring MVC</li>
  <li>HTML</li>
  <li>CSS</li>
  <li>MySQL</li>
  <li>Hibernate</li>
  <li>Maven</li>
</ul>

