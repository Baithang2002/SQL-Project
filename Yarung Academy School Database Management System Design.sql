-- ============================================
-- Yarung Academy School Database
-- ============================================

DROP DATABASE IF EXISTS Yarung_Academy_DB;
CREATE DATABASE Yarung_Academy_DB;
USE Yarung_Academy_DB;

CREATE TABLE School_Info (
    school_id INT PRIMARY KEY,
    school_name VARCHAR(100) NOT NULL,
    city VARCHAR(50) NOT NULL,
    state VARCHAR(50) NOT NULL,
    principal_name VARCHAR(100) NOT NULL
);

CREATE TABLE Teacher (
    teacher_id INT PRIMARY KEY,
    teacher_name VARCHAR(100) NOT NULL,
    specialization VARCHAR(50) NOT NULL,
    home_state VARCHAR(50) NOT NULL,
    qualification VARCHAR(100) NOT NULL,
    gender ENUM('Male', 'Female') NOT NULL,
    school_id INT NOT NULL,
    FOREIGN KEY (school_id) REFERENCES School_Info(school_id)
);

CREATE TABLE Class_Section (
    class_id INT PRIMARY KEY,
    class_name VARCHAR(20) NOT NULL UNIQUE,
    class_teacher_id INT NOT NULL,
    FOREIGN KEY (class_teacher_id) REFERENCES Teacher(teacher_id)
);

CREATE TABLE Student (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(100) NOT NULL,
    gender ENUM('Male', 'Female') NOT NULL,
    dob DATE NOT NULL,
    class_id INT NOT NULL,
    school_id INT NOT NULL,
    FOREIGN KEY (class_id) REFERENCES Class_Section(class_id),
    FOREIGN KEY (school_id) REFERENCES School_Info(school_id)
);

CREATE TABLE Subject (
    subject_id INT PRIMARY KEY,
    subject_name VARCHAR(50) NOT NULL UNIQUE,
    teacher_id INT NOT NULL,
    FOREIGN KEY (teacher_id) REFERENCES Teacher(teacher_id)
);

INSERT INTO School_Info VALUES
(1, 'Yarung Academy', 'Gachiram Para', 'Tripura', 'Dr. Baithangha Reang');

INSERT INTO Teacher VALUES
(1, 'Ms. Mitali Debbarma', 'English', 'Tripura', 'M.A. English, B.Ed.', 'Female', 1),
(2, 'Mr. Biresh Reang', 'Kokborok', 'Tripura', 'M.A. Kokborok, B.Ed.', 'Male', 1),
(3, 'Mr. Sudip Chakma', 'Mathematics', 'Tripura', 'M.Sc. Mathematics, B.Ed.', 'Male', 1),
(4, 'Ms. Rekha Jamatia', 'Science', 'Tripura', 'M.Sc. Physics, B.Ed.', 'Female', 1),
(5, 'Mr. Pranab Tripura', 'Social Science', 'Tripura', 'M.A. History, B.Ed.', 'Male', 1),
(6, 'Ms. Nabanita Koloi', 'Computer Science', 'Tripura', 'MCA', 'Female', 1),
(7, 'Mr. Tapan Molsom', 'Physical Education', 'Tripura', 'M.P.Ed.', 'Male', 1),
(8, 'Mrs. Neha Singh', 'English', 'Bihar', 'M.A. English, B.Ed.', 'Female', 1);

INSERT INTO Class_Section VALUES
(1, 'Class 6A', 1),
(2, 'Class 6B', 2),
(3, 'Class 7A', 3),
(4, 'Class 7B', 4),
(5, 'Class 8A', 5),
(6, 'Class 8B', 6),
(7, 'Class 9A', 7),
(8, 'Class 9B', 8),
(9, 'Class 10A', 1),
(10, 'Class 10B', 3);

INSERT INTO Subject VALUES
(1, 'English', 1),
(2, 'Kokborok', 2),
(3, 'Mathematics', 3),
(4, 'Science', 4),
(5, 'Social Science', 5),
(6, 'Computer Science', 6),
(7, 'Physical Education', 7);

