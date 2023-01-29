
--See grades of last month
select (Student.FName + ' ' + Student.LName) Student, Course, Grade, GradeDate, (Employee.Fname + ' '+Employee.Lname) Teacher
From Enrollment
Join Student on Enrollment.StudentID = Student.StudentID
Join Courses on Enrollment.CourseID = Courses.CourseID
Join Grades on Enrollment.GradeID = Grades.GradeID
Join Employee on Enrollment.EmployeeID = Employee.EmployeeID
where GradeDate > CONVERT(date,'2022-12-29')


--See Grades
select Course, AVG(Grades.Grade)Average, Max(Grade)Highest, Min(Grade)Lowest
from Enrollment
join Courses on Enrollment.CourseID = Courses.CourseID
join Grades on Enrollment.GradeID = Grades.GradeID
Group By Courses.Course

-- procedure to search for employee title
Create Proc SpGetEmployeeProffesion
@ProffessionID nvarchar(50)
as
begin
select * from Employee
Where Title = @ProffessionID
end

exec SpGetEmployeeProffesion Teacher

--Insert a new student procedure
Create Proc spInsertNewStudent
@Fname nvarchar(50), @Lname nvarchar(50), @SSN int, @ClassID int
as
begin
Insert into Student(Fname,Lname,SSN,ClassID) Values(@Fname,@Lname,@SSN,@ClassID)
end

exec spInsertNewStudent Jan, Bertilsson, 19970630,2