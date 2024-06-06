USE [master]
GO
/****** Object:  Database [MoreShortUnivercity ]    Script Date: 14.12.2023 18:51:57 ******/
CREATE DATABASE [MoreShortUnivercity ]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MoreShortUnivercity', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\MoreShortUnivercity .mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MoreShortUnivercity _log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\MoreShortUnivercity _log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [MoreShortUnivercity ] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MoreShortUnivercity ].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MoreShortUnivercity ] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MoreShortUnivercity ] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MoreShortUnivercity ] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MoreShortUnivercity ] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MoreShortUnivercity ] SET ARITHABORT OFF 
GO
ALTER DATABASE [MoreShortUnivercity ] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MoreShortUnivercity ] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MoreShortUnivercity ] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MoreShortUnivercity ] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MoreShortUnivercity ] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MoreShortUnivercity ] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MoreShortUnivercity ] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MoreShortUnivercity ] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MoreShortUnivercity ] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MoreShortUnivercity ] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MoreShortUnivercity ] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MoreShortUnivercity ] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MoreShortUnivercity ] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MoreShortUnivercity ] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MoreShortUnivercity ] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MoreShortUnivercity ] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MoreShortUnivercity ] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MoreShortUnivercity ] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [MoreShortUnivercity ] SET  MULTI_USER 
GO
ALTER DATABASE [MoreShortUnivercity ] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MoreShortUnivercity ] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MoreShortUnivercity ] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MoreShortUnivercity ] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MoreShortUnivercity ] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [MoreShortUnivercity ] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [MoreShortUnivercity ] SET QUERY_STORE = ON
GO
ALTER DATABASE [MoreShortUnivercity ] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [MoreShortUnivercity ]
GO
USE [MoreShortUnivercity ]
GO
/****** Object:  Sequence [dbo].[STUDENT_TICKET_NUMBER_SEQUENCE]    Script Date: 14.12.2023 18:51:57 ******/
CREATE SEQUENCE [dbo].[STUDENT_TICKET_NUMBER_SEQUENCE] 
 AS [bigint]
 START WITH -9223372036854775808
 INCREMENT BY 1
 MINVALUE -9223372036854775808
 MAXVALUE 999999
 CACHE 
GO
USE [MoreShortUnivercity ]
GO
/****** Object:  Sequence [dbo].[teachers_ticket_number_sequence]    Script Date: 14.12.2023 18:51:57 ******/
CREATE SEQUENCE [dbo].[teachers_ticket_number_sequence] 
 AS [bigint]
 START WITH 300000
 INCREMENT BY 1
 MINVALUE -9223372036854775808
 MAXVALUE 999999
 CACHE 
