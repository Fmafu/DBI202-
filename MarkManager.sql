

CREATE TABLE HomeTown(
	HomeTownID INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	HomeTownName NVARCHAR(30) NOT NULL
)
CREATE TABLE Major(
	MajorID VARCHAR(10) NOT NULL PRIMARY KEY,
	MajorName NVARCHAR(55) NOT NULL,
)

CREATE TABLE Student(
	StudentID VARCHAR(25) NOT NULL PRIMARY KEY,
	
	StudentFirstName NVARCHAR(30) NOT NULL,
	StudentLastName NVARCHAR(30) NOT NULL,
	BirthDay DATE NOT NULL,
	Sex BIT NOT NULL,
	MajorID VARCHAR(10) NOT NULL FOREIGN KEY REFERENCES Major(MajorID),
	ContacMail VARCHAR(70) NOT NULL,
	HomeTownID INT NOT NULL FOREIGN KEY REFERENCES HomeTown(HomeTownID),	
)


CREATE TABLE Lecture(
	LectureID VARCHAR(25) NOT NULL PRIMARY KEY,
	LectureFirstName NVARCHAR(30) NOT NULL,
	LectureLastName NVARCHAR(30) NOT NULL,
	BirthDay DATE,
	Sex BIT NOT NULL,
	ContacMail VARCHAR(70) NOT NULL,
	HomeTownID INT NOT NULL FOREIGN KEY REFERENCES HomeTown(HomeTownID),
)

CREATE TABLE DEPARTMENT(
	DepartmentID VARCHAR(50) NOT NULL PRIMARY KEY,
	DepartmentName VARCHAR(70) NOT NULL,
)

CREATE TABLE Course(
	CourseID VARCHAR(15) NOT NULL PRIMARY KEY,
	CourseName VARCHAR(70) NOT NULL,
	[Number of sessions] INT NOT NULL,
	Department VARCHAR(50) NOT NULL FOREIGN KEY REFERENCES DEPARTMENT(DepartmentID),
	Semester VARCHAR(15) NOT NULL,
)

CREATE TABLE [Group](
	GroupID varchar(15) not null primary key,
	CourseID VARCHAR(15) NOT NULL FOREIGN KEY REFERENCES Course(CourseID),
	LectureID VARCHAR(25) NOT NULL FOREIGN KEY REFERENCES Lecture(LectureID),

)

CREATE TABLE StudentGroup(
	GroupID VARCHAR(15) NOT NULL FOREIGN KEY REFERENCES [Group](GroupID),
	StudentID VARCHAR(25) NOT NULL FOREIGN KEY REFERENCES Student(StudentID),
	
	CONSTRAINT pk_StudentID_CourseID_GroupID PRIMARY KEY (GroupID,StudentID),
	EnrolledDate DATE NOT NULL,
)



CREATE TABLE Element(
	Category VARCHAR(40) NOT NULL PRIMARY KEY,
	CourseID VARCHAR(15) NOT NULL FOREIGN KEY REFERENCES Course(CourseID),
	StartDate DATE NOT NULL,
	EndDate DATE NOT NULL,
)

CREATE TABLE Assessment(
	AssessmentID INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	Category VARCHAR(40) NOT NULL FOREIGN KEY REFERENCES Element(Category),
	[Type] NVARCHAR(15) NOT NULL,
	Part INT NOT NULL,
	[Weight] Float check([Weight]<=1 and [Weight]>0) NOT NULL,
	[Completion Criteria] INT NOT NULL,
	[No Question] INT,
	
)


CREATE TABLE Process(
	StudentID VARCHAR(25) NOT NULL FOREIGN KEY REFERENCES Student(StudentID),
	Category VARCHAR(40) NOT NULL FOREIGN KEY REFERENCES Element(Category),
	CONSTRAINT pk_StudentID_Category PRIMARY KEY (StudentID,Category),
	SubmisstionStatus BIT NOT NULL,
)



CREATE TABLE Result(
	StudentID VARCHAR(25) NOT NULL FOREIGN KEY REFERENCES Student(StudentID),
	AssessmentID INT NOT NULL FOREIGN KEY REFERENCES Assessment(AssessmentID),
	CONSTRAINT pk_OutputID_Graded_by_AssessmentID PRIMARY KEY (StudentID,AssessmentID),
	[Day of publication] DATE NOT NULL,
	Mark FLOAT,
	[Status] BIT,
)


