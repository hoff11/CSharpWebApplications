--CREATE PROCEDURE [dbo].[GetAccountByAccountname]
--	@param1 int = 0,
--	@param2 int
--AS
--	SELECT @param1, @param2
--RETURN 0

CREATE PROCEDURE [dbo].[GetAccountByEmail]
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
