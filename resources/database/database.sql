USE [master]
GO
/****** Object:  Database [car_park]    Script Date: 12/19/2022 9:14:08 AM ******/
CREATE DATABASE [car_park]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'car_park', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\car_park.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'car_park_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\car_park_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [car_park] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [car_park].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [car_park] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [car_park] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [car_park] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [car_park] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [car_park] SET ARITHABORT OFF 
GO
ALTER DATABASE [car_park] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [car_park] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [car_park] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [car_park] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [car_park] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [car_park] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [car_park] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [car_park] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [car_park] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [car_park] SET  ENABLE_BROKER 
GO
ALTER DATABASE [car_park] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [car_park] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [car_park] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [car_park] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [car_park] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [car_park] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [car_park] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [car_park] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [car_park] SET  MULTI_USER 
GO
ALTER DATABASE [car_park] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [car_park] SET DB_CHAINING OFF 
GO
ALTER DATABASE [car_park] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [car_park] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [car_park] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [car_park] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [car_park] SET QUERY_STORE = OFF
GO
USE [car_park]
GO
/****** Object:  Table [dbo].[booking_office]    Script Date: 12/19/2022 9:14:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[booking_office](
	[office_id] [int] IDENTITY(1,1) NOT NULL,
	[office_name] [varchar](50) NOT NULL,
	[office_phone] [varchar](15) NOT NULL,
	[office_place] [varchar](50) NOT NULL,
	[office_price] [money] NOT NULL,
	[start_contract_deadline] [date] NOT NULL,
	[end_contract_deadline] [date] NOT NULL,
	[trip_id] [int] NOT NULL,
 CONSTRAINT [PK__booking___2A196375EB91AA68] PRIMARY KEY CLUSTERED 
(
	[office_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[car]    Script Date: 12/19/2022 9:14:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[car](
	[license_plate] [varchar](20) NOT NULL,
	[car_color] [varchar](15) NULL,
	[car_type] [varchar](50) NULL,
	[company] [varchar](50) NOT NULL,
	[park_id] [int] NOT NULL,
 CONSTRAINT [PK__car__F72CD56FDB26B02D] PRIMARY KEY CLUSTERED 
(
	[license_plate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[department]    Script Date: 12/19/2022 9:14:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[department](
	[department_id] [int] IDENTITY(1,1) NOT NULL,
	[department_name] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[department_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[employee]    Script Date: 12/19/2022 9:14:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[employee](
	[employee_id] [int] IDENTITY(1,1) NOT NULL,
	[account] [varchar](50) NOT NULL,
	[employee_address] [varchar](50) NULL,
	[employee_birthdate] [date] NOT NULL,
	[employee_email] [varchar](50) NULL,
	[employee_name] [varchar](50) NOT NULL,
	[employee_phone] [varchar](15) NOT NULL,
	[password] [varchar](64) NOT NULL,
	[sex] [bit] NOT NULL,
	[department_id] [int] NULL,
 CONSTRAINT [PK__employee__C52E0BA8BD0D0832] PRIMARY KEY CLUSTERED 
(
	[employee_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[parking_lot]    Script Date: 12/19/2022 9:14:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[parking_lot](
	[park_id] [int] IDENTITY(1,1) NOT NULL,
	[park_quantity] [int] NOT NULL,
	[park_name] [varchar](50) NOT NULL,
	[park_place] [varchar](50) NOT NULL,
	[park_price] [money] NOT NULL,
	[park_status] [char](1) NOT NULL,
	[park_area] [int] NOT NULL,
	[park_count] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[park_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ticket]    Script Date: 12/19/2022 9:14:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ticket](
	[ticket_id] [int] IDENTITY(1,1) NOT NULL,
	[booking_time] [time](7) NOT NULL,
	[customer_name] [varchar](50) NOT NULL,
	[license_plate] [varchar](20) NOT NULL,
	[trip_id] [int] NOT NULL,
 CONSTRAINT [PK__ticket__D596F96B1D25CFF8] PRIMARY KEY CLUSTERED 
(
	[ticket_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[trip]    Script Date: 12/19/2022 9:14:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[trip](
	[trip_id] [int] IDENTITY(1,1) NOT NULL,
	[booked_ticket_number] [int] NOT NULL,
	[car_type] [varchar](50) NOT NULL,
	[departure_date] [date] NOT NULL,
	[departure_time] [time](7) NOT NULL,
	[destination] [varchar](50) NOT NULL,
	[driver] [varchar](50) NOT NULL,
	[maximum_online_ticket_number] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[trip_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[booking_office] ON 

INSERT [dbo].[booking_office] ([office_id], [office_name], [office_phone], [office_place], [office_price], [start_contract_deadline], [end_contract_deadline], [trip_id]) VALUES (1, N'Deckow Inc', N'9132456822', N'72 Stone Corner Trail', 138.0000, CAST(N'2021-11-17' AS Date), CAST(N'2022-01-01' AS Date), 68)
INSERT [dbo].[booking_office] ([office_id], [office_name], [office_phone], [office_place], [office_price], [start_contract_deadline], [end_contract_deadline], [trip_id]) VALUES (2, N'Borer, Shields and Hackett', N'1344243302', N'050 Leroy Road', 193.0000, CAST(N'2021-11-29' AS Date), CAST(N'2021-12-05' AS Date), 42)
INSERT [dbo].[booking_office] ([office_id], [office_name], [office_phone], [office_place], [office_price], [start_contract_deadline], [end_contract_deadline], [trip_id]) VALUES (3, N'Hamill and Sons', N'6856005680', N'545 Manitowish Place', 196.0000, CAST(N'2021-11-20' AS Date), CAST(N'2021-12-19' AS Date), 80)
INSERT [dbo].[booking_office] ([office_id], [office_name], [office_phone], [office_place], [office_price], [start_contract_deadline], [end_contract_deadline], [trip_id]) VALUES (4, N'Jacobi-Renner', N'2672430467', N'931 Stoughton Alley', 179.0000, CAST(N'2021-11-06' AS Date), CAST(N'2021-12-27' AS Date), 61)
INSERT [dbo].[booking_office] ([office_id], [office_name], [office_phone], [office_place], [office_price], [start_contract_deadline], [end_contract_deadline], [trip_id]) VALUES (5, N'Welch, Schoen and Stehr', N'6459226316', N'7 Rowland Way', 115.0000, CAST(N'2021-11-11' AS Date), CAST(N'2021-12-23' AS Date), 20)
INSERT [dbo].[booking_office] ([office_id], [office_name], [office_phone], [office_place], [office_price], [start_contract_deadline], [end_contract_deadline], [trip_id]) VALUES (6, N'Considine, Effertz and Koelpin', N'9948510452', N'907 Sycamore Hill', 199.0000, CAST(N'2021-11-22' AS Date), CAST(N'2021-12-24' AS Date), 53)
INSERT [dbo].[booking_office] ([office_id], [office_name], [office_phone], [office_place], [office_price], [start_contract_deadline], [end_contract_deadline], [trip_id]) VALUES (7, N'Kshlerin, Wunsch and Bosco', N'6538771706', N'596 Mesta Road', 162.0000, CAST(N'2021-11-19' AS Date), CAST(N'2021-12-23' AS Date), 25)
INSERT [dbo].[booking_office] ([office_id], [office_name], [office_phone], [office_place], [office_price], [start_contract_deadline], [end_contract_deadline], [trip_id]) VALUES (8, N'Farrell-Dickens', N'2808720622', N'419 Vera Junction', 142.0000, CAST(N'2021-11-16' AS Date), CAST(N'2021-12-04' AS Date), 53)
INSERT [dbo].[booking_office] ([office_id], [office_name], [office_phone], [office_place], [office_price], [start_contract_deadline], [end_contract_deadline], [trip_id]) VALUES (9, N'Collier, Kreiger and Reynolds', N'3549286991', N'3416 Shopko Center', 119.0000, CAST(N'2021-11-29' AS Date), CAST(N'2021-12-22' AS Date), 79)
INSERT [dbo].[booking_office] ([office_id], [office_name], [office_phone], [office_place], [office_price], [start_contract_deadline], [end_contract_deadline], [trip_id]) VALUES (10, N'Huels-Volkman', N'8556449736', N'8972 Columbus Pass', 120.0000, CAST(N'2021-11-10' AS Date), CAST(N'2021-12-21' AS Date), 20)
INSERT [dbo].[booking_office] ([office_id], [office_name], [office_phone], [office_place], [office_price], [start_contract_deadline], [end_contract_deadline], [trip_id]) VALUES (11, N'Dach-Russel', N'2781044895', N'80 Kim Drive', 159.0000, CAST(N'2021-11-02' AS Date), CAST(N'2021-12-09' AS Date), 68)
INSERT [dbo].[booking_office] ([office_id], [office_name], [office_phone], [office_place], [office_price], [start_contract_deadline], [end_contract_deadline], [trip_id]) VALUES (12, N'O''Hara-Simonis', N'6823768576', N'83 Mesta Lane', 180.0000, CAST(N'2021-11-16' AS Date), CAST(N'2021-12-06' AS Date), 71)
INSERT [dbo].[booking_office] ([office_id], [office_name], [office_phone], [office_place], [office_price], [start_contract_deadline], [end_contract_deadline], [trip_id]) VALUES (13, N'Rolfson, Kohler and Thompson', N'8497074166', N'26340 Redwing Place', 119.0000, CAST(N'2021-11-29' AS Date), CAST(N'2021-12-14' AS Date), 86)
INSERT [dbo].[booking_office] ([office_id], [office_name], [office_phone], [office_place], [office_price], [start_contract_deadline], [end_contract_deadline], [trip_id]) VALUES (14, N'Rowe Inc', N'9403937243', N'31 Burrows Place', 160.0000, CAST(N'2021-11-25' AS Date), CAST(N'2021-12-27' AS Date), 2)
INSERT [dbo].[booking_office] ([office_id], [office_name], [office_phone], [office_place], [office_price], [start_contract_deadline], [end_contract_deadline], [trip_id]) VALUES (15, N'Grimes and Sons', N'6102419422', N'58059 Eagle Crest Center', 182.0000, CAST(N'2021-11-03' AS Date), CAST(N'2021-12-28' AS Date), 79)
INSERT [dbo].[booking_office] ([office_id], [office_name], [office_phone], [office_place], [office_price], [start_contract_deadline], [end_contract_deadline], [trip_id]) VALUES (16, N'Carroll Group', N'6467842185', N'6547 Springs Street', 117.0000, CAST(N'2021-11-26' AS Date), CAST(N'2021-12-03' AS Date), 97)
INSERT [dbo].[booking_office] ([office_id], [office_name], [office_phone], [office_place], [office_price], [start_contract_deadline], [end_contract_deadline], [trip_id]) VALUES (17, N'Swift-Jakubowski', N'8558990911', N'1 Rigney Court', 196.0000, CAST(N'2021-11-24' AS Date), CAST(N'2021-12-24' AS Date), 44)
INSERT [dbo].[booking_office] ([office_id], [office_name], [office_phone], [office_place], [office_price], [start_contract_deadline], [end_contract_deadline], [trip_id]) VALUES (18, N'Botsford Group', N'7141552816', N'9 Pawling Lane', 163.0000, CAST(N'2021-11-01' AS Date), CAST(N'2021-12-19' AS Date), 46)
INSERT [dbo].[booking_office] ([office_id], [office_name], [office_phone], [office_place], [office_price], [start_contract_deadline], [end_contract_deadline], [trip_id]) VALUES (19, N'Wolff-Ebert', N'4574585597', N'3352 Green Ridge Hill', 127.0000, CAST(N'2021-11-18' AS Date), CAST(N'2021-12-09' AS Date), 92)
INSERT [dbo].[booking_office] ([office_id], [office_name], [office_phone], [office_place], [office_price], [start_contract_deadline], [end_contract_deadline], [trip_id]) VALUES (20, N'Konopelski LLC', N'4523711277', N'0 Debs Junction', 181.0000, CAST(N'2021-11-06' AS Date), CAST(N'2021-12-06' AS Date), 90)
INSERT [dbo].[booking_office] ([office_id], [office_name], [office_phone], [office_place], [office_price], [start_contract_deadline], [end_contract_deadline], [trip_id]) VALUES (21, N'Stehr-Wehner', N'7567223873', N'4 Fieldstone Terrace', 121.0000, CAST(N'2021-11-05' AS Date), CAST(N'2021-12-29' AS Date), 8)
INSERT [dbo].[booking_office] ([office_id], [office_name], [office_phone], [office_place], [office_price], [start_contract_deadline], [end_contract_deadline], [trip_id]) VALUES (22, N'Ruecker-Koss', N'2882953188', N'4656 Forest Run Park', 183.0000, CAST(N'2021-11-03' AS Date), CAST(N'2021-12-11' AS Date), 98)
INSERT [dbo].[booking_office] ([office_id], [office_name], [office_phone], [office_place], [office_price], [start_contract_deadline], [end_contract_deadline], [trip_id]) VALUES (23, N'Strosin-Nitzsche', N'7554592382', N'0110 Comanche Alley', 147.0000, CAST(N'2021-11-12' AS Date), CAST(N'2021-12-04' AS Date), 87)
INSERT [dbo].[booking_office] ([office_id], [office_name], [office_phone], [office_place], [office_price], [start_contract_deadline], [end_contract_deadline], [trip_id]) VALUES (24, N'Raynor, Altenwerth and Kerluke', N'9386438079', N'9738 Pierstorff Place', 126.0000, CAST(N'2021-11-11' AS Date), CAST(N'2021-12-20' AS Date), 9)
INSERT [dbo].[booking_office] ([office_id], [office_name], [office_phone], [office_place], [office_price], [start_contract_deadline], [end_contract_deadline], [trip_id]) VALUES (25, N'Legros Inc', N'6254447615', N'9123 Susan Place', 132.0000, CAST(N'2021-11-23' AS Date), CAST(N'2021-12-23' AS Date), 79)
INSERT [dbo].[booking_office] ([office_id], [office_name], [office_phone], [office_place], [office_price], [start_contract_deadline], [end_contract_deadline], [trip_id]) VALUES (26, N'Bednar and Sons', N'5302396637', N'26490 Hermina Lane', 172.0000, CAST(N'2021-11-19' AS Date), CAST(N'2021-12-06' AS Date), 33)
INSERT [dbo].[booking_office] ([office_id], [office_name], [office_phone], [office_place], [office_price], [start_contract_deadline], [end_contract_deadline], [trip_id]) VALUES (27, N'Ratke, O''Hara and Grimes', N'6406840765', N'1066 Badeau Trail', 146.0000, CAST(N'2021-11-07' AS Date), CAST(N'2021-12-24' AS Date), 26)
INSERT [dbo].[booking_office] ([office_id], [office_name], [office_phone], [office_place], [office_price], [start_contract_deadline], [end_contract_deadline], [trip_id]) VALUES (28, N'Zulauf-Feest', N'6538665630', N'6 Merry Road', 126.0000, CAST(N'2021-11-25' AS Date), CAST(N'2021-12-16' AS Date), 42)
INSERT [dbo].[booking_office] ([office_id], [office_name], [office_phone], [office_place], [office_price], [start_contract_deadline], [end_contract_deadline], [trip_id]) VALUES (29, N'Legros-Wolff', N'1225864484', N'930 Declaration Point', 135.0000, CAST(N'2021-11-10' AS Date), CAST(N'2021-12-22' AS Date), 72)
INSERT [dbo].[booking_office] ([office_id], [office_name], [office_phone], [office_place], [office_price], [start_contract_deadline], [end_contract_deadline], [trip_id]) VALUES (30, N'Bode, Hackett and Murray', N'7876922848', N'1877 Carberry Trail', 155.0000, CAST(N'2021-11-21' AS Date), CAST(N'2021-12-15' AS Date), 77)
INSERT [dbo].[booking_office] ([office_id], [office_name], [office_phone], [office_place], [office_price], [start_contract_deadline], [end_contract_deadline], [trip_id]) VALUES (31, N'Koss, Bednar and Kuvalis', N'8758723096', N'7 Pond Drive', 144.0000, CAST(N'2021-11-16' AS Date), CAST(N'2021-12-12' AS Date), 90)
INSERT [dbo].[booking_office] ([office_id], [office_name], [office_phone], [office_place], [office_price], [start_contract_deadline], [end_contract_deadline], [trip_id]) VALUES (32, N'Kozey, DuBuque and Dooley', N'6541697098', N'5 Oak Valley Road', 134.0000, CAST(N'2021-11-01' AS Date), CAST(N'2021-12-07' AS Date), 73)
INSERT [dbo].[booking_office] ([office_id], [office_name], [office_phone], [office_place], [office_price], [start_contract_deadline], [end_contract_deadline], [trip_id]) VALUES (33, N'Kuhic LLC', N'9142144979', N'69228 Mendota Trail', 127.0000, CAST(N'2021-11-03' AS Date), CAST(N'2021-12-06' AS Date), 57)
INSERT [dbo].[booking_office] ([office_id], [office_name], [office_phone], [office_place], [office_price], [start_contract_deadline], [end_contract_deadline], [trip_id]) VALUES (34, N'Kris-Blanda', N'5627098669', N'1879 Bunting Pass', 111.0000, CAST(N'2021-11-11' AS Date), CAST(N'2021-12-02' AS Date), 69)
INSERT [dbo].[booking_office] ([office_id], [office_name], [office_phone], [office_place], [office_price], [start_contract_deadline], [end_contract_deadline], [trip_id]) VALUES (35, N'Muller, D''Amore and Walsh', N'7148287232', N'55190 Michigan Way', 160.0000, CAST(N'2021-11-16' AS Date), CAST(N'2021-12-21' AS Date), 25)
INSERT [dbo].[booking_office] ([office_id], [office_name], [office_phone], [office_place], [office_price], [start_contract_deadline], [end_contract_deadline], [trip_id]) VALUES (36, N'Schultz, Marquardt and Barrows', N'7514833547', N'90535 Kings Crossing', 125.0000, CAST(N'2021-11-02' AS Date), CAST(N'2021-12-16' AS Date), 63)
INSERT [dbo].[booking_office] ([office_id], [office_name], [office_phone], [office_place], [office_price], [start_contract_deadline], [end_contract_deadline], [trip_id]) VALUES (37, N'Waelchi LLC', N'2958160582', N'38970 Mayer Plaza', 193.0000, CAST(N'2021-11-22' AS Date), CAST(N'2021-12-10' AS Date), 29)
INSERT [dbo].[booking_office] ([office_id], [office_name], [office_phone], [office_place], [office_price], [start_contract_deadline], [end_contract_deadline], [trip_id]) VALUES (38, N'Bednar LLC', N'1758972116', N'6453 Sage Avenue', 194.0000, CAST(N'2021-11-15' AS Date), CAST(N'2021-12-25' AS Date), 35)
INSERT [dbo].[booking_office] ([office_id], [office_name], [office_phone], [office_place], [office_price], [start_contract_deadline], [end_contract_deadline], [trip_id]) VALUES (39, N'Kassulke-Mosciski', N'4692672845', N'6 Eastlawn Lane', 172.0000, CAST(N'2021-11-22' AS Date), CAST(N'2021-12-19' AS Date), 44)
INSERT [dbo].[booking_office] ([office_id], [office_name], [office_phone], [office_place], [office_price], [start_contract_deadline], [end_contract_deadline], [trip_id]) VALUES (40, N'Crist Inc', N'2697399439', N'1 Muir Drive', 138.0000, CAST(N'2021-10-30' AS Date), CAST(N'2021-12-01' AS Date), 25)
INSERT [dbo].[booking_office] ([office_id], [office_name], [office_phone], [office_place], [office_price], [start_contract_deadline], [end_contract_deadline], [trip_id]) VALUES (41, N'Reichert and Sons', N'3107641146', N'7 Brickson Park Parkway', 178.0000, CAST(N'2021-11-03' AS Date), CAST(N'2021-12-24' AS Date), 58)
INSERT [dbo].[booking_office] ([office_id], [office_name], [office_phone], [office_place], [office_price], [start_contract_deadline], [end_contract_deadline], [trip_id]) VALUES (42, N'Boehm Inc', N'4935125803', N'693 Merrick Parkway', 116.0000, CAST(N'2021-11-29' AS Date), CAST(N'2021-12-18' AS Date), 57)
INSERT [dbo].[booking_office] ([office_id], [office_name], [office_phone], [office_place], [office_price], [start_contract_deadline], [end_contract_deadline], [trip_id]) VALUES (43, N'Walker-Grant', N'9021294653', N'69711 Prairieview Plaza', 130.0000, CAST(N'2021-11-25' AS Date), CAST(N'2021-12-22' AS Date), 20)
INSERT [dbo].[booking_office] ([office_id], [office_name], [office_phone], [office_place], [office_price], [start_contract_deadline], [end_contract_deadline], [trip_id]) VALUES (44, N'MacGyver Inc', N'2307395723', N'7 Corry Road', 174.0000, CAST(N'2021-11-12' AS Date), CAST(N'2021-12-14' AS Date), 82)
INSERT [dbo].[booking_office] ([office_id], [office_name], [office_phone], [office_place], [office_price], [start_contract_deadline], [end_contract_deadline], [trip_id]) VALUES (45, N'Ferry, Von and Bergstrom', N'6308402073', N'144 Karstens Alley', 130.0000, CAST(N'2021-11-05' AS Date), CAST(N'2021-12-25' AS Date), 86)
INSERT [dbo].[booking_office] ([office_id], [office_name], [office_phone], [office_place], [office_price], [start_contract_deadline], [end_contract_deadline], [trip_id]) VALUES (46, N'Franecki-Farrell', N'5544354493', N'32913 Farwell Point', 182.0000, CAST(N'2021-11-07' AS Date), CAST(N'2021-12-22' AS Date), 24)
INSERT [dbo].[booking_office] ([office_id], [office_name], [office_phone], [office_place], [office_price], [start_contract_deadline], [end_contract_deadline], [trip_id]) VALUES (47, N'Bartell and Sons', N'1392748714', N'21 Golf Pass', 158.0000, CAST(N'2021-11-11' AS Date), CAST(N'2021-12-07' AS Date), 36)
INSERT [dbo].[booking_office] ([office_id], [office_name], [office_phone], [office_place], [office_price], [start_contract_deadline], [end_contract_deadline], [trip_id]) VALUES (48, N'Thompson Group', N'8216552868', N'824 Algoma Pass', 185.0000, CAST(N'2021-11-29' AS Date), CAST(N'2021-12-25' AS Date), 64)
INSERT [dbo].[booking_office] ([office_id], [office_name], [office_phone], [office_place], [office_price], [start_contract_deadline], [end_contract_deadline], [trip_id]) VALUES (49, N'Kunze-Dooley', N'7393366141', N'999 Pennsylvania Lane', 172.0000, CAST(N'2021-11-02' AS Date), CAST(N'2021-12-24' AS Date), 6)
INSERT [dbo].[booking_office] ([office_id], [office_name], [office_phone], [office_place], [office_price], [start_contract_deadline], [end_contract_deadline], [trip_id]) VALUES (50, N'Satterfield and Sons', N'4853253710', N'06 Anzinger Terrace', 133.0000, CAST(N'2021-11-16' AS Date), CAST(N'2021-12-10' AS Date), 74)
INSERT [dbo].[booking_office] ([office_id], [office_name], [office_phone], [office_place], [office_price], [start_contract_deadline], [end_contract_deadline], [trip_id]) VALUES (51, N'Barton-Weimann', N'8906410838', N'069 Graedel Parkway', 164.0000, CAST(N'2021-11-12' AS Date), CAST(N'2021-12-28' AS Date), 60)
INSERT [dbo].[booking_office] ([office_id], [office_name], [office_phone], [office_place], [office_price], [start_contract_deadline], [end_contract_deadline], [trip_id]) VALUES (52, N'Satterfield, O''Kon and Spencer', N'6382435283', N'3071 Northridge Place', 173.0000, CAST(N'2021-11-22' AS Date), CAST(N'2021-12-01' AS Date), 26)
INSERT [dbo].[booking_office] ([office_id], [office_name], [office_phone], [office_place], [office_price], [start_contract_deadline], [end_contract_deadline], [trip_id]) VALUES (53, N'Wolff and Sons', N'9866083415', N'46 Birchwood Hill', 105.0000, CAST(N'2021-11-17' AS Date), CAST(N'2021-12-08' AS Date), 77)
INSERT [dbo].[booking_office] ([office_id], [office_name], [office_phone], [office_place], [office_price], [start_contract_deadline], [end_contract_deadline], [trip_id]) VALUES (54, N'Labadie-Kuhn', N'5144419937', N'627 Village Avenue', 189.0000, CAST(N'2021-11-22' AS Date), CAST(N'2021-12-22' AS Date), 13)
INSERT [dbo].[booking_office] ([office_id], [office_name], [office_phone], [office_place], [office_price], [start_contract_deadline], [end_contract_deadline], [trip_id]) VALUES (55, N'Sipes LLC', N'7823375983', N'9027 Onsgard Crossing', 132.0000, CAST(N'2021-11-21' AS Date), CAST(N'2021-12-24' AS Date), 100)
INSERT [dbo].[booking_office] ([office_id], [office_name], [office_phone], [office_place], [office_price], [start_contract_deadline], [end_contract_deadline], [trip_id]) VALUES (56, N'Lehner Inc', N'9731130273', N'0 Ridge Oak Pass', 192.0000, CAST(N'2021-11-16' AS Date), CAST(N'2021-12-27' AS Date), 52)
INSERT [dbo].[booking_office] ([office_id], [office_name], [office_phone], [office_place], [office_price], [start_contract_deadline], [end_contract_deadline], [trip_id]) VALUES (57, N'Lebsack-Schuster', N'6183349728', N'62389 Anhalt Crossing', 122.0000, CAST(N'2021-11-24' AS Date), CAST(N'2021-12-07' AS Date), 62)
INSERT [dbo].[booking_office] ([office_id], [office_name], [office_phone], [office_place], [office_price], [start_contract_deadline], [end_contract_deadline], [trip_id]) VALUES (58, N'Flatley, Batz and Bernier', N'3522271299', N'98999 Crescent Oaks Circle', 100.0000, CAST(N'2021-11-11' AS Date), CAST(N'2021-12-28' AS Date), 65)
INSERT [dbo].[booking_office] ([office_id], [office_name], [office_phone], [office_place], [office_price], [start_contract_deadline], [end_contract_deadline], [trip_id]) VALUES (59, N'Ankunding LLC', N'9166712046', N'90 Drewry Way', 113.0000, CAST(N'2021-11-07' AS Date), CAST(N'2021-12-21' AS Date), 77)
INSERT [dbo].[booking_office] ([office_id], [office_name], [office_phone], [office_place], [office_price], [start_contract_deadline], [end_contract_deadline], [trip_id]) VALUES (60, N'Anderson, Donnelly and Wilderman', N'2583088351', N'4173 Mcguire Lane', 120.0000, CAST(N'2021-11-19' AS Date), CAST(N'2021-12-28' AS Date), 82)
INSERT [dbo].[booking_office] ([office_id], [office_name], [office_phone], [office_place], [office_price], [start_contract_deadline], [end_contract_deadline], [trip_id]) VALUES (61, N'Torp-Kutch', N'2263129840', N'87 Monterey Point', 184.0000, CAST(N'2021-11-15' AS Date), CAST(N'2021-12-21' AS Date), 62)
INSERT [dbo].[booking_office] ([office_id], [office_name], [office_phone], [office_place], [office_price], [start_contract_deadline], [end_contract_deadline], [trip_id]) VALUES (62, N'Huels, Crona and Harvey', N'5611902787', N'20014 Dunning Avenue', 135.0000, CAST(N'2021-11-15' AS Date), CAST(N'2021-12-06' AS Date), 93)
INSERT [dbo].[booking_office] ([office_id], [office_name], [office_phone], [office_place], [office_price], [start_contract_deadline], [end_contract_deadline], [trip_id]) VALUES (63, N'McLaughlin-Jones', N'1034505473', N'2974 Anthes Parkway', 158.0000, CAST(N'2021-11-02' AS Date), CAST(N'2021-12-11' AS Date), 13)
INSERT [dbo].[booking_office] ([office_id], [office_name], [office_phone], [office_place], [office_price], [start_contract_deadline], [end_contract_deadline], [trip_id]) VALUES (64, N'Crist-Schaefer', N'7842336563', N'39893 Fieldstone Pass', 148.0000, CAST(N'2021-11-22' AS Date), CAST(N'2021-12-29' AS Date), 69)
INSERT [dbo].[booking_office] ([office_id], [office_name], [office_phone], [office_place], [office_price], [start_contract_deadline], [end_contract_deadline], [trip_id]) VALUES (65, N'Goldner Group', N'9995420816', N'8032 Talmadge Street', 139.0000, CAST(N'2021-10-30' AS Date), CAST(N'2021-12-29' AS Date), 63)
INSERT [dbo].[booking_office] ([office_id], [office_name], [office_phone], [office_place], [office_price], [start_contract_deadline], [end_contract_deadline], [trip_id]) VALUES (66, N'Bednar, Hudson and Schneider', N'2537983367', N'99 Nobel Place', 115.0000, CAST(N'2021-11-03' AS Date), CAST(N'2021-12-13' AS Date), 71)
INSERT [dbo].[booking_office] ([office_id], [office_name], [office_phone], [office_place], [office_price], [start_contract_deadline], [end_contract_deadline], [trip_id]) VALUES (67, N'O''Connell-Shanahan', N'5761333161', N'5 Hallows Circle', 100.0000, CAST(N'2021-11-02' AS Date), CAST(N'2021-12-29' AS Date), 63)
INSERT [dbo].[booking_office] ([office_id], [office_name], [office_phone], [office_place], [office_price], [start_contract_deadline], [end_contract_deadline], [trip_id]) VALUES (68, N'Kohler Group', N'2056158587', N'4 Gale Court', 120.0000, CAST(N'2021-11-16' AS Date), CAST(N'2021-12-06' AS Date), 36)
INSERT [dbo].[booking_office] ([office_id], [office_name], [office_phone], [office_place], [office_price], [start_contract_deadline], [end_contract_deadline], [trip_id]) VALUES (69, N'Daugherty, Leffler and Emard', N'1856301359', N'0 Cordelia Center', 185.0000, CAST(N'2021-11-29' AS Date), CAST(N'2021-12-29' AS Date), 67)
INSERT [dbo].[booking_office] ([office_id], [office_name], [office_phone], [office_place], [office_price], [start_contract_deadline], [end_contract_deadline], [trip_id]) VALUES (70, N'Beier, Funk and Pollich', N'9444355794', N'80 Welch Crossing', 145.0000, CAST(N'2021-10-31' AS Date), CAST(N'2021-12-27' AS Date), 26)
INSERT [dbo].[booking_office] ([office_id], [office_name], [office_phone], [office_place], [office_price], [start_contract_deadline], [end_contract_deadline], [trip_id]) VALUES (71, N'Luettgen Group', N'6305766853', N'648 Rowland Trail', 106.0000, CAST(N'2021-11-20' AS Date), CAST(N'2021-12-16' AS Date), 57)
INSERT [dbo].[booking_office] ([office_id], [office_name], [office_phone], [office_place], [office_price], [start_contract_deadline], [end_contract_deadline], [trip_id]) VALUES (72, N'Schiller-Rogahn', N'6583145607', N'00344 Tennyson Circle', 160.0000, CAST(N'2021-11-23' AS Date), CAST(N'2021-12-20' AS Date), 61)
INSERT [dbo].[booking_office] ([office_id], [office_name], [office_phone], [office_place], [office_price], [start_contract_deadline], [end_contract_deadline], [trip_id]) VALUES (73, N'Friesen-Stoltenberg', N'1092187088', N'54 Pleasure Center', 109.0000, CAST(N'2021-11-08' AS Date), CAST(N'2021-12-08' AS Date), 28)
INSERT [dbo].[booking_office] ([office_id], [office_name], [office_phone], [office_place], [office_price], [start_contract_deadline], [end_contract_deadline], [trip_id]) VALUES (74, N'Marvin, Thiel and Corkery', N'5592608930', N'0 Ridgeview Street', 118.0000, CAST(N'2021-10-31' AS Date), CAST(N'2021-12-20' AS Date), 44)
INSERT [dbo].[booking_office] ([office_id], [office_name], [office_phone], [office_place], [office_price], [start_contract_deadline], [end_contract_deadline], [trip_id]) VALUES (75, N'Hagenes Group', N'7511508179', N'944 Clyde Gallagher Drive', 187.0000, CAST(N'2021-10-31' AS Date), CAST(N'2021-12-15' AS Date), 80)
INSERT [dbo].[booking_office] ([office_id], [office_name], [office_phone], [office_place], [office_price], [start_contract_deadline], [end_contract_deadline], [trip_id]) VALUES (76, N'Pfannerstill-Predovic', N'3333712364', N'220 Di Loreto Center', 139.0000, CAST(N'2021-11-29' AS Date), CAST(N'2021-12-02' AS Date), 7)
INSERT [dbo].[booking_office] ([office_id], [office_name], [office_phone], [office_place], [office_price], [start_contract_deadline], [end_contract_deadline], [trip_id]) VALUES (77, N'Marvin Inc', N'6398920213', N'9721 Lukken Point', 116.0000, CAST(N'2021-11-13' AS Date), CAST(N'2021-12-08' AS Date), 45)
INSERT [dbo].[booking_office] ([office_id], [office_name], [office_phone], [office_place], [office_price], [start_contract_deadline], [end_contract_deadline], [trip_id]) VALUES (78, N'Bahringer Inc', N'3614376885', N'869 Di Loreto Drive', 125.0000, CAST(N'2021-11-21' AS Date), CAST(N'2021-12-18' AS Date), 53)
INSERT [dbo].[booking_office] ([office_id], [office_name], [office_phone], [office_place], [office_price], [start_contract_deadline], [end_contract_deadline], [trip_id]) VALUES (79, N'Schmeler and Sons', N'7368897040', N'6783 Nancy Way', 161.0000, CAST(N'2021-11-23' AS Date), CAST(N'2021-12-23' AS Date), 4)
INSERT [dbo].[booking_office] ([office_id], [office_name], [office_phone], [office_place], [office_price], [start_contract_deadline], [end_contract_deadline], [trip_id]) VALUES (80, N'Feeney-Kling', N'8988481909', N'57 Stephen Way', 176.0000, CAST(N'2021-11-29' AS Date), CAST(N'2021-12-24' AS Date), 54)
INSERT [dbo].[booking_office] ([office_id], [office_name], [office_phone], [office_place], [office_price], [start_contract_deadline], [end_contract_deadline], [trip_id]) VALUES (81, N'Abshire-Cummings', N'1094084596', N'51 Fordem Avenue', 124.0000, CAST(N'2021-11-22' AS Date), CAST(N'2021-12-17' AS Date), 6)
INSERT [dbo].[booking_office] ([office_id], [office_name], [office_phone], [office_place], [office_price], [start_contract_deadline], [end_contract_deadline], [trip_id]) VALUES (82, N'Reichert-Lueilwitz', N'4021431111', N'1 Stuart Junction', 151.0000, CAST(N'2021-11-09' AS Date), CAST(N'2021-12-26' AS Date), 78)
INSERT [dbo].[booking_office] ([office_id], [office_name], [office_phone], [office_place], [office_price], [start_contract_deadline], [end_contract_deadline], [trip_id]) VALUES (83, N'Hammes Group', N'5623038054', N'21411 Service Lane', 176.0000, CAST(N'2021-11-21' AS Date), CAST(N'2021-12-17' AS Date), 18)
INSERT [dbo].[booking_office] ([office_id], [office_name], [office_phone], [office_place], [office_price], [start_contract_deadline], [end_contract_deadline], [trip_id]) VALUES (84, N'Dare and Sons', N'7936047715', N'6154 Johnson Drive', 184.0000, CAST(N'2021-11-23' AS Date), CAST(N'2021-12-08' AS Date), 44)
INSERT [dbo].[booking_office] ([office_id], [office_name], [office_phone], [office_place], [office_price], [start_contract_deadline], [end_contract_deadline], [trip_id]) VALUES (85, N'Hand and Sons', N'6675816840', N'23 Park Meadow Parkway', 185.0000, CAST(N'2021-11-15' AS Date), CAST(N'2021-12-13' AS Date), 9)
INSERT [dbo].[booking_office] ([office_id], [office_name], [office_phone], [office_place], [office_price], [start_contract_deadline], [end_contract_deadline], [trip_id]) VALUES (86, N'Nader Inc', N'1393889056', N'0 Northwestern Crossing', 128.0000, CAST(N'2021-11-04' AS Date), CAST(N'2021-12-24' AS Date), 15)
INSERT [dbo].[booking_office] ([office_id], [office_name], [office_phone], [office_place], [office_price], [start_contract_deadline], [end_contract_deadline], [trip_id]) VALUES (87, N'Prohaska-Labadie', N'4568647061', N'5 Chive Point', 120.0000, CAST(N'2021-11-04' AS Date), CAST(N'2021-12-26' AS Date), 81)
INSERT [dbo].[booking_office] ([office_id], [office_name], [office_phone], [office_place], [office_price], [start_contract_deadline], [end_contract_deadline], [trip_id]) VALUES (88, N'Waters-Nitzsche', N'5553736978', N'55621 Stoughton Court', 155.0000, CAST(N'2021-11-24' AS Date), CAST(N'2021-12-17' AS Date), 8)
INSERT [dbo].[booking_office] ([office_id], [office_name], [office_phone], [office_place], [office_price], [start_contract_deadline], [end_contract_deadline], [trip_id]) VALUES (89, N'Mayert, Wolff and Blanda', N'8615056652', N'54 Westridge Point', 189.0000, CAST(N'2021-11-11' AS Date), CAST(N'2021-12-26' AS Date), 70)
INSERT [dbo].[booking_office] ([office_id], [office_name], [office_phone], [office_place], [office_price], [start_contract_deadline], [end_contract_deadline], [trip_id]) VALUES (91, N'Predovic Group', N'8015516772', N'799 Sullivan Point', 197.0000, CAST(N'2021-11-01' AS Date), CAST(N'2021-12-15' AS Date), 43)
INSERT [dbo].[booking_office] ([office_id], [office_name], [office_phone], [office_place], [office_price], [start_contract_deadline], [end_contract_deadline], [trip_id]) VALUES (92, N'Altenwerth Group', N'8086398551', N'506 Dixon Junction', 192.0000, CAST(N'2021-11-26' AS Date), CAST(N'2021-12-23' AS Date), 69)
INSERT [dbo].[booking_office] ([office_id], [office_name], [office_phone], [office_place], [office_price], [start_contract_deadline], [end_contract_deadline], [trip_id]) VALUES (93, N'Hegmann Group', N'9967984697', N'42841 Eliot Drive', 109.0000, CAST(N'2021-11-22' AS Date), CAST(N'2021-12-13' AS Date), 35)
INSERT [dbo].[booking_office] ([office_id], [office_name], [office_phone], [office_place], [office_price], [start_contract_deadline], [end_contract_deadline], [trip_id]) VALUES (94, N'Schmeler, Cole and Bartoletti', N'7905601371', N'82 1st Alley', 181.0000, CAST(N'2021-11-12' AS Date), CAST(N'2021-12-12' AS Date), 18)
INSERT [dbo].[booking_office] ([office_id], [office_name], [office_phone], [office_place], [office_price], [start_contract_deadline], [end_contract_deadline], [trip_id]) VALUES (95, N'Koss Inc', N'9547428387', N'3 Surrey Trail', 123.0000, CAST(N'2021-11-10' AS Date), CAST(N'2021-12-28' AS Date), 52)
INSERT [dbo].[booking_office] ([office_id], [office_name], [office_phone], [office_place], [office_price], [start_contract_deadline], [end_contract_deadline], [trip_id]) VALUES (96, N'Langosh-Trantow', N'3055427421', N'8 School Alley', 186.0000, CAST(N'2021-11-17' AS Date), CAST(N'2021-12-13' AS Date), 74)
INSERT [dbo].[booking_office] ([office_id], [office_name], [office_phone], [office_place], [office_price], [start_contract_deadline], [end_contract_deadline], [trip_id]) VALUES (97, N'Carter-Jones', N'1691271666', N'9246 Garrison Avenue', 156.0000, CAST(N'2021-11-17' AS Date), CAST(N'2021-12-25' AS Date), 91)
INSERT [dbo].[booking_office] ([office_id], [office_name], [office_phone], [office_place], [office_price], [start_contract_deadline], [end_contract_deadline], [trip_id]) VALUES (98, N'Sanford-Buckridge', N'4384657546', N'5 Canary Crossing', 133.0000, CAST(N'2021-11-11' AS Date), CAST(N'2021-12-16' AS Date), 29)
INSERT [dbo].[booking_office] ([office_id], [office_name], [office_phone], [office_place], [office_price], [start_contract_deadline], [end_contract_deadline], [trip_id]) VALUES (99, N'Hodkiewicz-Ortiz', N'6658550057', N'2296 Lake View Road', 147.0000, CAST(N'2021-11-02' AS Date), CAST(N'2021-12-26' AS Date), 5)
INSERT [dbo].[booking_office] ([office_id], [office_name], [office_phone], [office_place], [office_price], [start_contract_deadline], [end_contract_deadline], [trip_id]) VALUES (100, N'Funk, Schowalter and Maggio', N'4673097187', N'27 Delaware Drive', 122.0000, CAST(N'2021-11-17' AS Date), CAST(N'2021-01-26' AS Date), 63)
GO
SET IDENTITY_INSERT [dbo].[booking_office] OFF
GO
INSERT [dbo].[car] ([license_plate], [car_color], [car_type], [company], [park_id]) VALUES (N'0228-2129', N'Fuscia', N'Suzuki', N'Skivee', 74)
INSERT [dbo].[car] ([license_plate], [car_color], [car_type], [company], [park_id]) VALUES (N'0363-0333', N'Orange', N'Porsche', N'Photofeed', 46)
INSERT [dbo].[car] ([license_plate], [car_color], [car_type], [company], [park_id]) VALUES (N'0409-4916', N'Goldenrod', N'Hyundai', N'Tagcat', 62)
INSERT [dbo].[car] ([license_plate], [car_color], [car_type], [company], [park_id]) VALUES (N'0703-1020', N'Teal', N'Ford', N'Twinte', 73)
INSERT [dbo].[car] ([license_plate], [car_color], [car_type], [company], [park_id]) VALUES (N'0781-3239', N'Pink', N'Hummer', N'Camimbo', 2)
INSERT [dbo].[car] ([license_plate], [car_color], [car_type], [company], [park_id]) VALUES (N'0781-3245', N'Crimson', N'Honda', N'Gevee', 63)
INSERT [dbo].[car] ([license_plate], [car_color], [car_type], [company], [park_id]) VALUES (N'0904-1314', N'Purple', N'Aston Martin', N'Skiba', 81)
INSERT [dbo].[car] ([license_plate], [car_color], [car_type], [company], [park_id]) VALUES (N'10096-0153', N'Blue', N'Buick', N'Jamia', 62)
INSERT [dbo].[car] ([license_plate], [car_color], [car_type], [company], [park_id]) VALUES (N'10096-0302', N'Green', N'Mazda', N'Fanoodle', 46)
INSERT [dbo].[car] ([license_plate], [car_color], [car_type], [company], [park_id]) VALUES (N'10819-1080', N'Turquoise', N'Mazda', N'Browsezoom', 1)
INSERT [dbo].[car] ([license_plate], [car_color], [car_type], [company], [park_id]) VALUES (N'11564-002', N'Mauv', N'Oldsmobile', N'Centidel', 67)
INSERT [dbo].[car] ([license_plate], [car_color], [car_type], [company], [park_id]) VALUES (N'12343-23435', N'Yellow', N'Missubisi', N'Viet Nam Net', 117)
INSERT [dbo].[car] ([license_plate], [car_color], [car_type], [company], [park_id]) VALUES (N'1234-3434', N'Red Green', N'White', N'Viet Nam Net', 1)
INSERT [dbo].[car] ([license_plate], [car_color], [car_type], [company], [park_id]) VALUES (N'13668-148', N'Crimson', N'Pontiac', N'Podcat', 52)
INSERT [dbo].[car] ([license_plate], [car_color], [car_type], [company], [park_id]) VALUES (N'13985-013', N'Red', N'Pontiac', N'Twitterbeat', 51)
INSERT [dbo].[car] ([license_plate], [car_color], [car_type], [company], [park_id]) VALUES (N'15127-228', N'Fuscia', N'Mercedes-Benz', N'Youbridge', 77)
INSERT [dbo].[car] ([license_plate], [car_color], [car_type], [company], [park_id]) VALUES (N'15370-036', N'Green', N'Volkswagen', N'Innotype', 97)
INSERT [dbo].[car] ([license_plate], [car_color], [car_type], [company], [park_id]) VALUES (N'23155-217', N'Goldenrod', N'Buick', N'Plambee', 76)
INSERT [dbo].[car] ([license_plate], [car_color], [car_type], [company], [park_id]) VALUES (N'24236-110', N'Turquoise', N'Dodge', N'Edgepulse', 50)
INSERT [dbo].[car] ([license_plate], [car_color], [car_type], [company], [park_id]) VALUES (N'24275-0185', N'Red', N'Isuzu', N'Eidel', 34)
INSERT [dbo].[car] ([license_plate], [car_color], [car_type], [company], [park_id]) VALUES (N'34645-4025', N'Blue', N'Chevrolet', N'Fadeo', 75)
INSERT [dbo].[car] ([license_plate], [car_color], [car_type], [company], [park_id]) VALUES (N'36800-108', N'Violet', N'Mitsubishi', N'Twitterlist', 4)
INSERT [dbo].[car] ([license_plate], [car_color], [car_type], [company], [park_id]) VALUES (N'36987-1477', N'Puce', N'Suzuki', N'Photojam', 35)
INSERT [dbo].[car] ([license_plate], [car_color], [car_type], [company], [park_id]) VALUES (N'36987-2174', N'Maroon', N'Toyota', N'Feedbug', 20)
INSERT [dbo].[car] ([license_plate], [car_color], [car_type], [company], [park_id]) VALUES (N'36987-2733', N'Teal', N'GMC', N'Thoughtbridge', 43)
INSERT [dbo].[car] ([license_plate], [car_color], [car_type], [company], [park_id]) VALUES (N'36987-2778', N'Khaki', N'Jaguar', N'Kamba', 77)
INSERT [dbo].[car] ([license_plate], [car_color], [car_type], [company], [park_id]) VALUES (N'37205-436', N'Puce', N'Mitsubishi', N'Browsedrive', 71)
INSERT [dbo].[car] ([license_plate], [car_color], [car_type], [company], [park_id]) VALUES (N'41163-529', N'Turquoise', N'Mitsubishi', N'Linkbridge', 60)
INSERT [dbo].[car] ([license_plate], [car_color], [car_type], [company], [park_id]) VALUES (N'42192-129', N'Turquoise', N'Hyundai', N'Devpulse', 68)
INSERT [dbo].[car] ([license_plate], [car_color], [car_type], [company], [park_id]) VALUES (N'42472-001', N'Purple', N'Hyundai', N'Skyble', 85)
INSERT [dbo].[car] ([license_plate], [car_color], [car_type], [company], [park_id]) VALUES (N'43063-327', N'Mauv', N'Pontiac', N'Centidel', 89)
INSERT [dbo].[car] ([license_plate], [car_color], [car_type], [company], [park_id]) VALUES (N'43376-230', N'Fuscia', N'Mercedes-Benz', N'Voomm', 68)
INSERT [dbo].[car] ([license_plate], [car_color], [car_type], [company], [park_id]) VALUES (N'43526-107', N'Green', N'Chevrolet', N'Eabox', 88)
INSERT [dbo].[car] ([license_plate], [car_color], [car_type], [company], [park_id]) VALUES (N'43857-0292', N'Red', N'Chevrolet', N'Shuffletag', 5)
INSERT [dbo].[car] ([license_plate], [car_color], [car_type], [company], [park_id]) VALUES (N'4535-5435-5467', N'Toyota', N'Green', N'FPT Software', 52)
INSERT [dbo].[car] ([license_plate], [car_color], [car_type], [company], [park_id]) VALUES (N'49288-0424', N'Green', N'Chevrolet', N'BlogXS', 62)
INSERT [dbo].[car] ([license_plate], [car_color], [car_type], [company], [park_id]) VALUES (N'49738-217', N'Maroon', N'Dodge', N'Oodoo', 53)
INSERT [dbo].[car] ([license_plate], [car_color], [car_type], [company], [park_id]) VALUES (N'49884-374', N'Violet', N'Audi', N'Muxo', 24)
INSERT [dbo].[car] ([license_plate], [car_color], [car_type], [company], [park_id]) VALUES (N'50111-482', N'Puce', N'Mercedes-Benz', N'Avavee', 49)
INSERT [dbo].[car] ([license_plate], [car_color], [car_type], [company], [park_id]) VALUES (N'50563-160', N'Pink', N'Volvo', N'Topiczoom', 91)
INSERT [dbo].[car] ([license_plate], [car_color], [car_type], [company], [park_id]) VALUES (N'50988-288', N'Purple', N'Chevrolet', N'Skinix', 33)
INSERT [dbo].[car] ([license_plate], [car_color], [car_type], [company], [park_id]) VALUES (N'51079-893', N'Crimson', N'GMC', N'Dablist', 69)
INSERT [dbo].[car] ([license_plate], [car_color], [car_type], [company], [park_id]) VALUES (N'51442-547', N'Crimson', N'Chevrolet', N'Meemm', 64)
INSERT [dbo].[car] ([license_plate], [car_color], [car_type], [company], [park_id]) VALUES (N'51660-142', N'Teal', N'Volkswagen', N'Topiclounge', 34)
INSERT [dbo].[car] ([license_plate], [car_color], [car_type], [company], [park_id]) VALUES (N'52099-8005', N'Yellow', N'Jeep', N'Dynava', 89)
INSERT [dbo].[car] ([license_plate], [car_color], [car_type], [company], [park_id]) VALUES (N'52125-966', N'Yellow', N'Ford', N'Centizu', 52)
INSERT [dbo].[car] ([license_plate], [car_color], [car_type], [company], [park_id]) VALUES (N'52686-254', N'Indigo', N'Kia', N'Youfeed', 12)
INSERT [dbo].[car] ([license_plate], [car_color], [car_type], [company], [park_id]) VALUES (N'52810-203', N'Mauv', N'Mercury', N'Skyba', 92)
INSERT [dbo].[car] ([license_plate], [car_color], [car_type], [company], [park_id]) VALUES (N'52959-994', N'Teal', N'Acura', N'Kwimbee', 49)
INSERT [dbo].[car] ([license_plate], [car_color], [car_type], [company], [park_id]) VALUES (N'53208-530', N'Violet', N'Acura', N'Podcat', 60)
INSERT [dbo].[car] ([license_plate], [car_color], [car_type], [company], [park_id]) VALUES (N'53808-0772', N'Puce', N'Bentley', N'Dabtype', 73)
INSERT [dbo].[car] ([license_plate], [car_color], [car_type], [company], [park_id]) VALUES (N'54569-0419', N'Blue', N'Dodge', N'Jamia', 48)
INSERT [dbo].[car] ([license_plate], [car_color], [car_type], [company], [park_id]) VALUES (N'54569-1697', N'Maroon', N'Ford', N'Eare', 12)
INSERT [dbo].[car] ([license_plate], [car_color], [car_type], [company], [park_id]) VALUES (N'54569-2113', N'Goldenrod', N'Nissan', N'Eayo', 97)
INSERT [dbo].[car] ([license_plate], [car_color], [car_type], [company], [park_id]) VALUES (N'54838-514', N'Fuscia', N'Oldsmobile', N'Bluejam', 41)
INSERT [dbo].[car] ([license_plate], [car_color], [car_type], [company], [park_id]) VALUES (N'54868-3316', N'Green', N'Ford', N'Meevee', 53)
INSERT [dbo].[car] ([license_plate], [car_color], [car_type], [company], [park_id]) VALUES (N'54868-4125', N'Indigo', N'Mazda', N'Kazio', 35)
INSERT [dbo].[car] ([license_plate], [car_color], [car_type], [company], [park_id]) VALUES (N'54868-5189', N'Indigo', N'Buick', N'Tavu', 93)
INSERT [dbo].[car] ([license_plate], [car_color], [car_type], [company], [park_id]) VALUES (N'55111-146', N'Purple', N'GMC', N'Trupe', 25)
INSERT [dbo].[car] ([license_plate], [car_color], [car_type], [company], [park_id]) VALUES (N'55111-226', N'Yellow', N'Dodge', N'Buzzshare', 12)
INSERT [dbo].[car] ([license_plate], [car_color], [car_type], [company], [park_id]) VALUES (N'55111-455', N'Orange', N'Hyundai', N'Yadel', 82)
INSERT [dbo].[car] ([license_plate], [car_color], [car_type], [company], [park_id]) VALUES (N'55154-0697', N'Orange', N'Mitsubishi', N'Zoombox', 23)
INSERT [dbo].[car] ([license_plate], [car_color], [car_type], [company], [park_id]) VALUES (N'55312-546', N'Puce', N'Chevrolet', N'Wikibox', 78)
INSERT [dbo].[car] ([license_plate], [car_color], [car_type], [company], [park_id]) VALUES (N'55390-310', N'Puce', N'Volvo', N'Buzzbean', 92)
INSERT [dbo].[car] ([license_plate], [car_color], [car_type], [company], [park_id]) VALUES (N'56152-2050', N'Pink', N'GMC', N'Feedmix', 63)
INSERT [dbo].[car] ([license_plate], [car_color], [car_type], [company], [park_id]) VALUES (N'57520-0763', N'Mauv', N'Audi', N'Realmix', 78)
INSERT [dbo].[car] ([license_plate], [car_color], [car_type], [company], [park_id]) VALUES (N'58118-5791', N'Pink', N'Volkswagen', N'Zoomdog', 2)
INSERT [dbo].[car] ([license_plate], [car_color], [car_type], [company], [park_id]) VALUES (N'58668-2771', N'Mauv', N'Mercedes-Benz', N'Meezzy', 29)
INSERT [dbo].[car] ([license_plate], [car_color], [car_type], [company], [park_id]) VALUES (N'60793-802', N'Khaki', N'Chevrolet', N'Youspan', 78)
INSERT [dbo].[car] ([license_plate], [car_color], [car_type], [company], [park_id]) VALUES (N'61041-211', N'Red', N'Maybach', N'Vinder', 26)
INSERT [dbo].[car] ([license_plate], [car_color], [car_type], [company], [park_id]) VALUES (N'62080-2001', N'Purple', N'Lincoln', N'Wordware', 38)
INSERT [dbo].[car] ([license_plate], [car_color], [car_type], [company], [park_id]) VALUES (N'62678-217', N'Pink', N'Lexus', N'Kazu', 77)
INSERT [dbo].[car] ([license_plate], [car_color], [car_type], [company], [park_id]) VALUES (N'63181-0019', N'Orange', N'Audi', N'Avamm', 49)
INSERT [dbo].[car] ([license_plate], [car_color], [car_type], [company], [park_id]) VALUES (N'63304-210', N'Aquamarine', N'Audi', N'Skilith', 62)
INSERT [dbo].[car] ([license_plate], [car_color], [car_type], [company], [park_id]) VALUES (N'63304-497', N'Teal', N'Toyota', N'Yakijo', 80)
INSERT [dbo].[car] ([license_plate], [car_color], [car_type], [company], [park_id]) VALUES (N'63645-130', N'Crimson', N'Mazda', N'Edgeclub', 73)
INSERT [dbo].[car] ([license_plate], [car_color], [car_type], [company], [park_id]) VALUES (N'63667-676', N'Fuscia', N'Audi', N'Brainverse', 75)
INSERT [dbo].[car] ([license_plate], [car_color], [car_type], [company], [park_id]) VALUES (N'64850-440', N'Mauv', N'BMW', N'Meejo', 47)
INSERT [dbo].[car] ([license_plate], [car_color], [car_type], [company], [park_id]) VALUES (N'65044-0613', N'Khaki', N'Subaru', N'Riffpath', 25)
INSERT [dbo].[car] ([license_plate], [car_color], [car_type], [company], [park_id]) VALUES (N'65862-028', N'Khaki', N'Mitsubishi', N'Realmix', 28)
INSERT [dbo].[car] ([license_plate], [car_color], [car_type], [company], [park_id]) VALUES (N'65954-554', N'Red', N'Chevrolet', N'Skyba', 25)
INSERT [dbo].[car] ([license_plate], [car_color], [car_type], [company], [park_id]) VALUES (N'66579-0065', N'Red', N'Toyota', N'Flipbug', 35)
INSERT [dbo].[car] ([license_plate], [car_color], [car_type], [company], [park_id]) VALUES (N'68016-448', N'Goldenrod', N'Chevrolet', N'Jayo', 16)
INSERT [dbo].[car] ([license_plate], [car_color], [car_type], [company], [park_id]) VALUES (N'68016-823', N'Turquoise', N'Buick', N'Livepath', 80)
INSERT [dbo].[car] ([license_plate], [car_color], [car_type], [company], [park_id]) VALUES (N'68258-7980', N'Red', N'Porsche', N'Skaboo', 3)
INSERT [dbo].[car] ([license_plate], [car_color], [car_type], [company], [park_id]) VALUES (N'68788-6755', N'Puce', N'Subaru', N'Tagtune', 87)
INSERT [dbo].[car] ([license_plate], [car_color], [car_type], [company], [park_id]) VALUES (N'68788-9817', N'Goldenrod', N'Pontiac', N'Kazu', 60)
INSERT [dbo].[car] ([license_plate], [car_color], [car_type], [company], [park_id]) VALUES (N'68987-024', N'Blue', N'Lincoln', N'Youspan', 22)
GO
SET IDENTITY_INSERT [dbo].[department] ON 

INSERT [dbo].[department] ([department_id], [department_name]) VALUES (1, N'Admin')
INSERT [dbo].[department] ([department_id], [department_name]) VALUES (2, N'HRM')
INSERT [dbo].[department] ([department_id], [department_name]) VALUES (3, N'Parking')
INSERT [dbo].[department] ([department_id], [department_name]) VALUES (4, N'Service')
SET IDENTITY_INSERT [dbo].[department] OFF
GO
SET IDENTITY_INSERT [dbo].[employee] ON 

INSERT [dbo].[employee] ([employee_id], [account], [employee_address], [employee_birthdate], [employee_email], [employee_name], [employee_phone], [password], [sex], [department_id]) VALUES (1, N'admina', N'FPT University', CAST(N'2001-09-15' AS Date), N'admina@gmail.com', N'Admin A', N'0355166404', N'020141b0381b7818bba0092671dc3524fb1b47cbc5dadec0334e38723906e0e4', 0, 1)
INSERT [dbo].[employee] ([employee_id], [account], [employee_address], [employee_birthdate], [employee_email], [employee_name], [employee_phone], [password], [sex], [department_id]) VALUES (2, N'adminb', N'FPT Software', CAST(N'1998-08-04' AS Date), N'adminb@gmail.com', N'Admin B', N'0355166404', N'020141b0381b7818bba0092671dc3524fb1b47cbc5dadec0334e38723906e0e4', 0, 1)
INSERT [dbo].[employee] ([employee_id], [account], [employee_address], [employee_birthdate], [employee_email], [employee_name], [employee_phone], [password], [sex], [department_id]) VALUES (3, N'hrmaa', N'301 Calypso Terrace', CAST(N'2001-06-09' AS Date), N'hrma@gmail.com', N'Hrm A', N'0355166404', N'020141b0381b7818bba0092671dc3524fb1b47cbc5dadec0334e38723906e0e4', 0, 2)
INSERT [dbo].[employee] ([employee_id], [account], [employee_address], [employee_birthdate], [employee_email], [employee_name], [employee_phone], [password], [sex], [department_id]) VALUES (4, N'parkinga', N'77 Eagan Alley', CAST(N'2000-07-18' AS Date), N'parkinga@gmail.com', N'Parking A', N'0355166404', N'020141b0381b7818bba0092671dc3524fb1b47cbc5dadec0334e38723906e0e4', 0, 3)
INSERT [dbo].[employee] ([employee_id], [account], [employee_address], [employee_birthdate], [employee_email], [employee_name], [employee_phone], [password], [sex], [department_id]) VALUES (5, N'hrmbb', N'2686 Moose Terrace', CAST(N'1999-08-31' AS Date), N'hrmb@gmail.com', N'Hrm B', N'0355166404', N'020141b0381b7818bba0092671dc3524fb1b47cbc5dadec0334e38723906e0e4', 0, 2)
INSERT [dbo].[employee] ([employee_id], [account], [employee_address], [employee_birthdate], [employee_email], [employee_name], [employee_phone], [password], [sex], [department_id]) VALUES (6, N'servicea', N'339 Grim Parkway', CAST(N'1998-07-24' AS Date), N'servicea@gmail.com', N'Service A', N'0355166404', N'020141b0381b7818bba0092671dc3524fb1b47cbc5dadec0334e38723906e0e4', 0, 4)
INSERT [dbo].[employee] ([employee_id], [account], [employee_address], [employee_birthdate], [employee_email], [employee_name], [employee_phone], [password], [sex], [department_id]) VALUES (7, N'serviceb', N'48 Mesta Hill', CAST(N'2001-12-08' AS Date), N'serviceb@gmail.com', N'Service B', N'0355166404', N'020141b0381b7818bba0092671dc3524fb1b47cbc5dadec0334e38723906e0e4', 0, 4)
INSERT [dbo].[employee] ([employee_id], [account], [employee_address], [employee_birthdate], [employee_email], [employee_name], [employee_phone], [password], [sex], [department_id]) VALUES (8, N'parkingb', N'638 Carberry Crossing', CAST(N'2001-02-12' AS Date), N'parkingb@gmail.com', N'Parking B', N'0355166404', N'020141b0381b7818bba0092671dc3524fb1b47cbc5dadec0334e38723906e0e4', 0, 3)
INSERT [dbo].[employee] ([employee_id], [account], [employee_address], [employee_birthdate], [employee_email], [employee_name], [employee_phone], [password], [sex], [department_id]) VALUES (9, N'Elbertine', N'48 Maryland Hill', CAST(N'1999-01-03' AS Date), N'eforward8@eventbrite.com', N'Elbertine Forward', N'0355166404', N'020141b0381b7818bba0092671dc3524fb1b47cbc5dadec0334e38723906e0e4', 0, 2)
INSERT [dbo].[employee] ([employee_id], [account], [employee_address], [employee_birthdate], [employee_email], [employee_name], [employee_phone], [password], [sex], [department_id]) VALUES (10, N'hadung', N'751 Welch Terrace', CAST(N'2000-10-29' AS Date), N'hadung@gmail.com', N'Ha Dung', N'0355166404', N'020141b0381b7818bba0092671dc3524fb1b47cbc5dadec0334e38723906e0e4', 0, 2)
INSERT [dbo].[employee] ([employee_id], [account], [employee_address], [employee_birthdate], [employee_email], [employee_name], [employee_phone], [password], [sex], [department_id]) VALUES (11, N'Hansiain', N'4 Iowa Avenue', CAST(N'1997-12-29' AS Date), N'hbertolaccinia@yahoo.com', N'Hansiain Bertolaccini', N'0355166404', N'020141b0381b7818bba0092671dc3524fb1b47cbc5dadec0334e38723906e0e4', 0, 4)
INSERT [dbo].[employee] ([employee_id], [account], [employee_address], [employee_birthdate], [employee_email], [employee_name], [employee_phone], [password], [sex], [department_id]) VALUES (12, N'Neila', N'4557 Upham Plaza', CAST(N'2001-05-12' AS Date), N'nchettoeb@google.pl', N'Neila Chettoe', N'0355166404', N'020141b0381b7818bba0092671dc3524fb1b47cbc5dadec0334e38723906e0e4', 0, 2)
INSERT [dbo].[employee] ([employee_id], [account], [employee_address], [employee_birthdate], [employee_email], [employee_name], [employee_phone], [password], [sex], [department_id]) VALUES (13, N'Lorie', N'49 Bay Lane', CAST(N'2000-10-23' AS Date), N'lsawerc@newyorker.com', N'Lorie Sawer', N'0355166404', N'020141b0381b7818bba0092671dc3524fb1b47cbc5dadec0334e38723906e0e4', 1, 2)
INSERT [dbo].[employee] ([employee_id], [account], [employee_address], [employee_birthdate], [employee_email], [employee_name], [employee_phone], [password], [sex], [department_id]) VALUES (14, N'Michele', N'76596 School Junction', CAST(N'2004-03-04' AS Date), N'mchildersd@canalblog.com', N'Michele Childers', N'0355166404', N'020141b0381b7818bba0092671dc3524fb1b47cbc5dadec0334e38723906e0e4', 1, 3)
INSERT [dbo].[employee] ([employee_id], [account], [employee_address], [employee_birthdate], [employee_email], [employee_name], [employee_phone], [password], [sex], [department_id]) VALUES (15, N'Leone', N'9 Merchant Parkway', CAST(N'1999-06-03' AS Date), N'lessexe@blinklist.com', N'Leone Essex', N'0355166404', N'020141b0381b7818bba0092671dc3524fb1b47cbc5dadec0334e38723906e0e4', 0, 4)
INSERT [dbo].[employee] ([employee_id], [account], [employee_address], [employee_birthdate], [employee_email], [employee_name], [employee_phone], [password], [sex], [department_id]) VALUES (16, N'Rebeka', N'2500 Hintze Lane', CAST(N'2001-01-16' AS Date), N'rwombwellf@jugem.jp', N'Rebeka Wombwell', N'0355166404', N'020141b0381b7818bba0092671dc3524fb1b47cbc5dadec0334e38723906e0e4', 1, 2)
INSERT [dbo].[employee] ([employee_id], [account], [employee_address], [employee_birthdate], [employee_email], [employee_name], [employee_phone], [password], [sex], [department_id]) VALUES (17, N'Lula', N'5195 Brown Circle', CAST(N'1998-04-15' AS Date), N'lnezeyg@multiply.com', N'Lula Nezey', N'0355166404', N'020141b0381b7818bba0092671dc3524fb1b47cbc5dadec0334e38723906e0e4', 0, 3)
INSERT [dbo].[employee] ([employee_id], [account], [employee_address], [employee_birthdate], [employee_email], [employee_name], [employee_phone], [password], [sex], [department_id]) VALUES (18, N'Josepha', N'977 Hauk Crossing', CAST(N'2001-03-15' AS Date), N'jbrasherh@wikispaces.com', N'Josepha Brasher', N'0355166404', N'020141b0381b7818bba0092671dc3524fb1b47cbc5dadec0334e38723906e0e4', 0, 4)
INSERT [dbo].[employee] ([employee_id], [account], [employee_address], [employee_birthdate], [employee_email], [employee_name], [employee_phone], [password], [sex], [department_id]) VALUES (19, N'Dick', N'32179 Clarendon Hill', CAST(N'1997-03-05' AS Date), N'dmulgrewi@cmu.edu', N'Dick Mulgrew', N'0355166404', N'020141b0381b7818bba0092671dc3524fb1b47cbc5dadec0334e38723906e0e4', 1, 3)
INSERT [dbo].[employee] ([employee_id], [account], [employee_address], [employee_birthdate], [employee_email], [employee_name], [employee_phone], [password], [sex], [department_id]) VALUES (20, N'Sukey', N'69 Claremont Crossing', CAST(N'2002-01-28' AS Date), N'sverrillj@hexun.com', N'Sukey Verrill', N'0355166404', N'020141b0381b7818bba0092671dc3524fb1b47cbc5dadec0334e38723906e0e4', 0, 3)
INSERT [dbo].[employee] ([employee_id], [account], [employee_address], [employee_birthdate], [employee_email], [employee_name], [employee_phone], [password], [sex], [department_id]) VALUES (21, N'Hamil', N'59 Artisan Hill', CAST(N'2003-09-30' AS Date), N'hgoodspeedk@indiatimes.com', N'Hamil Goodspeed', N'0355166404', N'020141b0381b7818bba0092671dc3524fb1b47cbc5dadec0334e38723906e0e4', 1, 2)
INSERT [dbo].[employee] ([employee_id], [account], [employee_address], [employee_birthdate], [employee_email], [employee_name], [employee_phone], [password], [sex], [department_id]) VALUES (22, N'Rorie', N'48723 Amoth Terrace', CAST(N'2003-08-11' AS Date), N'rmacbeyl@youtube.com', N'Rorie MacBey', N'0355166404', N'020141b0381b7818bba0092671dc3524fb1b47cbc5dadec0334e38723906e0e4', 1, 3)
INSERT [dbo].[employee] ([employee_id], [account], [employee_address], [employee_birthdate], [employee_email], [employee_name], [employee_phone], [password], [sex], [department_id]) VALUES (23, N'Cornela', N'2 Rieder Avenue', CAST(N'2001-11-21' AS Date), N'ckrammerm@jalbum.net', N'Cornela Krammer', N'0355166404', N'020141b0381b7818bba0092671dc3524fb1b47cbc5dadec0334e38723906e0e4', 0, 4)
INSERT [dbo].[employee] ([employee_id], [account], [employee_address], [employee_birthdate], [employee_email], [employee_name], [employee_phone], [password], [sex], [department_id]) VALUES (24, N'Helena', N'1 Dovetail Road', CAST(N'2001-03-07' AS Date), N'hkarlikn@blinklist.com', N'Helena Karlik', N'0355166404', N'020141b0381b7818bba0092671dc3524fb1b47cbc5dadec0334e38723906e0e4', 1, 4)
INSERT [dbo].[employee] ([employee_id], [account], [employee_address], [employee_birthdate], [employee_email], [employee_name], [employee_phone], [password], [sex], [department_id]) VALUES (25, N'Hedwiga', N'6639 Mayfield Avenue', CAST(N'1999-08-05' AS Date), N'hcorstono@umich.edu', N'Hedwiga Corston', N'0355166404', N'020141b0381b7818bba0092671dc3524fb1b47cbc5dadec0334e38723906e0e4', 1, 2)
INSERT [dbo].[employee] ([employee_id], [account], [employee_address], [employee_birthdate], [employee_email], [employee_name], [employee_phone], [password], [sex], [department_id]) VALUES (26, N'Tine', N'2 Sutteridge Drive', CAST(N'1998-05-09' AS Date), N'twerrettp@mashable.com', N'Tine Werrett', N'0355166404', N'020141b0381b7818bba0092671dc3524fb1b47cbc5dadec0334e38723906e0e4', 1, 4)
INSERT [dbo].[employee] ([employee_id], [account], [employee_address], [employee_birthdate], [employee_email], [employee_name], [employee_phone], [password], [sex], [department_id]) VALUES (27, N'Anderson', N'2085 Jenna Road', CAST(N'2000-07-29' AS Date), N'aklimaszewskiq@java.com', N'Anderson Klimaszewski', N'0355166404', N'020141b0381b7818bba0092671dc3524fb1b47cbc5dadec0334e38723906e0e4', 1, 3)
INSERT [dbo].[employee] ([employee_id], [account], [employee_address], [employee_birthdate], [employee_email], [employee_name], [employee_phone], [password], [sex], [department_id]) VALUES (28, N'Isidore', N'451 Kingsford Alley', CAST(N'2004-04-14' AS Date), N'igatusr@quantcast.com', N'Isidore Gatus', N'0355166404', N'020141b0381b7818bba0092671dc3524fb1b47cbc5dadec0334e38723906e0e4', 1, 2)
INSERT [dbo].[employee] ([employee_id], [account], [employee_address], [employee_birthdate], [employee_email], [employee_name], [employee_phone], [password], [sex], [department_id]) VALUES (29, N'Byrom', N'61 Welch Alley', CAST(N'2001-08-17' AS Date), N'blambertis@1688.com', N'Byrom Lamberti', N'0355166404', N'020141b0381b7818bba0092671dc3524fb1b47cbc5dadec0334e38723906e0e4', 0, 4)
INSERT [dbo].[employee] ([employee_id], [account], [employee_address], [employee_birthdate], [employee_email], [employee_name], [employee_phone], [password], [sex], [department_id]) VALUES (30, N'Nolieee', N'139 Toban Center', CAST(N'2002-02-25' AS Date), N'nannicet@latimes.com', N'Nolie Annice', N'0355166404', N'020141b0381b7818bba0092671dc3524fb1b47cbc5dadec0334e38723906e0e4', 0, 3)
INSERT [dbo].[employee] ([employee_id], [account], [employee_address], [employee_birthdate], [employee_email], [employee_name], [employee_phone], [password], [sex], [department_id]) VALUES (31, N'Nadine', N'0801 Marquette Pass', CAST(N'2003-06-30' AS Date), N'ntouhigu@elpais.com', N'Nadine Touhig', N'0355166404', N'020141b0381b7818bba0092671dc3524fb1b47cbc5dadec0334e38723906e0e4', 0, 2)
INSERT [dbo].[employee] ([employee_id], [account], [employee_address], [employee_birthdate], [employee_email], [employee_name], [employee_phone], [password], [sex], [department_id]) VALUES (32, N'Vivien', N'9426 Clemons Pass', CAST(N'2000-10-03' AS Date), N'vbalfev@mlb.com', N'Vivien Balfe', N'0355166404', N'020141b0381b7818bba0092671dc3524fb1b47cbc5dadec0334e38723906e0e4', 1, 3)
INSERT [dbo].[employee] ([employee_id], [account], [employee_address], [employee_birthdate], [employee_email], [employee_name], [employee_phone], [password], [sex], [department_id]) VALUES (33, N'Linea', N'56 Hoard Parkway', CAST(N'2003-08-04' AS Date), N'lhoylesw@fema.gov', N'Linea Hoyles', N'0355166404', N'020141b0381b7818bba0092671dc3524fb1b47cbc5dadec0334e38723906e0e4', 1, 3)
INSERT [dbo].[employee] ([employee_id], [account], [employee_address], [employee_birthdate], [employee_email], [employee_name], [employee_phone], [password], [sex], [department_id]) VALUES (34, N'Giffy', N'4090 Melody Crossing', CAST(N'1997-10-07' AS Date), N'gslocumx@cbc.ca', N'Giffy Slocum', N'0355166404', N'020141b0381b7818bba0092671dc3524fb1b47cbc5dadec0334e38723906e0e4', 0, 2)
INSERT [dbo].[employee] ([employee_id], [account], [employee_address], [employee_birthdate], [employee_email], [employee_name], [employee_phone], [password], [sex], [department_id]) VALUES (35, N'Rolf', N'9 Canary Junction', CAST(N'2000-01-31' AS Date), N'rludgrovey@hugedomains.com', N'Rolf Ludgrove', N'0355166404', N'020141b0381b7818bba0092671dc3524fb1b47cbc5dadec0334e38723906e0e4', 1, 3)
INSERT [dbo].[employee] ([employee_id], [account], [employee_address], [employee_birthdate], [employee_email], [employee_name], [employee_phone], [password], [sex], [department_id]) VALUES (36, N'Aimee', N'4 Holy Cross Park', CAST(N'2004-01-23' AS Date), N'aricketz@newyorker.com', N'Aimee Ricket', N'0355166404', N'020141b0381b7818bba0092671dc3524fb1b47cbc5dadec0334e38723906e0e4', 0, 2)
INSERT [dbo].[employee] ([employee_id], [account], [employee_address], [employee_birthdate], [employee_email], [employee_name], [employee_phone], [password], [sex], [department_id]) VALUES (37, N'Sigvard', N'7 Larry Lane', CAST(N'2002-09-18' AS Date), N'socarran10@mozilla.org', N'Sigvard O''Carran', N'0355166404', N'020141b0381b7818bba0092671dc3524fb1b47cbc5dadec0334e38723906e0e4', 0, 3)
INSERT [dbo].[employee] ([employee_id], [account], [employee_address], [employee_birthdate], [employee_email], [employee_name], [employee_phone], [password], [sex], [department_id]) VALUES (38, N'Jessalyn', N'2 Scoville Avenue', CAST(N'2003-03-01' AS Date), N'jcoutthart11@myspace.com', N'Jessalyn Coutthart', N'0355166404', N'020141b0381b7818bba0092671dc3524fb1b47cbc5dadec0334e38723906e0e4', 0, 3)
INSERT [dbo].[employee] ([employee_id], [account], [employee_address], [employee_birthdate], [employee_email], [employee_name], [employee_phone], [password], [sex], [department_id]) VALUES (39, N'Jacki', N'186 Springview Park', CAST(N'1999-01-23' AS Date), N'jheale12@tmall.com', N'Jacki Heale', N'0355166404', N'020141b0381b7818bba0092671dc3524fb1b47cbc5dadec0334e38723906e0e4', 0, 3)
INSERT [dbo].[employee] ([employee_id], [account], [employee_address], [employee_birthdate], [employee_email], [employee_name], [employee_phone], [password], [sex], [department_id]) VALUES (40, N'Rora', N'84004 Graedel Alley', CAST(N'1998-09-17' AS Date), N'rfoss13@naver.com', N'Rora Foss', N'0355166404', N'020141b0381b7818bba0092671dc3524fb1b47cbc5dadec0334e38723906e0e4', 1, 3)
INSERT [dbo].[employee] ([employee_id], [account], [employee_address], [employee_birthdate], [employee_email], [employee_name], [employee_phone], [password], [sex], [department_id]) VALUES (41, N'Rosalyn', N'1 Hauk Way', CAST(N'2004-10-03' AS Date), N'rshord14@tinyurl.com', N'Rosalyn Shord', N'0355166404', N'020141b0381b7818bba0092671dc3524fb1b47cbc5dadec0334e38723906e0e4', 1, 4)
INSERT [dbo].[employee] ([employee_id], [account], [employee_address], [employee_birthdate], [employee_email], [employee_name], [employee_phone], [password], [sex], [department_id]) VALUES (42, N'Beniamino', N'2754 Upham Junction', CAST(N'1998-01-24' AS Date), N'bstackbridge15@oracle.com', N'Beniamino Stackbridge', N'0355166404', N'020141b0381b7818bba0092671dc3524fb1b47cbc5dadec0334e38723906e0e4', 1, 2)
INSERT [dbo].[employee] ([employee_id], [account], [employee_address], [employee_birthdate], [employee_email], [employee_name], [employee_phone], [password], [sex], [department_id]) VALUES (43, N'Bart', N'1 Westend Lane', CAST(N'2004-06-21' AS Date), N'bkidstone16@feedburner.com', N'Bart Kidstone', N'0355166404', N'020141b0381b7818bba0092671dc3524fb1b47cbc5dadec0334e38723906e0e4', 0, 2)
INSERT [dbo].[employee] ([employee_id], [account], [employee_address], [employee_birthdate], [employee_email], [employee_name], [employee_phone], [password], [sex], [department_id]) VALUES (44, N'Patrice', N'488 Linden Parkway', CAST(N'2001-11-02' AS Date), N'pbrandom17@sphinn.com', N'Patrice Brandom', N'0355166404', N'020141b0381b7818bba0092671dc3524fb1b47cbc5dadec0334e38723906e0e4', 0, 4)
INSERT [dbo].[employee] ([employee_id], [account], [employee_address], [employee_birthdate], [employee_email], [employee_name], [employee_phone], [password], [sex], [department_id]) VALUES (45, N'Brigid', N'065 Alpine Place', CAST(N'2001-10-20' AS Date), N'blabern18@geocities.jp', N'Brigid Labern', N'0355166404', N'020141b0381b7818bba0092671dc3524fb1b47cbc5dadec0334e38723906e0e4', 0, 2)
INSERT [dbo].[employee] ([employee_id], [account], [employee_address], [employee_birthdate], [employee_email], [employee_name], [employee_phone], [password], [sex], [department_id]) VALUES (46, N'Kandy', N'3145 Stephen Lane', CAST(N'1997-11-18' AS Date), N'kmynard19@mlb.com', N'Kandy Mynard', N'0355166404', N'020141b0381b7818bba0092671dc3524fb1b47cbc5dadec0334e38723906e0e4', 1, 2)
INSERT [dbo].[employee] ([employee_id], [account], [employee_address], [employee_birthdate], [employee_email], [employee_name], [employee_phone], [password], [sex], [department_id]) VALUES (47, N'Dyan', N'23 Moose Junction', CAST(N'2004-07-20' AS Date), N'dgheeraert1a@prweb.com', N'Dyan Gheeraert', N'0355166404', N'020141b0381b7818bba0092671dc3524fb1b47cbc5dadec0334e38723906e0e4', 1, 3)
INSERT [dbo].[employee] ([employee_id], [account], [employee_address], [employee_birthdate], [employee_email], [employee_name], [employee_phone], [password], [sex], [department_id]) VALUES (48, N'Addy', N'465 Dovetail Drive', CAST(N'2002-09-09' AS Date), N'aarmor1b@indiatimes.com', N'Addy Armor', N'0355166404', N'020141b0381b7818bba0092671dc3524fb1b47cbc5dadec0334e38723906e0e4', 1, 2)
INSERT [dbo].[employee] ([employee_id], [account], [employee_address], [employee_birthdate], [employee_email], [employee_name], [employee_phone], [password], [sex], [department_id]) VALUES (49, N'Stillman', N'46475 Golf Trail', CAST(N'2000-03-04' AS Date), N'shrishanok1c@php.net', N'Stillman Hrishanok', N'0355166404', N'020141b0381b7818bba0092671dc3524fb1b47cbc5dadec0334e38723906e0e4', 0, 3)
INSERT [dbo].[employee] ([employee_id], [account], [employee_address], [employee_birthdate], [employee_email], [employee_name], [employee_phone], [password], [sex], [department_id]) VALUES (50, N'Mahala', N'31215 Armistice Terrace', CAST(N'1998-09-22' AS Date), N'mvenables1d@drupal.org', N'Mahala Venables', N'0355166404', N'020141b0381b7818bba0092671dc3524fb1b47cbc5dadec0334e38723906e0e4', 0, 4)
INSERT [dbo].[employee] ([employee_id], [account], [employee_address], [employee_birthdate], [employee_email], [employee_name], [employee_phone], [password], [sex], [department_id]) VALUES (51, N'Alexa', N'9 Havey Hill', CAST(N'1997-10-11' AS Date), N'amacsherry1e@furl.net', N'Alexa MacSherry', N'0355166404', N'020141b0381b7818bba0092671dc3524fb1b47cbc5dadec0334e38723906e0e4', 1, 2)
INSERT [dbo].[employee] ([employee_id], [account], [employee_address], [employee_birthdate], [employee_email], [employee_name], [employee_phone], [password], [sex], [department_id]) VALUES (52, N'Winny', N'85502 New Castle Alley', CAST(N'2002-03-01' AS Date), N'wkwietak1f@prweb.com', N'Winny Kwietak', N'0355166404', N'020141b0381b7818bba0092671dc3524fb1b47cbc5dadec0334e38723906e0e4', 1, 3)
INSERT [dbo].[employee] ([employee_id], [account], [employee_address], [employee_birthdate], [employee_email], [employee_name], [employee_phone], [password], [sex], [department_id]) VALUES (53, N'Vania', N'154 Bowman Pass', CAST(N'2002-07-29' AS Date), N'vdenisot1g@epa.gov', N'Vania Denisot', N'0355166404', N'020141b0381b7818bba0092671dc3524fb1b47cbc5dadec0334e38723906e0e4', 1, 2)
INSERT [dbo].[employee] ([employee_id], [account], [employee_address], [employee_birthdate], [employee_email], [employee_name], [employee_phone], [password], [sex], [department_id]) VALUES (54, N'Dukey', N'48 Harbort Place', CAST(N'2004-01-01' AS Date), N'djuarez1h@odnoklassniki.ru', N'Dukey Juarez', N'0355166404', N'020141b0381b7818bba0092671dc3524fb1b47cbc5dadec0334e38723906e0e4', 1, 4)
INSERT [dbo].[employee] ([employee_id], [account], [employee_address], [employee_birthdate], [employee_email], [employee_name], [employee_phone], [password], [sex], [department_id]) VALUES (55, N'Dedie', N'59773 Farmco Parkway', CAST(N'2004-10-22' AS Date), N'dbarroux1i@wordpress.com', N'Dedie Barroux', N'0355166404', N'020141b0381b7818bba0092671dc3524fb1b47cbc5dadec0334e38723906e0e4', 0, 4)
INSERT [dbo].[employee] ([employee_id], [account], [employee_address], [employee_birthdate], [employee_email], [employee_name], [employee_phone], [password], [sex], [department_id]) VALUES (56, N'Rica', N'8 Armistice Plaza', CAST(N'2004-04-07' AS Date), N'rtunbridge1j@marriott.com', N'Rica Tunbridge', N'0355166404', N'020141b0381b7818bba0092671dc3524fb1b47cbc5dadec0334e38723906e0e4', 1, 3)
INSERT [dbo].[employee] ([employee_id], [account], [employee_address], [employee_birthdate], [employee_email], [employee_name], [employee_phone], [password], [sex], [department_id]) VALUES (57, N'Kira', N'41 Sundown Park', CAST(N'2001-09-13' AS Date), N'keyres1k@alibaba.com', N'Kira Eyres', N'0355166404', N'020141b0381b7818bba0092671dc3524fb1b47cbc5dadec0334e38723906e0e4', 1, 2)
INSERT [dbo].[employee] ([employee_id], [account], [employee_address], [employee_birthdate], [employee_email], [employee_name], [employee_phone], [password], [sex], [department_id]) VALUES (58, N'York', N'8703 Rusk Crossing', CAST(N'1998-08-14' AS Date), N'yashborn1l@yelp.com', N'York Ashborn', N'0355166404', N'020141b0381b7818bba0092671dc3524fb1b47cbc5dadec0334e38723906e0e4', 1, 3)
INSERT [dbo].[employee] ([employee_id], [account], [employee_address], [employee_birthdate], [employee_email], [employee_name], [employee_phone], [password], [sex], [department_id]) VALUES (59, N'Cynthia', N'1 Pennsylvania Place', CAST(N'2000-12-08' AS Date), N'cewbanche1m@yellowbook.com', N'Cynthia Ewbanche', N'0355166404', N'020141b0381b7818bba0092671dc3524fb1b47cbc5dadec0334e38723906e0e4', 0, 3)
INSERT [dbo].[employee] ([employee_id], [account], [employee_address], [employee_birthdate], [employee_email], [employee_name], [employee_phone], [password], [sex], [department_id]) VALUES (60, N'Livvyy', N'923 Stuart Center', CAST(N'2001-06-05' AS Date), N'lmatityahu1n@paginegialle.it', N'Livvyy Matityahu', N'0355166404', N'020141b0381b7818bba0092671dc3524fb1b47cbc5dadec0334e38723906e0e4', 1, 4)
INSERT [dbo].[employee] ([employee_id], [account], [employee_address], [employee_birthdate], [employee_email], [employee_name], [employee_phone], [password], [sex], [department_id]) VALUES (61, N'Toinette', N'174 Vidon Park', CAST(N'2002-08-05' AS Date), N'ttallant1o@hostgator.com', N'Toinette Tallant', N'0355166404', N'020141b0381b7818bba0092671dc3524fb1b47cbc5dadec0334e38723906e0e4', 0, 2)
INSERT [dbo].[employee] ([employee_id], [account], [employee_address], [employee_birthdate], [employee_email], [employee_name], [employee_phone], [password], [sex], [department_id]) VALUES (62, N'Holly', N'31 Valley Edge Place', CAST(N'2001-10-23' AS Date), N'hbrickwood1p@macromedia.com', N'Holly Brickwood', N'0355166404', N'020141b0381b7818bba0092671dc3524fb1b47cbc5dadec0334e38723906e0e4', 1, 3)
INSERT [dbo].[employee] ([employee_id], [account], [employee_address], [employee_birthdate], [employee_email], [employee_name], [employee_phone], [password], [sex], [department_id]) VALUES (63, N'Batholomew', N'57 Gina Way', CAST(N'1998-12-08' AS Date), N'bison1q@smh.com.au', N'Batholomew Ison', N'0355166404', N'020141b0381b7818bba0092671dc3524fb1b47cbc5dadec0334e38723906e0e4', 0, 2)
INSERT [dbo].[employee] ([employee_id], [account], [employee_address], [employee_birthdate], [employee_email], [employee_name], [employee_phone], [password], [sex], [department_id]) VALUES (64, N'Bambie', N'70 Orin Lane', CAST(N'2001-12-09' AS Date), N'banersen1r@histats.com', N'Bambie Anersen', N'0355166404', N'020141b0381b7818bba0092671dc3524fb1b47cbc5dadec0334e38723906e0e4', 0, 3)
INSERT [dbo].[employee] ([employee_id], [account], [employee_address], [employee_birthdate], [employee_email], [employee_name], [employee_phone], [password], [sex], [department_id]) VALUES (65, N'Hakim', N'213 Manley Way', CAST(N'2004-05-15' AS Date), N'htabbitt1s@nifty.com', N'Hakim Tabbitt', N'0355166404', N'020141b0381b7818bba0092671dc3524fb1b47cbc5dadec0334e38723906e0e4', 0, 2)
INSERT [dbo].[employee] ([employee_id], [account], [employee_address], [employee_birthdate], [employee_email], [employee_name], [employee_phone], [password], [sex], [department_id]) VALUES (66, N'Alexine', N'68 Merrick Crossing', CAST(N'1997-10-22' AS Date), N'amacentee1t@google.co.jp', N'Alexine MacEntee', N'0355166404', N'020141b0381b7818bba0092671dc3524fb1b47cbc5dadec0334e38723906e0e4', 1, 2)
INSERT [dbo].[employee] ([employee_id], [account], [employee_address], [employee_birthdate], [employee_email], [employee_name], [employee_phone], [password], [sex], [department_id]) VALUES (67, N'Dorthea', N'3 Namekagon Junction', CAST(N'1997-01-31' AS Date), N'dmcvrone1u@archive.org', N'Dorthea McVrone', N'0355166404', N'020141b0381b7818bba0092671dc3524fb1b47cbc5dadec0334e38723906e0e4', 1, 2)
INSERT [dbo].[employee] ([employee_id], [account], [employee_address], [employee_birthdate], [employee_email], [employee_name], [employee_phone], [password], [sex], [department_id]) VALUES (68, N'Charlotte', N'75597 American Lane', CAST(N'2002-11-29' AS Date), N'cmarklund1v@e-recht24.de', N'Charlotte Marklund', N'0355166404', N'020141b0381b7818bba0092671dc3524fb1b47cbc5dadec0334e38723906e0e4', 1, 2)
INSERT [dbo].[employee] ([employee_id], [account], [employee_address], [employee_birthdate], [employee_email], [employee_name], [employee_phone], [password], [sex], [department_id]) VALUES (69, N'Ricard', N'41 Golden Leaf Place', CAST(N'2003-06-19' AS Date), N'reley1w@fc2.com', N'Ricard Eley', N'0355166404', N'020141b0381b7818bba0092671dc3524fb1b47cbc5dadec0334e38723906e0e4', 0, 2)
INSERT [dbo].[employee] ([employee_id], [account], [employee_address], [employee_birthdate], [employee_email], [employee_name], [employee_phone], [password], [sex], [department_id]) VALUES (70, N'Patience', N'6 3rd Junction', CAST(N'1999-11-30' AS Date), N'pchillingworth1x@prlog.org', N'Patience Chillingworth', N'0355166404', N'020141b0381b7818bba0092671dc3524fb1b47cbc5dadec0334e38723906e0e4', 0, 3)
INSERT [dbo].[employee] ([employee_id], [account], [employee_address], [employee_birthdate], [employee_email], [employee_name], [employee_phone], [password], [sex], [department_id]) VALUES (71, N'Gilbertine', N'22 Stoughton Way', CAST(N'2001-06-09' AS Date), N'gthacke1y@networkadvertising.org', N'Gilbertine Thacke', N'0355166404', N'020141b0381b7818bba0092671dc3524fb1b47cbc5dadec0334e38723906e0e4', 1, 2)
INSERT [dbo].[employee] ([employee_id], [account], [employee_address], [employee_birthdate], [employee_email], [employee_name], [employee_phone], [password], [sex], [department_id]) VALUES (72, N'Jamison', N'34092 Lindbergh Parkway', CAST(N'2002-12-21' AS Date), N'jloines1z@woothemes.com', N'Jamison Loines', N'0355166404', N'020141b0381b7818bba0092671dc3524fb1b47cbc5dadec0334e38723906e0e4', 0, 2)
INSERT [dbo].[employee] ([employee_id], [account], [employee_address], [employee_birthdate], [employee_email], [employee_name], [employee_phone], [password], [sex], [department_id]) VALUES (73, N'Erminia', N'473 Dunning Parkway', CAST(N'2002-07-06' AS Date), N'esendley20@nymag.com', N'Erminia Sendley', N'0355166404', N'020141b0381b7818bba0092671dc3524fb1b47cbc5dadec0334e38723906e0e4', 1, 2)
INSERT [dbo].[employee] ([employee_id], [account], [employee_address], [employee_birthdate], [employee_email], [employee_name], [employee_phone], [password], [sex], [department_id]) VALUES (74, N'Falito', N'391 Atwood Parkway', CAST(N'2003-04-27' AS Date), N'fduffy21@jigsy.com', N'Falito Duffy', N'0355166404', N'020141b0381b7818bba0092671dc3524fb1b47cbc5dadec0334e38723906e0e4', 0, 2)
INSERT [dbo].[employee] ([employee_id], [account], [employee_address], [employee_birthdate], [employee_email], [employee_name], [employee_phone], [password], [sex], [department_id]) VALUES (75, N'Hazlett', N'74412 Valley Edge Terrace', CAST(N'2000-05-10' AS Date), N'hde22@surveymonkey.com', N'Hazlett de Quincey', N'0355166404', N'020141b0381b7818bba0092671dc3524fb1b47cbc5dadec0334e38723906e0e4', 1, 2)
INSERT [dbo].[employee] ([employee_id], [account], [employee_address], [employee_birthdate], [employee_email], [employee_name], [employee_phone], [password], [sex], [department_id]) VALUES (76, N'Annora', N'5 Hanson Alley', CAST(N'1999-06-17' AS Date), N'athurling23@odnoklassniki.ru', N'Annora Thurling', N'0355166404', N'020141b0381b7818bba0092671dc3524fb1b47cbc5dadec0334e38723906e0e4', 1, 3)
INSERT [dbo].[employee] ([employee_id], [account], [employee_address], [employee_birthdate], [employee_email], [employee_name], [employee_phone], [password], [sex], [department_id]) VALUES (77, N'Emory', N'5362 Lerdahl Court', CAST(N'1998-08-15' AS Date), N'efranzman24@un.org', N'Emory Franzman', N'0355166404', N'020141b0381b7818bba0092671dc3524fb1b47cbc5dadec0334e38723906e0e4', 0, 3)
INSERT [dbo].[employee] ([employee_id], [account], [employee_address], [employee_birthdate], [employee_email], [employee_name], [employee_phone], [password], [sex], [department_id]) VALUES (78, N'Chelsy', N'68245 Springview Place', CAST(N'1997-07-02' AS Date), N'cfery25@ed.gov', N'Chelsy Fery', N'0355166404', N'020141b0381b7818bba0092671dc3524fb1b47cbc5dadec0334e38723906e0e4', 0, 2)
INSERT [dbo].[employee] ([employee_id], [account], [employee_address], [employee_birthdate], [employee_email], [employee_name], [employee_phone], [password], [sex], [department_id]) VALUES (79, N'Moyra', N'8 Ruskin Crossing', CAST(N'1999-02-06' AS Date), N'mmusselwhite26@topsy.com', N'Moyra Musselwhite', N'0355166404', N'020141b0381b7818bba0092671dc3524fb1b47cbc5dadec0334e38723906e0e4', 1, 2)
INSERT [dbo].[employee] ([employee_id], [account], [employee_address], [employee_birthdate], [employee_email], [employee_name], [employee_phone], [password], [sex], [department_id]) VALUES (80, N'Julina', N'817 Manley Junction', CAST(N'2001-07-20' AS Date), N'jbrood27@ucoz.com', N'Julina Brood', N'0355166404', N'020141b0381b7818bba0092671dc3524fb1b47cbc5dadec0334e38723906e0e4', 0, 4)
INSERT [dbo].[employee] ([employee_id], [account], [employee_address], [employee_birthdate], [employee_email], [employee_name], [employee_phone], [password], [sex], [department_id]) VALUES (81, N'Abbye', N'448 Claremont Street', CAST(N'2000-05-03' AS Date), N'awass28@whitehouse.gov', N'Abbye Wass', N'0355166404', N'020141b0381b7818bba0092671dc3524fb1b47cbc5dadec0334e38723906e0e4', 0, 4)
INSERT [dbo].[employee] ([employee_id], [account], [employee_address], [employee_birthdate], [employee_email], [employee_name], [employee_phone], [password], [sex], [department_id]) VALUES (82, N'Meagan', N'67 Algoma Alley', CAST(N'1999-07-14' AS Date), N'msaylor29@toplist.cz', N'Meagan Saylor', N'0355166404', N'020141b0381b7818bba0092671dc3524fb1b47cbc5dadec0334e38723906e0e4', 0, 3)
INSERT [dbo].[employee] ([employee_id], [account], [employee_address], [employee_birthdate], [employee_email], [employee_name], [employee_phone], [password], [sex], [department_id]) VALUES (83, N'Sorcha', N'36048 Jana Park', CAST(N'2000-07-20' AS Date), N'scallard2a@hatena.ne.jp', N'Sorcha Callard', N'0355166404', N'020141b0381b7818bba0092671dc3524fb1b47cbc5dadec0334e38723906e0e4', 0, 4)
INSERT [dbo].[employee] ([employee_id], [account], [employee_address], [employee_birthdate], [employee_email], [employee_name], [employee_phone], [password], [sex], [department_id]) VALUES (84, N'Erastus', N'867 Lotheville Avenue', CAST(N'2004-10-21' AS Date), N'eswarbrigg2b@google.de', N'Erastus Swarbrigg', N'0355166404', N'020141b0381b7818bba0092671dc3524fb1b47cbc5dadec0334e38723906e0e4', 1, 3)
INSERT [dbo].[employee] ([employee_id], [account], [employee_address], [employee_birthdate], [employee_email], [employee_name], [employee_phone], [password], [sex], [department_id]) VALUES (85, N'Linn', N'9 Canary Place', CAST(N'2000-08-08' AS Date), N'lmacgiolla2c@jugem.jp', N'Linn MacGiolla Pheadair', N'0355166404', N'020141b0381b7818bba0092671dc3524fb1b47cbc5dadec0334e38723906e0e4', 0, 4)
INSERT [dbo].[employee] ([employee_id], [account], [employee_address], [employee_birthdate], [employee_email], [employee_name], [employee_phone], [password], [sex], [department_id]) VALUES (86, N'Lina', N'11158 Scofield Road', CAST(N'2004-07-22' AS Date), N'lduddy2d@google.com.hk', N'Lina Duddy', N'0355166404', N'020141b0381b7818bba0092671dc3524fb1b47cbc5dadec0334e38723906e0e4', 0, 2)
INSERT [dbo].[employee] ([employee_id], [account], [employee_address], [employee_birthdate], [employee_email], [employee_name], [employee_phone], [password], [sex], [department_id]) VALUES (87, N'Cyndie', N'51 Thackeray Place', CAST(N'1999-11-14' AS Date), N'ccoverly2e@prweb.com', N'Cyndie Coverly', N'0355166404', N'020141b0381b7818bba0092671dc3524fb1b47cbc5dadec0334e38723906e0e4', 1, 4)
INSERT [dbo].[employee] ([employee_id], [account], [employee_address], [employee_birthdate], [employee_email], [employee_name], [employee_phone], [password], [sex], [department_id]) VALUES (88, N'Wilhelmina', N'6 Holy Cross Plaza', CAST(N'2002-10-25' AS Date), N'wleamy2f@kickstarter.com', N'Wilhelmina Leamy', N'0355166404', N'020141b0381b7818bba0092671dc3524fb1b47cbc5dadec0334e38723906e0e4', 0, 3)
INSERT [dbo].[employee] ([employee_id], [account], [employee_address], [employee_birthdate], [employee_email], [employee_name], [employee_phone], [password], [sex], [department_id]) VALUES (89, N'Barb', N'08 Burrows Lane', CAST(N'2003-06-23' AS Date), N'bgrouvel2g@unblog.fr', N'Barb Grouvel', N'0355166404', N'020141b0381b7818bba0092671dc3524fb1b47cbc5dadec0334e38723906e0e4', 1, 3)
INSERT [dbo].[employee] ([employee_id], [account], [employee_address], [employee_birthdate], [employee_email], [employee_name], [employee_phone], [password], [sex], [department_id]) VALUES (90, N'Lois', N'0 Hanover Circle', CAST(N'1998-11-12' AS Date), N'ljuggings2h@bloglines.com', N'Lois Juggings', N'0355166404', N'020141b0381b7818bba0092671dc3524fb1b47cbc5dadec0334e38723906e0e4', 0, 2)
INSERT [dbo].[employee] ([employee_id], [account], [employee_address], [employee_birthdate], [employee_email], [employee_name], [employee_phone], [password], [sex], [department_id]) VALUES (91, N'Ernesto', N'47 Thierer Terrace', CAST(N'2000-06-17' AS Date), N'ecaldecourt2i@mozilla.com', N'Ernesto Caldecourt', N'0355166404', N'020141b0381b7818bba0092671dc3524fb1b47cbc5dadec0334e38723906e0e4', 1, 3)
INSERT [dbo].[employee] ([employee_id], [account], [employee_address], [employee_birthdate], [employee_email], [employee_name], [employee_phone], [password], [sex], [department_id]) VALUES (92, N'Adore', N'73 Mendota Circle', CAST(N'1999-10-20' AS Date), N'apriddey2j@ucla.edu', N'Adore Priddey', N'0355166404', N'020141b0381b7818bba0092671dc3524fb1b47cbc5dadec0334e38723906e0e4', 1, 3)
INSERT [dbo].[employee] ([employee_id], [account], [employee_address], [employee_birthdate], [employee_email], [employee_name], [employee_phone], [password], [sex], [department_id]) VALUES (93, N'Gamaliel', N'13 Mariners Cove Circle', CAST(N'2001-11-26' AS Date), N'gdwine2k@unesco.org', N'Gamaliel Dwine', N'0355166405', N'020141b0381b7818bba0092671dc3524fb1b47cbc5dadec0334e38723906e0e4', 0, 3)
INSERT [dbo].[employee] ([employee_id], [account], [employee_address], [employee_birthdate], [employee_email], [employee_name], [employee_phone], [password], [sex], [department_id]) VALUES (94, N'Maud', N'22 Hayes Crossing', CAST(N'2000-11-11' AS Date), N'mfellos2l@unc.edu', N'Maud Fellos', N'0355166404', N'020141b0381b7818bba0092671dc3524fb1b47cbc5dadec0334e38723906e0e4', 0, 3)
INSERT [dbo].[employee] ([employee_id], [account], [employee_address], [employee_birthdate], [employee_email], [employee_name], [employee_phone], [password], [sex], [department_id]) VALUES (95, N'Allie', N'49407 Iowa Point', CAST(N'1999-08-12' AS Date), N'ahurn2m@yahoo.co.jp', N'Allie Hurn', N'0355166404', N'020141b0381b7818bba0092671dc3524fb1b47cbc5dadec0334e38723906e0e4', 1, 3)
INSERT [dbo].[employee] ([employee_id], [account], [employee_address], [employee_birthdate], [employee_email], [employee_name], [employee_phone], [password], [sex], [department_id]) VALUES (96, N'Rutherford', N'50 Emmet Park', CAST(N'2002-02-22' AS Date), N'rtomney2n@topsy.com', N'Rutherford Tomney', N'0355166404', N'020141b0381b7818bba0092671dc3524fb1b47cbc5dadec0334e38723906e0e4', 0, 4)
INSERT [dbo].[employee] ([employee_id], [account], [employee_address], [employee_birthdate], [employee_email], [employee_name], [employee_phone], [password], [sex], [department_id]) VALUES (97, N'Ase', N'52637 Pond Plaza', CAST(N'2004-07-23' AS Date), N'abramham2o@topsy.com', N'Ase Bramham', N'0355166404', N'020141b0381b7818bba0092671dc3524fb1b47cbc5dadec0334e38723906e0e4', 0, 2)
INSERT [dbo].[employee] ([employee_id], [account], [employee_address], [employee_birthdate], [employee_email], [employee_name], [employee_phone], [password], [sex], [department_id]) VALUES (98, N'Carolann', N'63 Ronald Regan Crossing', CAST(N'1997-11-14' AS Date), N'crucklidge2p@51.la', N'Carolann Rucklidge', N'0355166404', N'020141b0381b7818bba0092671dc3524fb1b47cbc5dadec0334e38723906e0e4', 1, 3)
INSERT [dbo].[employee] ([employee_id], [account], [employee_address], [employee_birthdate], [employee_email], [employee_name], [employee_phone], [password], [sex], [department_id]) VALUES (99, N'Parrnell', N'39 Hansons Terrace', CAST(N'2001-04-20' AS Date), N'ptynnan2q@skyrock.com', N'Parrnell Tynnan', N'0355166404', N'020141b0381b7818bba0092671dc3524fb1b47cbc5dadec0334e38723906e0e4', 1, 3)
GO
INSERT [dbo].[employee] ([employee_id], [account], [employee_address], [employee_birthdate], [employee_email], [employee_name], [employee_phone], [password], [sex], [department_id]) VALUES (100, N'Ignazio', N'46204 Everett Road', CAST(N'2002-08-31' AS Date), N'ischapiro2r@oakley.com', N'Ignazio Schapiro', N'0355166404', N'020141b0381b7818bba0092671dc3524fb1b47cbc5dadec0334e38723906e0e4', 0, 2)
INSERT [dbo].[employee] ([employee_id], [account], [employee_address], [employee_birthdate], [employee_email], [employee_name], [employee_phone], [password], [sex], [department_id]) VALUES (135, N'sssssssssssss', N'Hoa Lac', CAST(N'2001-12-09' AS Date), N'emploggg@gmail.com', N'nguyen van a', N'09485838594', N'020141b0381b7818bba0092671dc3524fb1b47cbc5dadec0334e38723906e0e4', 0, 1)
INSERT [dbo].[employee] ([employee_id], [account], [employee_address], [employee_birthdate], [employee_email], [employee_name], [employee_phone], [password], [sex], [department_id]) VALUES (137, N'addnewww', N'', CAST(N'2001-12-09' AS Date), N'addnewww@gmail.com', N'nguyen ha ddd', N'09485838594', N'020141b0381b7818bba0092671dc3524fb1b47cbc5dadec0334e38723906e0e4', 0, 1)
SET IDENTITY_INSERT [dbo].[employee] OFF
GO
SET IDENTITY_INSERT [dbo].[parking_lot] ON 

INSERT [dbo].[parking_lot] ([park_id], [park_quantity], [park_name], [park_place], [park_price], [park_status], [park_area], [park_count]) VALUES (1, 20, N'Yodel', N'AVOCADO', 49.0000, N'1', 300, 2)
INSERT [dbo].[parking_lot] ([park_id], [park_quantity], [park_name], [park_place], [park_price], [park_status], [park_area], [park_count]) VALUES (2, 20, N'Linktype', N'Griseofulvin', 17.0000, N'1', 300, 2)
INSERT [dbo].[parking_lot] ([park_id], [park_quantity], [park_name], [park_place], [park_price], [park_status], [park_area], [park_count]) VALUES (3, 20, N'Browsetype', N'PC537 E-2 BRUTE', 49.0000, N'1', 300, 1)
INSERT [dbo].[parking_lot] ([park_id], [park_quantity], [park_name], [park_place], [park_price], [park_status], [park_area], [park_count]) VALUES (4, 20, N'Jaxworks', N'Octreotide Acetate', 95.0000, N'1', 300, 1)
INSERT [dbo].[parking_lot] ([park_id], [park_quantity], [park_name], [park_place], [park_price], [park_status], [park_area], [park_count]) VALUES (5, 20, N'Wikibox', N'Ibuprofen', 15.0000, N'1', 300, 1)
INSERT [dbo].[parking_lot] ([park_id], [park_quantity], [park_name], [park_place], [park_price], [park_status], [park_area], [park_count]) VALUES (6, 20, N'Gabcube', N'Amlodipine Besylate', 33.0000, N'1', 300, 0)
INSERT [dbo].[parking_lot] ([park_id], [park_quantity], [park_name], [park_place], [park_price], [park_status], [park_area], [park_count]) VALUES (7, 20, N'Eidel', N'Lice Treatment', 62.0000, N'1', 300, 0)
INSERT [dbo].[parking_lot] ([park_id], [park_quantity], [park_name], [park_place], [park_price], [park_status], [park_area], [park_count]) VALUES (8, 20, N'Katz', N'CALCAREA CARBONICA', 30.0000, N'1', 300, 0)
INSERT [dbo].[parking_lot] ([park_id], [park_quantity], [park_name], [park_place], [park_price], [park_status], [park_area], [park_count]) VALUES (9, 20, N'Ntags', N'Aruba Aloe Very Water Resistant Sunscreen', 86.0000, N'1', 300, 0)
INSERT [dbo].[parking_lot] ([park_id], [park_quantity], [park_name], [park_place], [park_price], [park_status], [park_area], [park_count]) VALUES (10, 20, N'Dynazzy', N'Mirtazapine', 79.0000, N'1', 300, 0)
INSERT [dbo].[parking_lot] ([park_id], [park_quantity], [park_name], [park_place], [park_price], [park_status], [park_area], [park_count]) VALUES (11, 20, N'Jabbertype', N'Long-Lasting Wicked Fresh - Cool Peppermint', 64.0000, N'1', 300, 0)
INSERT [dbo].[parking_lot] ([park_id], [park_quantity], [park_name], [park_place], [park_price], [park_status], [park_area], [park_count]) VALUES (12, 20, N'LiveZ', N'Alba TerraTint Bloom SPF 15 Lip Balm', 76.0000, N'1', 300, 3)
INSERT [dbo].[parking_lot] ([park_id], [park_quantity], [park_name], [park_place], [park_price], [park_status], [park_area], [park_count]) VALUES (13, 20, N'Edgetag', N'Midodrine Hydrochloride', 38.0000, N'1', 300, 0)
INSERT [dbo].[parking_lot] ([park_id], [park_quantity], [park_name], [park_place], [park_price], [park_status], [park_area], [park_count]) VALUES (14, 20, N'Dabtype', N'Benztropine Mesylate', 86.0000, N'1', 300, 0)
INSERT [dbo].[parking_lot] ([park_id], [park_quantity], [park_name], [park_place], [park_price], [park_status], [park_area], [park_count]) VALUES (15, 20, N'Skinix', N'Q-Tapp DM Elixir', 42.0000, N'1', 300, 0)
INSERT [dbo].[parking_lot] ([park_id], [park_quantity], [park_name], [park_place], [park_price], [park_status], [park_area], [park_count]) VALUES (16, 20, N'Voonix', N'UV LOCK FLOWER NON CHEMICAL SUN', 44.0000, N'1', 300, 1)
INSERT [dbo].[parking_lot] ([park_id], [park_quantity], [park_name], [park_place], [park_price], [park_status], [park_area], [park_count]) VALUES (18, 20, N'Roomm', N'RHUBARB', 43.0000, N'1', 300, 0)
INSERT [dbo].[parking_lot] ([park_id], [park_quantity], [park_name], [park_place], [park_price], [park_status], [park_area], [park_count]) VALUES (19, 20, N'Twitterlist', N'CARELESS WEED POLLEN', 16.0000, N'1', 300, 0)
INSERT [dbo].[parking_lot] ([park_id], [park_quantity], [park_name], [park_place], [park_price], [park_status], [park_area], [park_count]) VALUES (20, 20, N'Twinder', N'Propranolol Hydrochloride', 94.0000, N'1', 300, 1)
INSERT [dbo].[parking_lot] ([park_id], [park_quantity], [park_name], [park_place], [park_price], [park_status], [park_area], [park_count]) VALUES (21, 20, N'Tagfeed', N'ANTIBACTERIAL FOAMING', 56.0000, N'1', 300, 0)
INSERT [dbo].[parking_lot] ([park_id], [park_quantity], [park_name], [park_place], [park_price], [park_status], [park_area], [park_count]) VALUES (22, 20, N'Browsecat', N'TIANHE GUBEN YAOSHEN TIE GAO', 25.0000, N'1', 300, 1)
INSERT [dbo].[parking_lot] ([park_id], [park_quantity], [park_name], [park_place], [park_price], [park_status], [park_area], [park_count]) VALUES (23, 20, N'Yodoo', N'Paroxetine', 73.0000, N'1', 300, 1)
INSERT [dbo].[parking_lot] ([park_id], [park_quantity], [park_name], [park_place], [park_price], [park_status], [park_area], [park_count]) VALUES (24, 20, N'Npath', N'Pentoxifylline', 24.0000, N'1', 300, 1)
INSERT [dbo].[parking_lot] ([park_id], [park_quantity], [park_name], [park_place], [park_price], [park_status], [park_area], [park_count]) VALUES (25, 20, N'Buzzbean', N'Sheer Tint', 20.0000, N'1', 300, 3)
INSERT [dbo].[parking_lot] ([park_id], [park_quantity], [park_name], [park_place], [park_price], [park_status], [park_area], [park_count]) VALUES (26, 20, N'Mynte', N'ARANESP', 81.0000, N'1', 300, 1)
INSERT [dbo].[parking_lot] ([park_id], [park_quantity], [park_name], [park_place], [park_price], [park_status], [park_area], [park_count]) VALUES (27, 20, N'InnoZ', N'Montelukast Sodium', 67.0000, N'1', 300, 0)
INSERT [dbo].[parking_lot] ([park_id], [park_quantity], [park_name], [park_place], [park_price], [park_status], [park_area], [park_count]) VALUES (28, 20, N'Aimbu', N'Apanol', 17.0000, N'1', 300, 1)
INSERT [dbo].[parking_lot] ([park_id], [park_quantity], [park_name], [park_place], [park_price], [park_status], [park_area], [park_count]) VALUES (29, 20, N'Linkbridge', N'CLE DE PEAU BEAUTE CR COMPACT FOUNDATION', 95.0000, N'1', 300, 1)
INSERT [dbo].[parking_lot] ([park_id], [park_quantity], [park_name], [park_place], [park_price], [park_status], [park_area], [park_count]) VALUES (30, 20, N'Vimbo', N'Tussin DM', 20.0000, N'1', 300, 0)
INSERT [dbo].[parking_lot] ([park_id], [park_quantity], [park_name], [park_place], [park_price], [park_status], [park_area], [park_count]) VALUES (31, 20, N'Wordtune', N'Denavir', 67.0000, N'1', 300, 0)
INSERT [dbo].[parking_lot] ([park_id], [park_quantity], [park_name], [park_place], [park_price], [park_status], [park_area], [park_count]) VALUES (32, 20, N'Oyoloo', N'GOLDKIWI SUN', 92.0000, N'1', 300, 0)
INSERT [dbo].[parking_lot] ([park_id], [park_quantity], [park_name], [park_place], [park_price], [park_status], [park_area], [park_count]) VALUES (33, 20, N'Avamba', N'Primlev', 12.0000, N'1', 300, 1)
INSERT [dbo].[parking_lot] ([park_id], [park_quantity], [park_name], [park_place], [park_price], [park_status], [park_area], [park_count]) VALUES (34, 20, N'Blogtag', N'Foaming Hand Wash', 40.0000, N'1', 300, 2)
INSERT [dbo].[parking_lot] ([park_id], [park_quantity], [park_name], [park_place], [park_price], [park_status], [park_area], [park_count]) VALUES (35, 20, N'Voonix', N'Amlodipine Besylate and Benazepril Hydrochloride', 24.0000, N'1', 300, 3)
INSERT [dbo].[parking_lot] ([park_id], [park_quantity], [park_name], [park_place], [park_price], [park_status], [park_area], [park_count]) VALUES (36, 20, N'Yadel', N'Pacific', 80.0000, N'1', 300, 0)
INSERT [dbo].[parking_lot] ([park_id], [park_quantity], [park_name], [park_place], [park_price], [park_status], [park_area], [park_count]) VALUES (38, 20, N'Abatz', N'AMBROSIA BIDENTATA POLLEN', 91.0000, N'1', 300, 1)
INSERT [dbo].[parking_lot] ([park_id], [park_quantity], [park_name], [park_place], [park_price], [park_status], [park_area], [park_count]) VALUES (39, 20, N'Izio', N'Rivastigmine Tartrate', 65.0000, N'1', 300, 0)
INSERT [dbo].[parking_lot] ([park_id], [park_quantity], [park_name], [park_place], [park_price], [park_status], [park_area], [park_count]) VALUES (40, 20, N'Tagopia', N'LAMICTAL', 89.0000, N'1', 300, 0)
INSERT [dbo].[parking_lot] ([park_id], [park_quantity], [park_name], [park_place], [park_price], [park_status], [park_area], [park_count]) VALUES (41, 20, N'Devify', N'Clear Anti Itch', 37.0000, N'1', 300, 1)
INSERT [dbo].[parking_lot] ([park_id], [park_quantity], [park_name], [park_place], [park_price], [park_status], [park_area], [park_count]) VALUES (42, 20, N'Meeveo', N'Ampicillin and Sulbactam ', 56.0000, N'1', 300, 0)
INSERT [dbo].[parking_lot] ([park_id], [park_quantity], [park_name], [park_place], [park_price], [park_status], [park_area], [park_count]) VALUES (43, 20, N'Meevee', N'Flecainide Acetate', 39.0000, N'1', 300, 1)
INSERT [dbo].[parking_lot] ([park_id], [park_quantity], [park_name], [park_place], [park_price], [park_status], [park_area], [park_count]) VALUES (44, 20, N'Oba', N'7 Select Allergy Relief', 16.0000, N'1', 300, 0)
INSERT [dbo].[parking_lot] ([park_id], [park_quantity], [park_name], [park_place], [park_price], [park_status], [park_area], [park_count]) VALUES (45, 20, N'Jaxnation', N'Assured Nasal Relief', 87.0000, N'1', 300, 0)
INSERT [dbo].[parking_lot] ([park_id], [park_quantity], [park_name], [park_place], [park_price], [park_status], [park_area], [park_count]) VALUES (46, 20, N'Kwideo', N'Benazepril Hydrochloride', 48.0000, N'1', 300, 2)
INSERT [dbo].[parking_lot] ([park_id], [park_quantity], [park_name], [park_place], [park_price], [park_status], [park_area], [park_count]) VALUES (47, 20, N'Demivee', N'Tension Headache Relief', 28.0000, N'1', 300, 1)
INSERT [dbo].[parking_lot] ([park_id], [park_quantity], [park_name], [park_place], [park_price], [park_status], [park_area], [park_count]) VALUES (48, 20, N'Tazz', N'SHISEIDO ADVANCED HYDRO-LIQUID COMPACT (REFILL)', 12.0000, N'1', 300, 1)
INSERT [dbo].[parking_lot] ([park_id], [park_quantity], [park_name], [park_place], [park_price], [park_status], [park_area], [park_count]) VALUES (49, 20, N'Edgeclub', N'Zolmitriptan', 43.0000, N'1', 300, 3)
INSERT [dbo].[parking_lot] ([park_id], [park_quantity], [park_name], [park_place], [park_price], [park_status], [park_area], [park_count]) VALUES (50, 20, N'Youtags', N'METRONIDAZOLE', 42.0000, N'1', 300, 1)
INSERT [dbo].[parking_lot] ([park_id], [park_quantity], [park_name], [park_place], [park_price], [park_status], [park_area], [park_count]) VALUES (51, 20, N'Yodoo', N'Cetirizine hydrochloride', 91.0000, N'1', 300, 1)
INSERT [dbo].[parking_lot] ([park_id], [park_quantity], [park_name], [park_place], [park_price], [park_status], [park_area], [park_count]) VALUES (52, 20, N'Lajo', N'Black Walnut', 83.0000, N'1', 300, 3)
INSERT [dbo].[parking_lot] ([park_id], [park_quantity], [park_name], [park_place], [park_price], [park_status], [park_area], [park_count]) VALUES (53, 20, N'Voomm', N'Doxycycline Hyclate', 40.0000, N'1', 300, 2)
INSERT [dbo].[parking_lot] ([park_id], [park_quantity], [park_name], [park_place], [park_price], [park_status], [park_area], [park_count]) VALUES (54, 20, N'Jaxspan', N'Oxaprozin', 70.0000, N'1', 300, 0)
INSERT [dbo].[parking_lot] ([park_id], [park_quantity], [park_name], [park_place], [park_price], [park_status], [park_area], [park_count]) VALUES (55, 20, N'Dynabox', N'Granisetron Hydrochloride', 30.0000, N'1', 300, 0)
INSERT [dbo].[parking_lot] ([park_id], [park_quantity], [park_name], [park_place], [park_price], [park_status], [park_area], [park_count]) VALUES (56, 20, N'Blogtags', N'Miacalcin', 20.0000, N'1', 300, 0)
INSERT [dbo].[parking_lot] ([park_id], [park_quantity], [park_name], [park_place], [park_price], [park_status], [park_area], [park_count]) VALUES (57, 20, N'Skinix', N'Phentermine Hydrochloride', 70.0000, N'1', 300, 0)
INSERT [dbo].[parking_lot] ([park_id], [park_quantity], [park_name], [park_place], [park_price], [park_status], [park_area], [park_count]) VALUES (58, 20, N'Yamia', N'ARTEMISIA TRIDENTATA POLLEN', 10.0000, N'1', 300, 0)
INSERT [dbo].[parking_lot] ([park_id], [park_quantity], [park_name], [park_place], [park_price], [park_status], [park_area], [park_count]) VALUES (59, 20, N'Skyndu', N'CVS Tussin CF', 94.0000, N'1', 300, 0)
INSERT [dbo].[parking_lot] ([park_id], [park_quantity], [park_name], [park_place], [park_price], [park_status], [park_area], [park_count]) VALUES (60, 20, N'Topdrive', N'all day relief', 68.0000, N'1', 300, 3)
INSERT [dbo].[parking_lot] ([park_id], [park_quantity], [park_name], [park_place], [park_price], [park_status], [park_area], [park_count]) VALUES (61, 20, N'Voomm', N'Famciclovir', 30.0000, N'1', 300, 0)
INSERT [dbo].[parking_lot] ([park_id], [park_quantity], [park_name], [park_place], [park_price], [park_status], [park_area], [park_count]) VALUES (62, 20, N'Devbug', N'Pedia Relief', 50.0000, N'1', 300, 4)
INSERT [dbo].[parking_lot] ([park_id], [park_quantity], [park_name], [park_place], [park_price], [park_status], [park_area], [park_count]) VALUES (63, 20, N'Gabtune', N'Extra Strength Headache Relief', 55.0000, N'1', 300, 2)
INSERT [dbo].[parking_lot] ([park_id], [park_quantity], [park_name], [park_place], [park_price], [park_status], [park_area], [park_count]) VALUES (64, 20, N'Jaloo', N'Lactulose', 63.0000, N'1', 300, 1)
INSERT [dbo].[parking_lot] ([park_id], [park_quantity], [park_name], [park_place], [park_price], [park_status], [park_area], [park_count]) VALUES (66, 20, N'Yambee', N'Cardene I.V.', 67.0000, N'1', 300, 0)
INSERT [dbo].[parking_lot] ([park_id], [park_quantity], [park_name], [park_place], [park_price], [park_status], [park_area], [park_count]) VALUES (67, 20, N'Kamba', N'Oxaliplatin', 88.0000, N'1', 300, 1)
INSERT [dbo].[parking_lot] ([park_id], [park_quantity], [park_name], [park_place], [park_price], [park_status], [park_area], [park_count]) VALUES (68, 20, N'Devpulse', N'Cepacol', 54.0000, N'1', 300, 2)
INSERT [dbo].[parking_lot] ([park_id], [park_quantity], [park_name], [park_place], [park_price], [park_status], [park_area], [park_count]) VALUES (69, 20, N'Eamia', N'oxaliplatin', 15.0000, N'1', 300, 1)
INSERT [dbo].[parking_lot] ([park_id], [park_quantity], [park_name], [park_place], [park_price], [park_status], [park_area], [park_count]) VALUES (70, 20, N'Blogtags', N'Levetiracetam', 23.0000, N'1', 300, 0)
INSERT [dbo].[parking_lot] ([park_id], [park_quantity], [park_name], [park_place], [park_price], [park_status], [park_area], [park_count]) VALUES (71, 20, N'Nlounge', N'Bayer', 80.0000, N'1', 300, 1)
INSERT [dbo].[parking_lot] ([park_id], [park_quantity], [park_name], [park_place], [park_price], [park_status], [park_area], [park_count]) VALUES (72, 20, N'Brightbean', N'Bayer', 21.0000, N'1', 300, 0)
INSERT [dbo].[parking_lot] ([park_id], [park_quantity], [park_name], [park_place], [park_price], [park_status], [park_area], [park_count]) VALUES (73, 20, N'Vimbo', N'Meijer Baby SPF 50', 99.0000, N'1', 300, 3)
INSERT [dbo].[parking_lot] ([park_id], [park_quantity], [park_name], [park_place], [park_price], [park_status], [park_area], [park_count]) VALUES (74, 20, N'Feedmix', N'ORAP', 11.0000, N'1', 300, 1)
INSERT [dbo].[parking_lot] ([park_id], [park_quantity], [park_name], [park_place], [park_price], [park_status], [park_area], [park_count]) VALUES (75, 20, N'Tanoodle', N'Aplicare Antiseptic Hand Rinse', 74.0000, N'1', 300, 2)
INSERT [dbo].[parking_lot] ([park_id], [park_quantity], [park_name], [park_place], [park_price], [park_status], [park_area], [park_count]) VALUES (76, 20, N'Kayveo', N'Alcohol Hand Sanitizer Problend', 16.0000, N'1', 300, 1)
INSERT [dbo].[parking_lot] ([park_id], [park_quantity], [park_name], [park_place], [park_price], [park_status], [park_area], [park_count]) VALUES (77, 20, N'Abata', N'Lactated Ringers', 81.0000, N'1', 300, 3)
INSERT [dbo].[parking_lot] ([park_id], [park_quantity], [park_name], [park_place], [park_price], [park_status], [park_area], [park_count]) VALUES (78, 20, N'Browsedrive', N'Lyrica', 68.0000, N'1', 300, 3)
INSERT [dbo].[parking_lot] ([park_id], [park_quantity], [park_name], [park_place], [park_price], [park_status], [park_area], [park_count]) VALUES (79, 20, N'Jetwire', N'Cumin', 93.0000, N'1', 300, 0)
INSERT [dbo].[parking_lot] ([park_id], [park_quantity], [park_name], [park_place], [park_price], [park_status], [park_area], [park_count]) VALUES (80, 20, N'Dynabox', N'Clear Eyes Maximum Redness Relief', 29.0000, N'1', 300, 2)
INSERT [dbo].[parking_lot] ([park_id], [park_quantity], [park_name], [park_place], [park_price], [park_status], [park_area], [park_count]) VALUES (81, 20, N'Bubblemix', N'Dexamethasone', 54.0000, N'1', 300, 1)
INSERT [dbo].[parking_lot] ([park_id], [park_quantity], [park_name], [park_place], [park_price], [park_status], [park_area], [park_count]) VALUES (82, 20, N'Vipe', N'Helium Oxygen Mixture', 99.0000, N'1', 300, 1)
INSERT [dbo].[parking_lot] ([park_id], [park_quantity], [park_name], [park_place], [park_price], [park_status], [park_area], [park_count]) VALUES (83, 20, N'Jetpulse', N'Cold and Allergy', 16.0000, N'1', 300, 0)
INSERT [dbo].[parking_lot] ([park_id], [park_quantity], [park_name], [park_place], [park_price], [park_status], [park_area], [park_count]) VALUES (84, 20, N'Zoovu', N'Lovastatin', 27.0000, N'1', 300, 0)
INSERT [dbo].[parking_lot] ([park_id], [park_quantity], [park_name], [park_place], [park_price], [park_status], [park_area], [park_count]) VALUES (85, 20, N'Topdrive', N'Phenytek', 15.0000, N'1', 300, 1)
INSERT [dbo].[parking_lot] ([park_id], [park_quantity], [park_name], [park_place], [park_price], [park_status], [park_area], [park_count]) VALUES (86, 20, N'Quire', N'PRAVASTATIN SODIUM', 35.0000, N'1', 300, 0)
INSERT [dbo].[parking_lot] ([park_id], [park_quantity], [park_name], [park_place], [park_price], [park_status], [park_area], [park_count]) VALUES (87, 20, N'Rhybox', N'Penicillin V Potassium', 99.0000, N'1', 300, 1)
INSERT [dbo].[parking_lot] ([park_id], [park_quantity], [park_name], [park_place], [park_price], [park_status], [park_area], [park_count]) VALUES (88, 20, N'Photobug', N'Isopropyl Alcohol with Wintergreen', 88.0000, N'1', 300, 1)
INSERT [dbo].[parking_lot] ([park_id], [park_quantity], [park_name], [park_place], [park_price], [park_status], [park_area], [park_count]) VALUES (89, 20, N'Dabshots', N'Cyclosporine', 42.0000, N'1', 300, 2)
INSERT [dbo].[parking_lot] ([park_id], [park_quantity], [park_name], [park_place], [park_price], [park_status], [park_area], [park_count]) VALUES (91, 20, N'Photofeed', N'Levothyroxine sodium', 25.0000, N'1', 300, 1)
INSERT [dbo].[parking_lot] ([park_id], [park_quantity], [park_name], [park_place], [park_price], [park_status], [park_area], [park_count]) VALUES (92, 20, N'Teklist', N'Metoprolol Tartrate', 97.0000, N'1', 300, 2)
INSERT [dbo].[parking_lot] ([park_id], [park_quantity], [park_name], [park_place], [park_price], [park_status], [park_area], [park_count]) VALUES (93, 20, N'Wordtune', N'Amoxicillin', 50.0000, N'1', 300, 1)
INSERT [dbo].[parking_lot] ([park_id], [park_quantity], [park_name], [park_place], [park_price], [park_status], [park_area], [park_count]) VALUES (95, 20, N'Realbuzz', N'IQ Derma Essentials Life Without Wrinkles', 20.0000, N'1', 300, 0)
INSERT [dbo].[parking_lot] ([park_id], [park_quantity], [park_name], [park_place], [park_price], [park_status], [park_area], [park_count]) VALUES (96, 20, N'Agimba', N'Oxycontin', 18.0000, N'1', 300, 0)
INSERT [dbo].[parking_lot] ([park_id], [park_quantity], [park_name], [park_place], [park_price], [park_status], [park_area], [park_count]) VALUES (97, 20, N'Edgepulse', N'Levetiracetam', 43.0000, N'1', 300, 2)
INSERT [dbo].[parking_lot] ([park_id], [park_quantity], [park_name], [park_place], [park_price], [park_status], [park_area], [park_count]) VALUES (98, 20, N'Roodel', N'BF-MICOZO', 67.0000, N'1', 300, 0)
INSERT [dbo].[parking_lot] ([park_id], [park_quantity], [park_name], [park_place], [park_price], [park_status], [park_area], [park_count]) VALUES (117, 2, N'new parking', N'18 Pham Hung', 100.0000, N'1', 100, 1)
SET IDENTITY_INSERT [dbo].[parking_lot] OFF
GO
SET IDENTITY_INSERT [dbo].[ticket] ON 

INSERT [dbo].[ticket] ([ticket_id], [booking_time], [customer_name], [license_plate], [trip_id]) VALUES (1, CAST(N'22:56:00' AS Time), N'Ansell Lucien', N'0228-2129', 45)
INSERT [dbo].[ticket] ([ticket_id], [booking_time], [customer_name], [license_plate], [trip_id]) VALUES (2, CAST(N'04:01:00' AS Time), N'Raviv Eberdt', N'0363-0333', 50)
INSERT [dbo].[ticket] ([ticket_id], [booking_time], [customer_name], [license_plate], [trip_id]) VALUES (3, CAST(N'16:55:00' AS Time), N'Nanette Waterstone', N'0904-1314', 70)
INSERT [dbo].[ticket] ([ticket_id], [booking_time], [customer_name], [license_plate], [trip_id]) VALUES (4, CAST(N'14:57:00' AS Time), N'Kym Huskisson', N'10819-1080', 19)
INSERT [dbo].[ticket] ([ticket_id], [booking_time], [customer_name], [license_plate], [trip_id]) VALUES (5, CAST(N'22:43:00' AS Time), N'Marylin Langstone', N'10819-1080', 48)
INSERT [dbo].[ticket] ([ticket_id], [booking_time], [customer_name], [license_plate], [trip_id]) VALUES (6, CAST(N'18:32:00' AS Time), N'Gayla Giraldez', N'13668-148', 13)
INSERT [dbo].[ticket] ([ticket_id], [booking_time], [customer_name], [license_plate], [trip_id]) VALUES (7, CAST(N'11:16:00' AS Time), N'Lutero Alliston', N'10096-0153', 9)
INSERT [dbo].[ticket] ([ticket_id], [booking_time], [customer_name], [license_plate], [trip_id]) VALUES (8, CAST(N'15:00:00' AS Time), N'Ynes Madgewick', N'0363-0333', 32)
INSERT [dbo].[ticket] ([ticket_id], [booking_time], [customer_name], [license_plate], [trip_id]) VALUES (9, CAST(N'07:40:00' AS Time), N'Danit Pinilla', N'23155-217', 26)
INSERT [dbo].[ticket] ([ticket_id], [booking_time], [customer_name], [license_plate], [trip_id]) VALUES (10, CAST(N'17:39:00' AS Time), N'Salvatore Kerrod', N'15370-036', 21)
INSERT [dbo].[ticket] ([ticket_id], [booking_time], [customer_name], [license_plate], [trip_id]) VALUES (11, CAST(N'08:22:00' AS Time), N'Audi Tasseler', N'34645-4025', 76)
INSERT [dbo].[ticket] ([ticket_id], [booking_time], [customer_name], [license_plate], [trip_id]) VALUES (12, CAST(N'10:03:00' AS Time), N'Kingsly Huddlestone', N'36987-1477', 81)
INSERT [dbo].[ticket] ([ticket_id], [booking_time], [customer_name], [license_plate], [trip_id]) VALUES (13, CAST(N'10:47:00' AS Time), N'Wrennie Riguard', N'13985-013', 33)
INSERT [dbo].[ticket] ([ticket_id], [booking_time], [customer_name], [license_plate], [trip_id]) VALUES (15, CAST(N'22:48:00' AS Time), N'Matthiew Blinerman', N'24236-110', 71)
INSERT [dbo].[ticket] ([ticket_id], [booking_time], [customer_name], [license_plate], [trip_id]) VALUES (17, CAST(N'10:58:00' AS Time), N'Erek Comolli', N'15127-228', 95)
INSERT [dbo].[ticket] ([ticket_id], [booking_time], [customer_name], [license_plate], [trip_id]) VALUES (18, CAST(N'16:46:00' AS Time), N'Booth Gillson', N'24275-0185', 21)
INSERT [dbo].[ticket] ([ticket_id], [booking_time], [customer_name], [license_plate], [trip_id]) VALUES (19, CAST(N'12:10:00' AS Time), N'Davidde Luparti', N'60793-802', 31)
INSERT [dbo].[ticket] ([ticket_id], [booking_time], [customer_name], [license_plate], [trip_id]) VALUES (20, CAST(N'11:34:00' AS Time), N'Tresa Maxworthy', N'68788-9817', 64)
INSERT [dbo].[ticket] ([ticket_id], [booking_time], [customer_name], [license_plate], [trip_id]) VALUES (22, CAST(N'10:50:00' AS Time), N'Christiano Izakoff', N'68016-448', 11)
INSERT [dbo].[ticket] ([ticket_id], [booking_time], [customer_name], [license_plate], [trip_id]) VALUES (23, CAST(N'19:18:00' AS Time), N'Marillin Mews', N'68987-024', 91)
INSERT [dbo].[ticket] ([ticket_id], [booking_time], [customer_name], [license_plate], [trip_id]) VALUES (26, CAST(N'00:04:00' AS Time), N'Bogart Gerrets', N'68016-823', 25)
INSERT [dbo].[ticket] ([ticket_id], [booking_time], [customer_name], [license_plate], [trip_id]) VALUES (27, CAST(N'15:00:00' AS Time), N'Jackelyn Gerasch', N'66579-0065', 86)
INSERT [dbo].[ticket] ([ticket_id], [booking_time], [customer_name], [license_plate], [trip_id]) VALUES (28, CAST(N'21:57:00' AS Time), N'Eberhard Ditter', N'52099-8005', 30)
INSERT [dbo].[ticket] ([ticket_id], [booking_time], [customer_name], [license_plate], [trip_id]) VALUES (29, CAST(N'18:16:00' AS Time), N'Marten Hartless', N'53808-0772', 69)
INSERT [dbo].[ticket] ([ticket_id], [booking_time], [customer_name], [license_plate], [trip_id]) VALUES (30, CAST(N'04:22:00' AS Time), N'Elisa Moynihan', N'42472-001', 48)
INSERT [dbo].[ticket] ([ticket_id], [booking_time], [customer_name], [license_plate], [trip_id]) VALUES (31, CAST(N'23:14:00' AS Time), N'Gussie Hiskey', N'43376-230', 94)
INSERT [dbo].[ticket] ([ticket_id], [booking_time], [customer_name], [license_plate], [trip_id]) VALUES (32, CAST(N'08:10:00' AS Time), N'Bili Micka', N'55390-310', 28)
INSERT [dbo].[ticket] ([ticket_id], [booking_time], [customer_name], [license_plate], [trip_id]) VALUES (33, CAST(N'13:28:00' AS Time), N'Lavina Sollars', N'68788-6755', 76)
INSERT [dbo].[ticket] ([ticket_id], [booking_time], [customer_name], [license_plate], [trip_id]) VALUES (34, CAST(N'08:30:00' AS Time), N'Douglas Tiron', N'58668-2771', 53)
INSERT [dbo].[ticket] ([ticket_id], [booking_time], [customer_name], [license_plate], [trip_id]) VALUES (35, CAST(N'04:54:00' AS Time), N'Maryanne Apfler', N'53808-0772', 36)
INSERT [dbo].[ticket] ([ticket_id], [booking_time], [customer_name], [license_plate], [trip_id]) VALUES (36, CAST(N'01:50:00' AS Time), N'Addy Getch', N'58118-5791', 5)
INSERT [dbo].[ticket] ([ticket_id], [booking_time], [customer_name], [license_plate], [trip_id]) VALUES (37, CAST(N'16:34:00' AS Time), N'Barbra Francisco', N'54868-5189', 17)
INSERT [dbo].[ticket] ([ticket_id], [booking_time], [customer_name], [license_plate], [trip_id]) VALUES (38, CAST(N'03:13:00' AS Time), N'Elli Nehlsen', N'54838-514', 47)
INSERT [dbo].[ticket] ([ticket_id], [booking_time], [customer_name], [license_plate], [trip_id]) VALUES (40, CAST(N'02:22:00' AS Time), N'Basia Escalero', N'0781-3239', 83)
INSERT [dbo].[ticket] ([ticket_id], [booking_time], [customer_name], [license_plate], [trip_id]) VALUES (42, CAST(N'16:42:00' AS Time), N'Hyman Clyant', N'53208-530', 49)
INSERT [dbo].[ticket] ([ticket_id], [booking_time], [customer_name], [license_plate], [trip_id]) VALUES (43, CAST(N'18:39:00' AS Time), N'Burk Douris', N'54868-5189', 16)
INSERT [dbo].[ticket] ([ticket_id], [booking_time], [customer_name], [license_plate], [trip_id]) VALUES (45, CAST(N'11:39:00' AS Time), N'Friedrick Forshaw', N'43063-327', 71)
INSERT [dbo].[ticket] ([ticket_id], [booking_time], [customer_name], [license_plate], [trip_id]) VALUES (46, CAST(N'16:48:00' AS Time), N'Titos Isaksen', N'51442-547', 21)
INSERT [dbo].[ticket] ([ticket_id], [booking_time], [customer_name], [license_plate], [trip_id]) VALUES (47, CAST(N'07:13:00' AS Time), N'Jeremias Sempill', N'54868-5189', 22)
INSERT [dbo].[ticket] ([ticket_id], [booking_time], [customer_name], [license_plate], [trip_id]) VALUES (48, CAST(N'22:03:00' AS Time), N'Jackelyn Pengilly', N'58668-2771', 15)
INSERT [dbo].[ticket] ([ticket_id], [booking_time], [customer_name], [license_plate], [trip_id]) VALUES (49, CAST(N'18:37:00' AS Time), N'Cleon Mathews', N'68788-6755', 65)
INSERT [dbo].[ticket] ([ticket_id], [booking_time], [customer_name], [license_plate], [trip_id]) VALUES (50, CAST(N'19:56:00' AS Time), N'Gabriel Ben', N'68016-448', 54)
SET IDENTITY_INSERT [dbo].[ticket] OFF
GO
SET IDENTITY_INSERT [dbo].[trip] ON 

INSERT [dbo].[trip] ([trip_id], [booked_ticket_number], [car_type], [departure_date], [departure_time], [destination], [driver], [maximum_online_ticket_number]) VALUES (1, 0, N'Cadillac', CAST(N'2022-04-07' AS Date), CAST(N'22:52:00' AS Time), N'622 8th Plaza', N'Zolaa', 20)
INSERT [dbo].[trip] ([trip_id], [booked_ticket_number], [car_type], [departure_date], [departure_time], [destination], [driver], [maximum_online_ticket_number]) VALUES (2, 0, N'Hyundai', CAST(N'2022-04-07' AS Date), CAST(N'05:11:00' AS Time), N'91734 Banding Avenue', N'Griffy', 20)
INSERT [dbo].[trip] ([trip_id], [booked_ticket_number], [car_type], [departure_date], [departure_time], [destination], [driver], [maximum_online_ticket_number]) VALUES (3, 0, N'Toyota', CAST(N'2022-09-22' AS Date), CAST(N'04:59:00' AS Time), N'0 Old Shore Junction', N'Park', 20)
INSERT [dbo].[trip] ([trip_id], [booked_ticket_number], [car_type], [departure_date], [departure_time], [destination], [driver], [maximum_online_ticket_number]) VALUES (4, 0, N'Mazda', CAST(N'2022-05-30' AS Date), CAST(N'22:52:00' AS Time), N'41 Chinook Court', N'Juanita', 20)
INSERT [dbo].[trip] ([trip_id], [booked_ticket_number], [car_type], [departure_date], [departure_time], [destination], [driver], [maximum_online_ticket_number]) VALUES (5, 1, N'Mitsubishi', CAST(N'2022-10-17' AS Date), CAST(N'18:56:00' AS Time), N'62420 Lakeland Terrace', N'Gustav', 20)
INSERT [dbo].[trip] ([trip_id], [booked_ticket_number], [car_type], [departure_date], [departure_time], [destination], [driver], [maximum_online_ticket_number]) VALUES (6, 0, N'Nissan', CAST(N'2022-04-21' AS Date), CAST(N'06:26:00' AS Time), N'060 Drewry Park', N'Althea', 20)
INSERT [dbo].[trip] ([trip_id], [booked_ticket_number], [car_type], [departure_date], [departure_time], [destination], [driver], [maximum_online_ticket_number]) VALUES (7, 0, N'Chevrolet', CAST(N'2022-09-24' AS Date), CAST(N'10:38:00' AS Time), N'111 7th Crossing', N'Romaa', 20)
INSERT [dbo].[trip] ([trip_id], [booked_ticket_number], [car_type], [departure_date], [departure_time], [destination], [driver], [maximum_online_ticket_number]) VALUES (8, 0, N'BMW', CAST(N'2022-04-17' AS Date), CAST(N'04:30:00' AS Time), N'3193 2nd Parkway', N'Heda', 20)
INSERT [dbo].[trip] ([trip_id], [booked_ticket_number], [car_type], [departure_date], [departure_time], [destination], [driver], [maximum_online_ticket_number]) VALUES (9, 1, N'Toyota', CAST(N'2021-12-25' AS Date), CAST(N'03:35:00' AS Time), N'996 Di Loreto Avenue', N'Rowena', 20)
INSERT [dbo].[trip] ([trip_id], [booked_ticket_number], [car_type], [departure_date], [departure_time], [destination], [driver], [maximum_online_ticket_number]) VALUES (10, 0, N'Audi', CAST(N'2022-04-07' AS Date), CAST(N'15:06:00' AS Time), N'36 Schlimgen Drive', N'Traver', 20)
INSERT [dbo].[trip] ([trip_id], [booked_ticket_number], [car_type], [departure_date], [departure_time], [destination], [driver], [maximum_online_ticket_number]) VALUES (11, 1, N'Audi', CAST(N'2021-12-25' AS Date), CAST(N'07:29:00' AS Time), N'82843 Center Alley', N'Raff', 20)
INSERT [dbo].[trip] ([trip_id], [booked_ticket_number], [car_type], [departure_date], [departure_time], [destination], [driver], [maximum_online_ticket_number]) VALUES (12, 0, N'Hyundai', CAST(N'2022-11-14' AS Date), CAST(N'16:17:00' AS Time), N'6051 Kropf Point', N'Dixie', 20)
INSERT [dbo].[trip] ([trip_id], [booked_ticket_number], [car_type], [departure_date], [departure_time], [destination], [driver], [maximum_online_ticket_number]) VALUES (13, 1, N'Audi', CAST(N'2022-12-08' AS Date), CAST(N'21:16:00' AS Time), N'41618 Lukken Park', N'Paolina', 20)
INSERT [dbo].[trip] ([trip_id], [booked_ticket_number], [car_type], [departure_date], [departure_time], [destination], [driver], [maximum_online_ticket_number]) VALUES (14, 0, N'Pontiac', CAST(N'2022-02-08' AS Date), CAST(N'15:59:00' AS Time), N'54317 Eagan Parkway', N'Flora', 20)
INSERT [dbo].[trip] ([trip_id], [booked_ticket_number], [car_type], [departure_date], [departure_time], [destination], [driver], [maximum_online_ticket_number]) VALUES (15, 1, N'Chevrolet', CAST(N'2022-08-09' AS Date), CAST(N'03:32:00' AS Time), N'43827 Pearson Alley', N'Lissa', 20)
INSERT [dbo].[trip] ([trip_id], [booked_ticket_number], [car_type], [departure_date], [departure_time], [destination], [driver], [maximum_online_ticket_number]) VALUES (16, 1, N'Mercedes-Benz', CAST(N'2022-09-12' AS Date), CAST(N'10:57:00' AS Time), N'3959 Tennessee Hill', N'Olia', 20)
INSERT [dbo].[trip] ([trip_id], [booked_ticket_number], [car_type], [departure_date], [departure_time], [destination], [driver], [maximum_online_ticket_number]) VALUES (17, 1, N'Honda', CAST(N'2021-12-07' AS Date), CAST(N'03:14:00' AS Time), N'7253 Packers Road', N'Etti', 20)
INSERT [dbo].[trip] ([trip_id], [booked_ticket_number], [car_type], [departure_date], [departure_time], [destination], [driver], [maximum_online_ticket_number]) VALUES (18, 0, N'GMC', CAST(N'2022-04-07' AS Date), CAST(N'16:37:00' AS Time), N'01110 Westport Place', N'West', 20)
INSERT [dbo].[trip] ([trip_id], [booked_ticket_number], [car_type], [departure_date], [departure_time], [destination], [driver], [maximum_online_ticket_number]) VALUES (19, 1, N'Mazda', CAST(N'2022-07-10' AS Date), CAST(N'22:44:00' AS Time), N'914 Fieldstone Terrace', N'Ruben', 20)
INSERT [dbo].[trip] ([trip_id], [booked_ticket_number], [car_type], [departure_date], [departure_time], [destination], [driver], [maximum_online_ticket_number]) VALUES (20, 0, N'Toyota', CAST(N'2022-10-30' AS Date), CAST(N'03:38:00' AS Time), N'2972 Waywood Alley', N'Ingemar', 20)
INSERT [dbo].[trip] ([trip_id], [booked_ticket_number], [car_type], [departure_date], [departure_time], [destination], [driver], [maximum_online_ticket_number]) VALUES (21, 3, N'Chevrolet', CAST(N'2022-01-04' AS Date), CAST(N'14:59:00' AS Time), N'04 Karstens Place', N'Juliann', 20)
INSERT [dbo].[trip] ([trip_id], [booked_ticket_number], [car_type], [departure_date], [departure_time], [destination], [driver], [maximum_online_ticket_number]) VALUES (22, 1, N'Mercury', CAST(N'2022-11-28' AS Date), CAST(N'19:42:00' AS Time), N'29015 Corben Circle', N'Angelique', 20)
INSERT [dbo].[trip] ([trip_id], [booked_ticket_number], [car_type], [departure_date], [departure_time], [destination], [driver], [maximum_online_ticket_number]) VALUES (23, 0, N'Toyota', CAST(N'2022-05-05' AS Date), CAST(N'07:03:00' AS Time), N'178 Red Cloud Terrace', N'Luciano', 20)
INSERT [dbo].[trip] ([trip_id], [booked_ticket_number], [car_type], [departure_date], [departure_time], [destination], [driver], [maximum_online_ticket_number]) VALUES (24, 0, N'Mitsubishi', CAST(N'2022-03-22' AS Date), CAST(N'03:05:00' AS Time), N'480 Banding Terrace', N'Drona', 20)
INSERT [dbo].[trip] ([trip_id], [booked_ticket_number], [car_type], [departure_date], [departure_time], [destination], [driver], [maximum_online_ticket_number]) VALUES (25, 1, N'Bentley', CAST(N'2022-01-01' AS Date), CAST(N'13:32:00' AS Time), N'274 Westend Avenue', N'Wallas', 20)
INSERT [dbo].[trip] ([trip_id], [booked_ticket_number], [car_type], [departure_date], [departure_time], [destination], [driver], [maximum_online_ticket_number]) VALUES (26, 1, N'Mitsubishi', CAST(N'2022-04-27' AS Date), CAST(N'05:43:00' AS Time), N'1 Pierstorff Terrace', N'Caryl', 20)
INSERT [dbo].[trip] ([trip_id], [booked_ticket_number], [car_type], [departure_date], [departure_time], [destination], [driver], [maximum_online_ticket_number]) VALUES (27, 0, N'Pontiac', CAST(N'2022-03-30' AS Date), CAST(N'23:38:00' AS Time), N'3 Fieldstone Circle', N'Calv', 20)
INSERT [dbo].[trip] ([trip_id], [booked_ticket_number], [car_type], [departure_date], [departure_time], [destination], [driver], [maximum_online_ticket_number]) VALUES (28, 1, N'Pontiac', CAST(N'2022-12-08' AS Date), CAST(N'23:40:00' AS Time), N'94 Rusk Point', N'Perkin', 20)
INSERT [dbo].[trip] ([trip_id], [booked_ticket_number], [car_type], [departure_date], [departure_time], [destination], [driver], [maximum_online_ticket_number]) VALUES (29, 0, N'Spyker', CAST(N'2022-08-10' AS Date), CAST(N'14:05:00' AS Time), N'6 Mccormick Way', N'Ingaborg', 20)
INSERT [dbo].[trip] ([trip_id], [booked_ticket_number], [car_type], [departure_date], [departure_time], [destination], [driver], [maximum_online_ticket_number]) VALUES (30, 1, N'Suzuki', CAST(N'2022-11-24' AS Date), CAST(N'13:35:00' AS Time), N'97 8th Crossing', N'Derwin', 20)
INSERT [dbo].[trip] ([trip_id], [booked_ticket_number], [car_type], [departure_date], [departure_time], [destination], [driver], [maximum_online_ticket_number]) VALUES (31, 1, N'Ford', CAST(N'2022-09-24' AS Date), CAST(N'01:50:00' AS Time), N'690 Muir Hill', N'Standford', 20)
INSERT [dbo].[trip] ([trip_id], [booked_ticket_number], [car_type], [departure_date], [departure_time], [destination], [driver], [maximum_online_ticket_number]) VALUES (32, 1, N'Chevrolet', CAST(N'2022-09-02' AS Date), CAST(N'01:42:00' AS Time), N'11 Dryden Circle', N'Cristin', 20)
INSERT [dbo].[trip] ([trip_id], [booked_ticket_number], [car_type], [departure_date], [departure_time], [destination], [driver], [maximum_online_ticket_number]) VALUES (33, 1, N'Pontiac', CAST(N'2022-07-01' AS Date), CAST(N'02:05:00' AS Time), N'2 Springs Junction', N'Lauren', 20)
INSERT [dbo].[trip] ([trip_id], [booked_ticket_number], [car_type], [departure_date], [departure_time], [destination], [driver], [maximum_online_ticket_number]) VALUES (34, 0, N'Scion', CAST(N'2022-03-17' AS Date), CAST(N'07:51:00' AS Time), N'29040 Sunbrook Circle', N'Odelinda', 20)
INSERT [dbo].[trip] ([trip_id], [booked_ticket_number], [car_type], [departure_date], [departure_time], [destination], [driver], [maximum_online_ticket_number]) VALUES (35, 1, N'Cadillac', CAST(N'2022-07-31' AS Date), CAST(N'12:26:00' AS Time), N'828 Hayes Alley', N'Caritta', 20)
INSERT [dbo].[trip] ([trip_id], [booked_ticket_number], [car_type], [departure_date], [departure_time], [destination], [driver], [maximum_online_ticket_number]) VALUES (36, 1, N'Chevrolet', CAST(N'2021-12-10' AS Date), CAST(N'11:53:00' AS Time), N'40129 Lindbergh Point', N'Jaymee', 20)
INSERT [dbo].[trip] ([trip_id], [booked_ticket_number], [car_type], [departure_date], [departure_time], [destination], [driver], [maximum_online_ticket_number]) VALUES (37, 0, N'Dodge', CAST(N'2022-04-28' AS Date), CAST(N'11:58:00' AS Time), N'9597 Monument Terrace', N'Gaston', 20)
INSERT [dbo].[trip] ([trip_id], [booked_ticket_number], [car_type], [departure_date], [departure_time], [destination], [driver], [maximum_online_ticket_number]) VALUES (38, 0, N'Suzuki', CAST(N'2021-12-27' AS Date), CAST(N'23:16:00' AS Time), N'4762 Lake View Plaza', N'Sharla', 20)
INSERT [dbo].[trip] ([trip_id], [booked_ticket_number], [car_type], [departure_date], [departure_time], [destination], [driver], [maximum_online_ticket_number]) VALUES (39, 0, N'Volkswagen', CAST(N'2022-10-14' AS Date), CAST(N'19:26:00' AS Time), N'369 Rigney Junction', N'Ham', 20)
INSERT [dbo].[trip] ([trip_id], [booked_ticket_number], [car_type], [departure_date], [departure_time], [destination], [driver], [maximum_online_ticket_number]) VALUES (40, 0, N'Dodge', CAST(N'2021-12-28' AS Date), CAST(N'02:46:00' AS Time), N'954 Tomscot Court', N'Corabella', 20)
INSERT [dbo].[trip] ([trip_id], [booked_ticket_number], [car_type], [departure_date], [departure_time], [destination], [driver], [maximum_online_ticket_number]) VALUES (41, 0, N'Mercedes-Benz', CAST(N'2022-03-26' AS Date), CAST(N'05:11:00' AS Time), N'52416 Summerview Trail', N'Kerk', 20)
INSERT [dbo].[trip] ([trip_id], [booked_ticket_number], [car_type], [departure_date], [departure_time], [destination], [driver], [maximum_online_ticket_number]) VALUES (42, 0, N'Subaru', CAST(N'2022-01-18' AS Date), CAST(N'15:36:00' AS Time), N'7034 Moose Park', N'Lily', 20)
INSERT [dbo].[trip] ([trip_id], [booked_ticket_number], [car_type], [departure_date], [departure_time], [destination], [driver], [maximum_online_ticket_number]) VALUES (43, 0, N'Mercedes-Benz', CAST(N'2022-02-18' AS Date), CAST(N'09:01:00' AS Time), N'90 Rigney Pass', N'Audrie', 20)
INSERT [dbo].[trip] ([trip_id], [booked_ticket_number], [car_type], [departure_date], [departure_time], [destination], [driver], [maximum_online_ticket_number]) VALUES (44, 0, N'Nissan', CAST(N'2022-12-08' AS Date), CAST(N'21:25:00' AS Time), N'2 1st Drive', N'Chloris', 20)
INSERT [dbo].[trip] ([trip_id], [booked_ticket_number], [car_type], [departure_date], [departure_time], [destination], [driver], [maximum_online_ticket_number]) VALUES (45, 1, N'Hyundai', CAST(N'2022-03-09' AS Date), CAST(N'09:14:00' AS Time), N'8924 Troy Court', N'Delmor', 20)
INSERT [dbo].[trip] ([trip_id], [booked_ticket_number], [car_type], [departure_date], [departure_time], [destination], [driver], [maximum_online_ticket_number]) VALUES (46, 0, N'Chevrolet', CAST(N'2021-11-30' AS Date), CAST(N'18:54:00' AS Time), N'75 East Plaza', N'Amabel', 20)
INSERT [dbo].[trip] ([trip_id], [booked_ticket_number], [car_type], [departure_date], [departure_time], [destination], [driver], [maximum_online_ticket_number]) VALUES (47, 1, N'Suzuki', CAST(N'2022-11-10' AS Date), CAST(N'04:28:00' AS Time), N'0809 Buell Park', N'Shae', 20)
INSERT [dbo].[trip] ([trip_id], [booked_ticket_number], [car_type], [departure_date], [departure_time], [destination], [driver], [maximum_online_ticket_number]) VALUES (48, 2, N'Austin', CAST(N'2022-02-14' AS Date), CAST(N'09:05:00' AS Time), N'0 Blackbird Lane', N'Deerdre', 20)
INSERT [dbo].[trip] ([trip_id], [booked_ticket_number], [car_type], [departure_date], [departure_time], [destination], [driver], [maximum_online_ticket_number]) VALUES (49, 1, N'Dodge', CAST(N'2022-09-05' AS Date), CAST(N'13:19:00' AS Time), N'9 Twin Pines Avenue', N'Weston', 20)
INSERT [dbo].[trip] ([trip_id], [booked_ticket_number], [car_type], [departure_date], [departure_time], [destination], [driver], [maximum_online_ticket_number]) VALUES (50, 1, N'Oldsmobile', CAST(N'2022-01-24' AS Date), CAST(N'22:20:00' AS Time), N'3047 Reinke Center', N'Alberto', 20)
INSERT [dbo].[trip] ([trip_id], [booked_ticket_number], [car_type], [departure_date], [departure_time], [destination], [driver], [maximum_online_ticket_number]) VALUES (51, 0, N'Ford', CAST(N'2021-12-17' AS Date), CAST(N'21:35:00' AS Time), N'70109 Petterle Hill', N'Gav', 20)
INSERT [dbo].[trip] ([trip_id], [booked_ticket_number], [car_type], [departure_date], [departure_time], [destination], [driver], [maximum_online_ticket_number]) VALUES (52, 0, N'Volvo', CAST(N'2022-11-01' AS Date), CAST(N'09:52:00' AS Time), N'4 David Hill', N'Cari', 20)
INSERT [dbo].[trip] ([trip_id], [booked_ticket_number], [car_type], [departure_date], [departure_time], [destination], [driver], [maximum_online_ticket_number]) VALUES (53, 2, N'Porsche', CAST(N'2022-06-14' AS Date), CAST(N'14:45:00' AS Time), N'327 Sherman Plaza', N'Ruthy', 20)
INSERT [dbo].[trip] ([trip_id], [booked_ticket_number], [car_type], [departure_date], [departure_time], [destination], [driver], [maximum_online_ticket_number]) VALUES (54, 1, N'Mercedes-Benz', CAST(N'2022-09-27' AS Date), CAST(N'01:31:00' AS Time), N'74 Killdeer Trail', N'Sofie', 20)
INSERT [dbo].[trip] ([trip_id], [booked_ticket_number], [car_type], [departure_date], [departure_time], [destination], [driver], [maximum_online_ticket_number]) VALUES (55, 0, N'Pontiac', CAST(N'2022-09-10' AS Date), CAST(N'17:41:00' AS Time), N'4 Rockefeller Place', N'Fina', 20)
INSERT [dbo].[trip] ([trip_id], [booked_ticket_number], [car_type], [departure_date], [departure_time], [destination], [driver], [maximum_online_ticket_number]) VALUES (56, 0, N'Mitsubishi', CAST(N'2022-03-04' AS Date), CAST(N'08:52:00' AS Time), N'57299 Cherokee Place', N'Vladamir', 20)
INSERT [dbo].[trip] ([trip_id], [booked_ticket_number], [car_type], [departure_date], [departure_time], [destination], [driver], [maximum_online_ticket_number]) VALUES (57, 0, N'Subaru', CAST(N'2022-07-28' AS Date), CAST(N'06:44:00' AS Time), N'10 Hallows Lane', N'Amelia', 20)
INSERT [dbo].[trip] ([trip_id], [booked_ticket_number], [car_type], [departure_date], [departure_time], [destination], [driver], [maximum_online_ticket_number]) VALUES (58, 0, N'Plymouth', CAST(N'2022-08-13' AS Date), CAST(N'19:19:00' AS Time), N'45495 Milwaukee Plaza', N'Jaquelin', 20)
INSERT [dbo].[trip] ([trip_id], [booked_ticket_number], [car_type], [departure_date], [departure_time], [destination], [driver], [maximum_online_ticket_number]) VALUES (59, 0, N'Honda', CAST(N'2022-12-08' AS Date), CAST(N'14:36:00' AS Time), N'9 Monterey Alley', N'Temple', 20)
INSERT [dbo].[trip] ([trip_id], [booked_ticket_number], [car_type], [departure_date], [departure_time], [destination], [driver], [maximum_online_ticket_number]) VALUES (60, 0, N'Ford', CAST(N'2022-10-14' AS Date), CAST(N'01:16:00' AS Time), N'0 Hoepker Pass', N'Irving', 20)
INSERT [dbo].[trip] ([trip_id], [booked_ticket_number], [car_type], [departure_date], [departure_time], [destination], [driver], [maximum_online_ticket_number]) VALUES (61, 0, N'Buick', CAST(N'2022-01-15' AS Date), CAST(N'20:45:00' AS Time), N'4 Coolidge Circle', N'Adria', 20)
INSERT [dbo].[trip] ([trip_id], [booked_ticket_number], [car_type], [departure_date], [departure_time], [destination], [driver], [maximum_online_ticket_number]) VALUES (62, 0, N'Pontiac', CAST(N'2022-03-04' AS Date), CAST(N'17:52:00' AS Time), N'37 Nova Plaza', N'David', 20)
INSERT [dbo].[trip] ([trip_id], [booked_ticket_number], [car_type], [departure_date], [departure_time], [destination], [driver], [maximum_online_ticket_number]) VALUES (63, 0, N'Chevrolet', CAST(N'2022-11-26' AS Date), CAST(N'02:37:00' AS Time), N'4 Namekagon Plaza', N'Ransell', 20)
INSERT [dbo].[trip] ([trip_id], [booked_ticket_number], [car_type], [departure_date], [departure_time], [destination], [driver], [maximum_online_ticket_number]) VALUES (64, 1, N'Dodge', CAST(N'2021-12-14' AS Date), CAST(N'18:02:00' AS Time), N'1550 1st Pass', N'Wallis', 20)
INSERT [dbo].[trip] ([trip_id], [booked_ticket_number], [car_type], [departure_date], [departure_time], [destination], [driver], [maximum_online_ticket_number]) VALUES (65, 1, N'Chevrolet', CAST(N'2022-01-29' AS Date), CAST(N'11:55:00' AS Time), N'9823 Hooker Parkway', N'Glen', 20)
INSERT [dbo].[trip] ([trip_id], [booked_ticket_number], [car_type], [departure_date], [departure_time], [destination], [driver], [maximum_online_ticket_number]) VALUES (66, 0, N'Dodge', CAST(N'2022-06-13' AS Date), CAST(N'02:37:00' AS Time), N'83075 Forest Run Road', N'Ario', 20)
INSERT [dbo].[trip] ([trip_id], [booked_ticket_number], [car_type], [departure_date], [departure_time], [destination], [driver], [maximum_online_ticket_number]) VALUES (67, 0, N'Chevrolet', CAST(N'2022-04-29' AS Date), CAST(N'05:45:00' AS Time), N'5627 Melody Place', N'Mitchel', 20)
INSERT [dbo].[trip] ([trip_id], [booked_ticket_number], [car_type], [departure_date], [departure_time], [destination], [driver], [maximum_online_ticket_number]) VALUES (68, 0, N'Nissan', CAST(N'2022-02-02' AS Date), CAST(N'08:03:00' AS Time), N'82 Delladonna Crossing', N'Molli', 20)
INSERT [dbo].[trip] ([trip_id], [booked_ticket_number], [car_type], [departure_date], [departure_time], [destination], [driver], [maximum_online_ticket_number]) VALUES (69, 1, N'BMW', CAST(N'2022-06-07' AS Date), CAST(N'02:50:00' AS Time), N'2277 Park Meadow Place', N'Brita', 20)
INSERT [dbo].[trip] ([trip_id], [booked_ticket_number], [car_type], [departure_date], [departure_time], [destination], [driver], [maximum_online_ticket_number]) VALUES (70, 1, N'Hyundai', CAST(N'2022-03-09' AS Date), CAST(N'02:07:00' AS Time), N'4 Northwestern Road', N'Ddene', 20)
INSERT [dbo].[trip] ([trip_id], [booked_ticket_number], [car_type], [departure_date], [departure_time], [destination], [driver], [maximum_online_ticket_number]) VALUES (71, 2, N'Suzuki', CAST(N'2022-12-08' AS Date), CAST(N'05:32:00' AS Time), N'61115 Emmet Center', N'Regina', 20)
INSERT [dbo].[trip] ([trip_id], [booked_ticket_number], [car_type], [departure_date], [departure_time], [destination], [driver], [maximum_online_ticket_number]) VALUES (72, 0, N'Ford', CAST(N'2022-03-27' AS Date), CAST(N'06:44:00' AS Time), N'10 Bashford Way', N'Leanor', 20)
INSERT [dbo].[trip] ([trip_id], [booked_ticket_number], [car_type], [departure_date], [departure_time], [destination], [driver], [maximum_online_ticket_number]) VALUES (73, 0, N'Audi', CAST(N'2022-04-11' AS Date), CAST(N'00:50:00' AS Time), N'19184 Logan Crossing', N'Oralie', 20)
INSERT [dbo].[trip] ([trip_id], [booked_ticket_number], [car_type], [departure_date], [departure_time], [destination], [driver], [maximum_online_ticket_number]) VALUES (74, 0, N'Hyundai', CAST(N'2022-07-20' AS Date), CAST(N'22:09:00' AS Time), N'341 Lakewood Parkway', N'Mal', 20)
INSERT [dbo].[trip] ([trip_id], [booked_ticket_number], [car_type], [departure_date], [departure_time], [destination], [driver], [maximum_online_ticket_number]) VALUES (75, 0, N'Porsche', CAST(N'2022-05-24' AS Date), CAST(N'14:35:00' AS Time), N'04 Cascade Plaza', N'Harbert', 20)
INSERT [dbo].[trip] ([trip_id], [booked_ticket_number], [car_type], [departure_date], [departure_time], [destination], [driver], [maximum_online_ticket_number]) VALUES (76, 2, N'Honda', CAST(N'2022-07-24' AS Date), CAST(N'18:18:00' AS Time), N'71513 Shopko Drive', N'Alleen', 20)
INSERT [dbo].[trip] ([trip_id], [booked_ticket_number], [car_type], [departure_date], [departure_time], [destination], [driver], [maximum_online_ticket_number]) VALUES (77, 0, N'Kia', CAST(N'2022-04-27' AS Date), CAST(N'01:40:00' AS Time), N'0 East Crossing', N'Skip', 20)
INSERT [dbo].[trip] ([trip_id], [booked_ticket_number], [car_type], [departure_date], [departure_time], [destination], [driver], [maximum_online_ticket_number]) VALUES (78, 0, N'Nissan', CAST(N'2022-10-04' AS Date), CAST(N'17:24:00' AS Time), N'33782 Grover Alley', N'Eddy', 20)
INSERT [dbo].[trip] ([trip_id], [booked_ticket_number], [car_type], [departure_date], [departure_time], [destination], [driver], [maximum_online_ticket_number]) VALUES (79, 0, N'Lexus', CAST(N'2022-01-17' AS Date), CAST(N'13:38:00' AS Time), N'77725 Kenwood Street', N'Ketty', 20)
INSERT [dbo].[trip] ([trip_id], [booked_ticket_number], [car_type], [departure_date], [departure_time], [destination], [driver], [maximum_online_ticket_number]) VALUES (80, 0, N'Chevrolet', CAST(N'2022-10-14' AS Date), CAST(N'22:08:00' AS Time), N'10444 Melrose Circle', N'Terrel', 20)
INSERT [dbo].[trip] ([trip_id], [booked_ticket_number], [car_type], [departure_date], [departure_time], [destination], [driver], [maximum_online_ticket_number]) VALUES (81, 1, N'Volvo', CAST(N'2022-11-09' AS Date), CAST(N'15:30:00' AS Time), N'48 Mockingbird Center', N'Eleonora', 20)
INSERT [dbo].[trip] ([trip_id], [booked_ticket_number], [car_type], [departure_date], [departure_time], [destination], [driver], [maximum_online_ticket_number]) VALUES (82, 0, N'Porsche', CAST(N'2022-02-14' AS Date), CAST(N'14:23:00' AS Time), N'91824 Loeprich Park', N'Margalo', 20)
INSERT [dbo].[trip] ([trip_id], [booked_ticket_number], [car_type], [departure_date], [departure_time], [destination], [driver], [maximum_online_ticket_number]) VALUES (83, 1, N'Mercedes-Benz', CAST(N'2022-06-21' AS Date), CAST(N'18:30:00' AS Time), N'47 Reinke Junction', N'Trula', 20)
INSERT [dbo].[trip] ([trip_id], [booked_ticket_number], [car_type], [departure_date], [departure_time], [destination], [driver], [maximum_online_ticket_number]) VALUES (84, 0, N'Tesla', CAST(N'2022-01-07' AS Date), CAST(N'21:23:00' AS Time), N'84011 Del Mar Road', N'Timothy', 20)
INSERT [dbo].[trip] ([trip_id], [booked_ticket_number], [car_type], [departure_date], [departure_time], [destination], [driver], [maximum_online_ticket_number]) VALUES (85, 0, N'Mercury', CAST(N'2022-02-05' AS Date), CAST(N'19:51:00' AS Time), N'8164 Old Gate Center', N'Grata', 20)
INSERT [dbo].[trip] ([trip_id], [booked_ticket_number], [car_type], [departure_date], [departure_time], [destination], [driver], [maximum_online_ticket_number]) VALUES (86, 1, N'Dodge', CAST(N'2021-12-14' AS Date), CAST(N'18:13:00' AS Time), N'44 2nd Road', N'Isahella', 20)
INSERT [dbo].[trip] ([trip_id], [booked_ticket_number], [car_type], [departure_date], [departure_time], [destination], [driver], [maximum_online_ticket_number]) VALUES (87, 0, N'Toyota', CAST(N'2022-11-25' AS Date), CAST(N'02:13:00' AS Time), N'3 Crest Line Parkway', N'Budd', 20)
INSERT [dbo].[trip] ([trip_id], [booked_ticket_number], [car_type], [departure_date], [departure_time], [destination], [driver], [maximum_online_ticket_number]) VALUES (88, 0, N'Ford', CAST(N'2022-11-29' AS Date), CAST(N'14:22:00' AS Time), N'05 Buena Vista Point', N'Carleton', 20)
INSERT [dbo].[trip] ([trip_id], [booked_ticket_number], [car_type], [departure_date], [departure_time], [destination], [driver], [maximum_online_ticket_number]) VALUES (89, 0, N'Nissan', CAST(N'2022-12-08' AS Date), CAST(N'12:09:00' AS Time), N'12 Everett Road', N'Jesse', 20)
INSERT [dbo].[trip] ([trip_id], [booked_ticket_number], [car_type], [departure_date], [departure_time], [destination], [driver], [maximum_online_ticket_number]) VALUES (90, 0, N'Ford', CAST(N'2022-01-07' AS Date), CAST(N'19:48:00' AS Time), N'20952 Eagan Circle', N'Alexandr', 20)
INSERT [dbo].[trip] ([trip_id], [booked_ticket_number], [car_type], [departure_date], [departure_time], [destination], [driver], [maximum_online_ticket_number]) VALUES (91, 1, N'Volkswagen', CAST(N'2022-05-18' AS Date), CAST(N'13:52:00' AS Time), N'928 Karstens Plaza', N'Erick', 20)
INSERT [dbo].[trip] ([trip_id], [booked_ticket_number], [car_type], [departure_date], [departure_time], [destination], [driver], [maximum_online_ticket_number]) VALUES (92, 0, N'Ford', CAST(N'2022-12-08' AS Date), CAST(N'12:18:00' AS Time), N'052 Moulton Center', N'Myrle', 20)
INSERT [dbo].[trip] ([trip_id], [booked_ticket_number], [car_type], [departure_date], [departure_time], [destination], [driver], [maximum_online_ticket_number]) VALUES (93, 0, N'Lexus', CAST(N'2022-09-05' AS Date), CAST(N'09:04:00' AS Time), N'52114 Anhalt Terrace', N'De witt', 20)
INSERT [dbo].[trip] ([trip_id], [booked_ticket_number], [car_type], [departure_date], [departure_time], [destination], [driver], [maximum_online_ticket_number]) VALUES (94, 1, N'Kia', CAST(N'2022-06-01' AS Date), CAST(N'23:14:00' AS Time), N'95990 Roxbury Court', N'Raviv', 20)
INSERT [dbo].[trip] ([trip_id], [booked_ticket_number], [car_type], [departure_date], [departure_time], [destination], [driver], [maximum_online_ticket_number]) VALUES (95, 1, N'Acura', CAST(N'2022-06-17' AS Date), CAST(N'19:47:00' AS Time), N'50 Springview Avenue', N'Nady', 20)
INSERT [dbo].[trip] ([trip_id], [booked_ticket_number], [car_type], [departure_date], [departure_time], [destination], [driver], [maximum_online_ticket_number]) VALUES (96, 0, N'Buick', CAST(N'2022-02-17' AS Date), CAST(N'21:27:00' AS Time), N'95931 Rieder Terrace', N'Sofie', 20)
INSERT [dbo].[trip] ([trip_id], [booked_ticket_number], [car_type], [departure_date], [departure_time], [destination], [driver], [maximum_online_ticket_number]) VALUES (97, 0, N'Dodge', CAST(N'2022-05-06' AS Date), CAST(N'01:21:00' AS Time), N'299 Shasta Terrace', N'Erasmus', 20)
INSERT [dbo].[trip] ([trip_id], [booked_ticket_number], [car_type], [departure_date], [departure_time], [destination], [driver], [maximum_online_ticket_number]) VALUES (98, 0, N'GMC', CAST(N'2022-12-08' AS Date), CAST(N'00:25:00' AS Time), N'7 Elmside Pass', N'Clayborne', 20)
INSERT [dbo].[trip] ([trip_id], [booked_ticket_number], [car_type], [departure_date], [departure_time], [destination], [driver], [maximum_online_ticket_number]) VALUES (99, 0, N'Mazda', CAST(N'2022-01-08' AS Date), CAST(N'20:14:00' AS Time), N'1 Monterey Avenue', N'Matthias', 20)
GO
INSERT [dbo].[trip] ([trip_id], [booked_ticket_number], [car_type], [departure_date], [departure_time], [destination], [driver], [maximum_online_ticket_number]) VALUES (100, 1, N'Pontiac', CAST(N'2022-09-10' AS Date), CAST(N'07:18:00' AS Time), N'7625 Northfield Center', N'Gabriell', 20)
SET IDENTITY_INSERT [dbo].[trip] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__employee__0A874BCF3DFC3F5C]    Script Date: 12/19/2022 9:14:08 AM ******/
ALTER TABLE [dbo].[employee] ADD  CONSTRAINT [UQ__employee__0A874BCF3DFC3F5C] UNIQUE NONCLUSTERED 
(
	[employee_email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__employee__EA162E11F215954A]    Script Date: 12/19/2022 9:14:08 AM ******/
ALTER TABLE [dbo].[employee] ADD  CONSTRAINT [UQ__employee__EA162E11F215954A] UNIQUE NONCLUSTERED 
(
	[account] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[parking_lot] ADD  CONSTRAINT [DF_parking_lot_parkArea]  DEFAULT ((0)) FOR [park_area]
GO
ALTER TABLE [dbo].[parking_lot] ADD  CONSTRAINT [DF_parking_lot_park_count]  DEFAULT ((0)) FOR [park_count]
GO
ALTER TABLE [dbo].[booking_office]  WITH CHECK ADD  CONSTRAINT [FK__booking_o__trip___5535A963] FOREIGN KEY([trip_id])
REFERENCES [dbo].[trip] ([trip_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[booking_office] CHECK CONSTRAINT [FK__booking_o__trip___5535A963]
GO
ALTER TABLE [dbo].[car]  WITH CHECK ADD  CONSTRAINT [FK__car__park_id__5629CD9C] FOREIGN KEY([park_id])
REFERENCES [dbo].[parking_lot] ([park_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[car] CHECK CONSTRAINT [FK__car__park_id__5629CD9C]
GO
ALTER TABLE [dbo].[employee]  WITH CHECK ADD  CONSTRAINT [FK__employee__depart__571DF1D5] FOREIGN KEY([department_id])
REFERENCES [dbo].[department] ([department_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[employee] CHECK CONSTRAINT [FK__employee__depart__571DF1D5]
GO
ALTER TABLE [dbo].[ticket]  WITH CHECK ADD  CONSTRAINT [FK__ticket__license___5812160E] FOREIGN KEY([license_plate])
REFERENCES [dbo].[car] ([license_plate])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ticket] CHECK CONSTRAINT [FK__ticket__license___5812160E]
GO
ALTER TABLE [dbo].[ticket]  WITH CHECK ADD  CONSTRAINT [FK__ticket__trip_id__59063A47] FOREIGN KEY([trip_id])
REFERENCES [dbo].[trip] ([trip_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ticket] CHECK CONSTRAINT [FK__ticket__trip_id__59063A47]
GO
USE [master]
GO
ALTER DATABASE [car_park] SET  READ_WRITE 
GO
