

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
	[Weight] Float check([Weight]<1 and [Weight]>0) NOT NULL,
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
	ResultID INT NOT NULL,
	AssessmentID INT NOT NULL FOREIGN KEY REFERENCES Assessment(AssessmentID),
	CONSTRAINT pk_OutputID_Graded_by_AssessmentID PRIMARY KEY (ResultID,AssessmentID),
	[Day of publication] DATE NOT NULL,
	Mark FLOAT,
	[Status] BIT,
)

select * from Assessment
select * from Student

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

select * from Major
select * from Student
select * from Lecture
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
select * from Lecture
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
SELECT * FROM Course

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
select * from StudentGroup
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

SELECT * FROM Element

--9 insert Assessment
INSERT INTO Assessment(Category,[Type],Part,[Weight],[Completion Criteria],[No Question])

VALUES
('CSD201_as','on-going',2,20.00,0,null),
('CSD201_fe',N'final exam',1,30.00,4,50),
('CSD201_pe','on-going',1,30.00,0,4),
('CSD201_pt','quiz',2,20.00,0,30),

('DBI202_as','on-going',1,20.00,0,null),
('DBI202_fe',N'final exam',1,30.00,4,50),
('DBI202_lab','on-going',5,10.00,4,null),
('DBI202_pe','on-going',1,30.00,0,null),
('DBI202_pt','on-going',2,10.00,0,20),

('JPD113_fe',N'final exam',2,40.00,4,null),
('JPD113_mt','on-going',1,30.00,0,45),
('JPD113_pt','on-going',2,20.00,0,20),
('JPD113_ptcpt','on-going',1,10.00,750,null),

('LAB211_pratices','on-going',1,100.00,0,null),

('WED201c_fe',N'final exam',1,50.00,4,null),
('WED201c_pe',N'final exam',1,50.00,4,60)
select * from Assessment