INSERT INTO class(class_id, class_name, instructor)
VALUES 
('101', 'Mathematics', 'Dr. Lee'),
('102', 'History', 'Prof. Chen'),
('103', 'Database System', 'Dr. K'),
('104', 'Computer Networks', 'Dr. Lin'),
('105', 'Artificial Intelligence', 'Prof. Zhang'),
('106', 'Software Engineering', 'Dr. Wu'),
('107', 'Cybersecurity', 'Dr. Chang');
INSERT INTO student(student_id, name, age)
VALUES 
(1, 'Alice', 20),
(2, 'Bob', 21),
(3, 'Charlie', 22),
(4, 'Diana', 23),
(5, 'Ethan', 20),
(6, 'Fiona', 21),
(7, 'George', 22);
INSERT INTO enroll(student_id, class_id, enrollment_date)
VALUES 
(1, '101', '2025-07-01'),
(1, '103', '2025-07-05'),
(2, '102', '2025-07-02'),
(2, '103', '2025-07-05'),
(3, '104', '2025-07-03'),
(4, '103', '2025-07-06'),
(5, '105', '2025-07-04'),
(6, '106', '2025-07-07'),
(7, '107', '2025-07-08');