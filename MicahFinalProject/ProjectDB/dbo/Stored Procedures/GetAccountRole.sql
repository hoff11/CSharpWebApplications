--CREATE PROCEDURE [dbo].[GetAccountRole]
--	@param1 int = 0,
--	@param2 int
--AS
--	SELECT @param1, @param2
--RETURN 0

CREATE PROCEDURE [dbo].[GetAccountRoles]
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