--insert data

--1. insert major
insert into Major values 
('SE','Software Engineering'),
('AI','Artificial Intelligence'),
('IA','IA'),
('GA','Graphic Design'),
('EN','English'),
('JN','Japanese')

--2.insert HomeTown
insert into HomeTown values
('An Giang'),
('Bà rịa – Vũng tàu'),
('Bắc Giang'),
('Bắc Kạn'),
('Bạc Liêu'),
('Bắc Ninh'),
('Bến Tre'),
('Bình Định'),
('Bình Dương'),
('Bình Phước'),
('Bình Thuận'),
('Cà Mau'),
('Cần Thơ'),
('Cao Bằng '),
('Đà Nẵng'),
('Đắk Lắk'),
('Đắk Nông'),
('Điện Biên'),
('Đồng Nai'),
('Đồng Tháp'),
('Gia Lai'),
('Hà Giang'),
('Hà Nam'),
('Hà Nội '),
('Hà Tĩnh'),
('Hải Phòng'),
('Hậu Giang'),
('Hòa Bình'),
('Hưng Yên'),
('Khánh Hòa'),
('Kiên Giang'),
('Kon Tum'),
('Lai Châu'),
('Lâm Đồng'),
('Lạng Sơn'),
('Lào Cai'),
('Long An'),
('Nam Định'),
('Nghệ An'),
('Ninh Bình'),
('Ninh Thuận'),
('Phú Thọ'),
('Phú Yên'),
('Quảng Bình'),
('Quảng Nam'),
('Quảng Ngãi'),
('Quảng Ninh'),
('Quảng Trị'),
('Sóc Trăng'),
('Sơn La'),
('Tây Ninh'),
('Thái Bình'),
('Thái Nguyên'),
('Thanh Hóa'),
('Thừa Thiên Huế'),
('Tiền Giang'),
('Thành phố Hồ Chí Minh'),
('Trà Vinh'),
('Tuyên Quang'),
('Vĩnh Long'),
('Vĩnh Phúc'),
('Yên Bái')

--3 INSERT STUDENT
insert into Student values 
('HE161106',N'Chau Ngoc','Duc','2002-09-17',1,'SE','HE161106@fpt.edu.vn',10),
('HE160136',N'Do Van','Chung','2002-01-15',1,N'IA','HE160136@fpt.edu.vn',15),
('HE160307',N'Nguyen Van','Duc','2002-05-03',1,N'IA','ducvnhe160307@fpt.edu.vn',20),
('HE160318',N'Le Viet','Anh','2002-06-10',1,N'IA','anhvlhe160318@fpt.edu.vn',25),
('HE161198',N'Nguyen Nhat','Huy','2002-05-27',1,N'IA','HE161198@fpt.edu.vn',30),
('HE160594',N'Ha Manh','Dat','2002-01-1',1,N'IA','HE160594@fpt.edu.vn',35),
('HE161665',N'Tran Thi Thanh','Tam','2002-08-08',0,N'IA','HE161665@fpt.edu.vn',40),
('HE161890',N'Nguyen Doanh','Thinh','2002-09-06',1,N'IA','HE161890@fpt.edu.vn',45),
('HE163693',N'Dao Vu','Hiep','2002-12-10',1,N'IA','HE163693@fpt.edu.vn',50),
('HE163581',N'Nguyen Van','Vuong','2002-11-11',1,'AI','vuongvnhe163581@fpt.edu.vn',55)


--4 insert leture
INSERT INTO Lecture
VALUES
('annt79',N'Nguyen Tan','An','2013-09-20',1,'annt79@fpt.edu.vn',10),
('sonnt5',N'Ngo Tung','Son','2009-01-01',1,'sonnt69@fe.edu.vn',20),
('NangNTH',N'Nguyen Thi Hai','Nang','2010-11-11',0,'NangNTH@fe.edu.vn',30),
('vandt',N'Do Thi','Van','2016-12-09',0,'vandt4@fe.edu.vn',40),
('TungHT22',N'Hoang Thanh','Tung','2019-04-28',1,'TungHT22@fe.edu.vn',50),
('bantq6969',N'Tran Quy','Ban','2010-01-25',1,'bantq6969@fpt.edu.vn',60),
('DucHM29',N'Hoang Manh','Duc','2007-10-9',1,'DucHM29@fe.edu.vn',15)

