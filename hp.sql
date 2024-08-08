
CREATE DATABASE IF NOT EXISTS HarryPotterDB;

use HarryPotterDB;

CREATE TABLE IF NOT EXISTS Students (
    StudentID INT AUTO_INCREMENT PRIMARY KEY,
    StudentName VARCHAR(100) NOT NULL,
    BirthDate DATE NOT NULL,
    Gender ENUM('Male', 'Female', 'Other') NOT NULL,
    HouseID INT
);

CREATE TABLE IF NOT EXISTS Houses (
    HouseID INT AUTO_INCREMENT PRIMARY KEY,
    HouseName VARCHAR(50) NOT NULL UNIQUE,
    HeadOfHouse VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS Professors (
    ProfessorID INT AUTO_INCREMENT PRIMARY KEY,
    ProfessorName VARCHAR(100) NOT NULL,
    Subject VARCHAR(100) NOT NULL,
    HireDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE IF NOT EXISTS Classes (
    ClassID INT AUTO_INCREMENT PRIMARY KEY,
    ClassName VARCHAR(100) NOT NULL,
    ProfessorID INT,
    FOREIGN KEY (ProfessorID) REFERENCES Professors(ProfessorID) ON DELETE CASCADE ON UPDATE CASCADE
);


CREATE TABLE IF NOT EXISTS Enrollments (
    EnrollmentID INT AUTO_INCREMENT PRIMARY KEY,
    StudentID INT,
    ClassID INT,
    EnrollmentDate DATE NOT NULL,
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (ClassID) REFERENCES Classes(ClassID) ON DELETE CASCADE ON UPDATE CASCADE
);


CREATE TABLE IF NOT EXISTS HeadOfHouses (
    HeadID INT AUTO_INCREMENT PRIMARY KEY,
    HouseID INT,
    ProfessorID INT,
    FOREIGN KEY (HouseID) REFERENCES Houses(HouseID) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (ProfessorID) REFERENCES Professors(ProfessorID) ON DELETE CASCADE ON UPDATE CASCADE
);



INSERT INTO Houses (HouseName, HeadOfHouse) VALUES
('Gryffindor', 'Minerva McGonagall'),
('Hufflepuff', 'Pomona Sprout'),
('Ravenclaw', 'Filius Flitwick'),
('Slytherin', 'Severus Snape');




INSERT INTO Students (StudentName, BirthDate, Gender, HouseID) VALUES
('Harry Potter', '1980-07-31', 'Male', 1),
('Hermione Granger', '1979-09-19', 'Female', 1),
('Ron Weasley', '1980-03-01', 'Male', 1),
('Draco Malfoy', '1980-06-05', 'Male', 4),
('Luna Lovegood', '1981-02-13', 'Female', 3);



INSERT INTO Professors (ProfessorName, Subject) VALUES
('Minerva McGonagall', 'Transfiguration'),
('Severus Snape', 'Potions'),
('Remus Lupin', 'Defense Against the Dark Arts'),
('Filius Flitwick', 'Charms');

INSERT INTO Classes (ClassName, ProfessorID) VALUES
('Transfiguration', 1),
('Potions', 2),
('Defense Against the Dark Arts', 3),
('Charms', 4);


INSERT INTO Enrollments (StudentID, ClassID, EnrollmentDate) VALUES
(1, 1, '1991-09-01'),
(1, 2, '1991-09-01'),
(1, 3, '1991-09-01'),
(2, 1, '1991-09-01'),
(2, 4, '1991-09-01'),
(3, 1, '1991-09-01'),
(3, 2, '1991-09-01'),
(4, 2, '1991-09-01'),
(4, 3, '1991-09-01'),
(5, 4, '1991-09-01');

INSERT INTO HeadOfHouses (HouseID, ProfessorID) VALUES
(1, 1),
(2, 2),
(3, 4),
(4, 3);



select * from Enrollments;

select * from classes;


DELETE FROM Classes WHERE ClassID = 2;

INSERT INTO Classes (ClassID, ClassName, ProfessorID) VALUES (2, 'Potions', 2);
INSERT INTO Enrollments (StudentID, ClassID, EnrollmentDate) VALUES (1, 2, '1991-09-01');
INSERT INTO Enrollments (StudentID, ClassID, EnrollmentDate) VALUES (3, 2, '1991-09-01');
INSERT INTO Enrollments (StudentID, ClassID, EnrollmentDate) VALUES (4, 2, '1991-09-01');
INSERT INTO Enrollments (StudentID, ClassID, EnrollmentDate) VALUES (2, 2, '1991-09-01');


DELETE FROM Students WHERE StudentID = 1;

INSERT INTO Students (StudentID, StudentName, BirthDate, Gender, HouseID) VALUES (1, 'Harry Potter', '1980-07-31', 'Male', 1);
INSERT INTO Enrollments (StudentID, ClassID, EnrollmentDate) VALUES (1, 1, '1991-09-01');
INSERT INTO Enrollments (StudentID, ClassID, EnrollmentDate) VALUES (1, 4, '1991-09-01');
INSERT INTO Enrollments (StudentID, ClassID, EnrollmentDate) VALUES (1, 3, '1991-09-01');


UPDATE Classes SET ClassID = 5 WHERE ClassID = 2;
