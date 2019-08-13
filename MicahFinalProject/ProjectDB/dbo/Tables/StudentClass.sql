CREATE TABLE [dbo].[StudentClass]
(
    [ClassId]   INT NOT NULL,
    [StudentId] INT NOT NULL,
    CONSTRAINT [PK_ClassStudents] PRIMARY KEY CLUSTERED ([ClassId] ASC, [StudentId] ASC)
)
