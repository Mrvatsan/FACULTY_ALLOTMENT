-- ===============================
-- DATABASE CREATION
-- ===============================
CREATE DATABASE IF NOT EXISTS exam_management;
USE exam_management;

-- ===============================
-- FACULTY MASTER TABLE (FROM YOUR EXCEL)
-- ===============================
CREATE TABLE faculty (
    faculty_id VARCHAR(10) PRIMARY KEY,      -- F001, F002...
    faculty_name VARCHAR(100) NOT NULL,
    department VARCHAR(50) NOT NULL,
    designation ENUM('HOD', 'Associate Professor', 'Assistant Professor') NOT NULL,
    year_handling VARCHAR(20),               -- 1,2,3,4
    subject_1 VARCHAR(100),
    subject_2 VARCHAR(100),
    subject_3 VARCHAR(100),
    is_available BOOLEAN DEFAULT TRUE
);

-- ===============================
-- EXAM SCHEDULE TABLE
-- ===============================
CREATE TABLE exam_schedule (
    exam_id INT AUTO_INCREMENT PRIMARY KEY,
    exam_type ENUM('Semester', 'Internal') NOT NULL,
    exam_date DATE NOT NULL,
    session ENUM('Forenoon', 'Afternoon') NOT NULL,
    course_id VARCHAR(30) NOT NULL
);

-- ===============================
-- HALL & COURSE MAPPING
-- (Multiple courses per hall supported)
-- ===============================
CREATE TABLE hall_allocation (
    id INT AUTO_INCREMENT PRIMARY KEY,
    hall_id INT NOT NULL,
    course_id VARCHAR(30) NOT NULL,
    exam_date DATE NOT NULL,
    session ENUM('Forenoon', 'Afternoon') NOT NULL
);

-- ===============================
-- FINAL INVIGILATOR ALLOCATION
-- ===============================
CREATE TABLE invigilator_allocation (
    allocation_id INT AUTO_INCREMENT PRIMARY KEY,
    faculty_id VARCHAR(10),
    hall_id INT,
    exam_date DATE,
    session ENUM('Forenoon', 'Afternoon'),
    exam_type ENUM('Semester', 'Internal'),
    FOREIGN KEY (faculty_id) REFERENCES faculty(faculty_id)
);

-- ===============================
-- FACULTY EMERGENCY AVAILABILITY
-- ===============================
CREATE TABLE faculty_availability (
    id INT AUTO_INCREMENT PRIMARY KEY,
    faculty_id VARCHAR(10),
    unavailable_date DATE,
    reason VARCHAR(200),
    FOREIGN KEY (faculty_id) REFERENCES faculty(faculty_id)
);

-- ===============================
-- SUBSTITUTE FACULTY POOL (10 RESERVED)
-- ===============================
CREATE TABLE substitute_faculty (
    faculty_id VARCHAR(10) PRIMARY KEY,
    is_reserved BOOLEAN DEFAULT TRUE,
    FOREIGN KEY (faculty_id) REFERENCES faculty(faculty_id)
);