GO
/****** Object:  Table [dbo].[Students]    Script Date: 14.12.2023 18:51:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Students](
	[student_number] [int] NOT NULL,
	[group_id] [int] NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Surname] [nvarchar](255) NOT NULL,
	[patronymic] [nvarchar](255) NOT NULL,
	[department_id] [int] NOT NULL,
	[faculty_id] [int] NOT NULL,
	[specialization_id] [int] NOT NULL,
	[date_of_birth] [date] NOT NULL,
	[date_of_admission] [date] NOT NULL,
	[date_of_expulsion] [date] NOT NULL,
 CONSTRAINT [students_id_primary] PRIMARY KEY CLUSTERED 
(
	[student_number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[grades]    Script Date: 14.12.2023 18:51:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[grades](
	[id] [int] NOT NULL,
	[subject_id] [int] NOT NULL,
	[student_number] [int] NOT NULL,
	[grade] [int] NOT NULL,
	[exam_date] [date] NOT NULL,
	[teacher_number] [int] NOT NULL,
 CONSTRAINT [grades_id_primary] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[StudentGradesView]    Script Date: 14.12.2023 18:51:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[StudentGradesView] AS
SELECT
    S.student_number AS StudentNumber,
    S.Name AS StudentName,
    S.Surname AS StudentSurname,
    G.subject_id AS SubjectID,
    G.grade AS Grade
FROM Students S
JOIN grades G ON S.student_number = G.student_number;
GO
/****** Object:  Table [dbo].[Groups]    Script Date: 14.12.2023 18:51:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Groups](
	[id] [int] NOT NULL,
	[faculty_id] [int] NOT NULL,
	[group_name] [nvarchar](255) NOT NULL,
	[curator] [int] NOT NULL,
 CONSTRAINT [groups_id_primary] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Classes]    Script Date: 14.12.2023 18:51:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Classes](
	[id] [int] NOT NULL,
	[subject_id] [int] NOT NULL,
	[teacher_id] [int] NOT NULL,
	[group_id] [int] NOT NULL,
	[date] [datetime2](7) NOT NULL,
 CONSTRAINT [classes_id_primary] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Teachers]    Script Date: 14.12.2023 18:51:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Teachers](
	[teacher_number] [int] NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Surname] [nvarchar](255) NOT NULL,
	[Patronymic] [nvarchar](255) NOT NULL,
	[Departmetn_id] [int] NOT NULL,
	[date_of_birth] [date] NOT NULL,
	[HIERARCHY_COLUMN] [hierarchyid] NULL,
 CONSTRAINT [teachers_id_primary] PRIMARY KEY CLUSTERED 
(
	[teacher_number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[TeacherScheduleView]    Script Date: 14.12.2023 18:51:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[TeacherScheduleView] AS
SELECT
    T.teacher_number AS TeacherNumber,
    T.Name AS TeacherName,
    T.Surname AS TeacherSurname,
    C.date AS ClassDate,
    C.subject_id AS SubjectID,
    G.id AS GroupID
FROM Teachers T
JOIN Classes C ON T.teacher_number = C.teacher_id
JOIN Groups G ON C.group_id = G.id;
GO
/****** Object:  Table [dbo].[Department]    Script Date: 14.12.2023 18:51:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[id] [int] NOT NULL,
	[faculty_id] [int] NOT NULL,
	[fullName] [nvarchar](255) NOT NULL,
	[shortName] [nvarchar](255) NOT NULL,
 CONSTRAINT [department_id_primary] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Facultes]    Script Date: 14.12.2023 18:51:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Facultes](
	[id] [int] NOT NULL,
	[faculty_shortName] [nvarchar](255) NOT NULL,
	[fullName] [nvarchar](255) NOT NULL,
 CONSTRAINT [facultes_id_primary] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[scholarship]    Script Date: 14.12.2023 18:51:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[scholarship](
	[id] [int] NOT NULL,
	[start_date] [date] NOT NULL,
	[end_date] [date] NOT NULL,
	[scholarship] [int] NOT NULL,
	[student_id] [int] NOT NULL,
 CONSTRAINT [scholarship_id_primary] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Specializations]    Script Date: 14.12.2023 18:51:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Specializations](
	[id] [int] NOT NULL,
	[spec_kode] [nvarchar](255) NOT NULL,
	[faculty_id] [int] NOT NULL,
	[department_id] [int] NOT NULL,
	[fullName] [nvarchar](255) NOT NULL,
	[shortName] [nvarchar](255) NOT NULL,
 CONSTRAINT [specializations_id_primary] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Study_plan]    Script Date: 14.12.2023 18:51:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Study_plan](
	[id] [int] NOT NULL,
	[Specialization] [nvarchar](255) NOT NULL,
	[Department_id] [int] NOT NULL,
	[Faculty_id] [int] NOT NULL,
	[semester_number] [int] NOT NULL,
	[subject_id] [int] NOT NULL,
	[hours] [int] NOT NULL,
	[subj_name] [nvarchar](255) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Subjects]    Script Date: 14.12.2023 18:51:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subjects](
	[id] [int] NOT NULL,
	[departnemt_id] [int] NOT NULL,
	[fullName] [nvarchar](255) NOT NULL,
	[shortName] [nvarchar](255) NOT NULL,
	[amount_of_hours] [int] NOT NULL,
 CONSTRAINT [subjects_id_primary] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[teachers_salary]    Script Date: 14.12.2023 18:51:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[teachers_salary](
	[id] [int] NOT NULL,
	[start_date] [date] NOT NULL,
	[end_date] [date] NOT NULL,
	[work_time] [int] NOT NULL,
	[salary] [int] NOT NULL,
	[teacher_id] [int] NOT NULL,
 CONSTRAINT [teachers_salary_id_primary] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Index [idx_Classes_Date]    Script Date: 14.12.2023 18:51:58 ******/
