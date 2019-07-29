Use Master;
Go
If Exists (Select Name from SysDatabases Where Name = 'EFCodeFirstDemo') 
	Drop Database EFCodeFirstDemo;
Go

Create -- Drop
Database EFCodeFirstDemo;
Go

Use EFCodeFirstDemo;
Go

---------------- Customers ---------------------------
Create Table Customers
(CustomerID int Primary Key Identity
,CustomerName nVarchar(100)
,CustomerTypeID int
);
Go
Deny Select, Insert, Update, Delete on Customers To Public;
Go

Create -- Drop
Procedure pInsCustomer
(@CustomerName nVarchar(100), @CustomerTypeID int, @NewRowID int Out)
AS
Begin -- Body
	Declare @RC int = 0;
	Begin Try
		Insert into Customers (CustomerName, CustomerTypeID)
		Values (@CustomerName, @CustomerTypeID);
		Select @NewRowID = SCOPE_IDENTITY(); 
		Set @RC = 100;
	End Try
	Begin Catch
	    IF (ERROR_NUMBER() = 547) Set @RC = -200 -- Violation of Foreign Key
		ELSE Set @RC = -100;
	End Catch
	Return @RC;
End -- Body
Go
Grant Exec on pInsCustomer to Public;
Go

Create Procedure pUpdCustomer
(@CustomerID int, @CustomerName nVarchar(100), @CustomerTypeID int)
AS
Begin -- Body
	Declare @RC int = 0;
	Begin Try
		Update Customers 
		Set CustomerName = @CustomerName, CustomerTypeID = @CustomerTypeID
		Where CustomerID = @CustomerID;
		Set @RC = 100;
	End Try
	Begin Catch
	    IF (ERROR_NUMBER() = 547) Set @RC = -200 -- Violation of Foreign Key
		ELSE Set @RC = -100;
	End Catch
	Return @RC;
End -- Body
Go
Grant Exec on pUpdCustomer to Public;
Go

Create Procedure pDelCustomer
(@CustomerID int)
AS
Begin -- Body
	Declare @RC int = 0;
	Begin Try
		Delete From Customers
		Where CustomerID = @CustomerID;
		Set @RC = 100;
	End Try
	Begin Catch
	    IF (ERROR_NUMBER() = 547) Set @RC = -200 -- Violation of Foreign Key
		ELSE Set @RC = -100;
	End Catch
	Return @RC;
End -- Body
Go
Grant Exec on pDelCustomer to Public;
Go

Create View vCustomers
AS 
Select CustomerID, CustomerName, CustomerTypeID
From Customers;
Go
Grant Select on vCustomers to Public;
Go

Create Procedure pSelCustomer
(@CustomerID int = null, @CustomerName nVarchar(100) = null, @CustomerTypeID int = null)
AS
Begin -- Body
	Declare @RC int = 0;
	Begin Try
		If (@CustomerID is Null AND @CustomerName is Null AND @CustomerTypeID is Null)
			Select CustomerID, CustomerName, CustomerTypeID
			From vCustomers
		Else
			Select CustomerID, CustomerName, CustomerTypeID
			From vCustomers
			Where CustomerID = @CustomerID
			Or CustomerName = @CustomerName
			Or CustomerTypeID = @CustomerTypeID
		Set @RC = 100;
	End Try
	Begin Catch
		Set @RC = -100;
	End Catch
	Return @RC;
End -- Body
Go
Grant Exec on pSelCustomer to Public;
Go

-- Test the objects
Declare @NewlyInsertedID int;
Exec pInsCustomer @CustomerName = 'Cust01', @CustomerTypeID = 1, @NewRowID = @NewlyInsertedID Out;
Select @NewlyInsertedID as NewRowID
Exec pInsCustomer @CustomerName = 'Cust02', @CustomerTypeID = 2, @NewRowID = @NewlyInsertedID Out;
Select @NewlyInsertedID as NewRowID
Exec pInsCustomer @CustomerName = 'Cust03', @CustomerTypeID = 2, @NewRowID = @NewlyInsertedID Out;
Select @NewlyInsertedID as NewRowID
Go
Select CustomerID, CustomerName, CustomerTypeID From vCustomers;
Go
Exec pSelCustomer;
Go
Exec pSelCustomer @CustomerID = 2, @CustomerName = null, @CustomerTypeID = null;
Go
Exec pSelCustomer @CustomerID = null, @CustomerName = Cust03, @CustomerTypeID = null;
Go
Exec pSelCustomer @CustomerID = null,  @CustomerName = null, @CustomerTypeID = 2;
Go
Exec pUpdCustomer @CustomerID = 1, @CustomerName = 'Customer01', @CustomerTypeID = 1;
Exec pSelCustomer @CustomerID = 1;
Go
Exec pDelCustomer @CustomerID = 1;
Exec pSelCustomer;
Go


