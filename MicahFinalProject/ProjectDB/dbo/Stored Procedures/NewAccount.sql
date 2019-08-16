--CREATE PROCEDURE [dbo].[NewAccount]
--	@param1 int = 0,
--	@param2 int
--AS
--	SELECT @param1, @param2
--RETURN 0

CREATE PROCEDURE [dbo].[NewAccount]
	-- Add the parameters for the stored procedure here
	@ID nvarchar(50),
	@AccountName nvarchar(50),
	@Email nvarchar(50),
	@Password nvarchar(50),
	@Status int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO Account(
		ID,
		AccountName ,
		Email ,
		Password ,
		Status 
	)VALUES(
		@ID,
		@AccountName ,
		@Email ,
		@Password ,
		@Status 
	)
END
GO