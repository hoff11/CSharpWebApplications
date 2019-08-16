--CREATE PROCEDURE [dbo].[GetAccountByRole]
--	@param1 int = 0,
--	@param2 int
--AS
--	SELECT @param1, @param2
--RETURN 0

--CREATE PROCEDURE [dbo].[GetAccountByRole]
--	-- Add the parameters for the stored procedure here
--	@Role nvarchar(50)
--AS
--BEGIN
--	-- SET NOCOUNT ON added to prevent extra result sets from
--	-- interfering with SELECT statements.
--	SET NOCOUNT ON;

--	SELECT * FROM AccountRole
--	WHERE RoleID = (
--	SELECT Name FROM Role WHERE Name = @Role)

--END

--DROP PROCEDURE IF EXISTS [dbo].[GetAccountByRole]
--Go
--CREATE
--PROCEDURE [dbo].[GetAccountByRole]
--AS
--Select 
--      [Students].[StudentId]
--    , [Students].[StudentName]
--    , [Students].[StudentEmail]
--    , [Classes].[ClassId]
--    , [Classes].[ClassName]
--    , [Classes].[ClassDate]
--    , [Classes].[ClassDescription]
--  From  Classes 
--  INNER JOIN ClassStudents 
--    ON Classes.ClassId = ClassStudents.ClassId 
--  INNER JOIN Students 
--    ON ClassStudents.StudentId = Students.StudentId
--Go


--EXECUTE dbo.GetAccountByRole @Role = "Student";