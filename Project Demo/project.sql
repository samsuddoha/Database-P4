-- Creating Tables

CREATE TABLE eligibility (
    eligible_id INT PRIMARY KEY,
    level VARCHAR(50),
    age INT,
    education_background VARCHAR(100),
    laptop BOOLEAN,
    prerequisites TEXT
);

CREATE TABLE program (
    program_id INT PRIMARY KEY,
    eligible_id INT,
    name VARCHAR(100),
    credit INT,
    level VARCHAR(50),
    duration INT,
    syllabus TEXT,
    FOREIGN KEY (eligible_id) REFERENCES eligibility(eligible_id)
);

CREATE TABLE centre (
    centre_id INT PRIMARY KEY,
    name VARCHAR(100),
    contact VARCHAR(15),
    address TEXT
);

CREATE TABLE student (
    student_id INT PRIMARY KEY,
    centre_id INT,
    program_id INT,
    name VARCHAR(100),
    gender VARCHAR(10),
    phone VARCHAR(15),
    email VARCHAR(100),
    dob DATE,
    registration_no VARCHAR(50),
    roll VARCHAR(50),
    batch VARCHAR(50),
    session VARCHAR(50),
    year INT,
    FOREIGN KEY (centre_id) REFERENCES centre(centre_id),
    FOREIGN KEY (program_id) REFERENCES program(program_id)
);

CREATE TABLE exam (
    exam_id INT PRIMARY KEY,
    exam_name VARCHAR(100),
    total_marks INT,
    obtained_marks INT,
    exam_date DATE,
    student_id INT,
    FOREIGN KEY (student_id) REFERENCES student(student_id)
);

CREATE TABLE instructor (
    instructor_id INT PRIMARY KEY,
    name VARCHAR(100),
    phone VARCHAR(15),
    expertise_on TEXT,
    address TEXT,
    designation VARCHAR(50)
);

CREATE TABLE program_instructor (
    pi_id INT PRIMARY KEY,
    instructor_id INT,
    program_id INT,
    FOREIGN KEY (instructor_id) REFERENCES instructor(instructor_id),
    FOREIGN KEY (program_id) REFERENCES program(program_id)
);

CREATE TABLE batch (
    batch_id INT PRIMARY KEY,
    instructor_id INT,
    name VARCHAR(50),
    capacity INT,
    FOREIGN KEY (instructor_id) REFERENCES instructor(instructor_id)
);

CREATE TABLE routine (
    routine_id INT PRIMARY KEY,
    batch_id INT,
    time TIME,
    day VARCHAR(20),
    FOREIGN KEY (batch_id) REFERENCES batch(batch_id)
);

CREATE TABLE room (
    room_id INT PRIMARY KEY,
    name VARCHAR(50),
    floor INT,
    room_number VARCHAR(20)
);

CREATE TABLE allocate_room (
    ar_id INT PRIMARY KEY,
    batch_id INT,
    room_id INT,
    FOREIGN KEY (batch_id) REFERENCES batch(batch_id),
    FOREIGN KEY (room_id) REFERENCES room(room_id)
);

CREATE TABLE circular (
    circular_id INT PRIMARY KEY,
    title VARCHAR(100),
    description TEXT,
    publish_date DATE,
    deadline DATE
);

CREATE TABLE notice (
    notice_id INT PRIMARY KEY,
    title VARCHAR(100),
    description TEXT,
    publishing_date DATE,
    attachments TEXT
);

-- Inserting Sample Data

INSERT INTO eligibility VALUES
(1, 'Undergraduate', 18, 'High School Diploma', TRUE, 'Basic Computer Knowledge'),
(2, 'Postgraduate', 22, 'Bachelor's Degree', TRUE, 'Programming Basics');

INSERT INTO program VALUES
(1, 1, 'Computer Science', 120, 'Undergraduate', 48, 'CS Syllabus Details'),
(2, 2, 'Data Science', 36, 'Postgraduate', 24, 'DS Syllabus Details');

INSERT INTO centre VALUES
(1, 'Main Campus', '1234567890', '123 University Road'),
(2, 'City Campus', '0987654321', '456 Downtown Street');

INSERT INTO student VALUES
(1, 1, 1, 'John Doe', 'Male', '1234567890', 'john@example.com', '2005-04-10', 'REG12345', 'ROLL123', 'Batch A', '2024-2025', 2024),
(2, 2, 2, 'Jane Smith', 'Female', '0987654321', 'jane@example.com', '2000-08-15', 'REG54321', 'ROLL543', 'Batch B', '2023-2024', 2023);

INSERT INTO exam VALUES
(1, 'Midterm', 100, 85, '2024-05-20', 1),
(2, 'Final', 100, 90, '2024-12-15', 2);

INSERT INTO instructor VALUES
(1, 'Dr. Alan Turing', '1122334455', 'Artificial Intelligence', '123 University Road', 'Professor'),
(2, 'Dr. Ada Lovelace', '6677889900', 'Data Science', '456 Downtown Street', 'Assistant Professor');

INSERT INTO program_instructor VALUES
(1, 1, 1),
(2, 2, 2);

INSERT INTO batch VALUES
(1, 1, 'Batch A', 30),
(2, 2, 'Batch B', 25);

INSERT INTO routine VALUES
(1, 1, '09:00:00', 'Monday'),
(2, 2, '11:00:00', 'Tuesday');

INSERT INTO room VALUES
(1, 'Room A', 1, '101'),
(2, 'Room B', 2, '202');

INSERT INTO allocate_room VALUES
(1, 1, 1),
(2, 2, 2);

INSERT INTO circular VALUES
(1, 'Admissions Open', 'Details about admissions', '2025-01-01', '2025-02-01'),
(2, 'Scholarship Announcement', 'Details about scholarships', '2025-01-10', '2025-03-01');

INSERT INTO notice VALUES
(1, 'Exam Schedule', 'Details about upcoming exams', '2025-01-15', 'attachment1.pdf'),
(2, 'Holiday Notice', 'Details about holidays', '2025-01-20', 'attachment2.pdf');
