drop database ComputingForFree;
create database ComputingForFree;
use ComputingForFree;

create table Student(
studentID char(6) primary key,
firstName varchar(20),
lastName varchar(20),
dateOfBirth date 
)engine InnoDB;

create table Course(
courseID char(6) primary key,
courseName varchar(30)
)engine InnoDB;

create table Enrolment(
enrolID char(6) primary key,
studentID char(6),
courseID char(6),
foreign key(studentID) references Student(studentID),
foreign key(courseID) references Course(courseID)
)engine InnoDB;

-- Session is reserved word
create table LearningSession(
sessionID char(8) primary key,
sessionTime time,
sessionDate date
)engine InnoDB;

create table Booking(
bookingID char(8) primary key,
enrolID char(6),
sessionID char(8),
foreign key(enrolID) references Enrolment(enrolID),
foreign key(sessionID) references LearningSession(sessionID)
)engine InnoDB;

create table Note(
bookingID char(8),
foreign key(bookingID) references Booking(bookingID),
primary key(bookingID),
wasAttended boolean
)engine InnoDB;

create table Attendance(
enrolID char(6),
sessionID char(8),
foreign key(enrolID) references Enrolment(enrolID),
foreign key(sessionID) references LearningSession(sessionID),
primary key(enrolID, sessionID)
) engine InnoDB;

create table Branch(
branchID char(4) primary key,
branchName varchar(25),
sessionID char(8),
foreign key(sessionID) references LearningSession(sessionID)
)engine InnoDB;