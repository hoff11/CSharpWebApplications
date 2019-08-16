DECLARE @RoleIDAdmin nvarchar(50),
	@RoleIDMember nvarchar(50),
	@AccountIDAdmin nvarchar(50),
	@AccountIDMember nvarchar(50)
			
SET @RoleIDAdmin = NewID()
SET @RoleIDMember = NewID()
SET @AccountIDAdmin = NewID()
SET @AccountIDMember = NewID()
		
INSERT INTO Role(
	ID,
	Name
)VALUES(
	@RoleIDAdmin,
	'Administrator'
)
	
INSERT INTO Role(
	ID,
	Name
)VALUES(
	@RoleIDStudent,
	'Student'
)
		
INSERT INTO Account(
	ID,
	AccountName ,
	Email ,
	Password ,
	Status 
)VALUES(
	@AccountIDAdmin,'admin', 'admin@example.com', '1234567', 1
)
	
INSERT INTO Account(
	ID,
	AccountName ,
	Email ,
	Password ,
	Status 
)VALUES(
	@AccountIDStudent,'student1', 'student1@example.com', '1234567', 1
)
	
INSERT INTO AccountRole(
	AccountRoleID,
	AccountID,
	RoleID
)VALUES(
	NewID(), @AccountIDAdmin, @RoleIDAdmin
)
	
INSERT INTO AccountRole(
	AccountRoleID,
	AccountID,
	RoleID
)VALUES(
	NewID(), @AccountIDStudent, @RoleIDStudent
)
GO