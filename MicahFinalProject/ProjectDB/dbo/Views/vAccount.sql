CREATE VIEW [dbo].[vAccount]
	AS 
	SELECT [Id], [UserName], [Email], [Password], [Status], [CreatedOnDate] FROM [Account]
GO
--Create View vStudents
--AS
--Select [StudentId], [StudentName], [StudentEmail], [StudentLogin], [StudentPassword] From [Students]
--Go