CREATE NONCLUSTERED INDEX [idx_Classes_Date] ON [dbo].[Classes]
(
	[date] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [idx_Classes_TeacherID]    Script Date: 14.12.2023 18:51:58 ******/
CREATE NONCLUSTERED INDEX [idx_Classes_TeacherID] ON [dbo].[Classes]
(
	[teacher_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [idx_grades_StudentNumber]    Script Date: 14.12.2023 18:51:58 ******/
CREATE NONCLUSTERED INDEX [idx_grades_StudentNumber] ON [dbo].[grades]
(
	[student_number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [idx_grades_SubjectID]    Script Date: 14.12.2023 18:51:58 ******/
CREATE NONCLUSTERED INDEX [idx_grades_SubjectID] ON [dbo].[grades]
(
	[subject_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [idx_Groups_ID]    Script Date: 14.12.2023 18:51:58 ******/
CREATE NONCLUSTERED INDEX [idx_Groups_ID] ON [dbo].[Groups]
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [idx_scholarship_StartDate]    Script Date: 14.12.2023 18:51:58 ******/
CREATE NONCLUSTERED INDEX [idx_scholarship_StartDate] ON [dbo].[scholarship]
(
	[start_date] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [idx_scholarship_StudentID]    Script Date: 14.12.2023 18:51:58 ******/
CREATE NONCLUSTERED INDEX [idx_scholarship_StudentID] ON [dbo].[scholarship]
(
	[student_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [specialization]    Script Date: 14.12.2023 18:51:58 ******/
CREATE UNIQUE NONCLUSTERED INDEX [specialization] ON [dbo].[Specializations]
(
	[spec_kode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [idx_Students_StudentNumber]    Script Date: 14.12.2023 18:51:58 ******/
CREATE NONCLUSTERED INDEX [idx_Students_StudentNumber] ON [dbo].[Students]
(
	[student_number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [subjects_fullname_unique]    Script Date: 14.12.2023 18:51:58 ******/
CREATE UNIQUE NONCLUSTERED INDEX [subjects_fullname_unique] ON [dbo].[Subjects]
(
	[fullName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [subjects_shortname_unique]    Script Date: 14.12.2023 18:51:58 ******/
CREATE UNIQUE NONCLUSTERED INDEX [subjects_shortname_unique] ON [dbo].[Subjects]
(
	[shortName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [idx_Teachers_TeacherNumber]    Script Date: 14.12.2023 18:51:58 ******/
CREATE NONCLUSTERED INDEX [idx_Teachers_TeacherNumber] ON [dbo].[Teachers]
(
	[teacher_number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [idx_teachers_salary_StartDate]    Script Date: 14.12.2023 18:51:58 ******/
CREATE NONCLUSTERED INDEX [idx_teachers_salary_StartDate] ON [dbo].[teachers_salary]
(
	[start_date] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Classes]  WITH CHECK ADD  CONSTRAINT [fk_classes_group] FOREIGN KEY([group_id])
REFERENCES [dbo].[Groups] ([id])
GO
ALTER TABLE [dbo].[Classes] CHECK CONSTRAINT [fk_classes_group]
GO
ALTER TABLE [dbo].[Classes]  WITH CHECK ADD  CONSTRAINT [fk_classes_subject] FOREIGN KEY([subject_id])
REFERENCES [dbo].[Subjects] ([id])
GO
ALTER TABLE [dbo].[Classes] CHECK CONSTRAINT [fk_classes_subject]
GO
ALTER TABLE [dbo].[Classes]  WITH CHECK ADD  CONSTRAINT [fk_classes_teacher] FOREIGN KEY([teacher_id])
REFERENCES [dbo].[Teachers] ([teacher_number])
GO
ALTER TABLE [dbo].[Classes] CHECK CONSTRAINT [fk_classes_teacher]
GO
ALTER TABLE [dbo].[Department]  WITH CHECK ADD  CONSTRAINT [fk_department_faculty] FOREIGN KEY([faculty_id])
REFERENCES [dbo].[Facultes] ([id])
GO
ALTER TABLE [dbo].[Department] CHECK CONSTRAINT [fk_department_faculty]
GO
ALTER TABLE [dbo].[grades]  WITH CHECK ADD  CONSTRAINT [fk_grades_student] FOREIGN KEY([student_number])
REFERENCES [dbo].[Students] ([student_number])
GO
ALTER TABLE [dbo].[grades] CHECK CONSTRAINT [fk_grades_student]
GO
ALTER TABLE [dbo].[grades]  WITH CHECK ADD  CONSTRAINT [fk_grades_subject] FOREIGN KEY([subject_id])
REFERENCES [dbo].[Subjects] ([id])
GO
ALTER TABLE [dbo].[grades] CHECK CONSTRAINT [fk_grades_subject]
GO
ALTER TABLE [dbo].[grades]  WITH CHECK ADD  CONSTRAINT [fk_grades_teacher] FOREIGN KEY([teacher_number])
REFERENCES [dbo].[Teachers] ([teacher_number])
GO
ALTER TABLE [dbo].[grades] CHECK CONSTRAINT [fk_grades_teacher]
GO
ALTER TABLE [dbo].[Groups]  WITH CHECK ADD  CONSTRAINT [fk_groups_faculty] FOREIGN KEY([faculty_id])
REFERENCES [dbo].[Facultes] ([id])
GO
ALTER TABLE [dbo].[Groups] CHECK CONSTRAINT [fk_groups_faculty]
GO
ALTER TABLE [dbo].[scholarship]  WITH CHECK ADD  CONSTRAINT [fk_scholarship_student] FOREIGN KEY([student_id])
REFERENCES [dbo].[Students] ([student_number])
GO
ALTER TABLE [dbo].[scholarship] CHECK CONSTRAINT [fk_scholarship_student]
GO
ALTER TABLE [dbo].[Specializations]  WITH CHECK ADD  CONSTRAINT [fk_specializations_department] FOREIGN KEY([department_id])
REFERENCES [dbo].[Department] ([id])
GO
ALTER TABLE [dbo].[Specializations] CHECK CONSTRAINT [fk_specializations_department]
GO
ALTER TABLE [dbo].[Specializations]  WITH CHECK ADD  CONSTRAINT [fk_specializations_faculty] FOREIGN KEY([faculty_id])
REFERENCES [dbo].[Facultes] ([id])
GO
ALTER TABLE [dbo].[Specializations] CHECK CONSTRAINT [fk_specializations_faculty]
GO
ALTER TABLE [dbo].[Students]  WITH CHECK ADD  CONSTRAINT [fk_students_department] FOREIGN KEY([department_id])
REFERENCES [dbo].[Department] ([id])
GO
ALTER TABLE [dbo].[Students] CHECK CONSTRAINT [fk_students_department]
GO
ALTER TABLE [dbo].[Students]  WITH CHECK ADD  CONSTRAINT [fk_students_faculty] FOREIGN KEY([faculty_id])
REFERENCES [dbo].[Facultes] ([id])
GO
ALTER TABLE [dbo].[Students] CHECK CONSTRAINT [fk_students_faculty]
GO
ALTER TABLE [dbo].[Students]  WITH CHECK ADD  CONSTRAINT [fk_students_group] FOREIGN KEY([group_id])
REFERENCES [dbo].[Groups] ([id])
GO
ALTER TABLE [dbo].[Students] CHECK CONSTRAINT [fk_students_group]
GO
ALTER TABLE [dbo].[Students]  WITH CHECK ADD  CONSTRAINT [fk_students_specializations] FOREIGN KEY([specialization_id])
REFERENCES [dbo].[Specializations] ([id])
GO
ALTER TABLE [dbo].[Students] CHECK CONSTRAINT [fk_students_specializations]
GO
ALTER TABLE [dbo].[Study_plan]  WITH CHECK ADD  CONSTRAINT [fk_study_plan_department] FOREIGN KEY([Department_id])
REFERENCES [dbo].[Department] ([id])
GO
ALTER TABLE [dbo].[Study_plan] CHECK CONSTRAINT [fk_study_plan_department]
GO
ALTER TABLE [dbo].[Study_plan]  WITH CHECK ADD  CONSTRAINT [fk_study_plan_faculty] FOREIGN KEY([Faculty_id])
REFERENCES [dbo].[Facultes] ([id])
GO
ALTER TABLE [dbo].[Study_plan] CHECK CONSTRAINT [fk_study_plan_faculty]
GO
ALTER TABLE [dbo].[Study_plan]  WITH CHECK ADD  CONSTRAINT [fk_study_plan_subject] FOREIGN KEY([subject_id])
REFERENCES [dbo].[Subjects] ([id])
GO
ALTER TABLE [dbo].[Study_plan] CHECK CONSTRAINT [fk_study_plan_subject]
GO
ALTER TABLE [dbo].[Subjects]  WITH CHECK ADD  CONSTRAINT [fk_subjects_department] FOREIGN KEY([departnemt_id])
REFERENCES [dbo].[Department] ([id])
GO
ALTER TABLE [dbo].[Subjects] CHECK CONSTRAINT [fk_subjects_department]
GO
ALTER TABLE [dbo].[Teachers]  WITH CHECK ADD  CONSTRAINT [fk_teachers_department] FOREIGN KEY([Departmetn_id])
REFERENCES [dbo].[Department] ([id])
GO
ALTER TABLE [dbo].[Teachers] CHECK CONSTRAINT [fk_teachers_department]
GO
ALTER TABLE [dbo].[teachers_salary]  WITH CHECK ADD  CONSTRAINT [fk_teachers_salary_teacher] FOREIGN KEY([teacher_id])
REFERENCES [dbo].[Teachers] ([teacher_number])
GO
ALTER TABLE [dbo].[teachers_salary] CHECK CONSTRAINT [fk_teachers_salary_teacher]
GO
/****** Object:  StoredProcedure [dbo].[AddSubordinate]    Script Date: 14.12.2023 18:51:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[AddSubordinate]
@ParentNode HIERARCHYID,
@NewNode HIERARCHYID
AS
BEGIN
    INSERT INTO Teachers(teacher_number,HIERARCHY_COLUMN,Surname,Name,Patronymic, Departmetn_id,date_of_birth)
    VALUES (next value for teachers_ticket_number_sequence ,@ParentNode.GetDescendant(@NewNode, NULL), 'FirstName', 'LastName','otchectvo', 1, '12-11-1988' );
END;
GO
/****** Object:  StoredProcedure [dbo].[MoveSubtree]    Script Date: 14.12.2023 18:51:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[MoveSubtree]
@SourceNode HIERARCHYID,
@TargetNode HIERARCHYID
AS
BEGIN

    UPDATE Teachers
    SET HIERARCHY_COLUMN = HIERARCHY_COLUMN.GetReparentedValue(@SourceNode, @TargetNode)
    WHERE HIERARCHY_COLUMN.IsDescendantOf(@SourceNode) = 1;
END;
GO
/****** Object:  StoredProcedure [dbo].[ShowSubordinates]    Script Date: 14.12.2023 18:51:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ShowSubordinates]
@Node HIERARCHYID
AS
BEGIN
    SELECT
        HIERARCHY_COLUMN.ToString() AS HierarchyPath,
        LEVEL = HIERARCHY_COLUMN.GetLevel(),
        * -- Выбираем все остальные столбцы по вашему усмотрению
    FROM Teachers
    WHERE HIERARCHY_COLUMN.IsDescendantOf(@Node) = 1;
END;
GO
USE [master]
GO
ALTER DATABASE [MoreShortUnivercity ] SET  READ_WRITE 
GO
