CREATE TABLE [dbo].[StudentTable]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY, 
    [StudentFirstName] NVARCHAR(50) NOT NULL, 
    [StudentLastName] NVARCHAR(50) NOT NULL, 
    [StudentEmailAddress] NVARCHAR(250) NOT NULL

)
