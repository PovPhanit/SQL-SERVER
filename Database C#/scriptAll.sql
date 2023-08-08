USE [master]
GO
/****** Object:  Database [testExam]    Script Date: 08-08-2023 10:24:56 PM ******/
CREATE DATABASE [testExam] ON  PRIMARY 
( NAME = N'testExam', FILENAME = N'D:\Software coding\MSSQL16.SQLEXPRESS\MSSQL\DATA\testExam.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'testExam_log', FILENAME = N'D:\Software coding\MSSQL16.SQLEXPRESS\MSSQL\DATA\testExam_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [testExam].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [testExam] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [testExam] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [testExam] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [testExam] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [testExam] SET ARITHABORT OFF 
GO
ALTER DATABASE [testExam] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [testExam] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [testExam] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [testExam] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [testExam] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [testExam] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [testExam] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [testExam] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [testExam] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [testExam] SET  ENABLE_BROKER 
GO
ALTER DATABASE [testExam] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [testExam] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [testExam] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [testExam] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [testExam] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [testExam] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [testExam] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [testExam] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [testExam] SET  MULTI_USER 
GO
ALTER DATABASE [testExam] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [testExam] SET DB_CHAINING OFF 
GO
USE [testExam]
GO
/****** Object:  Table [dbo].[tbPerson]    Script Date: 08-08-2023 10:24:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbPerson](
	[tID] [int] NOT NULL,
	[tsub] [nvarchar](max) NOT NULL,
	[Tname] [nvarchar](max) NOT NULL,
	[tsex] [char](1) NOT NULL,
 CONSTRAINT [pkTID] PRIMARY KEY CLUSTERED 
(
	[tID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbsubject]    Script Date: 08-08-2023 10:24:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbsubject](
	[tsub] [nvarchar](max) NOT NULL,
	[tID] [int] NOT NULL,
	[sMath] [decimal](18, 0) NOT NULL,
	[sKhmer] [decimal](18, 0) NOT NULL,
	[sEnglish] [decimal](18, 0) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[Subject]    Script Date: 08-08-2023 10:24:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[Subject]()
returns table as return
(
select tsub as [Subject],tID as [ID],sMath as [Math],sKhmer as [Khmer],sEnglish as [English] from tbsubject

)
GO
/****** Object:  View [dbo].[Nameview]    Script Date: 08-08-2023 10:24:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[Nameview] as
select *from tbsubject
GO
INSERT [dbo].[tbPerson] ([tID], [tsub], [Tname], [tsex]) VALUES (89, N'Teacher', N'Phanit', N'm')
INSERT [dbo].[tbPerson] ([tID], [tsub], [Tname], [tsex]) VALUES (90, N'Korean ', N'Reak ', N'M')
INSERT [dbo].[tbPerson] ([tID], [tsub], [Tname], [tsex]) VALUES (91, N'Chinese', N'Kongly ', N'M')
INSERT [dbo].[tbPerson] ([tID], [tsub], [Tname], [tsex]) VALUES (92, N'88', N'77', N'm')
INSERT [dbo].[tbPerson] ([tID], [tsub], [Tname], [tsex]) VALUES (93, N'34', N'55 ', N'm')
INSERT [dbo].[tbPerson] ([tID], [tsub], [Tname], [tsex]) VALUES (94, N'56', N'44', N'm')
GO
INSERT [dbo].[tbsubject] ([tsub], [tID], [sMath], [sKhmer], [sEnglish]) VALUES (N'Thailand', 89, CAST(87 AS Decimal(18, 0)), CAST(65 AS Decimal(18, 0)), CAST(67 AS Decimal(18, 0)))
INSERT [dbo].[tbsubject] ([tsub], [tID], [sMath], [sKhmer], [sEnglish]) VALUES (N'Dubai', 90, CAST(77 AS Decimal(18, 0)), CAST(55 AS Decimal(18, 0)), CAST(66 AS Decimal(18, 0)))
INSERT [dbo].[tbsubject] ([tsub], [tID], [sMath], [sKhmer], [sEnglish]) VALUES (N'Hongkong', 91, CAST(77 AS Decimal(18, 0)), CAST(5 AS Decimal(18, 0)), CAST(55 AS Decimal(18, 0)))
INSERT [dbo].[tbsubject] ([tsub], [tID], [sMath], [sKhmer], [sEnglish]) VALUES (N'Bangkok', 92, CAST(99 AS Decimal(18, 0)), CAST(67 AS Decimal(18, 0)), CAST(87 AS Decimal(18, 0)))
GO
ALTER TABLE [dbo].[tbsubject]  WITH CHECK ADD  CONSTRAINT [fkTID] FOREIGN KEY([tID])
REFERENCES [dbo].[tbPerson] ([tID])
GO
ALTER TABLE [dbo].[tbsubject] CHECK CONSTRAINT [fkTID]
GO
/****** Object:  StoredProcedure [dbo].[DeleteSub]    Script Date: 08-08-2023 10:24:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[DeleteSub](@sub nvarchar(max),@tID int,@math decimal,@khmer decimal,@english decimal) as
begin
delete from tbsubject where tID=@tID
end
GO
/****** Object:  StoredProcedure [dbo].[gradeStudent]    Script Date: 08-08-2023 10:24:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[gradeStudent] as
begin
select ps.tID,ps.Tname,sj.sMath,sj.sKhmer,convert(decimal,sMath+sKhmer) as Total,
case when sMath+sKhmer>190 then 'A'
     when sMath+sKhmer>160 then 'B'
	 else 
	 'C'
	 end as Grade,
	 sum(sMath+sKhmer) [Sum],
	 avg((sMath+sKhmer)/2) Average,
	 Rank() over(order by avg((sMath+skhmer)/2) desc) as [Rank]
from tbPerson ps inner join tbsubject sj on ps.tID=sj.tID
group by ps.tID,ps.Tname,sj.sMath,sj.sKhmer
order by Average desc
end
GO
/****** Object:  StoredProcedure [dbo].[InsertSub]    Script Date: 08-08-2023 10:24:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[InsertSub](@sub nvarchar(max),@tID int,@math decimal,@khmer decimal,@english decimal) as
begin
insert into tbsubject values(@sub,@tID,@math,@khmer,@english)
end
GO
/****** Object:  StoredProcedure [dbo].[ResetAllSub]    Script Date: 08-08-2023 10:24:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[ResetAllSub] as
begin
delete from tbsubject 
end
GO
/****** Object:  StoredProcedure [dbo].[ResetSub]    Script Date: 08-08-2023 10:24:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[ResetSub](@sub nvarchar(max),@tID int,@math decimal,@khmer decimal,@english decimal) as
begin
delete from tbsubject 
end
GO
/****** Object:  StoredProcedure [dbo].[SearchSub]    Script Date: 08-08-2023 10:24:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[SearchSub](@tID nvarchar(max)) as
begin
select *from tbsubject where tID like N'%'+@tID+'%'
end
GO
/****** Object:  StoredProcedure [dbo].[testCursor]    Script Date: 08-08-2023 10:24:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[testCursor] as
begin
declare @tid int
declare @tsub nvarchar(max)
declare @tname nvarchar(max)
declare @sex char(1)
declare csPerson cursor
scroll dynamic for select *from tbPerson
open csPerson
fetch first from csPerson into @tid,@tsub,@tname,@sex
while(@@FETCH_STATUS=0)
begin
print 'ID = '+convert(nvarchar(max),@tid)+'subject = '+@tsub+'Name = '+@tname+'sex = '+@sex
fetch next from csPerson into @tid,@tsub,@tname,@sex
end
close csPerson
Deallocate csPerson
end
GO
/****** Object:  StoredProcedure [dbo].[updateSub]    Script Date: 08-08-2023 10:24:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[updateSub](@sub nvarchar(max),@tID int,@math decimal,@khmer decimal,@english decimal) as
begin
update tbsubject set tsub=@sub,sMath=@math,sKhmer=@khmer,sEnglish=@english where tID=@tID
end
GO
USE [master]
GO
ALTER DATABASE [testExam] SET  READ_WRITE 
GO
