--CREATE PROCEDURE [dbo].[RemoveAccountRole]
--	@param1 int = 0,
--	@param2 int
--AS
--	SELECT @param1, @param2
--RETURN 0

CREATE PROCEDURE [dbo].[RemoveAccountRole]
	@AccountID nvarchar(50),
	@RoleName nvarchar(50)
AS
BEGIN
	DECLARE @RoleID nvarchar(50)
	
	SELECT @RoleID = Id
	FROM Role
	WHERE Name = @RoleName
	
	IF @RoleID IS NULL
		BEGIN
			Delete FROM AccountRole
			WHERE RoleID = @RoleID AND AccountID = @AccountID
		END

END
GO