--5. INSERT DEPARTMENT
INSERT INTO DEPARTMENT
VALUES
('BA','Business Administration'),
('IT','Information Technology'),
('LA','Languages')

SELECT * FROM DEPARTMENT
--6 INSERT COURSE

INSERT INTO Course
VALUES 
('CSD201',N'Data Structures and Algorithms',30,'IT',3),
('DBI202',N'Introduction to Database systems',30,'IT',3),
('JPD113',N'Elementary Japanese',30,'LA',3),
('LAB211',N'Object Oriented Programming practices with JAVA',30,'IT',3),
('WED201c',N'Web design',5,'IT',3),
('IAO202','Introduction to Information Assurance',30,'IT',3)


--7 INSERT GROUP
SELECT * FROM [Group]
INSERT INTO [Group]
VALUES 
('IA1604_CSD201','CSD201','annt79'),
('IA1604_DBI202','DBI202','sonnt5'),
('IA1604_JPD113','JPD113','vandt'),
('IA1604_LAB211','LAB211','NangNTH'),
('IA1604_IAO202','IAO202','DucHM29')

--8 insert studentGroup

INSERT INTO StudentGroup
VALUES
--CSD
('IA1604_CSD201','HE160318','2022-05-09'),
('IA1604_CSD201','HE160136','2022-05-09'),
('IA1604_CSD201','HE160594','2022-05-09'),
('IA1604_CSD201','HE161106','2022-05-09'),
('IA1604_CSD201','HE160307','2022-05-09'),
('IA1604_CSD201','HE163693','2022-05-09'),
('IA1604_CSD201','HE161198','2022-05-09'),
('IA1604_CSD201','HE161665','2022-05-09'),
('IA1604_CSD201','HE161890','2022-05-09'),
('IA1604_CSD201','HE163581','2022-05-09'),
--DBI
('IA1604_DBI202','HE160318','2022-05-10'),
('IA1604_DBI202','HE160136','2022-05-10'),
('IA1604_DBI202','HE160594','2022-05-10'),
('IA1604_DBI202','HE161106','2022-05-10'),
('IA1604_DBI202','HE160307','2022-05-10'),
('IA1604_DBI202','HE163693','2022-05-10'),
('IA1604_DBI202','HE161198','2022-05-10'),
('IA1604_DBI202','HE161665','2022-05-10'),
('IA1604_DBI202','HE161890','2022-05-10'),
('IA1604_DBI202','HE163581','2022-05-10'),
--JPD
('IA1604_JPD113','HE160318','2022-05-10'),
('IA1604_JPD113','HE160136','2022-05-10'),
('IA1604_JPD113','HE160594','2022-05-10'),
('IA1604_JPD113','HE161106','2022-05-10'),
('IA1604_JPD113','HE160307','2022-05-10'),
('IA1604_JPD113','HE163693','2022-05-10'),
('IA1604_JPD113','HE161198','2022-05-10'),
('IA1604_JPD113','HE161665','2022-05-10'),
('IA1604_JPD113','HE161890','2022-05-10'),
('IA1604_JPD113','HE163581','2022-05-10'),
--LAB
('IA1604_LAB211','HE160318','2022-05-09'),
('IA1604_LAB211','HE160136','2022-05-09'),
('IA1604_LAB211','HE160594','2022-05-09'),
('IA1604_LAB211','HE161106','2022-05-09'),
('IA1604_LAB211','HE160307','2022-05-09'),
('IA1604_LAB211','HE163693','2022-05-09'),
('IA1604_LAB211','HE161198','2022-05-09'),
('IA1604_LAB211','HE161665','2022-05-09'),
('IA1604_LAB211','HE161890','2022-05-09'),
('IA1604_LAB211','HE163581','2022-05-09'),
--IAO
('IA1604_IAO202','HE160318','2022-05-10'),
('IA1604_IAO202','HE160136','2022-05-10'),
('IA1604_IAO202','HE160594','2022-05-10'),
('IA1604_IAO202','HE161106','2022-05-10'),
('IA1604_IAO202','HE160307','2022-05-10'),
('IA1604_IAO202','HE163693','2022-05-10'),
('IA1604_IAO202','HE161198','2022-05-10'),
('IA1604_IAO202','HE161665','2022-05-10'),
('IA1604_IAO202','HE161890','2022-05-10'),
('IA1604_IAO202','HE163581','2022-05-10')

