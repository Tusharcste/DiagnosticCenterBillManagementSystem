USE [master]
GO
/****** Object:  Database [DiagnosisCenteBill]    Script Date: 8/7/2016 11:56:33 AM ******/
CREATE DATABASE [DiagnosisCenteBill]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DiagnosisCenteBill', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\DiagnosisCenteBill.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'DiagnosisCenteBill_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\DiagnosisCenteBill_log.ldf' , SIZE = 4672KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [DiagnosisCenteBill] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DiagnosisCenteBill].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DiagnosisCenteBill] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DiagnosisCenteBill] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DiagnosisCenteBill] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DiagnosisCenteBill] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DiagnosisCenteBill] SET ARITHABORT OFF 
GO
ALTER DATABASE [DiagnosisCenteBill] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DiagnosisCenteBill] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [DiagnosisCenteBill] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DiagnosisCenteBill] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DiagnosisCenteBill] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DiagnosisCenteBill] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DiagnosisCenteBill] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DiagnosisCenteBill] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DiagnosisCenteBill] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DiagnosisCenteBill] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DiagnosisCenteBill] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DiagnosisCenteBill] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DiagnosisCenteBill] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DiagnosisCenteBill] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DiagnosisCenteBill] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DiagnosisCenteBill] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DiagnosisCenteBill] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DiagnosisCenteBill] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DiagnosisCenteBill] SET RECOVERY FULL 
GO
ALTER DATABASE [DiagnosisCenteBill] SET  MULTI_USER 
GO
ALTER DATABASE [DiagnosisCenteBill] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DiagnosisCenteBill] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DiagnosisCenteBill] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DiagnosisCenteBill] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [DiagnosisCenteBill]
GO
/****** Object:  Table [dbo].[Patient]    Script Date: 8/7/2016 11:56:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Patient](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PatientName] [nvarchar](50) NULL,
	[DateOfBirth] [date] NULL,
	[BillNo] [nvarchar](50) NULL,
	[Mobile] [nvarchar](11) NULL,
	[PaymentStatus] [bit] NULL,
	[InsertDate] [date] NULL,
 CONSTRAINT [PK_TestEntry] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PatientTest]    Script Date: 8/7/2016 11:56:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PatientTest](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PatientId] [int] NULL,
	[TestSetupId] [int] NULL,
	[BillNo] [nvarchar](50) NULL,
	[InsertDate] [date] NULL,
 CONSTRAINT [PK_PatientTest] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Payment]    Script Date: 8/7/2016 11:56:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payment](
	[Id] [int] NOT NULL,
	[PatientTestId] [int] NULL,
	[Amount] [decimal](18, 2) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TestSetup]    Script Date: 8/7/2016 11:56:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TestSetup](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TestName] [nvarchar](50) NULL,
	[Fee] [decimal](18, 2) NULL,
	[TestTypeId] [int] NULL,
	[InsertDate] [date] NULL,
 CONSTRAINT [PK_TestSetup] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TestType]    Script Date: 8/7/2016 11:56:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TestType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[InsertDate] [date] NULL,
 CONSTRAINT [PK_TestType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[DateWiseTestReport]    Script Date: 8/7/2016 11:56:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[DateWiseTestReport]
AS
SELECT     T.TestName, T.Fee, PT.InsertDate, COUNT(T.Id) AS TotalCount
FROM         dbo.TestSetup AS T INNER JOIN
                      dbo.TestType AS PT ON T.TestTypeId = PT.Id
GROUP BY T.TestName, PT.InsertDate, T.Fee

GO
/****** Object:  View [dbo].[TestSetup_view]    Script Date: 8/7/2016 11:56:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[TestSetup_view]
as
SELECT     TestSetup.TestName, TestSetup.Fee, TestType.Name
FROM         TestSetup INNER JOIN
                      TestType ON TestSetup.TestTypeId = TestType.Id
GO
/****** Object:  View [dbo].[TypeWiseTestReport]    Script Date: 8/7/2016 11:56:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[TypeWiseTestReport]
AS
SELECT        dbo.TestType.Name, dbo.PatientTest.InsertDate, COUNT(dbo.TestType.Name) AS Count, SUM(dbo.TestSetup.Fee) AS Total
FROM            dbo.PatientTest INNER JOIN
                         dbo.TestSetup ON dbo.PatientTest.TestSetupId = dbo.TestSetup.Id INNER JOIN
                         dbo.TestType ON dbo.TestSetup.TestTypeId = dbo.TestType.Id
GROUP BY dbo.TestType.Name, dbo.PatientTest.InsertDate

GO
/****** Object:  View [dbo].[unpaidBillView]    Script Date: 8/7/2016 11:56:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[unpaidBillView] as
SELECT     Patient.PatientName, Patient.BillNo, Patient.Mobile,SUM( TestSetup.Fee) as Total, Patient.PaymentStatus,PatientTest.InsertDate
FROM         Patient INNER JOIN
                      PatientTest ON Patient.Id = PatientTest.PatientId INNER JOIN
                      TestSetup ON PatientTest.TestSetupId = TestSetup.Id
                      where Patient.PaymentStatus !=1
                      group by Patient.PatientName,Patient.BillNo,Patient.Mobile,Patient.PaymentStatus,PatientTest.InsertDate
GO
SET IDENTITY_INSERT [dbo].[Patient] ON 

INSERT [dbo].[Patient] ([Id], [PatientName], [DateOfBirth], [BillNo], [Mobile], [PaymentStatus], [InsertDate]) VALUES (27, N'ahmed', CAST(0xC3150B00 AS Date), N'01991', N'DBS68163047', 0, CAST(0xB53B0B00 AS Date))
INSERT [dbo].[Patient] ([Id], [PatientName], [DateOfBirth], [BillNo], [Mobile], [PaymentStatus], [InsertDate]) VALUES (32, N'rofiq', CAST(0xE23A0B00 AS Date), N'DBS2035', N'01199', 1, CAST(0xB53B0B00 AS Date))
INSERT [dbo].[Patient] ([Id], [PatientName], [DateOfBirth], [BillNo], [Mobile], [PaymentStatus], [InsertDate]) VALUES (33, N'ab Based', CAST(0x9D180B00 AS Date), N'DBS2713', N'0168', 0, CAST(0xB53B0B00 AS Date))
INSERT [dbo].[Patient] ([Id], [PatientName], [DateOfBirth], [BillNo], [Mobile], [PaymentStatus], [InsertDate]) VALUES (34, N'ahmed reza', CAST(0x75140B00 AS Date), N'DBS1547', N'11811', 1, CAST(0xB53B0B00 AS Date))
INSERT [dbo].[Patient] ([Id], [PatientName], [DateOfBirth], [BillNo], [Mobile], [PaymentStatus], [InsertDate]) VALUES (35, N'rezaul', CAST(0xC3150B00 AS Date), N'DBS3810', N'0168', 1, CAST(0xB53B0B00 AS Date))
INSERT [dbo].[Patient] ([Id], [PatientName], [DateOfBirth], [BillNo], [Mobile], [PaymentStatus], [InsertDate]) VALUES (36, N'ab hamidur rahman', CAST(0x013B0B00 AS Date), N'DBS2519', N'0119988', 0, CAST(0xB53B0B00 AS Date))
INSERT [dbo].[Patient] ([Id], [PatientName], [DateOfBirth], [BillNo], [Mobile], [PaymentStatus], [InsertDate]) VALUES (37, N'ahmed', CAST(0x013B0B00 AS Date), N'DBS8443', N'01991', 1, CAST(0xB53B0B00 AS Date))
INSERT [dbo].[Patient] ([Id], [PatientName], [DateOfBirth], [BillNo], [Mobile], [PaymentStatus], [InsertDate]) VALUES (39, N'yousuf', CAST(0xE23A0B00 AS Date), N'DBS1471', N'01991', 1, CAST(0xB53B0B00 AS Date))
INSERT [dbo].[Patient] ([Id], [PatientName], [DateOfBirth], [BillNo], [Mobile], [PaymentStatus], [InsertDate]) VALUES (40, N'Rimon', CAST(0x57140B00 AS Date), N'DBS1542', N'01756412348', NULL, CAST(0xB63B0B00 AS Date))
INSERT [dbo].[Patient] ([Id], [PatientName], [DateOfBirth], [BillNo], [Mobile], [PaymentStatus], [InsertDate]) VALUES (41, N'Hasan', CAST(0x89180B00 AS Date), N'DBS8884', N'01721236584', NULL, CAST(0xB63B0B00 AS Date))
INSERT [dbo].[Patient] ([Id], [PatientName], [DateOfBirth], [BillNo], [Mobile], [PaymentStatus], [InsertDate]) VALUES (42, N'Hasan', CAST(0xAF150B00 AS Date), N'DBS1057', N'01745896541', NULL, CAST(0xB63B0B00 AS Date))
INSERT [dbo].[Patient] ([Id], [PatientName], [DateOfBirth], [BillNo], [Mobile], [PaymentStatus], [InsertDate]) VALUES (43, N'Atik', CAST(0x34170B00 AS Date), N'DBS4891', N'0978451236', NULL, CAST(0xB63B0B00 AS Date))
INSERT [dbo].[Patient] ([Id], [PatientName], [DateOfBirth], [BillNo], [Mobile], [PaymentStatus], [InsertDate]) VALUES (44, N'Rakib', CAST(0x2C180B00 AS Date), N'DBS1435', N'01963147854', NULL, CAST(0xB63B0B00 AS Date))
INSERT [dbo].[Patient] ([Id], [PatientName], [DateOfBirth], [BillNo], [Mobile], [PaymentStatus], [InsertDate]) VALUES (45, N'Preom', CAST(0x89180B00 AS Date), N'DBS6163', N'01984123654', NULL, CAST(0xB63B0B00 AS Date))
INSERT [dbo].[Patient] ([Id], [PatientName], [DateOfBirth], [BillNo], [Mobile], [PaymentStatus], [InsertDate]) VALUES (46, N'Preom', CAST(0x89180B00 AS Date), N'DBS8539', N'01984123654', NULL, CAST(0xB63B0B00 AS Date))
INSERT [dbo].[Patient] ([Id], [PatientName], [DateOfBirth], [BillNo], [Mobile], [PaymentStatus], [InsertDate]) VALUES (47, N'Tahid', CAST(0x89180B00 AS Date), N'DBS6873', N'01987123456', NULL, CAST(0xB63B0B00 AS Date))
INSERT [dbo].[Patient] ([Id], [PatientName], [DateOfBirth], [BillNo], [Mobile], [PaymentStatus], [InsertDate]) VALUES (48, N'Ataur', CAST(0x89180B00 AS Date), N'DBS2370', N'01741236547', NULL, CAST(0xB63B0B00 AS Date))
INSERT [dbo].[Patient] ([Id], [PatientName], [DateOfBirth], [BillNo], [Mobile], [PaymentStatus], [InsertDate]) VALUES (49, N'Masud', CAST(0x9B180B00 AS Date), N'DBS7738', N'01789654123', NULL, CAST(0xB63B0B00 AS Date))
INSERT [dbo].[Patient] ([Id], [PatientName], [DateOfBirth], [BillNo], [Mobile], [PaymentStatus], [InsertDate]) VALUES (50, N'Sadi', CAST(0x9A180B00 AS Date), N'DBS7290', N'01854123654', NULL, CAST(0xB63B0B00 AS Date))
INSERT [dbo].[Patient] ([Id], [PatientName], [DateOfBirth], [BillNo], [Mobile], [PaymentStatus], [InsertDate]) VALUES (52, N'Rakib', CAST(0x31170B00 AS Date), N'DBS3938', N'01741236541', NULL, CAST(0xB63B0B00 AS Date))
INSERT [dbo].[Patient] ([Id], [PatientName], [DateOfBirth], [BillNo], [Mobile], [PaymentStatus], [InsertDate]) VALUES (53, N'Marjan Islam', CAST(0x31170B00 AS Date), N'DBS5368', N'01941236541', NULL, CAST(0xB63B0B00 AS Date))
INSERT [dbo].[Patient] ([Id], [PatientName], [DateOfBirth], [BillNo], [Mobile], [PaymentStatus], [InsertDate]) VALUES (54, N'Islam', CAST(0x531E0B00 AS Date), N'DBS8458', N'01715412365', NULL, CAST(0xB63B0B00 AS Date))
INSERT [dbo].[Patient] ([Id], [PatientName], [DateOfBirth], [BillNo], [Mobile], [PaymentStatus], [InsertDate]) VALUES (55, N'Khan', CAST(0xAC1F0B00 AS Date), N'DBS4082', N'01754123541', NULL, CAST(0xB63B0B00 AS Date))
INSERT [dbo].[Patient] ([Id], [PatientName], [DateOfBirth], [BillNo], [Mobile], [PaymentStatus], [InsertDate]) VALUES (56, N'Rimon', CAST(0xE41C0B00 AS Date), N'DBS6033', N'01745126954', NULL, CAST(0xB63B0B00 AS Date))
INSERT [dbo].[Patient] ([Id], [PatientName], [DateOfBirth], [BillNo], [Mobile], [PaymentStatus], [InsertDate]) VALUES (57, N'Jomir Uddin Khan', CAST(0xBB150B00 AS Date), N'DBS6671', N'01974154632', NULL, CAST(0xB63B0B00 AS Date))
INSERT [dbo].[Patient] ([Id], [PatientName], [DateOfBirth], [BillNo], [Mobile], [PaymentStatus], [InsertDate]) VALUES (58, N'Emon', CAST(0xBC150B00 AS Date), N'DBS2528', N'01845123654', NULL, CAST(0xB63B0B00 AS Date))
INSERT [dbo].[Patient] ([Id], [PatientName], [DateOfBirth], [BillNo], [Mobile], [PaymentStatus], [InsertDate]) VALUES (59, N'Messi', CAST(0x820E0B00 AS Date), N'', N'01456321789', NULL, CAST(0xB63B0B00 AS Date))
INSERT [dbo].[Patient] ([Id], [PatientName], [DateOfBirth], [BillNo], [Mobile], [PaymentStatus], [InsertDate]) VALUES (60, N'ABC', CAST(0x19100B00 AS Date), N'DBS5847', N'01542136541', 1, CAST(0xB63B0B00 AS Date))
INSERT [dbo].[Patient] ([Id], [PatientName], [DateOfBirth], [BillNo], [Mobile], [PaymentStatus], [InsertDate]) VALUES (62, N'Rakib', CAST(0x7A1B0B00 AS Date), N'DBS2562', N'01456321457', NULL, CAST(0xB63B0B00 AS Date))
SET IDENTITY_INSERT [dbo].[Patient] OFF
SET IDENTITY_INSERT [dbo].[PatientTest] ON 

INSERT [dbo].[PatientTest] ([Id], [PatientId], [TestSetupId], [BillNo], [InsertDate]) VALUES (23, 25, 4, NULL, CAST(0xB53B0B00 AS Date))
INSERT [dbo].[PatientTest] ([Id], [PatientId], [TestSetupId], [BillNo], [InsertDate]) VALUES (24, 25, 5, NULL, CAST(0xB53B0B00 AS Date))
INSERT [dbo].[PatientTest] ([Id], [PatientId], [TestSetupId], [BillNo], [InsertDate]) VALUES (25, 25, 9, NULL, CAST(0xB53B0B00 AS Date))
INSERT [dbo].[PatientTest] ([Id], [PatientId], [TestSetupId], [BillNo], [InsertDate]) VALUES (26, 27, 1, NULL, CAST(0xB53B0B00 AS Date))
INSERT [dbo].[PatientTest] ([Id], [PatientId], [TestSetupId], [BillNo], [InsertDate]) VALUES (27, 27, 6, NULL, CAST(0xB53B0B00 AS Date))
INSERT [dbo].[PatientTest] ([Id], [PatientId], [TestSetupId], [BillNo], [InsertDate]) VALUES (28, 32, 3, NULL, CAST(0xB53B0B00 AS Date))
INSERT [dbo].[PatientTest] ([Id], [PatientId], [TestSetupId], [BillNo], [InsertDate]) VALUES (29, 32, 6, NULL, CAST(0xB53B0B00 AS Date))
INSERT [dbo].[PatientTest] ([Id], [PatientId], [TestSetupId], [BillNo], [InsertDate]) VALUES (30, 33, 4, NULL, CAST(0xB53B0B00 AS Date))
INSERT [dbo].[PatientTest] ([Id], [PatientId], [TestSetupId], [BillNo], [InsertDate]) VALUES (31, 33, 7, NULL, CAST(0xB53B0B00 AS Date))
INSERT [dbo].[PatientTest] ([Id], [PatientId], [TestSetupId], [BillNo], [InsertDate]) VALUES (32, 33, 8, NULL, CAST(0xB53B0B00 AS Date))
INSERT [dbo].[PatientTest] ([Id], [PatientId], [TestSetupId], [BillNo], [InsertDate]) VALUES (33, 34, 1, NULL, CAST(0xB53B0B00 AS Date))
INSERT [dbo].[PatientTest] ([Id], [PatientId], [TestSetupId], [BillNo], [InsertDate]) VALUES (34, 34, 7, NULL, CAST(0xB53B0B00 AS Date))
INSERT [dbo].[PatientTest] ([Id], [PatientId], [TestSetupId], [BillNo], [InsertDate]) VALUES (35, 35, 4, NULL, CAST(0xB53B0B00 AS Date))
INSERT [dbo].[PatientTest] ([Id], [PatientId], [TestSetupId], [BillNo], [InsertDate]) VALUES (36, 35, 9, NULL, CAST(0xB53B0B00 AS Date))
INSERT [dbo].[PatientTest] ([Id], [PatientId], [TestSetupId], [BillNo], [InsertDate]) VALUES (37, 36, 2, NULL, CAST(0xB53B0B00 AS Date))
INSERT [dbo].[PatientTest] ([Id], [PatientId], [TestSetupId], [BillNo], [InsertDate]) VALUES (38, 36, 3, NULL, CAST(0xB53B0B00 AS Date))
INSERT [dbo].[PatientTest] ([Id], [PatientId], [TestSetupId], [BillNo], [InsertDate]) VALUES (39, 37, 2, NULL, CAST(0xB53B0B00 AS Date))
INSERT [dbo].[PatientTest] ([Id], [PatientId], [TestSetupId], [BillNo], [InsertDate]) VALUES (40, 39, 3, NULL, CAST(0xB53B0B00 AS Date))
INSERT [dbo].[PatientTest] ([Id], [PatientId], [TestSetupId], [BillNo], [InsertDate]) VALUES (41, 39, 8, NULL, CAST(0xB53B0B00 AS Date))
INSERT [dbo].[PatientTest] ([Id], [PatientId], [TestSetupId], [BillNo], [InsertDate]) VALUES (42, 40, 2, NULL, CAST(0xB63B0B00 AS Date))
INSERT [dbo].[PatientTest] ([Id], [PatientId], [TestSetupId], [BillNo], [InsertDate]) VALUES (43, 40, 7, NULL, CAST(0xB63B0B00 AS Date))
INSERT [dbo].[PatientTest] ([Id], [PatientId], [TestSetupId], [BillNo], [InsertDate]) VALUES (44, 44, 2, NULL, CAST(0xB63B0B00 AS Date))
INSERT [dbo].[PatientTest] ([Id], [PatientId], [TestSetupId], [BillNo], [InsertDate]) VALUES (45, 44, 7, NULL, CAST(0xB63B0B00 AS Date))
INSERT [dbo].[PatientTest] ([Id], [PatientId], [TestSetupId], [BillNo], [InsertDate]) VALUES (46, 45, 2, NULL, CAST(0xB63B0B00 AS Date))
INSERT [dbo].[PatientTest] ([Id], [PatientId], [TestSetupId], [BillNo], [InsertDate]) VALUES (47, 46, 2, NULL, CAST(0xB63B0B00 AS Date))
INSERT [dbo].[PatientTest] ([Id], [PatientId], [TestSetupId], [BillNo], [InsertDate]) VALUES (48, 47, 3, NULL, CAST(0xB63B0B00 AS Date))
INSERT [dbo].[PatientTest] ([Id], [PatientId], [TestSetupId], [BillNo], [InsertDate]) VALUES (49, 47, 5, NULL, CAST(0xB63B0B00 AS Date))
INSERT [dbo].[PatientTest] ([Id], [PatientId], [TestSetupId], [BillNo], [InsertDate]) VALUES (50, 48, 4, NULL, CAST(0xB63B0B00 AS Date))
INSERT [dbo].[PatientTest] ([Id], [PatientId], [TestSetupId], [BillNo], [InsertDate]) VALUES (51, 48, 7, NULL, CAST(0xB63B0B00 AS Date))
INSERT [dbo].[PatientTest] ([Id], [PatientId], [TestSetupId], [BillNo], [InsertDate]) VALUES (52, 49, 1, NULL, CAST(0xB63B0B00 AS Date))
INSERT [dbo].[PatientTest] ([Id], [PatientId], [TestSetupId], [BillNo], [InsertDate]) VALUES (53, 49, 5, NULL, CAST(0xB63B0B00 AS Date))
INSERT [dbo].[PatientTest] ([Id], [PatientId], [TestSetupId], [BillNo], [InsertDate]) VALUES (54, 50, 3, NULL, CAST(0xB63B0B00 AS Date))
INSERT [dbo].[PatientTest] ([Id], [PatientId], [TestSetupId], [BillNo], [InsertDate]) VALUES (55, 50, 5, NULL, CAST(0xB63B0B00 AS Date))
INSERT [dbo].[PatientTest] ([Id], [PatientId], [TestSetupId], [BillNo], [InsertDate]) VALUES (56, 52, 3, NULL, CAST(0xB63B0B00 AS Date))
INSERT [dbo].[PatientTest] ([Id], [PatientId], [TestSetupId], [BillNo], [InsertDate]) VALUES (57, 52, 4, NULL, CAST(0xB63B0B00 AS Date))
INSERT [dbo].[PatientTest] ([Id], [PatientId], [TestSetupId], [BillNo], [InsertDate]) VALUES (58, 53, 1, NULL, CAST(0xB63B0B00 AS Date))
INSERT [dbo].[PatientTest] ([Id], [PatientId], [TestSetupId], [BillNo], [InsertDate]) VALUES (59, 53, 8, NULL, CAST(0xB63B0B00 AS Date))
INSERT [dbo].[PatientTest] ([Id], [PatientId], [TestSetupId], [BillNo], [InsertDate]) VALUES (60, 54, 3, NULL, CAST(0xB63B0B00 AS Date))
INSERT [dbo].[PatientTest] ([Id], [PatientId], [TestSetupId], [BillNo], [InsertDate]) VALUES (61, 54, 5, NULL, CAST(0xB63B0B00 AS Date))
INSERT [dbo].[PatientTest] ([Id], [PatientId], [TestSetupId], [BillNo], [InsertDate]) VALUES (62, 55, 3, NULL, CAST(0xB63B0B00 AS Date))
INSERT [dbo].[PatientTest] ([Id], [PatientId], [TestSetupId], [BillNo], [InsertDate]) VALUES (63, 55, 5, NULL, CAST(0xB63B0B00 AS Date))
INSERT [dbo].[PatientTest] ([Id], [PatientId], [TestSetupId], [BillNo], [InsertDate]) VALUES (64, 56, 4, NULL, CAST(0xB63B0B00 AS Date))
INSERT [dbo].[PatientTest] ([Id], [PatientId], [TestSetupId], [BillNo], [InsertDate]) VALUES (65, 56, 3, NULL, CAST(0xB63B0B00 AS Date))
INSERT [dbo].[PatientTest] ([Id], [PatientId], [TestSetupId], [BillNo], [InsertDate]) VALUES (66, 57, 5, NULL, CAST(0xB63B0B00 AS Date))
INSERT [dbo].[PatientTest] ([Id], [PatientId], [TestSetupId], [BillNo], [InsertDate]) VALUES (67, 57, 7, NULL, CAST(0xB63B0B00 AS Date))
INSERT [dbo].[PatientTest] ([Id], [PatientId], [TestSetupId], [BillNo], [InsertDate]) VALUES (68, 58, 3, NULL, CAST(0xB63B0B00 AS Date))
INSERT [dbo].[PatientTest] ([Id], [PatientId], [TestSetupId], [BillNo], [InsertDate]) VALUES (69, 58, 7, NULL, CAST(0xB63B0B00 AS Date))
INSERT [dbo].[PatientTest] ([Id], [PatientId], [TestSetupId], [BillNo], [InsertDate]) VALUES (70, 59, 8, NULL, CAST(0xB63B0B00 AS Date))
INSERT [dbo].[PatientTest] ([Id], [PatientId], [TestSetupId], [BillNo], [InsertDate]) VALUES (71, 59, 7, NULL, CAST(0xB63B0B00 AS Date))
INSERT [dbo].[PatientTest] ([Id], [PatientId], [TestSetupId], [BillNo], [InsertDate]) VALUES (72, 60, 4, NULL, CAST(0xB63B0B00 AS Date))
INSERT [dbo].[PatientTest] ([Id], [PatientId], [TestSetupId], [BillNo], [InsertDate]) VALUES (73, 60, 6, NULL, CAST(0xB63B0B00 AS Date))
INSERT [dbo].[PatientTest] ([Id], [PatientId], [TestSetupId], [BillNo], [InsertDate]) VALUES (74, 62, 5, NULL, CAST(0xB63B0B00 AS Date))
SET IDENTITY_INSERT [dbo].[PatientTest] OFF
SET IDENTITY_INSERT [dbo].[TestSetup] ON 

INSERT [dbo].[TestSetup] ([Id], [TestName], [Fee], [TestTypeId], [InsertDate]) VALUES (1, N'Complete Blood count ', CAST(400.00 AS Decimal(18, 2)), 1, CAST(0xB53B0B00 AS Date))
INSERT [dbo].[TestSetup] ([Id], [TestName], [Fee], [TestTypeId], [InsertDate]) VALUES (2, N'RBS', CAST(150.00 AS Decimal(18, 2)), 1, CAST(0xB53B0B00 AS Date))
INSERT [dbo].[TestSetup] ([Id], [TestName], [Fee], [TestTypeId], [InsertDate]) VALUES (3, N'S. Creatinine', CAST(350.00 AS Decimal(18, 2)), 1, CAST(0xB53B0B00 AS Date))
INSERT [dbo].[TestSetup] ([Id], [TestName], [Fee], [TestTypeId], [InsertDate]) VALUES (4, N'Lipid profile', CAST(450.00 AS Decimal(18, 2)), 1, CAST(0xB53B0B00 AS Date))
INSERT [dbo].[TestSetup] ([Id], [TestName], [Fee], [TestTypeId], [InsertDate]) VALUES (5, N'Hand X-ray', CAST(200.00 AS Decimal(18, 2)), 2, CAST(0xB53B0B00 AS Date))
INSERT [dbo].[TestSetup] ([Id], [TestName], [Fee], [TestTypeId], [InsertDate]) VALUES (6, N'Feet X-ray', CAST(300.00 AS Decimal(18, 2)), 2, CAST(0xB53B0B00 AS Date))
INSERT [dbo].[TestSetup] ([Id], [TestName], [Fee], [TestTypeId], [InsertDate]) VALUES (7, N'LS Spine', CAST(1100.00 AS Decimal(18, 2)), 2, CAST(0xB53B0B00 AS Date))
INSERT [dbo].[TestSetup] ([Id], [TestName], [Fee], [TestTypeId], [InsertDate]) VALUES (8, N'Lower Abdomen', CAST(550.00 AS Decimal(18, 2)), 3, CAST(0xB53B0B00 AS Date))
INSERT [dbo].[TestSetup] ([Id], [TestName], [Fee], [TestTypeId], [InsertDate]) VALUES (9, N'Whole Abdomen', CAST(800.00 AS Decimal(18, 2)), 3, CAST(0xB53B0B00 AS Date))
INSERT [dbo].[TestSetup] ([Id], [TestName], [Fee], [TestTypeId], [InsertDate]) VALUES (10, N'Pregnancy profile', CAST(550.00 AS Decimal(18, 2)), 3, CAST(0xB53B0B00 AS Date))
INSERT [dbo].[TestSetup] ([Id], [TestName], [Fee], [TestTypeId], [InsertDate]) VALUES (11, N'ECG', CAST(150.00 AS Decimal(18, 2)), 4, CAST(0xB53B0B00 AS Date))
INSERT [dbo].[TestSetup] ([Id], [TestName], [Fee], [TestTypeId], [InsertDate]) VALUES (12, N'Echo', CAST(1000.00 AS Decimal(18, 2)), 5, CAST(0xB53B0B00 AS Date))
SET IDENTITY_INSERT [dbo].[TestSetup] OFF
SET IDENTITY_INSERT [dbo].[TestType] ON 

INSERT [dbo].[TestType] ([Id], [Name], [InsertDate]) VALUES (1, N'Blood', CAST(0xB53B0B00 AS Date))
INSERT [dbo].[TestType] ([Id], [Name], [InsertDate]) VALUES (2, N'X-Ray', CAST(0xB53B0B00 AS Date))
INSERT [dbo].[TestType] ([Id], [Name], [InsertDate]) VALUES (3, N'USG', CAST(0xB53B0B00 AS Date))
INSERT [dbo].[TestType] ([Id], [Name], [InsertDate]) VALUES (4, N'ECG', CAST(0xB53B0B00 AS Date))
INSERT [dbo].[TestType] ([Id], [Name], [InsertDate]) VALUES (5, N'Echo', CAST(0xB53B0B00 AS Date))
SET IDENTITY_INSERT [dbo].[TestType] OFF
ALTER TABLE [dbo].[Payment]  WITH CHECK ADD  CONSTRAINT [FK_Payment_PatientTest] FOREIGN KEY([PatientTestId])
REFERENCES [dbo].[PatientTest] ([Id])
GO
ALTER TABLE [dbo].[Payment] CHECK CONSTRAINT [FK_Payment_PatientTest]
GO
ALTER TABLE [dbo].[TestSetup]  WITH CHECK ADD  CONSTRAINT [FK_TestSetup_TestType] FOREIGN KEY([TestTypeId])
REFERENCES [dbo].[TestType] ([Id])
GO
ALTER TABLE [dbo].[TestSetup] CHECK CONSTRAINT [FK_TestSetup_TestType]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "T"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 126
               Right = 198
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "PT"
            Begin Extent = 
               Top = 6
               Left = 236
               Bottom = 111
               Right = 396
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'DateWiseTestReport'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'DateWiseTestReport'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "PatientTest"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 224
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "TestSetup"
            Begin Extent = 
               Top = 6
               Left = 262
               Bottom = 136
               Right = 448
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "TestType"
            Begin Extent = 
               Top = 138
               Left = 38
               Bottom = 251
               Right = 224
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'TypeWiseTestReport'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'TypeWiseTestReport'
GO
USE [master]
GO
ALTER DATABASE [DiagnosisCenteBill] SET  READ_WRITE 
GO
