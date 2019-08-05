USE [master]
GO

IF  EXISTS (SELECT name FROM sys.databases WHERE name = N'DataDrivenAppDemoDB')
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
([LoggedAction] [nvarchar](50), [TimeOfAction] [nvarchar](50) ) 
Go

/****** Create Views ******/
CREATE VIEW vProductsByCategories
AS
SELECT        
  Categories.CategoryName
, Products.ProductName
FROM Categories 
INNER JOIN Products 
  ON Categories.CategoryId = Products.CategoryId
Go


/****** Create Stored Procedures ******/

-- First the logging Sproc
Create -- Drop
Procedure pInsDemoLog
( @LoggedAction [nvarchar](50) )
As
  Begin
    Insert Into [DemoLog] ([LoggedAction],[TimeOfAction])
    Values(@LoggedAction, GetDate() )
  End
Go

-- Now the Transaction Sprocs!
-- Working with SQL often consists of only 4 actions, sometimes referred to as CRUD:
-- Create - INSERT - to store new data
-- Read - SELECT - to retrieve data
-- Update - UPDATE - to change or modify data.
-- Delete - DELETE - delete or remove data
-- So, we will make stored procedures for each of these actions

/*** CREATE (Insert) ***/
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
Exec pDelProducts @ProductId = 2

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
  from Products 
Select * 
  from Categories
Select * 
  from  DemoLog 

Go  
SELECT CategoryName, ProductName FROM vProductsByCategories



