-- Use the built in System database called TempDB:
Use tempdb 
Go

-- Make a new table in that database for this activity:
Create Table Customers
( CustomerId int Primary Key -- This stop you from putting duplicate values in a column
, CustomerName varchar(100) )
Go


-- Create a SELECT procedure:
Create -- Drop
Proc pSelCustomer
AS
BEGIN -- Proc
	Begin Try
		Select CustomerId, CustomerName From Customers
	  	Return +100
	End Try
	Begin Catch
		Declare @Message varchar(200)
		Set @Message = Error_Message()
		Raiserror(@Message, 15, 1)
		Return -100
	End Catch
END -- Proc
Go


/*** The following code would be used to execute the preceding stored procedure ***

Declare @RC int
EXEC @RC = pSelCustomer
if @RC < 0
	Begin 
	 Print 'There was an error'	 
	End
Else
	Begin
		Print @RC
		Select * From Customers
	End			 

**********************************************************************************/



-- Create a INSERT procedure:
Create -- Drop
Proc pInsCustomer
( @CustomerId int , @CustomerName varchar(100) )
AS
BEGIN -- Proc
	Begin Try
		Begin Tran 
			Insert into Customers (CustomerId, CustomerName)
			Values ( @CustomerId , @CustomerName)
	  	Commit Tran
	  	Return +100
	End Try
	Begin Catch
		Rollback Tran
		Declare @Message varchar(200)
		Set @Message = Error_Message()
		Raiserror(@Message, 15, 1)
		Return -100
	End Catch
END -- Proc
Go


/*** The following code would be used to execute the preceding stored procedure ***

Declare @RC int
EXEC @RC = pInsCustomer
			  @CustomerId = 1,
			  @CustomerName = 'Bob Smith'
if @RC < 0
	Begin 
	 Print 'There was an error'	 
	End
Else
	Begin
		Print @RC
		Select * From Customers
	End			 

**********************************************************************************/


-- Create a UPDATE procedure:
Create -- Drop
Proc pUpdCustomer
( @CustomerId int , @NewCustomerName varchar(100) )
AS
BEGIN -- Proc
	Begin Try
		Begin Tran 
			Update Customers 
			Set CustomerName = @NewCustomerName
			Where CustomerId = @CustomerId
	  	Commit Tran
	  	Return +100
	End Try
	Begin Catch
		Rollback Tran
		Declare @Message varchar(200)
		Set @Message = Error_Message()
		Raiserror(@Message, 15, 1)
		Return -100
	End Catch
END -- Proc
Go


/*** The following code would be used to execute the preceding stored procedure ***

Declare @RC int
EXEC @RC = pUpdCustomer
			  @CustomerId = 1,
			  @NewCustomerName = 'Robert Smith'
if @RC < 0
	Begin 
	 Print 'There was an error'	 
	End
Else
	Begin
		Print @RC
		Select * From Customers
	End			 

**********************************************************************************/


-- Create a DELETE procedure:
Create -- Drop
Proc pDelCustomer
( @CustomerId int )
AS
BEGIN -- Proc
	Begin Try
		Begin Tran 
			Delete From Customers 
			Where CustomerId = @CustomerId
	  	Commit Tran
	  	Return +100
	End Try
	Begin Catch
		Rollback Tran
		Declare @Message varchar(200)
		Set @Message = Error_Message()
		Raiserror(@Message, 15, 1)
		Return -100
	End Catch
END -- Proc
Go


/*** The following code would be used to execute the preceding stored procedure ***

Declare @RC int
EXEC @RC = pDelCustomer
			  @CustomerId = 1
if @RC < 0
	Begin 
	 Print 'There was an error'	 
	End
Else
	Begin
		Print @RC
		Select * From Customers
	End			 

**********************************************************************************/