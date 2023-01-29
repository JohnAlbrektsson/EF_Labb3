USE [master]
GO
/****** Object:  Database [Highschool]    Script Date: 2023-01-29 19:20:18 ******/
CREATE DATABASE [Highschool]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Highschool', FILENAME = N'D:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Highschool.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Highschool_log', FILENAME = N'D:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Highschool_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Highschool] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Highschool].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Highschool] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Highschool] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Highschool] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Highschool] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Highschool] SET ARITHABORT OFF 
GO
ALTER DATABASE [Highschool] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Highschool] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Highschool] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Highschool] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Highschool] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Highschool] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Highschool] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Highschool] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Highschool] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Highschool] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Highschool] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Highschool] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Highschool] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Highschool] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Highschool] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Highschool] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Highschool] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Highschool] SET RECOVERY FULL 
GO
ALTER DATABASE [Highschool] SET  MULTI_USER 
GO
ALTER DATABASE [Highschool] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Highschool] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Highschool] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Highschool] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Highschool] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Highschool] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Highschool', N'ON'
GO
ALTER DATABASE [Highschool] SET QUERY_STORE = OFF
GO
USE [Highschool]
GO
/****** Object:  Table [dbo].[Class]    Script Date: 2023-01-29 19:20:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Class](
	[ClassID] [int] NOT NULL,
	[Class] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Class] PRIMARY KEY CLUSTERED 
(
	[ClassID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Courses]    Script Date: 2023-01-29 19:20:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Courses](
	[CourseID] [int] NOT NULL,
	[Course] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Courses] PRIMARY KEY CLUSTERED 
(
	[CourseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 2023-01-29 19:20:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[EmployeeID] [int] IDENTITY(1,1) NOT NULL,
	[Fname] [nvarchar](50) NOT NULL,
	[Lname] [nvarchar](50) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Enrollment]    Script Date: 2023-01-29 19:20:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Enrollment](
	[StudentID] [int] NOT NULL,
	[CourseID] [int] NOT NULL,
	[GradeID] [int] NOT NULL,
	[EmployeeID] [int] NOT NULL,
	[GradeDate] [date] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Grades]    Script Date: 2023-01-29 19:20:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Grades](
	[GradeID] [int] NOT NULL,
	[Grade] [int] NOT NULL,
 CONSTRAINT [PK_Grades] PRIMARY KEY CLUSTERED 
(
	[GradeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student]    Script Date: 2023-01-29 19:20:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[StudentID] [int] IDENTITY(1,1) NOT NULL,
	[Fname] [nvarchar](50) NOT NULL,
	[Lname] [nvarchar](50) NOT NULL,
	[SSN] [int] NOT NULL,
	[ClassID] [int] NOT NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[StudentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Class] ([ClassID], [Class]) VALUES (1, N'3a')
INSERT [dbo].[Class] ([ClassID], [Class]) VALUES (2, N'3b')
GO
INSERT [dbo].[Courses] ([CourseID], [Course]) VALUES (1, N'Math')
INSERT [dbo].[Courses] ([CourseID], [Course]) VALUES (2, N'Swedish')
INSERT [dbo].[Courses] ([CourseID], [Course]) VALUES (3, N'English')
INSERT [dbo].[Courses] ([CourseID], [Course]) VALUES (4, N'P.E')
INSERT [dbo].[Courses] ([CourseID], [Course]) VALUES (5, N'Arts')
INSERT [dbo].[Courses] ([CourseID], [Course]) VALUES (6, N'Crafts')
GO
SET IDENTITY_INSERT [dbo].[Employee] ON 

INSERT [dbo].[Employee] ([EmployeeID], [Fname], [Lname], [Title]) VALUES (1, N'Henrik', N'Larsson', N'Teacher')
INSERT [dbo].[Employee] ([EmployeeID], [Fname], [Lname], [Title]) VALUES (2, N'Lisa', N'Karlsson', N'Principal')
INSERT [dbo].[Employee] ([EmployeeID], [Fname], [Lname], [Title]) VALUES (3, N'Dan', N'Andersson', N'Teacher')
INSERT [dbo].[Employee] ([EmployeeID], [Fname], [Lname], [Title]) VALUES (4, N'Joel', N'Henriksson', N'Teacher')
INSERT [dbo].[Employee] ([EmployeeID], [Fname], [Lname], [Title]) VALUES (5, N'Nils', N'Jansson', N'Janitor')
INSERT [dbo].[Employee] ([EmployeeID], [Fname], [Lname], [Title]) VALUES (6, N'Vilma', N'Göransson', N'Teacher')
INSERT [dbo].[Employee] ([EmployeeID], [Fname], [Lname], [Title]) VALUES (7, N'Erika', N'Al', N'School Nurse')
INSERT [dbo].[Employee] ([EmployeeID], [Fname], [Lname], [Title]) VALUES (8, N'Rickard', N'Davidsson', N'Principal')
INSERT [dbo].[Employee] ([EmployeeID], [Fname], [Lname], [Title]) VALUES (9, N'Fredrik', N'Ingvarsson', N'Teacher')
INSERT [dbo].[Employee] ([EmployeeID], [Fname], [Lname], [Title]) VALUES (10, N'Fredrik', N'Andersson', N'Janitor')
SET IDENTITY_INSERT [dbo].[Employee] OFF
GO
INSERT [dbo].[Enrollment] ([StudentID], [CourseID], [GradeID], [EmployeeID], [GradeDate]) VALUES (1, 1, 4, 3, CAST(N'2023-01-16' AS Date))
INSERT [dbo].[Enrollment] ([StudentID], [CourseID], [GradeID], [EmployeeID], [GradeDate]) VALUES (2, 1, 3, 3, CAST(N'2023-01-16' AS Date))
INSERT [dbo].[Enrollment] ([StudentID], [CourseID], [GradeID], [EmployeeID], [GradeDate]) VALUES (3, 2, 5, 1, CAST(N'2022-12-20' AS Date))
INSERT [dbo].[Enrollment] ([StudentID], [CourseID], [GradeID], [EmployeeID], [GradeDate]) VALUES (4, 3, 2, 4, CAST(N'2022-12-15' AS Date))
INSERT [dbo].[Enrollment] ([StudentID], [CourseID], [GradeID], [EmployeeID], [GradeDate]) VALUES (10, 6, 2, 1, CAST(N'2023-01-23' AS Date))
INSERT [dbo].[Enrollment] ([StudentID], [CourseID], [GradeID], [EmployeeID], [GradeDate]) VALUES (8, 5, 4, 9, CAST(N'2023-01-25' AS Date))
INSERT [dbo].[Enrollment] ([StudentID], [CourseID], [GradeID], [EmployeeID], [GradeDate]) VALUES (2, 3, 5, 4, CAST(N'2022-12-20' AS Date))
INSERT [dbo].[Enrollment] ([StudentID], [CourseID], [GradeID], [EmployeeID], [GradeDate]) VALUES (6, 1, 2, 3, CAST(N'2022-12-20' AS Date))
INSERT [dbo].[Enrollment] ([StudentID], [CourseID], [GradeID], [EmployeeID], [GradeDate]) VALUES (9, 2, 3, 1, CAST(N'2023-01-05' AS Date))
INSERT [dbo].[Enrollment] ([StudentID], [CourseID], [GradeID], [EmployeeID], [GradeDate]) VALUES (5, 3, 3, 4, CAST(N'2022-12-15' AS Date))
INSERT [dbo].[Enrollment] ([StudentID], [CourseID], [GradeID], [EmployeeID], [GradeDate]) VALUES (6, 4, 5, 6, CAST(N'2022-12-22' AS Date))
INSERT [dbo].[Enrollment] ([StudentID], [CourseID], [GradeID], [EmployeeID], [GradeDate]) VALUES (7, 5, 3, 9, CAST(N'2023-01-14' AS Date))
INSERT [dbo].[Enrollment] ([StudentID], [CourseID], [GradeID], [EmployeeID], [GradeDate]) VALUES (8, 5, 4, 9, CAST(N'2023-01-15' AS Date))
INSERT [dbo].[Enrollment] ([StudentID], [CourseID], [GradeID], [EmployeeID], [GradeDate]) VALUES (9, 6, 5, 1, CAST(N'2023-01-20' AS Date))
INSERT [dbo].[Enrollment] ([StudentID], [CourseID], [GradeID], [EmployeeID], [GradeDate]) VALUES (10, 1, 4, 3, CAST(N'2023-01-21' AS Date))
INSERT [dbo].[Enrollment] ([StudentID], [CourseID], [GradeID], [EmployeeID], [GradeDate]) VALUES (1, 3, 3, 4, CAST(N'2023-01-12' AS Date))
INSERT [dbo].[Enrollment] ([StudentID], [CourseID], [GradeID], [EmployeeID], [GradeDate]) VALUES (3, 4, 2, 6, CAST(N'2023-01-23' AS Date))
INSERT [dbo].[Enrollment] ([StudentID], [CourseID], [GradeID], [EmployeeID], [GradeDate]) VALUES (7, 1, 1, 3, CAST(N'2023-01-17' AS Date))
INSERT [dbo].[Enrollment] ([StudentID], [CourseID], [GradeID], [EmployeeID], [GradeDate]) VALUES (2, 6, 3, 1, CAST(N'2022-12-16' AS Date))
INSERT [dbo].[Enrollment] ([StudentID], [CourseID], [GradeID], [EmployeeID], [GradeDate]) VALUES (5, 4, 1, 6, CAST(N'2023-01-12' AS Date))
GO
INSERT [dbo].[Grades] ([GradeID], [Grade]) VALUES (1, 1)
INSERT [dbo].[Grades] ([GradeID], [Grade]) VALUES (2, 2)
INSERT [dbo].[Grades] ([GradeID], [Grade]) VALUES (3, 3)
INSERT [dbo].[Grades] ([GradeID], [Grade]) VALUES (4, 4)
INSERT [dbo].[Grades] ([GradeID], [Grade]) VALUES (5, 5)
GO
SET IDENTITY_INSERT [dbo].[Student] ON 

INSERT [dbo].[Student] ([StudentID], [Fname], [Lname], [SSN], [ClassID]) VALUES (1, N'John', N'Albrektsson', 19970424, 1)
INSERT [dbo].[Student] ([StudentID], [Fname], [Lname], [SSN], [ClassID]) VALUES (2, N'Ernst', N'Torvaldsson', 19970212, 1)
INSERT [dbo].[Student] ([StudentID], [Fname], [Lname], [SSN], [ClassID]) VALUES (3, N'Viktor', N'Bengtsson', 19970401, 2)
INSERT [dbo].[Student] ([StudentID], [Fname], [Lname], [SSN], [ClassID]) VALUES (4, N'Linn', N'Stenström', 19971023, 1)
INSERT [dbo].[Student] ([StudentID], [Fname], [Lname], [SSN], [ClassID]) VALUES (5, N'Karl', N'Andersson', 19970707, 2)
INSERT [dbo].[Student] ([StudentID], [Fname], [Lname], [SSN], [ClassID]) VALUES (6, N'Anna', N'Karlsson', 19970802, 2)
INSERT [dbo].[Student] ([StudentID], [Fname], [Lname], [SSN], [ClassID]) VALUES (7, N'Sandra', N'Fredriksson', 19970603, 1)
INSERT [dbo].[Student] ([StudentID], [Fname], [Lname], [SSN], [ClassID]) VALUES (8, N'Patrik', N'Nilsson', 19971223, 2)
INSERT [dbo].[Student] ([StudentID], [Fname], [Lname], [SSN], [ClassID]) VALUES (9, N'Olle', N'Ivarsson', 19970527, 2)
INSERT [dbo].[Student] ([StudentID], [Fname], [Lname], [SSN], [ClassID]) VALUES (10, N'Bengt', N'Fredriksson', 19970821, 1)
INSERT [dbo].[Student] ([StudentID], [Fname], [Lname], [SSN], [ClassID]) VALUES (11, N'Jan', N'Bertilsson', 19970630, 2)
SET IDENTITY_INSERT [dbo].[Student] OFF
GO
ALTER TABLE [dbo].[Enrollment]  WITH CHECK ADD  CONSTRAINT [FK_Enrollment_Courses] FOREIGN KEY([CourseID])
REFERENCES [dbo].[Courses] ([CourseID])
GO
ALTER TABLE [dbo].[Enrollment] CHECK CONSTRAINT [FK_Enrollment_Courses]
GO
ALTER TABLE [dbo].[Enrollment]  WITH CHECK ADD  CONSTRAINT [FK_Enrollment_Employee] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employee] ([EmployeeID])
GO
ALTER TABLE [dbo].[Enrollment] CHECK CONSTRAINT [FK_Enrollment_Employee]
GO
ALTER TABLE [dbo].[Enrollment]  WITH CHECK ADD  CONSTRAINT [FK_Enrollment_Grades] FOREIGN KEY([GradeID])
REFERENCES [dbo].[Grades] ([GradeID])
GO
ALTER TABLE [dbo].[Enrollment] CHECK CONSTRAINT [FK_Enrollment_Grades]
GO
ALTER TABLE [dbo].[Enrollment]  WITH CHECK ADD  CONSTRAINT [FK_Enrollment_Student] FOREIGN KEY([StudentID])
REFERENCES [dbo].[Student] ([StudentID])
GO
ALTER TABLE [dbo].[Enrollment] CHECK CONSTRAINT [FK_Enrollment_Student]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_Class] FOREIGN KEY([ClassID])
REFERENCES [dbo].[Class] ([ClassID])
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Student_Class]
GO
/****** Object:  StoredProcedure [dbo].[SpGetEmployeeProffesion]    Script Date: 2023-01-29 19:20:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[SpGetEmployeeProffesion]
@ProffessionID nvarchar(50)
as
begin
select * from Employee
Where Title = @ProffessionID
end
GO
/****** Object:  StoredProcedure [dbo].[spInsertNewStudent]    Script Date: 2023-01-29 19:20:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[spInsertNewStudent]
@Fname nvarchar(50), @Lname nvarchar(50), @SSN int, @ClassID int
as
begin
Insert into Student(Fname,Lname,SSN,ClassID) Values(@Fname,@Lname,@SSN,@ClassID)
end
GO
USE [master]
GO
ALTER DATABASE [Highschool] SET  READ_WRITE 
GO
