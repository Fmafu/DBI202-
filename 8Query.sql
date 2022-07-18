use MarkManagerFPT
--1 order by

select * from Student Order by StudentFirstName, StudentLastName

--2 inner join
select st.StudentID,st.StudentFirstName,st.StudentLastName,g.CourseID,c.Department,c.Semester, g.GroupID
from 
Student st inner join StudentGroup sg on st.StudentID = sg.StudentID
			inner join [Group] g on sg.GroupID = g.GroupID
			inner join Course c on g.CourseID = c.CourseID

--3 ham tong hop
select r.StudentID,sum(r.Mark * a.Weight) as Average, e.CourseID
from Result r inner join Assessment a on r.AssessmentID = a.AssessmentID
				inner join Element e on a.Category = e.Category
group by r.StudentID, e.CourseID
--4 having, grby
select r.StudentID,sum(r.Mark * a.Weight) as Average, e.CourseID

from 

Result r inner join Assessment a on r.AssessmentID = a.AssessmentID
		 inner join Element e on 
a.Category = e.Category
group by r.StudentID, e.CourseID
having r.StudentID = 'HE163693'


--50
select LEC.LectureID, concat(LEC.LectureFirstName,' ',LEC.LectureLastName) as FullName,STU.StudentID
,ASSES.Category ,r.Mark
from
(Select LectureID, LectureFirstName,LectureLastName from Lecture) as LEC
inner join [Group] g 
on g.LectureID = LEC.LectureID

inner join StudentGroup sg
on sg.GroupID = g.GroupID

inner join (select StudentID, StudentFirstName, StudentLastName from Student) as STU
on STU.StudentID = sg.StudentID

inner join Result r
on STU.StudentID = r.StudentID

inner join (select AssessmentID,Category from Assessment) ASSES
on ASSES.AssessmentID = r.AssessmentID

order by LEC.LectureID	
--6 
select LEC.LectureID, concat(LEC.LectureFirstName,' ',LEC.LectureLastName) as FullName,STU.StudentID
,ASSES.Category ,r.Mark
from
(Select LectureID, LectureFirstName,LectureLastName from Lecture) as LEC
inner join [Group] g 
on g.LectureID = LEC.LectureID

inner join StudentGroup sg
on sg.GroupID = g.GroupID

inner join (select StudentID, StudentFirstName, StudentLastName from Student) as STU
on STU.StudentID = sg.StudentID

inner join Result r
on STU.StudentID = r.StudentID

inner join (select AssessmentID,Category from Assessment) ASSES
on ASSES.AssessmentID = r.AssessmentID

Where LEC.LectureID = (select LectureID from Lecture where LectureFirstName = 'Nguyen Tan' and LectureLastName = 'An')

--7
select * from Student
where  MajorID like '%I' 

--8 s
select * from StudentGroup
except
--StudentGroup.StudentID, leader.Leader, StudentGroup.GroupID
select b.GroupID,b.StudentID,b.EnrolledDate,b.Leader
from StudentGroup a left join StudentGroup b on b.Leader = a.StudentID

--9 store proceduce
GO
	CREATE PROC Count_Std_in_Group
	@Group VARCHAR(55)
	AS
	BEGIN
		SELECT COUNT(GroupID) AS [TOTAL OF STUDENT ENROLLED IN THIS GROUP] FROM StudentGroup WHERE GroupID = @Group
	END
GO
EXEC Count_Std_in_Group N'IA1604_CSD201'
EXEC Count_Std_in_Group N'IA1604_DBI202'
EXEC Count_Std_in_Group N'IA1604_IAO202'


