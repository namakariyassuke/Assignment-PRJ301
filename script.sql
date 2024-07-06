USE [master]
GO
/****** Object:  Database [Assignment_SU24]    Script Date: 7/6/2024 3:42:13 PM ******/
CREATE DATABASE [Assignment_SU24]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Assignment_SU24', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Assignment_SU24.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Assignment_SU24_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Assignment_SU24_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Assignment_SU24] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Assignment_SU24].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Assignment_SU24] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Assignment_SU24] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Assignment_SU24] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Assignment_SU24] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Assignment_SU24] SET ARITHABORT OFF 
GO
ALTER DATABASE [Assignment_SU24] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Assignment_SU24] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Assignment_SU24] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Assignment_SU24] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Assignment_SU24] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Assignment_SU24] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Assignment_SU24] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Assignment_SU24] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Assignment_SU24] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Assignment_SU24] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Assignment_SU24] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Assignment_SU24] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Assignment_SU24] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Assignment_SU24] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Assignment_SU24] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Assignment_SU24] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Assignment_SU24] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Assignment_SU24] SET RECOVERY FULL 
GO
ALTER DATABASE [Assignment_SU24] SET  MULTI_USER 
GO
ALTER DATABASE [Assignment_SU24] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Assignment_SU24] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Assignment_SU24] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Assignment_SU24] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Assignment_SU24] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Assignment_SU24] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Assignment_SU24', N'ON'
GO
ALTER DATABASE [Assignment_SU24] SET QUERY_STORE = ON
GO
ALTER DATABASE [Assignment_SU24] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Assignment_SU24]
GO
/****** Object:  Table [dbo].[assesments]    Script Date: 7/6/2024 3:42:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[assesments](
	[aid] [int] NOT NULL,
	[aname] [varchar](150) NOT NULL,
	[weight] [float] NOT NULL,
	[subid] [int] NULL,
 CONSTRAINT [PK_assesments] PRIMARY KEY CLUSTERED 
(
	[aid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[courses]    Script Date: 7/6/2024 3:42:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[courses](
	[cid] [int] NOT NULL,
	[cname] [varchar](150) NOT NULL,
	[lid] [int] NOT NULL,
	[subid] [int] NOT NULL,
	[semid] [int] NOT NULL,
 CONSTRAINT [PK_courses] PRIMARY KEY CLUSTERED 
(
	[cid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[exams]    Script Date: 7/6/2024 3:42:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[exams](
	[eid] [int] NOT NULL,
	[from] [datetime] NOT NULL,
	[duration] [float] NOT NULL,
	[aid] [int] NOT NULL,
 CONSTRAINT [PK_exams] PRIMARY KEY CLUSTERED 
(
	[eid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[grades]    Script Date: 7/6/2024 3:42:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[grades](
	[eid] [int] NOT NULL,
	[sid] [int] NOT NULL,
	[score] [float] NOT NULL,
 CONSTRAINT [PK_grades] PRIMARY KEY CLUSTERED 
(
	[eid] ASC,
	[sid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[lecturers]    Script Date: 7/6/2024 3:42:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[lecturers](
	[lid] [int] NOT NULL,
	[lname] [varchar](150) NOT NULL,
 CONSTRAINT [PK_lecturers] PRIMARY KEY CLUSTERED 
(
	[lid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[semester]    Script Date: 7/6/2024 3:42:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[semester](
	[semid] [int] NOT NULL,
	[year] [int] NOT NULL,
	[season] [varchar](10) NOT NULL,
	[active] [bit] NOT NULL,
 CONSTRAINT [PK_semester] PRIMARY KEY CLUSTERED 
(
	[semid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[students]    Script Date: 7/6/2024 3:42:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[students](
	[sid] [int] NOT NULL,
	[sname] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_students] PRIMARY KEY CLUSTERED 
(
	[sid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[students_courses]    Script Date: 7/6/2024 3:42:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[students_courses](
	[sid] [int] NOT NULL,
	[cid] [int] NOT NULL,
 CONSTRAINT [PK_students_courses] PRIMARY KEY CLUSTERED 
(
	[sid] ASC,
	[cid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[subjects]    Script Date: 7/6/2024 3:42:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[subjects](
	[subid] [int] NOT NULL,
	[subname] [varchar](150) NOT NULL,
 CONSTRAINT [PK_subjects] PRIMARY KEY CLUSTERED 
(
	[subid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user_students]    Script Date: 7/6/2024 3:42:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user_students](
	[username] [varchar](150) NOT NULL,
	[sid] [int] NOT NULL,
	[active] [bit] NOT NULL,
 CONSTRAINT [PK_user_students] PRIMARY KEY CLUSTERED 
(
	[username] ASC,
	[sid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 7/6/2024 3:42:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[username] [varchar](150) NOT NULL,
	[password] [varchar](150) NOT NULL,
	[displayname] [varchar](150) NOT NULL,
 CONSTRAINT [PK_users] PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users_lecturers]    Script Date: 7/6/2024 3:42:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users_lecturers](
	[username] [varchar](150) NOT NULL,
	[lid] [int] NOT NULL,
	[active] [bit] NOT NULL,
 CONSTRAINT [PK_users_lecturers] PRIMARY KEY CLUSTERED 
(
	[username] ASC,
	[lid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[assesments]  WITH CHECK ADD  CONSTRAINT [FK_assesments_subjects] FOREIGN KEY([subid])
REFERENCES [dbo].[subjects] ([subid])
GO
ALTER TABLE [dbo].[assesments] CHECK CONSTRAINT [FK_assesments_subjects]
GO
ALTER TABLE [dbo].[courses]  WITH CHECK ADD  CONSTRAINT [FK_courses_lecturers] FOREIGN KEY([lid])
REFERENCES [dbo].[lecturers] ([lid])
GO
ALTER TABLE [dbo].[courses] CHECK CONSTRAINT [FK_courses_lecturers]
GO
ALTER TABLE [dbo].[courses]  WITH CHECK ADD  CONSTRAINT [FK_courses_semester] FOREIGN KEY([semid])
REFERENCES [dbo].[semester] ([semid])
GO
ALTER TABLE [dbo].[courses] CHECK CONSTRAINT [FK_courses_semester]
GO
ALTER TABLE [dbo].[courses]  WITH CHECK ADD  CONSTRAINT [FK_courses_subjects] FOREIGN KEY([subid])
REFERENCES [dbo].[subjects] ([subid])
GO
ALTER TABLE [dbo].[courses] CHECK CONSTRAINT [FK_courses_subjects]
GO
ALTER TABLE [dbo].[exams]  WITH CHECK ADD  CONSTRAINT [FK_exams_assesments] FOREIGN KEY([aid])
REFERENCES [dbo].[assesments] ([aid])
GO
ALTER TABLE [dbo].[exams] CHECK CONSTRAINT [FK_exams_assesments]
GO
ALTER TABLE [dbo].[grades]  WITH CHECK ADD  CONSTRAINT [FK_grades_exams] FOREIGN KEY([eid])
REFERENCES [dbo].[exams] ([eid])
GO
ALTER TABLE [dbo].[grades] CHECK CONSTRAINT [FK_grades_exams]
GO
ALTER TABLE [dbo].[grades]  WITH CHECK ADD  CONSTRAINT [FK_grades_students] FOREIGN KEY([sid])
REFERENCES [dbo].[students] ([sid])
GO
ALTER TABLE [dbo].[grades] CHECK CONSTRAINT [FK_grades_students]
GO
ALTER TABLE [dbo].[students_courses]  WITH CHECK ADD  CONSTRAINT [FK_students_courses_courses] FOREIGN KEY([cid])
REFERENCES [dbo].[courses] ([cid])
GO
ALTER TABLE [dbo].[students_courses] CHECK CONSTRAINT [FK_students_courses_courses]
GO
ALTER TABLE [dbo].[students_courses]  WITH CHECK ADD  CONSTRAINT [FK_students_courses_students] FOREIGN KEY([sid])
REFERENCES [dbo].[students] ([sid])
GO
ALTER TABLE [dbo].[students_courses] CHECK CONSTRAINT [FK_students_courses_students]
GO
ALTER TABLE [dbo].[user_students]  WITH CHECK ADD  CONSTRAINT [FK_user_students_students] FOREIGN KEY([sid])
REFERENCES [dbo].[students] ([sid])
GO
ALTER TABLE [dbo].[user_students] CHECK CONSTRAINT [FK_user_students_students]
GO
ALTER TABLE [dbo].[user_students]  WITH CHECK ADD  CONSTRAINT [FK_user_students_students1] FOREIGN KEY([sid])
REFERENCES [dbo].[students] ([sid])
GO
ALTER TABLE [dbo].[user_students] CHECK CONSTRAINT [FK_user_students_students1]
GO
ALTER TABLE [dbo].[user_students]  WITH CHECK ADD  CONSTRAINT [FK_user_students_users] FOREIGN KEY([username])
REFERENCES [dbo].[users] ([username])
GO
ALTER TABLE [dbo].[user_students] CHECK CONSTRAINT [FK_user_students_users]
GO
ALTER TABLE [dbo].[users_lecturers]  WITH CHECK ADD  CONSTRAINT [FK_users_lecturers_lecturers] FOREIGN KEY([lid])
REFERENCES [dbo].[lecturers] ([lid])
GO
ALTER TABLE [dbo].[users_lecturers] CHECK CONSTRAINT [FK_users_lecturers_lecturers]
GO
ALTER TABLE [dbo].[users_lecturers]  WITH CHECK ADD  CONSTRAINT [FK_users_lecturers_users] FOREIGN KEY([username])
REFERENCES [dbo].[users] ([username])
GO
ALTER TABLE [dbo].[users_lecturers] CHECK CONSTRAINT [FK_users_lecturers_users]
GO
USE [master]
GO
ALTER DATABASE [Assignment_SU24] SET  READ_WRITE 
GO
