Create database ASPNetHomework;
Go

Use ASPNetHomework;
Go

CREATE TABLE [dbo].[Logins](
	[LoginId] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[Name] [nvarchar](50) NOT NULL,
	[EmailAddress] [nvarchar](50) NOT NULL,
	[LoginName] [nvarchar](50) NOT NULL,
	[ReasonForAccess] [nvarchar](50) NOT NULL
);
Go

Begin -- Batch of statements
	Declare 
	 @Name nVarchar(50) = 'Test'
	,@EmailAddress nVarchar(50) = 'Test'
	,@LoginName nVarchar(50) = 'Test'
	,@ReasonForAccess nVarchar(50) = 'Test';

	Insert into [Logins] ([Name],[EmailAddress],[LoginName],[ReasonForAccess])
		Values ( @Name, @EmailAddress, @LoginName, @ReasonForAccess );
End -- Batch
Go

-- Test that the data is in the table
Select [Name],[EmailAddress],[LoginName],[ReasonForAccess]
From [Logins];
Go
 

Create Procedure pInsLogins
( 
	 @Name nVarchar(50) = 'Default Value'
	,@EmailAddress nVarchar(50) = 'Default Value'
	,@LoginName nVarchar(50) = 'Default Value'
	,@ReasonForAccess nVarchar(50) = 'Default Value'
 )
AS
Begin --{ Batch of statements
	Begin Try
	 Insert into [Logins] ([Name],[EmailAddress],[LoginName],[ReasonForAccess])
			 Values (@Name, @EmailAddress, @LoginName, @ReasonForAccess );
	End Try
	Begin Catch
	 RaisError('An error happend while inserting the login request', 15, 1);
	End Catch
End --} Batch and Stored Procedure
Go

-- Test the Stored Procedure
Begin -- Batch of statements
	Declare 
	 @Name nVarchar(50) = 'Micah'
	,@EmailAddress nVarchar(50) = 'micah@Gmail.com'
	,@LoginName nVarchar(50) = 'Mjh'
	,@ReasonForAccess nVarchar(50) = 'Because!';

	Execute pInsLogins @Name, @EmailAddress, @LoginName, @ReasonForAccess;
End -- Batch
Go

-- Test that the data is in the table
Select [Name],[EmailAddress],[LoginName],[ReasonForAccess]
From [Logins];
Go
