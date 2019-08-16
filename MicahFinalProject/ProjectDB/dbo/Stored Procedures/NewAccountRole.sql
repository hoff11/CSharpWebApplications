--CREATE PROCEDURE [dbo].[NewAccountRole]
--	@param1 int = 0,
--	@param2 int
--AS
--	SELECT @param1, @param2
--RETURN 0

CREATE PROCEDURE [dbo].[NewAccountRole]
	@AccountID nvarchar(50),
	@RoleName nvarchar(50)
AS
BEGIN
	DECLARE @AccountRoleID nvarchar(50)
	DECLARE @RoleID nvarchar(50)
	
	SELECT @RoleID = Id
	FROM Role
	WHERE Name = @RoleName
	
	IF @RoleID IS NULL
		BEGIN
			INSERT INTO Role(
				Id,
				Name
			)VALUES(
				NEWID(),
				@RoleName
			)
			
			SELECT @RoleID = Id
			FROM Role
			WHERE Name = @RoleName
		END
	
	SELECT @AccountRoleID = AccountRoleID
	FROM AccountRole
	WHERE AccountID = @AccountID AND RoleID = @RoleID
	
	IF @AccountRoleID IS NULL
		BEGIN
			INSERT INTO AccountRole(
				AccountRoleID,
				AccountID,
				RoleID
			)VALUES(
				NEWID(),
				@AccountID,
				@RoleID
			)
		END 

END
GO