

CREATE TABLE HomeTown(
	HomeTownID INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	HomeTownName NVARCHAR(30) NOT NULL
)

CREATE TABLE Student(
	StudentID VARCHAR(25) NOT NULL PRIMARY KEY,
	
	StudentFirstName NVARCHAR(30) NOT NULL,
	StudentLastName NVARCHAR(30) NOT NULL,
	BirthDay DATE NOT NULL,
	Sex BIT NOT NULL,
	Major VARCHAR(55) NOT NULL,
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

