SELECT student.name
FROM enroll
JOIN student ON enroll.student_id = student.student_id
JOIN class ON enroll.class_id = class.class_id
WHERE class.class_name = 'Database System';