--8 INSERT ELEMENT
INSERT INTO Element
VALUES
(N'CSD201_pt','CSD201','2022-05-18','2022-06-18'),
(N'CSD201_as','CSD201','2022-05-25','2022-06-23'),
(N'CSD201_pe','CSD201','2022-07-16','2022-07-16'),
(N'CSD201_fe','CSD201','2022-08-02','2022-08-02'),
--dbi
(N'DBI202_as','DBI202','2022-07-08','2022-08-02'),
(N'DBI202_lab','DBI202','2022-05-18','2022-06-18'),
(N'DBI202_pt','DBI202','2022-05-23','2022-06-21'),
(N'DBI202_pe','DBI202','2022-07-23','2022-07-23'),
(N'DBI202_fe','DBI202','2022-08-01','2022-08-01'),
--jpd
(N'JPD113_mt','JPD113','2022-06-11','2022-06-11'),
(N'JPD113_ptcpt','JPD113','2022-05-10','2022-07-21'), --participation
(N'JPD113_pt','JPD113','2022-05-23','2022-06-21'),
(N'JPD113_fe','JPD113','2022-07-24','2022-07-24'),
--lab
(N'LAB211_pratices','LAB211','2022-05-9','2022-07-22'),
--IAO
(N'IAO202_pt','IAO202','2022-05-18','2022-06-18'),
(N'IAO202_as','IAO202','2022-05-25','2022-06-23'),
(N'IAO202_pe','IAO202','2022-07-16','2022-07-16'),
(N'IAO202_fe','IAO202','2022-08-02','2022-08-02')



--9 insert Assessment
INSERT INTO Assessment(Category,[Type],Part,[Weight],[Completion Criteria],[No Question])

VALUES
('CSD201_as','on-going',2,0.2,0,null),
('CSD201_fe',N'final exam',1,0.3,4,50),
('CSD201_pe','on-going',1,0.3,0,4),
('CSD201_pt','quiz',2,0.2,0,30),

('DBI202_as','on-going',1,0.2,0,null),
('DBI202_fe',N'final exam',1,0.3,4,50),
('DBI202_lab','on-going',5,0.1,4,null),
('DBI202_pe','on-going',1,0.3,0,null),
('DBI202_pt','on-going',2,0.1,0,20),

('JPD113_fe',N'final exam',2,0.4,4,null),
('JPD113_mt','on-going',1,0.3,0,45),
('JPD113_pt','on-going',2,0.2,0,20),
('JPD113_ptcpt','on-going',1,0.1,750,null),

('LAB211_pratices','on-going',1,1,0,null),

('IAO202_as','on-going',1,0.2,0,null),
('IAO202_fe',N'final exam',1,0.3,4,50),
('IAO202_pe','on-going',1,0.3,0,null),
('IAO202_pt','on-going',2,0.1,0,20)
select * from Assessment

--10 insert process
INSERT INTO Process
VALUES
('HE160318','CSD201_as',1),
('HE160318','CSD201_fe',0),
('HE160318','CSD201_pe',0),
('HE160318','CSD201_pt',1),
('HE160318','DBI202_as',0),
('HE160318','DBI202_fe',0),
('HE160318','DBI202_lab',1),
('HE160318','DBI202_pe',0),
('HE160318','DBI202_pt',1),
('HE160318','JPD113_fe',0),
('HE160318','JPD113_mt',1),
('HE160318','JPD113_pt',1),
('HE160318','JPD113_ptcpt',1),
('HE160318','LAB211_pratices',0),

('HE160136','CSD201_as',1),
('HE160136','CSD201_fe',0),
('HE160136','CSD201_pe',0),
('HE160136','CSD201_pt',1),
('HE160136','DBI202_as',0),
('HE160136','DBI202_fe',0),
('HE160136','DBI202_lab',1),
('HE160136','DBI202_pe',0),
('HE160136','DBI202_pt',1),
('HE160136','JPD113_fe',0),
('HE160136','JPD113_mt',1),
('HE160136','JPD113_pt',1),
('HE160136','JPD113_ptcpt',1),
('HE160136','LAB211_pratices',0),

