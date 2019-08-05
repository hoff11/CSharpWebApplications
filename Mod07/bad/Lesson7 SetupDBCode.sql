USE [master]
GO

IF  EXISTS (Select name From sys.databases WHERE name = N'DataDrivenAppDemoDB')
  BEGIN
     -- Close connections to the DataDrivenAppDemoDB database 
    ALTER DATABASE [DataDrivenAppDemoDB] SET SINGLE_USER WITH ROLLBACK IMMEDIATE
    DROP DATABASE [DataDrivenAppDemoDB]
  END
GO

CREATE DATABASE [DataDrivenAppDemoDB]
GO

USE [DataDrivenAppDemoDB]
GO
-- Set Permission for CSharp Login 
-- Create User CSharp for Login CSharp
go

/****** Create Tables ******/
CREATE -- Drop
TABLE [dbo].[Categories](
 [CategoryId] [int] NOT NULL PRIMARY KEY Identity
,[CategoryName] [nvarchar](50) NOT NULL
)
GO

CREATE -- Drop
TABLE [dbo].[Products](
 [ProductId] [int] NOT NULL PRIMARY KEY Identity
,[ProductName] [nvarchar](50) NOT NULL
,[CategoryId] [int] NOT NULL References [Categories](CategoryId)
)
GO

-- We will create a logging table for this demo (It will make sense later!)
CREATE TABLE [DemoLog]
([LogId] [int] NOT NULL PRIMARY KEY Identity, [LoggedAction] [nvarchar](50), [TimeOfAction] [nvarchar](50) ) 
Go

-- Set Permissions
Deny Select, Insert, Update, Delete 
 On [Categories]
 To Public
go
Deny Select, Insert, Update, Delete 
 On [Products]
 To Public
go
Deny Select, Insert, Update, Delete 
 On [DemoLog]
 To Public
go

/****** Create Views ******/
-- Base Views --
Create View [vCategories]
AS
 Select [CategoryId], [CategoryName] From [Categories];
go

Create View [vProducts]
AS
 Select [ProductId], [ProductName], [CategoryId] From [Products];
go

Create View [vDemoLog]
AS
 Select [LoggedAction], [TimeOfAction] From [DemoLog];
go

-- Report Views --
CREATE VIEW vProductsByCategories
AS
Select        
  Categories.CategoryName
, Products.ProductName
From Categories 
INNER JOIN Products 
  ON Categories.CategoryId = Products.CategoryId
Go

-- Set Permissions
Grant Select On [vCategories] To Public
Grant Select On [vProducts] To Public
Grant Select On [vDemoLog] To Public
Grant Select On [vProductsByCategories] To Public
go

/****** Create Stored Procedures ******/

-- Now I create the Transaction Sprocs for each table!
-- Working with SQL often consists of only 4 actions, sometimes referred to as CRUD:
-- Create - INSERT - to store new data
-- Read - Select - to retrieve data
-- Update - UPDATE - to change or modify data.
-- Delete - DELETE - delete or remove data
-- So, we will make stored procedures for each of these actions

/*** CREATE (Insert) ***/
-- First, I create logging Sproc for the demo...
Create -- Drop
Procedure pInsDemoLog
( @LoggedAction [nvarchar](50) )
As
  Begin
    Insert Into [DemoLog] ([LoggedAction],[TimeOfAction])
    Values(@LoggedAction, GetDate() )
  End
Go

-- Create Categories
Create -- Drop
Procedure pInsCategories
(@CategoryName [nvarchar](50))
As
  Begin
    Insert Into [Categories]([CategoryName])
    Values(@CategoryName)
    Exec pInsDemoLog
      @LoggedAction =  'pInsCategories was executed'
  End 
Go

-- Test
Exec pInsCategories @CategoryName = 'Cat1'
Exec pInsCategories @CategoryName = 'Cat2'
Go

/*** Products ***/
-- Create Products
Create -- Drop
Procedure pInsProducts
(@ProductName [nvarchar](50), @CategoryId [int])
As
  Begin
    Insert Into [Products]([ProductName],[CategoryId])
    Values(@ProductName,@CategoryId)

    Exec pInsDemoLog
      @LoggedAction =  'pInsProducts was executed'	    
  End 
Go

-- Test
Exec pInsProducts @ProductName = 'ProdA', @CategoryId = 1
Exec pInsProducts @ProductName = 'ProdB', @CategoryId = 1
Exec pInsProducts @ProductName = 'ProdC', @CategoryId = 2
Go

/*** READ (Select) ***/
-- No DemoLog Select Sproc

