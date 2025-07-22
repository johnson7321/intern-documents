CREATE DATABASE school;
USE school;
-- 學生表 student
CREATE TABLE student (
    student_id INT PRIMARY KEY,
    name VARCHAR(50),
    age INT
);

-- 課程表 class
CREATE TABLE class (
    class_id INT PRIMARY KEY,
    class_name VARCHAR(100),
    instructor VARCHAR(50)
);

-- 修課關聯表 enroll
CREATE TABLE enroll (
    student_id INT,
    class_id INT,
    enrollment_date DATE,
    PRIMARY KEY (student_id, class_id),
    FOREIGN KEY (student_id) REFERENCES student(student_id),
    FOREIGN KEY (class_id) REFERENCES class(class_id)
);