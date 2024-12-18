USE [QLKTX]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 7/13/2024 6:07:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin](
	[adminId] [int] NOT NULL,
	[username] [nvarchar](50) NULL,
	[password] [nvarchar](50) NULL,
	[name] [nvarchar](100) NULL,
	[email] [varchar](100) NULL,
	[role] [nvarchar](50) NULL,
	[phone] [nvarchar](20) NULL,
	[avatar] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[adminId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Application]    Script Date: 7/13/2024 6:07:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Application](
	[applicationId] [int] NOT NULL,
	[usersId] [int] NULL,
	[title] [nvarchar](100) NULL,
	[reason] [nvarchar](500) NULL,
	[files] [nvarchar](100) NULL,
	[statuses] [nvarchar](50) NULL,
	[comment] [nvarchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[applicationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[News]    Script Date: 7/13/2024 6:07:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[News](
	[newsId] [int] IDENTITY(1,1) NOT NULL,
	[title] [varchar](255) NOT NULL,
	[content] [text] NOT NULL,
	[adminId] [int] NOT NULL,
	[timeCreate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[newsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payment]    Script Date: 7/13/2024 6:07:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payment](
	[paymentId] [int] IDENTITY(1,1) NOT NULL,
	[userId] [int] NOT NULL,
	[roomId] [int] NOT NULL,
	[semester] [varchar](50) NOT NULL,
	[total] [int] NOT NULL,
	[status] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[paymentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Room]    Script Date: 7/13/2024 6:07:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Room](
	[roomId] [int] NOT NULL,
	[name] [nvarchar](100) NULL,
	[type] [nvarchar](50) NULL,
	[price] [float] NULL,
	[slot] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[roomId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 7/13/2024 6:07:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[usersId] [int] NOT NULL,
	[username] [nvarchar](50) NULL,
	[password] [nvarchar](50) NULL,
	[name] [nvarchar](100) NULL,
	[email] [nvarchar](100) NULL,
	[phone] [nvarchar](20) NULL,
	[parentName] [nvarchar](100) NULL,
	[parentPhone] [nvarchar](20) NULL,
	[balance] [float] NULL,
	[avatar] [nvarchar](100) NULL,
	[roomId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[usersId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Admin] ([adminId], [username], [password], [name], [email], [role], [phone], [avatar]) VALUES (1, N'admin1', N'pass1', N'Admin Onec', N'admin1@example.com', N'Ban Quản Lý', N'1234567890', N'avatar1.jpg')
INSERT [dbo].[Admin] ([adminId], [username], [password], [name], [email], [role], [phone], [avatar]) VALUES (2, N'admin2', N'pass2', N'Admin Two', N'admin2@example.com', N'Manager', N'1234567891', N'avatar2.jpg')
INSERT [dbo].[Admin] ([adminId], [username], [password], [name], [email], [role], [phone], [avatar]) VALUES (3, N'admin3', N'pass3', N'Admin Three', N'admin3@example.com', N'Staff', N'1234567892', N'avatar3.jpg')
INSERT [dbo].[Admin] ([adminId], [username], [password], [name], [email], [role], [phone], [avatar]) VALUES (5, N'admin5', N'pass5', N'Admin Five', N'admin5@example.com', N'Manager', N'1234567894', N'avatar5.jpg')
INSERT [dbo].[Admin] ([adminId], [username], [password], [name], [email], [role], [phone], [avatar]) VALUES (6, N'admin6', N'pass6', N'Admin Six', N'admin6@example.com', N'Staff', N'1234567895', N'avatar6.jpg')
INSERT [dbo].[Admin] ([adminId], [username], [password], [name], [email], [role], [phone], [avatar]) VALUES (7, N'admin7', N'pass7', N'Admin Seven', N'admin7@example.com', N'SuperAdmin', N'1234567896', N'avatar7.jpg')
INSERT [dbo].[Admin] ([adminId], [username], [password], [name], [email], [role], [phone], [avatar]) VALUES (8, N'admin8', N'pass8', N'Admin Eight', N'admin8@example.com', N'Manager', N'1234567897', N'avatar8.jpg')
GO
INSERT [dbo].[Application] ([applicationId], [usersId], [title], [reason], [files], [statuses], [comment]) VALUES (1, 1, N'Application One', N'Reason One', N'file1.pdf', N'Approved', N'Comment One')
INSERT [dbo].[Application] ([applicationId], [usersId], [title], [reason], [files], [statuses], [comment]) VALUES (2, 2, N'Application Two', N'Reason Two', N'file2.pdf', N'Pending', N'Comment Two')
INSERT [dbo].[Application] ([applicationId], [usersId], [title], [reason], [files], [statuses], [comment]) VALUES (3, 3, N'Application Three', N'Reason Three', N'file3.pdf', N'Rejected', N'Comment Three')
INSERT [dbo].[Application] ([applicationId], [usersId], [title], [reason], [files], [statuses], [comment]) VALUES (4, 4, N'Application Four', N'Reason Four', N'file4.pdf', N'Approved', N'Comment Four')
INSERT [dbo].[Application] ([applicationId], [usersId], [title], [reason], [files], [statuses], [comment]) VALUES (5, 5, N'Application Five', N'Reason Five', N'file5.pdf', N'Pending', N'Comment Five')
INSERT [dbo].[Application] ([applicationId], [usersId], [title], [reason], [files], [statuses], [comment]) VALUES (6, 6, N'Application Six', N'Reason Six', N'file6.pdf', N'Rejected', N'Comment Six')
INSERT [dbo].[Application] ([applicationId], [usersId], [title], [reason], [files], [statuses], [comment]) VALUES (7, 7, N'Application Seven', N'Reason Seven', N'file7.pdf', N'Approved', N'Comment Seven')
INSERT [dbo].[Application] ([applicationId], [usersId], [title], [reason], [files], [statuses], [comment]) VALUES (8, 8, N'Application Eight', N'Reason Eight', N'file8.pdf', N'Pending', N'Comment Eight')
INSERT [dbo].[Application] ([applicationId], [usersId], [title], [reason], [files], [statuses], [comment]) VALUES (9, 9, N'Application Nine', N'Reason Nine', N'file9.pdf', N'Rejected', N'Comment Nine')
INSERT [dbo].[Application] ([applicationId], [usersId], [title], [reason], [files], [statuses], [comment]) VALUES (10, 10, N'Application Ten', N'Reason Ten', N'file10.pdf', N'Approved', N'Comment Ten')
GO
SET IDENTITY_INSERT [dbo].[News] ON 

INSERT [dbo].[News] ([newsId], [title], [content], [adminId], [timeCreate]) VALUES (2, N'News Title 2', N'Content of news 2', 2, CAST(N'2024-07-13T11:00:00.000' AS DateTime))
INSERT [dbo].[News] ([newsId], [title], [content], [adminId], [timeCreate]) VALUES (3, N'News Title 3', N'Content of news 3', 3, CAST(N'2024-07-13T12:00:00.000' AS DateTime))
INSERT [dbo].[News] ([newsId], [title], [content], [adminId], [timeCreate]) VALUES (4, N'News Title 4', N'Content of news 4', 1, CAST(N'2024-07-13T13:00:00.000' AS DateTime))
INSERT [dbo].[News] ([newsId], [title], [content], [adminId], [timeCreate]) VALUES (5, N'News Title 5', N'Content of news 5', 2, CAST(N'2024-07-13T14:00:00.000' AS DateTime))
INSERT [dbo].[News] ([newsId], [title], [content], [adminId], [timeCreate]) VALUES (6, N'News Title 6', N'Content of news 6', 3, CAST(N'2024-07-13T15:00:00.000' AS DateTime))
INSERT [dbo].[News] ([newsId], [title], [content], [adminId], [timeCreate]) VALUES (7, N'News Title 7', N'Content of news 7', 1, CAST(N'2024-07-13T16:00:00.000' AS DateTime))
INSERT [dbo].[News] ([newsId], [title], [content], [adminId], [timeCreate]) VALUES (8, N'News Title 8', N'Content of news 8', 2, CAST(N'2024-07-13T17:00:00.000' AS DateTime))
INSERT [dbo].[News] ([newsId], [title], [content], [adminId], [timeCreate]) VALUES (9, N'News Title 9', N'Content of news 9', 3, CAST(N'2024-07-13T18:00:00.000' AS DateTime))
INSERT [dbo].[News] ([newsId], [title], [content], [adminId], [timeCreate]) VALUES (10, N'News Title 10', N'Content of news 10', 1, CAST(N'2024-07-13T19:00:00.000' AS DateTime))
INSERT [dbo].[News] ([newsId], [title], [content], [adminId], [timeCreate]) VALUES (11, N'Breaking News', N'<p>This is a breaking news article.sdfg</p>', 1, CAST(N'2024-07-13T00:00:00.000' AS DateTime))
INSERT [dbo].[News] ([newsId], [title], [content], [adminId], [timeCreate]) VALUES (12, N'adxcg', N'', 1, CAST(N'2024-07-13T17:21:55.107' AS DateTime))
INSERT [dbo].[News] ([newsId], [title], [content], [adminId], [timeCreate]) VALUES (13, N'adxcg', N'<p>ádfg</p>', 1, CAST(N'2024-07-13T00:00:00.000' AS DateTime))
INSERT [dbo].[News] ([newsId], [title], [content], [adminId], [timeCreate]) VALUES (14, N'sdfg', N'<p>dfgh</p>', 1, CAST(N'2024-07-13T17:22:28.363' AS DateTime))
SET IDENTITY_INSERT [dbo].[News] OFF
GO
SET IDENTITY_INSERT [dbo].[Payment] ON 

INSERT [dbo].[Payment] ([paymentId], [userId], [roomId], [semester], [total], [status]) VALUES (1, 1, 1, N'Fall 2024', 1000, N'Thanh toán thành công')
INSERT [dbo].[Payment] ([paymentId], [userId], [roomId], [semester], [total], [status]) VALUES (2, 2, 2, N'Fall 2024', 1500, N'sss')
INSERT [dbo].[Payment] ([paymentId], [userId], [roomId], [semester], [total], [status]) VALUES (3, 3, 3, N'Spring 2024', 1200, N'Thanh toán thành công')
INSERT [dbo].[Payment] ([paymentId], [userId], [roomId], [semester], [total], [status]) VALUES (4, 4, 1, N'Spring 2024', 1100, N'Thanh toán thành công')
INSERT [dbo].[Payment] ([paymentId], [userId], [roomId], [semester], [total], [status]) VALUES (5, 5, 2, N'Fall 2023', 1400, N'sss')
SET IDENTITY_INSERT [dbo].[Payment] OFF
GO
INSERT [dbo].[Room] ([roomId], [name], [type], [price], [slot]) VALUES (-1418964013, N'test', N'6 BEDS', 700000, 0)
INSERT [dbo].[Room] ([roomId], [name], [type], [price], [slot]) VALUES (1, N'Room A', N'Single', 50, 1)
INSERT [dbo].[Room] ([roomId], [name], [type], [price], [slot]) VALUES (2, N'Room B', N'Double', 75, 0)
INSERT [dbo].[Room] ([roomId], [name], [type], [price], [slot]) VALUES (3, N'Room C', N'Suite', 150, 1)
INSERT [dbo].[Room] ([roomId], [name], [type], [price], [slot]) VALUES (4, N'Room D', N'Single', 55, 0)
INSERT [dbo].[Room] ([roomId], [name], [type], [price], [slot]) VALUES (5, N'Room E', N'Double', 80, 0)
INSERT [dbo].[Room] ([roomId], [name], [type], [price], [slot]) VALUES (6, N'Room F', N'Suite', 155, 0)
INSERT [dbo].[Room] ([roomId], [name], [type], [price], [slot]) VALUES (7, N'Room G', N'Single', 60, 0)
INSERT [dbo].[Room] ([roomId], [name], [type], [price], [slot]) VALUES (8, N'Room H', N'Double', 85, 0)
INSERT [dbo].[Room] ([roomId], [name], [type], [price], [slot]) VALUES (9, N'Room I', N'Suite', 160, 0)
INSERT [dbo].[Room] ([roomId], [name], [type], [price], [slot]) VALUES (10, N'Room J', N'Single', 65, 0)
GO
INSERT [dbo].[Users] ([usersId], [username], [password], [name], [email], [phone], [parentName], [parentPhone], [balance], [avatar], [roomId]) VALUES (-1413660690, N'asd', N'123', N'test', N'asd@gmail.com', N'0123456789', N'1111', N'3456789012333', 0, NULL, NULL)
INSERT [dbo].[Users] ([usersId], [username], [password], [name], [email], [phone], [parentName], [parentPhone], [balance], [avatar], [roomId]) VALUES (1, N'user1', N'1234', N'user1', N'user1', N'123456789', N'Parent One', N'3456789012333', 100, N'avatar1.jpg', NULL)
INSERT [dbo].[Users] ([usersId], [username], [password], [name], [email], [phone], [parentName], [parentPhone], [balance], [avatar], [roomId]) VALUES (2, N'user2', N'pass2', N'User Two', N'user2@example.com', N'2345678902', N'Parent Two', N'3456789013', 150, N'avatar2.jpg', NULL)
INSERT [dbo].[Users] ([usersId], [username], [password], [name], [email], [phone], [parentName], [parentPhone], [balance], [avatar], [roomId]) VALUES (3, N'user3', N'pass3', N'User Three', N'user3@example.com', N'2345678903', N'Parent Three', N'3456789014', 200, N'avatar3.jpg', 3)
INSERT [dbo].[Users] ([usersId], [username], [password], [name], [email], [phone], [parentName], [parentPhone], [balance], [avatar], [roomId]) VALUES (4, N'user4', N'pass4', N'User Four', N'user4@example.com', N'2345678904', N'Parent Four', N'3456789015', 250, N'avatar4.jpg', 1)
INSERT [dbo].[Users] ([usersId], [username], [password], [name], [email], [phone], [parentName], [parentPhone], [balance], [avatar], [roomId]) VALUES (5, N'user5', N'pass5', N'User Five', N'user5@example.com', N'2345678905', N'Parent Five', N'3456789016', 300, N'avatar5.jpg', NULL)
INSERT [dbo].[Users] ([usersId], [username], [password], [name], [email], [phone], [parentName], [parentPhone], [balance], [avatar], [roomId]) VALUES (6, N'user6', N'pass6', N'User Six', N'user6@example.com', N'2345678906', N'Parent Six', N'3456789017', 350, N'avatar6.jpg', NULL)
INSERT [dbo].[Users] ([usersId], [username], [password], [name], [email], [phone], [parentName], [parentPhone], [balance], [avatar], [roomId]) VALUES (7, N'user7', N'pass7', N'User Seven', N'user7@example.com', N'2345678907', N'Parent Seven', N'3456789018', 400, N'avatar7.jpg', NULL)
INSERT [dbo].[Users] ([usersId], [username], [password], [name], [email], [phone], [parentName], [parentPhone], [balance], [avatar], [roomId]) VALUES (8, N'user8', N'pass8', N'User Eight', N'user8@example.com', N'2345678908', N'Parent Eight', N'3456789019', 450, N'avatar8.jpg', NULL)
INSERT [dbo].[Users] ([usersId], [username], [password], [name], [email], [phone], [parentName], [parentPhone], [balance], [avatar], [roomId]) VALUES (9, N'user9', N'pass9', N'User Nine', N'user9@example.com', N'2345678909', N'Parent Nine', N'3456789020', 500, N'avatar9.jpg', NULL)
INSERT [dbo].[Users] ([usersId], [username], [password], [name], [email], [phone], [parentName], [parentPhone], [balance], [avatar], [roomId]) VALUES (10, N'user10', N'pass10', N'User Ten', N'user10@example.com', N'2345678910', N'Parent Ten', N'3456789021', 550, N'avatar10.jpg', NULL)
GO
ALTER TABLE [dbo].[Application]  WITH CHECK ADD FOREIGN KEY([usersId])
REFERENCES [dbo].[Users] ([usersId])
GO
ALTER TABLE [dbo].[News]  WITH CHECK ADD FOREIGN KEY([adminId])
REFERENCES [dbo].[Admin] ([adminId])
GO
ALTER TABLE [dbo].[Payment]  WITH CHECK ADD FOREIGN KEY([roomId])
REFERENCES [dbo].[Room] ([roomId])
GO
ALTER TABLE [dbo].[Payment]  WITH CHECK ADD FOREIGN KEY([userId])
REFERENCES [dbo].[Users] ([usersId])
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD FOREIGN KEY([roomId])
REFERENCES [dbo].[Room] ([roomId])
GO
