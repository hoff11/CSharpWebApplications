USE [tempdb]
GO
CREATE TABLE [dbo].[Logins](
	[LoginId] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[LoginName] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL
)
GO
INSERT INTO [tempdb].[dbo].[Logins] ([LoginName] ,[Password])
     VALUES ('Bob Smith' ,'Pass')
GO
INSERT INTO [tempdb].[dbo].[Logins] ([LoginName] ,[Password])
     VALUES ('Sue Jones' ,'Pass')
GO



