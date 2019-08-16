/**********
Title: MicahHoffmannFinalDB for localDB

ChangeLog: (Who, When, What)
Micah, 7/20/2019, created
***********/

Set NoCount On

/****** -- Create Database -- *****/
USE [master]
IF  EXISTS (Select name From sys.databases Where name = N'MicahFinal')
  BEGIN
    EXEC msdb.dbo.sp_delete_database_backuphistory @database_name = N'MicahFinal'
    ALTER DATABASE [MicahFinal] SET  SINGLE_USER WITH ROLLBACK IMMEDIATE
    DROP DATABASE [MicahFinal]
  END
Go

CREATE DATABASE MicahFinal
Go
USE MicahFinal
GO

/****** -- Create Tables -- *****/
DROP TABLE IF EXISTS Account;
CREATE TABLE [Account](
	[Id] [nvarchar](50) NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[Status] [int] NOT NULL DEFAULT(0),
	[CreatedOnDate] [datetime] NULL DEFAULT getdate() ,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)
	WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

Go

DROP TABLE IF EXISTS Role;
CREATE TABLE Role(
	[Id] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)
WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
Go

DROP TABLE IF EXISTS AccountRole;
CREATE TABLE AccountRole(
	[AccountRoleID] [nvarchar](50) NOT NULL,
	[AccountID] [nvarchar](50) NOT NULL,
	[RoleID] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_AccountRoles] PRIMARY KEY CLUSTERED 
(
	[AccountRoleID] ASC
)
WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** -- Clear and Reload Test Data -- *****/
DELETE FROM Account;
DELETE FROM Role;
DELETE FROM AccountRole;
GO

/******** Load DATA ***************/
DECLARE @RoleIDAdmin int,
	@RoleIDStudent int,
	@AccountIDAdmin nvarchar(50),
	@Account2IDAdmin nvarchar(50),
	@AccountIDStudent nvarchar(50),
	@Account2IDStudent nvarchar(50)
			
SET @RoleIDAdmin = 1
SET @RoleIDStudent = 2
SET @AccountIDAdmin = NewID()
SET @Account2IDAdmin = NewID()
SET @AccountIDStudent = NewID()
SET @Account2IDStudent = NewID()
		
INSERT INTO Role(
	ID,
	Name
)VALUES(
	@RoleIDAdmin,
	'Administrator'
)
	
INSERT INTO Role(
	ID,
	Name
)VALUES(
	@RoleIDStudent,
	'Student'
)
		
INSERT INTO Account(
	ID,
	UserName ,
	Email ,
	Password ,
	Status 
)VALUES(
	@AccountIDAdmin,'admin', 'admin@example.com', '1234567', 1
)
	
INSERT INTO Account(
	ID,
	UserName ,
	Email ,
	Password ,
	Status 
)VALUES(
	@Account2IDAdmin,'admin1', 'admin1@example.com', '1234567', 1
)

INSERT INTO Account(
	ID,
	UserName ,
	Email ,
	Password ,
	Status 
)VALUES(
	@AccountIDStudent,'student', 'student@example.com', '1234567', 1
)

INSERT INTO Account(
	ID,
	UserName ,
	Email ,
	Password ,
	Status 
)VALUES(
	@Account2IDStudent,'student1', 'student1@example.com', '1234567', 1
)
	
INSERT INTO AccountRole(
	AccountRoleID,
	AccountID,
	RoleID
)VALUES(
	NewID(), @AccountIDAdmin, @RoleIDAdmin
)
	
INSERT INTO AccountRole(
	AccountRoleID,
	AccountID,
	RoleID
)VALUES(
	NewID(), @AccountIDStudent, @RoleIDStudent
)
INSERT INTO AccountRole(
	AccountRoleID,
	AccountID,
	RoleID
)VALUES(
	NewID(), @Account2IDAdmin, @RoleIDAdmin
)
	
INSERT INTO AccountRole(
	AccountRoleID,
	AccountID,
	RoleID
)VALUES(
	NewID(), @Account2IDStudent, @RoleIDStudent
)
GO

/****** -- Create Views -- *****/
-- Abstraction Views --

DROP VIEW IF EXISTS vAccount;
GO
Create View vAccount
AS 
SELECT [Id], [UserName], [Email], [Password], [Status], [CreatedOnDate] FROM [Account]
GO

DROP VIEW IF EXISTS vAccountRole;
GO
CREATE VIEW vAccountRole
AS 
SELECT [AccountRoleID],[AccountID], [RoleID] FROM [AccountRole]
GO

DROP VIEW IF EXISTS vRole;
GO
CREATE VIEW vRole
AS 
SELECT [Id], [Name] FROM [Role]
GO

/****** -- Create Stored Procedures -- *****/
DROP PROCEDURE IF EXISTS spGet_Account;
GO
CREATE PROCEDURE spGet_Account
	-- Add the parameters for the stored procedure here
	@ID nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM Account
	WHERE ID = @ID
END
GO

DROP PROCEDURE IF EXISTS spGet_AccountByRole;
GO
CREATE
PROCEDURE spGet_AccountByRole
	@RoleID int
AS
BEGIN
	SELECT UserName, Email, r.Name
	FROM Account AS a INNER JOIN AccountRole AS ar
	ON a.Id = ar.AccountID
	INNER JOIN Role r
	ON ar.RoleID = r.Id
	WHERE r.Id = @RoleID
END
Go

DROP PROCEDURE IF EXISTS spGet_AccountByEmail;
Go
CREATE PROCEDURE spGet_AccountByEmail
	-- Add the parameters for the stored procedure here
	@Email nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM Account
	WHERE Email = @Email
END
GO

DROP PROCEDURE IF EXISTS spGet_AccountByUserName;
GO
CREATE PROCEDURE spGet_AccountByUserName
	-- Add the parameters for the stored procedure here
	@UserName nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM Account
	WHERE UserName = @UserName
END
GO

DROP PROCEDURE IF EXISTS spGet_AccountRole;
GO
CREATE PROCEDURE spGet_AccountRole
	@AccountID nvarchar(50)
AS
BEGIN
	
	SELECT R.Name As RoleName
	FROM AccountRole UR
	INNER JOIN Role R
	ON UR.RoleID = R.Id
	WHERE UR.AccountID = @AccountID
	
END
GO