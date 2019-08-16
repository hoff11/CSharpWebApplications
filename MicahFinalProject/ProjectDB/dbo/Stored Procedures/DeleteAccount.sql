--CREATE PROCEDURE [dbo].[DeleteAccount]
--	@param1 int = 0,
--	@param2 int
--AS
--	SELECT @param1, @param2
--RETURN 0

CREATE PROCEDURE [dbo].[DeleteAccount]
	-- Add the parameters for the stored procedure here
	@ID nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DELETE FROM Account
	WHERE ID = @ID
END
GO