--------------- CustomerTypes -----------------------------------
Create Table CustomerTypes
(CustomerTypeID int Primary Key Identity
,CustomerTypeName nVarchar(100)
);
Go
Deny Select, Insert, Update, Delete on CustomerTypes To Public;
Go

Create -- Drop
Procedure pInsCustomerType
(@CustomerTypeName nVarchar(100), @NewRowID int Out)
AS
Begin -- Body
	Declare @RC int = 0;
	Begin Try
		Insert into CustomerTypes (CustomerTypeName)
		Values (@CustomerTypeName);
		Select @NewRowID = SCOPE_IDENTITY(); 
		Set @RC = 100;
	End Try
	Begin Catch
	    IF (ERROR_NUMBER() = 547) Set @RC = -200 -- Violation of Foreign Key
		ELSE Set @RC = -100;
	End Catch
	Return @RC;
End -- Body
Go
Grant Exec on pInsCustomerType to Public;
Go

Create -- Drop
Procedure pUpdCustomerType
(@CustomerTypeID int, @CustomerTypeName nVarchar(100))
AS
Begin -- Body
	Declare @RC int = 0;
	Begin Try
		Update CustomerTypes 
		Set CustomerTypeName = @CustomerTypeName
		Where CustomerTypeID = @CustomerTypeID;
		Set @RC = 100;
	End Try
	Begin Catch
	    IF (ERROR_NUMBER() = 547) Set @RC = -200 -- Violation of Foreign Key
		ELSE Set @RC = -100;
	End Catch
	Return @RC;
End -- Body
Go
Grant Exec on pUpdCustomerType to Public;
Go

Create -- Drop
Procedure pDelCustomerType
(@CustomerTypeID int)
AS
Begin -- Body
	Declare @RC int = 0;
	Begin Try
		Delete From CustomerTypes
		Where CustomerTypeID = @CustomerTypeID;
		Set @RC = 100;
	End Try
	Begin Catch
	    IF (ERROR_NUMBER() = 547) Set @RC = -200 -- Violation of Foreign Key
		ELSE Set @RC = -100;
	End Catch
	Return @RC;
End -- Body
Go
Grant Exec on pDelCustomerType to Public;
Go

Create -- Drop
View vCustomerTypes
AS 
Select CustomerTypeID, CustomerTypeName
From CustomerTypes;
Go

Create -- Drop
Procedure pSelCustomerType
(@CustomerTypeID int = null, @CustomerTypeName nVarchar(100) = null)
AS
Begin -- Body
	Declare @RC int = 0;
	Begin Try
		If (@CustomerTypeID is Null AND @CustomerTypeName is Null)
			Select CustomerTypeID, CustomerTypeName
			From vCustomerTypes;
		Else
			Select CustomerTypeID, CustomerTypeName
			From vCustomerTypes
			Where CustomerTypeID = @CustomerTypeID
			Or CustomerTypeName = @CustomerTypeName;
		Set @RC = 100;
	End Try
	Begin Catch
		Set @RC = -100;
	End Catch
	Return @RC;
End -- Body
Go
Grant Exec on pSelCustomerType to Public;
Go

-- Test the objects
Declare @NewlyInsertedID int;
Exec pInsCustomerType @CustomerTypeName = 'Wholesale', @NewRowID = @NewlyInsertedID Out;
Exec pInsCustomerType @CustomerTypeName = 'Retail', @NewRowID = @NewlyInsertedID Out;
Exec pInsCustomerType @CustomerTypeName = 'Anonymous', @NewRowID = @NewlyInsertedID Out;
Select @NewlyInsertedID as NewRowID

Go
Select CustomerTypeID, CustomerTypeName From vCustomerTypes;
Go
Exec pSelCustomerType;
Go
Exec pSelCustomerType @CustomerTypeID = 2
Go
Exec pSelCustomerType @CustomerTypeName = 'Retail';
Go
Exec pUpdCustomerType @CustomerTypeID = 3, @CustomerTypeName = 'CustomerType01';
Exec pSelCustomerType @CustomerTypeID = 3;
Go
Exec pDelCustomerType @CustomerTypeID = 3;
Exec pSelCustomerType;
Go


Create View vCustomersByCustomerTypes
AS
Select C.CustomerTypeID, CT.CustomerTypeName, C.CustomerID, C.CustomerName  
From Customers as C
Join CustomerTypes as CT
  On C.CustomerTypeID = CT.CustomerTypeID;
Go
Select CustomerTypeID, CustomerTypeName, CustomerID, CustomerName
from vCustomersByCustomerTypes;
Go

-- Add some simple Validation code
Alter Table Customers
  Add Constraint fkCustomersToCustomerTypeID 
  Foreign Key (CustomerTypeID) references CustomerTypes(CustomerTypeID);

-- Test it
Declare @NewlyInsertedID int, @RC int;
Exec @RC = pInsCustomer @CustomerName = 'Cust04', @CustomerTypeID = 123, @NewRowID = @NewlyInsertedID Out;
Select @RC as [This should fail since there is no Customer Type ID of 123]
Go