('HE160594','CSD201_as',1),
('HE160594','CSD201_fe',0),
('HE160594','CSD201_pe',0),
('HE160594','CSD201_pt',1),
('HE160594','DBI202_as',0),
('HE160594','DBI202_fe',0),
('HE160594','DBI202_lab',1),
('HE160594','DBI202_pe',0),
('HE160594','DBI202_pt',1),
('HE160594','JPD113_fe',0),
('HE160594','JPD113_mt',1),
('HE160594','JPD113_pt',1),
('HE160594','JPD113_ptcpt',0),
('HE160594','LAB211_pratices',0),

('HE161106','CSD201_as',1),
('HE161106','CSD201_fe',0),
('HE161106','CSD201_pe',0),
('HE161106','CSD201_pt',1),
('HE161106','DBI202_as',0),
('HE161106','DBI202_fe',0),
('HE161106','DBI202_lab',1),
('HE161106','DBI202_pe',0),
('HE161106','DBI202_pt',1),
('HE161106','JPD113_fe',0),
('HE161106','JPD113_mt',1),
('HE161106','JPD113_pt',1),
('HE161106','JPD113_ptcpt',1),
('HE161106','LAB211_pratices',1),

('HE160307','CSD201_as',1),
('HE160307','CSD201_fe',0),
('HE160307','CSD201_pe',0),
('HE160307','CSD201_pt',1),
('HE160307','DBI202_as',1),
('HE160307','DBI202_fe',0),
('HE160307','DBI202_lab',1),
('HE160307','DBI202_pe',0),
('HE160307','DBI202_pt',1),
('HE160307','JPD113_fe',0),
('HE160307','JPD113_mt',1),
('HE160307','JPD113_pt',1),
('HE160307','JPD113_ptcpt',1),
('HE160307','LAB211_pratices',1),

('HE163693','CSD201_as',1),
('HE163693','CSD201_fe',0),
('HE163693','CSD201_pe',0),
('HE163693','CSD201_pt',1),
('HE163693','DBI202_as',0),
('HE163693','DBI202_fe',0),
('HE163693','DBI202_lab',1),
('HE163693','DBI202_pe',0),
('HE163693','DBI202_pt',1),
('HE163693','JPD113_fe',0),
('HE163693','JPD113_mt',1),
('HE163693','JPD113_pt',1),
('HE163693','JPD113_ptcpt',0),
('HE163693','LAB211_pratices',0),

('HE161198','CSD201_as',1),
('HE161198','CSD201_fe',0),
('HE161198','CSD201_pe',0),
('HE161198','CSD201_pt',1),
('HE161198','DBI202_as',0),
('HE161198','DBI202_fe',0),
('HE161198','DBI202_lab',1),
('HE161198','DBI202_pe',0),
('HE161198','DBI202_pt',1),
('HE161198','JPD113_fe',0),
('HE161198','JPD113_mt',1),
('HE161198','JPD113_pt',0),
('HE161198','JPD113_ptcpt',0),
('HE161198','LAB211_pratices',1),

('HE161665','CSD201_as',1),
('HE161665','CSD201_fe',0),
('HE161665','CSD201_pe',0),
('HE161665','CSD201_pt',1),
('HE161665','DBI202_as',0),
('HE161665','DBI202_fe',0),
('HE161665','DBI202_lab',1),
('HE161665','DBI202_pe',0),
('HE161665','DBI202_pt',1),
('HE161665','JPD113_fe',0),
('HE161665','JPD113_mt',1),
('HE161665','JPD113_pt',1),
('HE161665','JPD113_ptcpt',1),
('HE161665','LAB211_pratices',0),

('HE161890','CSD201_as',1),
('HE161890','CSD201_fe',0),
('HE161890','CSD201_pe',0),
('HE161890','CSD201_pt',1),
('HE161890','DBI202_as',1),
('HE161890','DBI202_fe',0),
('HE161890','DBI202_lab',1),
('HE161890','DBI202_pe',0),
('HE161890','DBI202_pt',1),
('HE161890','JPD113_fe',0),
('HE161890','JPD113_mt',1),
('HE161890','JPD113_pt',1),
('HE161890','JPD113_ptcpt',1),
('HE161890','LAB211_pratices',1),

