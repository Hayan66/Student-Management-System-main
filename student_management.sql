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
