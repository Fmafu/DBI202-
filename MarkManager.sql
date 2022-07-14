

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
	DepartmentID INT NOT NULL PRIMARY KEY,
	DepartmentName VARCHAR(70) NOT NULL,
)

CREATE TABLE Course(
	CourseID VARCHAR(15) NOT NULL PRIMARY KEY,
	CourseName VARCHAR(70) NOT NULL,
	[Number of sessions] INT NOT NULL,
	Department INT NOT NULL FOREIGN KEY REFERENCES DEPARTMENT(DepartmentID),
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

CREATE TABLE Class(
	ClassID VARCHAR(80) NOT NULL PRIMARY KEY,
	LectureID VARCHAR(25) NOT NULL FOREIGN KEY REFERENCES Lecture(LectureID),
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
insert into Student values 
('HE161106',N'Chau Ngoc','Duc','2002-09-17',1,'SE','duccnhe161106@fpt.edu.vn',10),
('HE160136',N'Do Van','Chung','2002-01-15',1,N'IA','chungdvhe160136@fpt.edu.vn',15),
('HE160307',N'Nguyen Van','Duc','2002-05-03',1,N'IA','ducvnhe160307@fpt.edu.vn',20),
('HE160318',N'Le Viet','Anh','2002-06-10',1,N'IA','anhvlhe160318@fpt.edu.vn',25),
('HE161198',N'Nguyen Nhat','Huy','2002-05-27',1,N'IA','huynnhe161198@fpt.edu.vn',30),
('HE160594',N'Ha Manh','Dat','2002-01-1',1,N'IA','dathmhe160594@fpt.edu.vn',35),
('HE161665',N'Tran Thi Thanh','Tam','2002-08-08',0,N'IA','tamttthe161665@fpt.edu.vn',40),
('HE161890',N'Nguyen Doanh','Thinh','2002-09-06',1,N'IA','thinhndhe161890@fpt.edu.vn',45),
('HE163693',N'Dao Vu','Hiep','2002-12-10',1,N'IA','hiepdvhe163693@fpt.edu.vn',50),
('HE163581',N'Nguyen Van','Vuong','2002-11-11',1,'AI','vuongvnhe163581@fpt.edu.vn',55)

select * from Major
select * from Student
select * from Lecture
--insert leture
INSERT INTO Lecture
VALUES
('annt79',N'Nguyen Tan','An',1,'2013-09-20','annt79@fpt.edu.vn',10),
('sonnt5',N'Ngo Tung','Son',1,'2009-01-01','sonnt69@fe.edu.vn',20),
('NangNTH',N'Nguyen Thi Hai','Nang',0,'2010-11-11','NangNTH@fe.edu.vn',30),
('vandt',N'Do Thi','Van',0,'2016-12-09','vandt4@fe.edu.vn',40),
('TungHT22',N'Hoang Thanh','Tung',1,'2019-04-28','TungHT22@fe.edu.vn',50),
('bantq6969',N'Tran Quy','Ban',1,'2010-01-25','bantq6969@fpt.edu.vn',60)