-- Read Categories
Create -- Drop
Procedure pSelCategories
(@CategoryId [int] = null ) -- Default of null give you all rows
As
  Begin
    Select [CategoryId],[CategoryName]
    From [Categories]
	  Where [CategoryId] =  @CategoryId
	  Or @CategoryId is null	  
    Exec pInsDemoLog
      @LoggedAction =  'pSelCategories was executed'	  
  End 
Go

-- Test
Exec pSelCategories 
Exec pSelCategories @CategoryId = '1'
Go

-- Read Products
Create -- Drop
Procedure pSelProducts
(@ProductId [int] = null ) -- Default of null give you all rows
As
  Begin
    Select [ProductId],[ProductName],[CategoryId]
    From [Products]
	  Where [ProductId] = @ProductId 
	  Or @ProductId is null
    Exec pInsDemoLog
      @LoggedAction =  'pSelProducts was executed'	    	  
  End 
Go

-- Test
Exec pSelProducts 
Exec pSelProducts @ProductId = 1
Go

-- Read Categories And Products
Create -- Drop
Procedure pSelProductsByCategory
(@ProductId [int] = null, @CategoryId [int] = null ) -- Default of null give you all rows
As
  Begin
    Select [ProductId],[ProductName],[Categories].[CategoryId], [CategoryName] 
    From [Products] Join [Categories]
	  On [Products].[CategoryId] = [Categories].[CategoryId]
	  Where [Products].[ProductId] = @ProductId
	    Or  [Categories].[CategoryId] = @CategoryId
	    Or @ProductId is null And @CategoryId is null
    Exec pInsDemoLog
      @LoggedAction =  'pSelProductsByCategory was executed'	    	  
  End 
Go

-- Test
Exec pSelProductsByCategory
Exec pSelProductsByCategory @ProductId = 1
Exec pSelProductsByCategory @CategoryId = 1
Exec pSelProductsByCategory @ProductId = 1, @CategoryId = 1
Go

/*** UPDATE (Update) ***/
-- No DemoLog Update Sproc

-- Update Categories
Create Procedure pUpdCategories
(@CategoryId [int], @CategoryName [nvarchar](50))
As
  Begin
    Update [Categories]
	Set 
	  [CategoryName] = @CategoryName
    Where [CategoryId] = @CategoryId
    Exec pInsDemoLog
      @LoggedAction =  'pUpdCategories was executed'	      
  End 
Go

-- Test
Exec pUpdCategories @CategoryId = '1', @CategoryName = 'Cat001'
Exec pSelProductsByCategory
Go

-- Update Products
Create Procedure pUpdProducts
(@ProductId [int], @ProductName [nvarchar](50), @CategoryId [int])
As
  Begin
    Update[Products]
	  Set 
	    [ProductName] = @ProductName
	  , [CategoryId] = @CategoryId
    Where [ProductId] = @ProductId
    Exec pInsDemoLog
      @LoggedAction =  'pUpdProducts was executed'	      
  End 
Go

-- Test
Exec pUpdProducts @ProductId = 2, @ProductName = 'ProdBzzz', @CategoryId = 1
Exec pSelProductsByCategory
Go

/*** DELETE (Delete) ***/
-- No DemoLog Update Sproc

-- Delete Products
Create Procedure pDelProducts
(@ProductId [int])
As
  Begin
    Delete From [Products]
    Where [ProductId] = @ProductId
    Exec pInsDemoLog
      @LoggedAction =  'pDelProducts was executed'	     
  End 
Go

-- Test
Exec pDelProducts @ProductId = 3
Go

-- Delete Categories
Create Procedure pDelCategories
(@CategoryId [int])
As
  Begin
    Delete From [Categories]
    Where [CategoryId] = @CategoryId
    Exec pInsDemoLog
      @LoggedAction =  'pDelCategories was executed'	  
  End 
Go

-- Test
Exec pDelCategories @CategoryId = '2'
Exec pSelProductsByCategory
Go

-- Test
Select * 
  From Products 
Select * 
  From Categories
Select * 
 From vProductsByCategories
Select * 
  From  DemoLog 
go

-- Set Permissions --
Grant Exec On [dbo].[pInsDemoLog] To Public;
Grant Exec On [dbo].[pInsCategories] To Public;
Grant Exec On [dbo].[pInsProducts] To Public;
Grant Exec On [dbo].[pSelCategories] To Public;
Grant Exec On [dbo].[pSelProducts] To Public;
Grant Exec On [dbo].[pSelProductsByCategory] To Public;
Grant Exec On [dbo].[pUpdCategories] To Public;
Grant Exec On [dbo].[pUpdProducts] To Public;
Grant Exec On [dbo].[pDelCategories] To Public;
Grant Exec On [dbo].[pDelProducts] To Public;