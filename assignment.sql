USE [Assignment_SU24]
GO
/****** Object:  Table [dbo].[admin]    Script Date: 7/14/2024 11:43:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[admin](
	[adid] [int] NOT NULL,
	[adname] [varchar](150) NOT NULL,
 CONSTRAINT [PK_admin] PRIMARY KEY CLUSTERED 
(
	[adid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[assesments]    Script Date: 7/14/2024 11:43:33 PM ******/
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
/****** Object:  Table [dbo].[courses]    Script Date: 7/14/2024 11:43:33 PM ******/
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
/****** Object:  Table [dbo].[exams]    Script Date: 7/14/2024 11:43:33 PM ******/
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
/****** Object:  Table [dbo].[grades]    Script Date: 7/14/2024 11:43:33 PM ******/
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
/****** Object:  Table [dbo].[lecturers]    Script Date: 7/14/2024 11:43:33 PM ******/
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
/****** Object:  Table [dbo].[semester]    Script Date: 7/14/2024 11:43:33 PM ******/
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
/****** Object:  Table [dbo].[students]    Script Date: 7/14/2024 11:43:33 PM ******/
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
/****** Object:  Table [dbo].[students_courses]    Script Date: 7/14/2024 11:43:33 PM ******/
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
/****** Object:  Table [dbo].[subjects]    Script Date: 7/14/2024 11:43:33 PM ******/
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
/****** Object:  Table [dbo].[user_admin]    Script Date: 7/14/2024 11:43:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user_admin](
	[username] [varchar](150) NOT NULL,
	[adid] [int] NOT NULL,
	[active] [bit] NOT NULL,
 CONSTRAINT [PK_user_admin] PRIMARY KEY CLUSTERED 
(
	[username] ASC,
	[adid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user_students]    Script Date: 7/14/2024 11:43:33 PM ******/
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
/****** Object:  Table [dbo].[users]    Script Date: 7/14/2024 11:43:33 PM ******/
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
/****** Object:  Table [dbo].[users_lecturers]    Script Date: 7/14/2024 11:43:33 PM ******/
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
INSERT [dbo].[admin] ([adid], [adname]) VALUES (1, N'admin')
GO
INSERT [dbo].[assesments] ([aid], [aname], [weight], [subid]) VALUES (1, N'WS1', 5, 1)
INSERT [dbo].[assesments] ([aid], [aname], [weight], [subid]) VALUES (2, N'WS2', 5, 1)
INSERT [dbo].[assesments] ([aid], [aname], [weight], [subid]) VALUES (3, N'PT', 5, 1)
INSERT [dbo].[assesments] ([aid], [aname], [weight], [subid]) VALUES (4, N'PT2', 5, 1)
INSERT [dbo].[assesments] ([aid], [aname], [weight], [subid]) VALUES (5, N'Assignment', 40, 1)
INSERT [dbo].[assesments] ([aid], [aname], [weight], [subid]) VALUES (6, N'Final Exam', 20, 1)
INSERT [dbo].[assesments] ([aid], [aname], [weight], [subid]) VALUES (7, N'Practical Exam', 20, 1)
INSERT [dbo].[assesments] ([aid], [aname], [weight], [subid]) VALUES (8, N'WS1', 50, 2)
INSERT [dbo].[assesments] ([aid], [aname], [weight], [subid]) VALUES (9, N'WS2', 50, 2)
INSERT [dbo].[assesments] ([aid], [aname], [weight], [subid]) VALUES (10, N'FE', 100, 3)
INSERT [dbo].[assesments] ([aid], [aname], [weight], [subid]) VALUES (11, N'Midterm', 50, 4)
INSERT [dbo].[assesments] ([aid], [aname], [weight], [subid]) VALUES (12, N'Final Exam', 50, 4)
INSERT [dbo].[assesments] ([aid], [aname], [weight], [subid]) VALUES (13, N'Midterm', 50, 5)
INSERT [dbo].[assesments] ([aid], [aname], [weight], [subid]) VALUES (14, N'Final Exam', 50, 5)
INSERT [dbo].[assesments] ([aid], [aname], [weight], [subid]) VALUES (15, N'Practical Exam', 50, 6)
INSERT [dbo].[assesments] ([aid], [aname], [weight], [subid]) VALUES (16, N'Theory Exam', 50, 6)
GO
INSERT [dbo].[courses] ([cid], [cname], [lid], [subid], [semid]) VALUES (1, N'SE1871-PRJ301', 1, 1, 4)
INSERT [dbo].[courses] ([cid], [cname], [lid], [subid], [semid]) VALUES (2, N'SE1871-IOT102', 2, 2, 4)
INSERT [dbo].[courses] ([cid], [cname], [lid], [subid], [semid]) VALUES (3, N'SE1871-PRO192', 1, 3, 4)
INSERT [dbo].[courses] ([cid], [cname], [lid], [subid], [semid]) VALUES (4, N'SE1922-PRJ301', 5, 1, 4)
INSERT [dbo].[courses] ([cid], [cname], [lid], [subid], [semid]) VALUES (5, N'SE1877-JS', 3, 4, 4)
INSERT [dbo].[courses] ([cid], [cname], [lid], [subid], [semid]) VALUES (6, N'SE1990-JPD123', 4, 5, 4)
INSERT [dbo].[courses] ([cid], [cname], [lid], [subid], [semid]) VALUES (7, N'SE1770-CSD201', 2, 6, 2)
GO
INSERT [dbo].[exams] ([eid], [from], [duration], [aid]) VALUES (1, CAST(N'2024-07-01T09:00:00.000' AS DateTime), 2.5, 3)
INSERT [dbo].[exams] ([eid], [from], [duration], [aid]) VALUES (2, CAST(N'2024-06-25T10:30:00.000' AS DateTime), 3, 14)
INSERT [dbo].[exams] ([eid], [from], [duration], [aid]) VALUES (3, CAST(N'2024-06-29T08:45:00.000' AS DateTime), 1.5, 7)
INSERT [dbo].[exams] ([eid], [from], [duration], [aid]) VALUES (4, CAST(N'2024-07-04T12:15:00.000' AS DateTime), 2, 9)
INSERT [dbo].[exams] ([eid], [from], [duration], [aid]) VALUES (5, CAST(N'2024-07-08T13:00:00.000' AS DateTime), 2.5, 2)
INSERT [dbo].[exams] ([eid], [from], [duration], [aid]) VALUES (6, CAST(N'2024-06-30T14:00:00.000' AS DateTime), 3, 16)
INSERT [dbo].[exams] ([eid], [from], [duration], [aid]) VALUES (7, CAST(N'2024-07-05T15:20:00.000' AS DateTime), 1.5, 11)
INSERT [dbo].[exams] ([eid], [from], [duration], [aid]) VALUES (8, CAST(N'2024-07-07T16:10:00.000' AS DateTime), 2, 4)
INSERT [dbo].[exams] ([eid], [from], [duration], [aid]) VALUES (9, CAST(N'2024-07-10T17:30:00.000' AS DateTime), 2.5, 1)
INSERT [dbo].[exams] ([eid], [from], [duration], [aid]) VALUES (10, CAST(N'2024-06-27T18:25:00.000' AS DateTime), 3, 13)
INSERT [dbo].[exams] ([eid], [from], [duration], [aid]) VALUES (11, CAST(N'2024-07-12T19:40:00.000' AS DateTime), 1.5, 8)
INSERT [dbo].[exams] ([eid], [from], [duration], [aid]) VALUES (12, CAST(N'2024-06-24T20:00:00.000' AS DateTime), 2, 6)
INSERT [dbo].[exams] ([eid], [from], [duration], [aid]) VALUES (13, CAST(N'2024-06-28T21:15:00.000' AS DateTime), 2.5, 15)
INSERT [dbo].[exams] ([eid], [from], [duration], [aid]) VALUES (14, CAST(N'2024-07-03T22:00:00.000' AS DateTime), 3, 5)
INSERT [dbo].[exams] ([eid], [from], [duration], [aid]) VALUES (15, CAST(N'2024-07-09T23:10:00.000' AS DateTime), 1.5, 12)
INSERT [dbo].[exams] ([eid], [from], [duration], [aid]) VALUES (16, CAST(N'2024-07-06T08:00:00.000' AS DateTime), 2, 10)
GO
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (1, 1, 5.25)
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (1, 2, 7.75)
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (1, 3, 9)
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (1, 4, 5.5)
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (1, 5, 6.75)
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (1, 6, 8.25)
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (2, 1, 7.25)
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (2, 2, 5.75)
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (2, 3, 8.5)
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (2, 4, 9.75)
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (2, 5, 5)
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (2, 6, 6.25)
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (3, 1, 6.5)
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (3, 2, 7)
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (3, 3, 9.25)
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (3, 4, 5.25)
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (3, 5, 8.75)
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (3, 6, 7.25)
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (4, 1, 5.5)
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (4, 2, 7.75)
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (4, 3, 8)
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (4, 4, 6.25)
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (4, 5, 9.5)
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (4, 6, 5.75)
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (5, 1, 8.25)
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (5, 2, 9.75)
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (5, 3, 7.5)
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (5, 4, 6)
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (5, 5, 5.25)
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (5, 6, 7.75)
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (6, 1, 6.75)
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (6, 2, 5)
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (6, 3, 9)
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (6, 4, 8.5)
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (6, 5, 7.25)
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (6, 6, 6.5)
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (7, 1, 5.25)
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (7, 2, 9.75)
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (7, 3, 8.75)
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (7, 4, 7)
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (7, 5, 5.5)
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (7, 6, 9.25)
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (8, 1, 6)
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (8, 2, 8.25)
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (8, 3, 5.75)
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (8, 4, 9.5)
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (8, 5, 7.75)
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (8, 6, 6.25)
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (9, 1, 7.25)
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (9, 2, 8.75)
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (9, 3, 6.5)
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (9, 4, 5)
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (9, 5, 9.75)
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (9, 6, 7.5)
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (10, 1, 6.75)
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (10, 2, 8)
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (10, 3, 5.25)
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (10, 4, 9)
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (10, 5, 7.25)
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (10, 6, 6)
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (11, 1, 5.5)
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (11, 2, 7.75)
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (11, 3, 8.5)
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (11, 4, 9.25)
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (11, 5, 5.75)
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (11, 6, 6.25)
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (12, 1, 7)
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (12, 2, 6.5)
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (12, 3, 9.75)
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (12, 4, 8.25)
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (12, 5, 5)
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (12, 6, 7.25)
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (13, 1, 6.75)
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (13, 2, 9.5)
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (13, 3, 8.75)
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (13, 4, 5.25)
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (13, 5, 7)
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (13, 6, 6.5)
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (14, 1, 5.75)
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (14, 2, 7.5)
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (14, 3, 6)
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (14, 4, 8)
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (14, 5, 9.75)
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (14, 6, 5.25)
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (15, 1, 8.5)
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (15, 2, 7.25)
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (15, 3, 5.5)
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (15, 4, 6.75)
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (15, 5, 9)
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (15, 6, 8.75)
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (16, 1, 7.75)
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (16, 2, 6.25)
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (16, 3, 7)
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (16, 4, 9.5)
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (16, 5, 8)
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (16, 6, 7.5)
GO
INSERT [dbo].[lecturers] ([lid], [lname]) VALUES (1, N'Ngo Tung Son')
INSERT [dbo].[lecturers] ([lid], [lname]) VALUES (2, N'Vuong Minh Tuan')
INSERT [dbo].[lecturers] ([lid], [lname]) VALUES (3, N'Kaarage Kage')
INSERT [dbo].[lecturers] ([lid], [lname]) VALUES (4, N'Nakamura Takami')
INSERT [dbo].[lecturers] ([lid], [lname]) VALUES (5, N'Tran Quoc Viet')
GO
INSERT [dbo].[semester] ([semid], [year], [season], [active]) VALUES (1, 2023, N'SUMMER', 0)
INSERT [dbo].[semester] ([semid], [year], [season], [active]) VALUES (2, 2023, N'FALL', 1)
INSERT [dbo].[semester] ([semid], [year], [season], [active]) VALUES (3, 2024, N'SPRING', 0)
INSERT [dbo].[semester] ([semid], [year], [season], [active]) VALUES (4, 2024, N'SUMMER', 1)
GO
INSERT [dbo].[students] ([sid], [sname]) VALUES (1, N'Tran Huy Tuan')
INSERT [dbo].[students] ([sid], [sname]) VALUES (2, N'Nguyen Minh Duc')
INSERT [dbo].[students] ([sid], [sname]) VALUES (3, N'Nguyen Minh Tri')
INSERT [dbo].[students] ([sid], [sname]) VALUES (4, N'Nguyen An Son')
INSERT [dbo].[students] ([sid], [sname]) VALUES (5, N'Pham Quoc Dat')
INSERT [dbo].[students] ([sid], [sname]) VALUES (6, N'Huynh Nguyen Hoang Phuoc')
GO
INSERT [dbo].[students_courses] ([sid], [cid]) VALUES (1, 1)
INSERT [dbo].[students_courses] ([sid], [cid]) VALUES (1, 2)
INSERT [dbo].[students_courses] ([sid], [cid]) VALUES (1, 3)
INSERT [dbo].[students_courses] ([sid], [cid]) VALUES (1, 4)
INSERT [dbo].[students_courses] ([sid], [cid]) VALUES (1, 5)
INSERT [dbo].[students_courses] ([sid], [cid]) VALUES (1, 6)
INSERT [dbo].[students_courses] ([sid], [cid]) VALUES (1, 7)
INSERT [dbo].[students_courses] ([sid], [cid]) VALUES (2, 1)
INSERT [dbo].[students_courses] ([sid], [cid]) VALUES (2, 2)
INSERT [dbo].[students_courses] ([sid], [cid]) VALUES (2, 3)
INSERT [dbo].[students_courses] ([sid], [cid]) VALUES (2, 4)
INSERT [dbo].[students_courses] ([sid], [cid]) VALUES (2, 5)
INSERT [dbo].[students_courses] ([sid], [cid]) VALUES (2, 6)
INSERT [dbo].[students_courses] ([sid], [cid]) VALUES (2, 7)
INSERT [dbo].[students_courses] ([sid], [cid]) VALUES (3, 1)
INSERT [dbo].[students_courses] ([sid], [cid]) VALUES (3, 2)
INSERT [dbo].[students_courses] ([sid], [cid]) VALUES (3, 3)
INSERT [dbo].[students_courses] ([sid], [cid]) VALUES (3, 4)
INSERT [dbo].[students_courses] ([sid], [cid]) VALUES (3, 5)
INSERT [dbo].[students_courses] ([sid], [cid]) VALUES (3, 6)
INSERT [dbo].[students_courses] ([sid], [cid]) VALUES (3, 7)
INSERT [dbo].[students_courses] ([sid], [cid]) VALUES (4, 1)
INSERT [dbo].[students_courses] ([sid], [cid]) VALUES (4, 2)
INSERT [dbo].[students_courses] ([sid], [cid]) VALUES (4, 3)
INSERT [dbo].[students_courses] ([sid], [cid]) VALUES (4, 4)
INSERT [dbo].[students_courses] ([sid], [cid]) VALUES (4, 5)
INSERT [dbo].[students_courses] ([sid], [cid]) VALUES (4, 6)
INSERT [dbo].[students_courses] ([sid], [cid]) VALUES (4, 7)
INSERT [dbo].[students_courses] ([sid], [cid]) VALUES (5, 1)
INSERT [dbo].[students_courses] ([sid], [cid]) VALUES (5, 2)
INSERT [dbo].[students_courses] ([sid], [cid]) VALUES (5, 3)
INSERT [dbo].[students_courses] ([sid], [cid]) VALUES (5, 4)
INSERT [dbo].[students_courses] ([sid], [cid]) VALUES (5, 5)
INSERT [dbo].[students_courses] ([sid], [cid]) VALUES (5, 6)
INSERT [dbo].[students_courses] ([sid], [cid]) VALUES (5, 7)
INSERT [dbo].[students_courses] ([sid], [cid]) VALUES (6, 1)
INSERT [dbo].[students_courses] ([sid], [cid]) VALUES (6, 2)
INSERT [dbo].[students_courses] ([sid], [cid]) VALUES (6, 3)
INSERT [dbo].[students_courses] ([sid], [cid]) VALUES (6, 4)
INSERT [dbo].[students_courses] ([sid], [cid]) VALUES (6, 5)
INSERT [dbo].[students_courses] ([sid], [cid]) VALUES (6, 6)
INSERT [dbo].[students_courses] ([sid], [cid]) VALUES (6, 7)
GO
INSERT [dbo].[subjects] ([subid], [subname]) VALUES (1, N'PRJ301')
INSERT [dbo].[subjects] ([subid], [subname]) VALUES (2, N'IOT102')
INSERT [dbo].[subjects] ([subid], [subname]) VALUES (3, N'PRO192')
INSERT [dbo].[subjects] ([subid], [subname]) VALUES (4, N'JPD133')
INSERT [dbo].[subjects] ([subid], [subname]) VALUES (5, N'JPD123')
INSERT [dbo].[subjects] ([subid], [subname]) VALUES (6, N'CSD201')
GO
INSERT [dbo].[user_admin] ([username], [adid], [active]) VALUES (N'admin', 1, 1)
GO
INSERT [dbo].[user_students] ([username], [sid], [active]) VALUES (N'datpq', 5, 1)
INSERT [dbo].[user_students] ([username], [sid], [active]) VALUES (N'ducnm', 2, 1)
INSERT [dbo].[user_students] ([username], [sid], [active]) VALUES (N'phuochnh', 6, 1)
INSERT [dbo].[user_students] ([username], [sid], [active]) VALUES (N'sonna', 4, 1)
INSERT [dbo].[user_students] ([username], [sid], [active]) VALUES (N'trinm', 3, 1)
INSERT [dbo].[user_students] ([username], [sid], [active]) VALUES (N'tuanth', 1, 1)
GO
INSERT [dbo].[users] ([username], [password], [displayname]) VALUES (N'admin', N'123', N'Office of Testing and Quality Assurance')
INSERT [dbo].[users] ([username], [password], [displayname]) VALUES (N'datpq', N'123', N'Pham Quoc Dat')
INSERT [dbo].[users] ([username], [password], [displayname]) VALUES (N'ducnm', N'123', N'Nguyen Minh Duc')
INSERT [dbo].[users] ([username], [password], [displayname]) VALUES (N'kage', N'123', N'Karaage Kage')
INSERT [dbo].[users] ([username], [password], [displayname]) VALUES (N'phuochnh', N'123', N'Huynh Nguyen Hoang Phuoc')
INSERT [dbo].[users] ([username], [password], [displayname]) VALUES (N'sonna', N'123', N'Nguyen An Son')
INSERT [dbo].[users] ([username], [password], [displayname]) VALUES (N'sonnt', N'123', N'Ngo Tung Son')
INSERT [dbo].[users] ([username], [password], [displayname]) VALUES (N'takami', N'123', N'Nakamura Takami')
INSERT [dbo].[users] ([username], [password], [displayname]) VALUES (N'trinm', N'123', N'Nguyen Minh Tri')
INSERT [dbo].[users] ([username], [password], [displayname]) VALUES (N'tuamvm2', N'123', N'Vuong Minh Tuan')
INSERT [dbo].[users] ([username], [password], [displayname]) VALUES (N'tuanth', N'123', N'Tran Huy Tuan')
INSERT [dbo].[users] ([username], [password], [displayname]) VALUES (N'viettq', N'123', N'Tran Quoc Viet')
GO
INSERT [dbo].[users_lecturers] ([username], [lid], [active]) VALUES (N'kage', 3, 1)
INSERT [dbo].[users_lecturers] ([username], [lid], [active]) VALUES (N'sonnt', 1, 1)
INSERT [dbo].[users_lecturers] ([username], [lid], [active]) VALUES (N'takami', 4, 1)
INSERT [dbo].[users_lecturers] ([username], [lid], [active]) VALUES (N'tuamvm2', 2, 1)
INSERT [dbo].[users_lecturers] ([username], [lid], [active]) VALUES (N'viettq', 5, 1)
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
ALTER TABLE [dbo].[user_admin]  WITH CHECK ADD  CONSTRAINT [FK_user_admin_admin] FOREIGN KEY([adid])
REFERENCES [dbo].[admin] ([adid])
GO
ALTER TABLE [dbo].[user_admin] CHECK CONSTRAINT [FK_user_admin_admin]
GO
ALTER TABLE [dbo].[user_admin]  WITH CHECK ADD  CONSTRAINT [FK_user_admin_users] FOREIGN KEY([username])
REFERENCES [dbo].[users] ([username])
GO
ALTER TABLE [dbo].[user_admin] CHECK CONSTRAINT [FK_user_admin_users]
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
