Use EFCodeFirstDemo;
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
		Set @RC = -100
	End Catch
End -- Body
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
		Set @RC = -100
	End Catch
End -- Body
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
		Set @RC = -100
	End Catch
End -- Body
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
		Set @RC = -100
	End Catch
End -- Body
Go

-- Test the objects
Declare @NewlyInsertedID int;
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