INSERT INTO Student (student_id, student_name, gender, dob, class_id, school_id) VALUES
(1, 'Arindam Debbarma', 'Male', '2013-03-04', 1, 1),
(2, 'Ankita Debbarma', 'Female', '2013-05-07', 1, 1),
(3, 'Kaushik Debbarma', 'Male', '2013-07-10', 1, 1),
(4, 'Anima Debbarma', 'Female', '2013-09-13', 1, 1),
(5, 'Bikash Debbarma', 'Male', '2013-11-16', 1, 1),
(6, 'Bina Debbarma', 'Female', '2013-01-19', 1, 1),
(7, 'Bimal Debbarma', 'Male', '2013-03-22', 1, 1),
(8, 'Chandrima Debbarma', 'Female', '2013-05-25', 1, 1),
(9, 'Bijoy Debbarma', 'Male', '2013-07-28', 1, 1),
(10, 'Debjani Debbarma', 'Female', '2013-09-03', 1, 1),
(11, 'Chandan Debbarma', 'Male', '2013-11-06', 1, 1),
(12, 'Dipali Debbarma', 'Female', '2013-01-09', 1, 1),
(13, 'Debojit Debbarma', 'Male', '2013-03-12', 1, 1),
(14, 'Esha Debbarma', 'Female', '2013-05-15', 1, 1),
(15, 'Dipankar Debbarma', 'Male', '2013-07-18', 1, 1),
(16, 'Falguni Debbarma', 'Female', '2013-09-21', 2, 1),
(17, 'Gautam Debbarma', 'Male', '2013-11-24', 2, 1),
(18, 'Gitali Debbarma', 'Female', '2013-01-27', 2, 1),
(19, 'Harendra Debbarma', 'Male', '2013-03-02', 2, 1),
(20, 'Hena Debbarma', 'Female', '2013-05-05', 2, 1),
(21, 'Indrajit Debbarma', 'Male', '2013-07-08', 2, 1),
(22, 'Indrani Debbarma', 'Female', '2013-09-11', 2, 1),
(23, 'Joydeb Debbarma', 'Male', '2013-11-14', 2, 1),
(24, 'Jharna Debbarma', 'Female', '2013-01-17', 2, 1),
(25, 'Kamal Debbarma', 'Male', '2013-03-20', 2, 1),
(26, 'Kalpana Debbarma', 'Female', '2013-05-23', 2, 1),
(27, 'Lalit Debbarma', 'Male', '2013-07-26', 2, 1),
(28, 'Laxmi Debbarma', 'Female', '2013-09-01', 2, 1),
(29, 'Madhab Reang', 'Male', '2013-11-04', 2, 1),
(30, 'Malati Reang', 'Female', '2013-01-07', 2, 1),
(31, 'Milan Reang', 'Male', '2012-03-10', 3, 1),
(32, 'Namita Reang', 'Female', '2012-05-13', 3, 1),
(33, 'Nayan Reang', 'Male', '2012-07-16', 3, 1),
(34, 'Purnima Reang', 'Female', '2012-09-19', 3, 1),
(35, 'Prasenjit Reang', 'Male', '2012-11-22', 3, 1),
(36, 'Rina Reang', 'Female', '2012-01-25', 3, 1),
(37, 'Rajib Reang', 'Male', '2012-03-28', 3, 1),
(38, 'Rima Reang', 'Female', '2012-05-03', 3, 1),
(39, 'Ratan Reang', 'Male', '2012-07-06', 3, 1),
(40, 'Sanchita Reang', 'Female', '2012-09-09', 3, 1),
(41, 'Ritwick Reang', 'Male', '2012-11-12', 3, 1),
(42, 'Tanushree Reang', 'Female', '2012-01-15', 3, 1),
(43, 'Sajal Reang', 'Male', '2012-03-18', 3, 1),
(44, 'Urmila Reang', 'Female', '2012-05-21', 3, 1),
(45, 'Samiran Reang', 'Male', '2012-07-24', 3, 1),
(46, 'Varsha Reang', 'Female', '2012-09-27', 4, 1),
(47, 'Subal Reang', 'Male', '2012-11-02', 4, 1),
(48, 'Mousumi Reang', 'Female', '2012-01-05', 4, 1),
(49, 'Suman Chakma', 'Male', '2012-03-08', 4, 1),
(50, 'Ranjita Chakma', 'Female', '2012-05-11', 4, 1),
(51, 'Tarun Chakma', 'Male', '2012-07-14', 4, 1),
(52, 'Sharmila Chakma', 'Female', '2012-09-17', 4, 1),
(53, 'Udayan Chakma', 'Male', '2012-11-20', 4, 1),
(54, 'Tripti Chakma', 'Female', '2012-01-23', 4, 1),
(55, 'Vikram Chakma', 'Male', '2012-03-26', 4, 1),
(56, 'Monalisa Chakma', 'Female', '2012-05-01', 4, 1),
(57, 'Abhijit Chakma', 'Male', '2012-07-04', 4, 1),
(58, 'Papia Chakma', 'Female', '2012-09-07', 4, 1),
(59, 'Soumik Chakma', 'Male', '2012-11-10', 4, 1),
(60, 'Soma Chakma', 'Female', '2012-01-13', 4, 1),
(61, 'Arindam Chakma', 'Male', '2011-03-16', 5, 1),
(62, 'Ankita Chakma', 'Female', '2011-05-19', 5, 1),
(63, 'Kaushik Chakma', 'Male', '2011-07-22', 5, 1),
(64, 'Anima Chakma', 'Female', '2011-09-25', 5, 1),
(65, 'Bikash Jamatia', 'Male', '2011-11-28', 5, 1),
(66, 'Bina Jamatia', 'Female', '2011-01-03', 5, 1),
(67, 'Bimal Jamatia', 'Male', '2011-03-06', 5, 1),
(68, 'Chandrima Jamatia', 'Female', '2011-05-09', 5, 1),
(69, 'Bijoy Jamatia', 'Male', '2011-07-12', 5, 1),
(70, 'Debjani Jamatia', 'Female', '2011-09-15', 5, 1),
(71, 'Chandan Jamatia', 'Male', '2011-11-18', 5, 1),
(72, 'Dipali Jamatia', 'Female', '2011-01-21', 5, 1),
(73, 'Debojit Jamatia', 'Male', '2011-03-24', 5, 1),
(74, 'Esha Jamatia', 'Female', '2011-05-27', 5, 1),
(75, 'Dipankar Jamatia', 'Male', '2011-07-02', 5, 1),
(76, 'Falguni Jamatia', 'Female', '2011-09-05', 6, 1),
(77, 'Gautam Jamatia', 'Male', '2011-11-08', 6, 1),
(78, 'Gitali Jamatia', 'Female', '2011-01-11', 6, 1),
(79, 'Harendra Tripura', 'Male', '2011-03-14', 6, 1),
(80, 'Hena Tripura', 'Female', '2011-05-17', 6, 1),
(81, 'Indrajit Tripura', 'Male', '2011-07-20', 6, 1),
(82, 'Indrani Tripura', 'Female', '2011-09-23', 6, 1),
(83, 'Joydeb Tripura', 'Male', '2011-11-26', 6, 1),
(84, 'Jharna Tripura', 'Female', '2011-01-01', 6, 1),
(85, 'Kamal Tripura', 'Male', '2011-03-04', 6, 1),
(86, 'Kalpana Tripura', 'Female', '2011-05-07', 6, 1),
(87, 'Lalit Tripura', 'Male', '2011-07-10', 6, 1),
(88, 'Laxmi Tripura', 'Female', '2011-09-13', 6, 1),
(89, 'Madhab Tripura', 'Male', '2011-11-16', 6, 1),
(90, 'Malati Tripura', 'Female', '2011-01-19', 6, 1),
(91, 'Milan Molsom', 'Male', '2010-03-22', 7, 1),
(92, 'Namita Molsom', 'Female', '2010-05-25', 7, 1),
(93, 'Nayan Molsom', 'Male', '2010-07-28', 7, 1),
(94, 'Purnima Molsom', 'Female', '2010-09-03', 7, 1),
(95, 'Prasenjit Molsom', 'Male', '2010-11-06', 7, 1),
(96, 'Rina Molsom', 'Female', '2010-01-09', 7, 1),
(97, 'Rajib Molsom', 'Male', '2010-03-12', 7, 1),
(98, 'Rima Molsom', 'Female', '2010-05-15', 7, 1),
(99, 'Ratan Molsom', 'Male', '2010-07-18', 7, 1),
(100, 'Sanchita Molsom', 'Female', '2010-09-21', 7, 1),
(101, 'Ritwick Koloi', 'Male', '2010-11-24', 7, 1),
(102, 'Tanushree Koloi', 'Female', '2010-01-27', 7, 1),
(103, 'Sajal Koloi', 'Male', '2010-03-02', 7, 1),
(104, 'Urmila Koloi', 'Female', '2010-05-05', 7, 1),
(105, 'Samiran Koloi', 'Male', '2010-07-08', 7, 1),
(106, 'Varsha Koloi', 'Female', '2010-09-11', 8, 1),
(107, 'Subal Koloi', 'Male', '2010-11-14', 8, 1),
(108, 'Mousumi Koloi', 'Female', '2010-01-17', 8, 1),
(109, 'Suman Murasing', 'Male', '2010-03-20', 8, 1),
(110, 'Ranjita Murasing', 'Female', '2010-05-23', 8, 1),
(111, 'Tarun Murasing', 'Male', '2010-07-26', 8, 1),
(112, 'Sharmila Murasing', 'Female', '2010-09-01', 8, 1),
(113, 'Udayan Murasing', 'Male', '2010-11-04', 8, 1),
(114, 'Tripti Murasing', 'Female', '2010-01-07', 8, 1),
(115, 'Vikram Uchoi', 'Male', '2010-03-10', 8, 1),
(116, 'Monalisa Uchoi', 'Female', '2010-05-13', 8, 1),
(117, 'Abhijit Uchoi', 'Male', '2010-07-16', 8, 1),
(118, 'Papia Uchoi', 'Female', '2010-09-19', 8, 1),
(119, 'Soumik Uchoi', 'Male', '2010-11-22', 8, 1),
(120, 'Soma Noatia', 'Female', '2010-01-25', 8, 1),
(121, 'Arindam Noatia', 'Male', '2009-03-28', 9, 1),
(122, 'Ankita Noatia', 'Female', '2009-05-03', 9, 1),
(123, 'Kaushik Noatia', 'Male', '2009-07-06', 9, 1),
(124, 'Anima Das', 'Female', '2009-09-09', 9, 1),
(125, 'Bikash Dey', 'Male', '2009-11-12', 9, 1),
(126, 'Bina Saha', 'Female', '2009-01-15', 9, 1),
(127, 'Bimal Debnath', 'Male', '2009-03-18', 9, 1),
(128, 'Chandrima Bhowmik', 'Female', '2009-05-21', 9, 1),
(129, 'Bijoy Roy', 'Male', '2009-07-24', 9, 1),
(130, 'Debjani Pal', 'Female', '2009-09-27', 9, 1),
(131, 'Chandan Majumder', 'Male', '2009-11-02', 9, 1),
(132, 'Dipali Shil', 'Female', '2009-01-05', 9, 1),
(133, 'Debojit Das', 'Male', '2009-03-08', 9, 1),
(134, 'Esha Dey', 'Female', '2009-05-11', 9, 1),
(135, 'Dipankar Saha', 'Male', '2009-07-14', 9, 1),
(136, 'Falguni Debnath', 'Female', '2009-09-17', 10, 1),
(137, 'Gautam Bhowmik', 'Male', '2009-11-20', 10, 1),
(138, 'Gitali Roy', 'Female', '2009-01-23', 10, 1),
(139, 'Harendra Pal', 'Male', '2009-03-26', 10, 1),
(140, 'Hena Majumder', 'Female', '2009-05-01', 10, 1),
(141, 'Indrajit Shil', 'Male', '2009-07-04', 10, 1),
(142, 'Indrani Das', 'Female', '2009-09-07', 10, 1),
(143, 'Joydeb Dey', 'Male', '2009-11-10', 10, 1),
(144, 'Jharna Saha', 'Female', '2009-01-13', 10, 1),
(145, 'Kamal Debnath', 'Male', '2009-03-16', 10, 1),
(146, 'Kalpana Bhowmik', 'Female', '2009-05-19', 10, 1),
(147, 'Lalit Roy', 'Male', '2009-07-22', 10, 1),
(148, 'Laxmi Pal', 'Female', '2009-09-25', 10, 1),
(149, 'Madhab Majumder', 'Male', '2009-11-28', 10, 1),
(150, 'Malati Shil', 'Female', '2009-01-03', 10, 1);


-- 1. Show all students with class names
SELECT s.student_id, s.student_name, c.class_name, s.gender
FROM Student s
JOIN Class_Section c ON s.class_id = c.class_id
ORDER BY c.class_name, s.student_name;

-- 2. Show subjects and their teachers
SELECT sub.subject_name, t.teacher_name, t.gender
FROM Subject sub
JOIN Teacher t ON sub.teacher_id = t.teacher_id
ORDER BY sub.subject_name;

-- 3. Count students by class
SELECT c.class_name, COUNT(*) AS total_students
FROM Student s
JOIN Class_Section c ON s.class_id = c.class_id
GROUP BY c.class_name
ORDER BY c.class_name;

-- 4. Show all teachers and students of a school
SELECT si.school_name, t.teacher_name, NULL AS student_name
FROM School_Info si
JOIN Teacher t ON t.school_id = si.school_id
UNION ALL
SELECT si.school_name, NULL, s.student_name
FROM School_Info si
JOIN Student s ON s.school_id = si.school_id
ORDER BY school_name;
