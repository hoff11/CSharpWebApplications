--CREATE PROCEDURE [dbo].[UpdateAccount]
--	@param1 int = 0,
--	@param2 int
--AS
--	SELECT @param1, @param2
--RETURN 0

CREATE PROCEDURE [dbo].[UpdateAccount]
	-- Add the parameters for the stored procedure here
	@UserName nvarchar(50),
	@Email nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE Account
	SET Email = @Email
	WHERE AccountName = @UserName
END
GO