('HE163581','CSD201_as',1),
('HE163581','CSD201_fe',0),
('HE163581','CSD201_pe',0),
('HE163581','CSD201_pt',1),
('HE163581','DBI202_as',1),
('HE163581','DBI202_fe',0),
('HE163581','DBI202_lab',1),
('HE163581','DBI202_pe',0),
('HE163581','DBI202_pt',1),
('HE163581','JPD113_fe',0),
('HE163581','JPD113_mt',1),
('HE163581','JPD113_pt',1),
('HE163581','JPD113_ptcpt',0),
('HE163581','LAB211_pratices',1)
select * from Process
select * from Assessment
select * from Result
--11 INSERT RESULT
INSERT INTO Result
VALUES
('HE160136',1,'2022-06-26',8,1),
('HE160136',2,'2022-08-05',NULL,0),
('HE160136',3,'2022-07-30',NULL,0),
('HE160136',4,'2022-06-20',8,1),
('HE160318',1,'2022-06-26',6,1),
('HE160318',2,'2022-08-05',NULL,0),
('HE160318',3,'2022-07-30',NULL,0),
('HE160318',4,'2022-06-20',7.5,1),
('HE160307',1,'2022-06-26',10,1),
('HE160307',2,'2022-08-05',NULL,0),
('HE160307',3,'2022-07-30',NULL,0),
('HE160594',4,'2022-06-20',5,1),
('HE160594',1,'2022-06-26',8,1),
('HE160594',2,'2022-08-05',NULL,0),
('HE160594',3,'2022-07-30',NULL,0),
('HE160594',4,'2022-06-20',7.5,1),
('HE161106',1,'2022-06-26',10,1),
('HE161106',2,'2022-08-05',NULL,0),
('HE161106',3,'2022-07-30',NULL,0),
('HE161106',4,'2022-06-20',9.5,1),
('HE161198',1,'2022-06-26',6,1),
('HE161198',2,'2022-08-05',NULL,0),
('HE161198',3,'2022-07-30',NULL,0),
('HE161198',4,'2022-06-20',7,1),
('HE161665',1,'2022-06-26',5,1),
('HE161665',2,'2022-08-05',NULL,0),
('HE161665',3,'2022-07-30',NULL,0),
('HE161665',4,'2022-06-20',6.5,1),
('HE161890',1,'2022-06-26',7,1),
('HE161890',2,'2022-08-05',NULL,0),
('HE161890',3,'2022-07-30',NULL,0),
('HE161890',4,'2022-06-20',8.5,1),
('HE163581',1,'2022-06-26',9,1),
('HE163581',2,'2022-08-05',NULL,0),
('HE163581',3,'2022-07-30',NULL,0),
('HE163581',4,'2022-06-20',9.5,1),
('HE163693',1,'2022-06-26',8,1),
('HE163693',2,'2022-08-05',NULL,0),
('HE163693',3,'2022-07-30',NULL,0),
('HE163693',4,'2022-06-20',8,1),
--dbi
('HE160136',5,'2022-08-02',NULL,0),
('HE160136',6,'2022-08-27',NULL,0),
('HE160136',7,'2022-06-20',7,1),
('HE160136',8,'2022-07-30',NULL,0),
('HE160136',9,'2022-06-28',6.5,1),
('HE160318',5,'2022-08-02',NULL,0),
('HE160318',6,'2022-08-27',NULL,0),
('HE160318',7,'2022-06-20',7.5,1),
('HE160318',8,'2022-07-30',NULL,0),
('HE160318',9,'2022-06-28',7.5,1),
('HE160307',5,'2022-08-02',NULL,0),
('HE160307',6,'2022-08-27',NULL,0),
('HE160307',7,'2022-06-20',6,1),
('HE160307',8,'2022-07-30',NULL,0),
('HE160307',9,'2022-06-28',7,1),
('HE160594',5,'2022-08-02',NULL,0),
('HE160594',6,'2022-08-27',NULL,0),
('HE160594',7,'2022-06-20',7,1),
('HE160594',8,'2022-07-30',NULL,0),
('HE160594',9,'2022-06-28',7,1),
('HE161106',5,'2022-08-02',NULL,0),
('HE161106',6,'2022-08-27',NULL,0),
('HE161106',7,'2022-06-20',9,1),
('HE161106',8,'2022-07-30',NULL,0),
('HE161106',9,'2022-06-28',8,1),
('HE161198',5,'2022-08-02',NULL,0),
('HE161198',6,'2022-08-27',NULL,0),
('HE161198',7,'2022-06-20',7,1),
('HE161198',8,'2022-07-30',NULL,0),
('HE161198',9,'2022-06-28',6.5,1),
('HE161665',5,'2022-08-02',NULL,0),
('HE161665',6,'2022-08-27',NULL,0),
('HE161665',7,'2022-06-20',5,1),
('HE161665',8,'2022-07-30',NULL,0),
('HE161665',9,'2022-06-28',5.5,1),
('HE161890',5,'2022-08-02',NULL,0),
('HE161890',6,'2022-08-27',NULL,0),
('HE161890',7,'2022-06-20',7,1),
('HE161890',8,'2022-07-30',NULL,0),
('HE161890',9,'2022-06-28',6.5,1),
('HE163581',5,'2022-08-02',NULL,0),
('HE163581',6,'2022-08-27',NULL,0),
('HE163581',7,'2022-06-20',9,1),
('HE163581',8,'2022-07-30',NULL,0),
('HE163581',9,'2022-06-28',10,1),
('HE163693',5,'2022-08-02',NULL,0),
('HE163693',6,'2022-08-27',NULL,0),
('HE163693',7,'2022-06-20',8,1),
('HE163693',8,'2022-07-30',NULL,0),
('HE163693',9,'2022-06-28',9,1),
--JPD
(10,'vandt',10,'2022-07-31',NULL,0),
(11,'vandt',11,'2022-06-16',9.75,1),
(12,'vandt',12,'2022-05-23',8.5,1),
(13,'vandt',13,'2022-07-21',10,1),
(24,'vandt',10,'2022-07-31',NULL,0),
(25,'vandt',11,'2022-06-16',6.75,1),
(26,'vandt',12,'2022-05-23',5.5,1),
(27,'vandt',13,'2022-07-21',8,1),
(38,'vandt',10,'2022-07-31',NULL,0),
(39,'vandt',11,'2022-06-16',5.75,1),
(40,'vandt',12,'2022-05-23',4.5,1),
(41,'vandt',13,'2022-07-21',7,1),
(52,'vandt',10,'2022-07-31',NULL,0),
(53,'vandt',11,'2022-06-16',9.5,1),
(54,'vandt',12,'2022-05-23',8.75,1),
(55,'vandt',13,'2022-07-21',10,1),
(68,'vandt',10,'2022-07-31',NULL,0),
(69,'vandt',11,'2022-06-16',8,1),
(70,'vandt',12,'2022-05-23',7.75,1),
(71,'vandt',13,'2022-07-21',10,1),
(82,'vandt',10,'2022-07-31',NULL,0),
(82,'vandt',11,'2022-06-16',7,1),
(84,'vandt',12,'2022-05-23',6.75,1),
(85,'vandt',13,'2022-07-21',7.5,1),
(96,'vandt',10,'2022-07-31',NULL,0),
(97,'vandt',11,'2022-06-16',5,1),
(98,'vandt',12,'2022-05-23',5.75,1),
(99,'vandt',13,'2022-07-21',6.5,1),
(110,'vandt',10,'2022-07-31',NULL,0),
(111,'vandt',11,'2022-06-16',6,1),
(112,'vandt',12,'2022-05-23',6.75,1),
(113,'vandt',13,'2022-07-21',7,1),
(124,'vandt',10,'2022-07-31',NULL,0),
(125,'vandt',11,'2022-06-16',10,1),
(126,'vandt',12,'2022-05-23',8.75,1),
(127,'vandt',13,'2022-07-21',10,1),
(138,'vandt',10,'2022-07-31',NULL,0),
(139,'vandt',11,'2022-06-16',5,1),
(140,'vandt',12,'2022-05-23',4.75,1),
(141,'vandt',13,'2022-07-21',7,1),
--LAB
(14,'NangNTH',14,'2022-07-22',660,0),
(28,'NangNTH',14,'2022-07-22',570,0),
(42,'NangNTH',14,'2022-07-22',420,0),
(56,'NangNTH',14,'2022-07-22',725,0),
(72,'NangNTH',14,'2022-07-22',760,1),
(86,'NangNTH',14,'2022-07-22',550,0),
(100,'NangNTH',14,'2022-07-22',773,1),
(114,'NangNTH',14,'2022-07-22',60,0),
(128,'NangNTH',14,'2022-07-22',750,1),
(142,'NangNTH',14,'2022-07-22',752,1),
--WED
(57,'TungHT22',15,'2022-08-29',NULL,0),
(58,'TungHT22',16,'2022-07-21',NULL,0)

SELECT * FROM Result