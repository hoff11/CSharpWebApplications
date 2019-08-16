CREATE TABLE [dbo].[AccountRole](
	[AccountRoleID] [nvarchar](50) NOT NULL,
	[AccountID] [nvarchar](50) NOT NULL,
	[RoleID] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_AccountRoles] PRIMARY KEY CLUSTERED 
([AccountRoleID] ASC)
)
GO