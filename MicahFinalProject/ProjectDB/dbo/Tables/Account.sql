CREATE TABLE [dbo].[Account](
	[Id] [nvarchar](50) NOT NULL,
	[Accountname] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[Status] [int] NOT NULL DEFAULT(0),
	[CreatedOnDate] [datetime] NULL DEFAULT getdate() ,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
([Id] ASC)
) 
GO

