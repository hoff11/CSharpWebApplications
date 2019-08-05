using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Data;
using System.Data.Entity.Core.Objects;

namespace TypicalClassLibrary
{
    #region Interfaces
    public interface ICustomerRepository
    {
        //Table Data
        IEnumerable<Customer> Customers { get; set; }
        int CustomerID { get; set; }
        string CustomerName { get; set; }
        int CustomerTypeID { get; set; }

        //Transaction Processing
        int InsCustomer(string CustomerName, int CustomerTypeID, out int NewRowID);
        int UpdCustomer(int CustomerID, string CustomerName, int CustomerTypeID);
        int DelCustomer(int CustomerID);
        
        //Query Processing
        IEnumerable<Customer> SelCustomer(int CustomerID = 0, string CustomerName = "", int CustomerTypeID = 0);
        IEnumerable<Customer> QueryCustomersView();
               
        //Most examples on the Web show a Save method that flushes changes from the hidden Dataset 
        //but, I am not using this features to avoid the overhead of the Dataset object.
        //void Save();
    }
    #endregion

#region Concrete Classes

public class Customer : ICustomerRepository
{
    IObjectContextAdapter Context;
    public Customer() { Context = new EFDbContext(); }

    #region Support for table data in Customers
    int intCustomerID;
    public int CustomerID
    {
        get { return intCustomerID; }
        set { intCustomerID = value; }
    }
    
    string strCustomerName;
    public string CustomerName
    {
        get { return strCustomerName; }
        set { strCustomerName = value; }
    }
    
    int intCustomerTypeID;
    public int CustomerTypeID
    {
        get { return intCustomerTypeID; }
        set { intCustomerTypeID = value; }
    }

    IEnumerable<Customer> objCustomers;
    public IEnumerable<Customer> Customers
    {
        get
        {
            return objCustomers;
        }
        set
        {
            objCustomers = value;
        }
    }
    #endregion

    #region Support for table Transaction processing

    public int InsCustomer(string CustomerName, int CustomerTypeID, out int NewRowID)
    {
        int RC = -1; //Used to trap the Stored Procedure's return code
        IParameterFactory objParams = new CustomersParameterFactory(CustomerName: CustomerName, CustomerTypeID: CustomerTypeID);
        string strSQLCode = @"Exec @RC = pInsCustomer " +
                        "  @CustomerName = '" + CustomerName + "'" + // Don't forget the SINGLE Quotes!!!
                        ", @CustomerTypeID = " + CustomerTypeID.ToString() + 
                        ", @NewRowID = @NewRowID Out;";
        try
        {
            this.Context.ObjectContext.ExecuteStoreCommand(strSQLCode
                                                        , objParams.Parmeters["RC"]
                                                        , objParams.Parmeters["CustomerName"]
                                                        , objParams.Parmeters["CustomerTypeID"]
                                                        , objParams.Parmeters["NewRowID"]
                                                        );
            //Get the new row ID created by the table's Identity feature
            if (objParams.Parmeters["NewRowID"].Value is DBNull) 
            { NewRowID = 0; } //if the insert has failed, then set this to an arbitrary number
            else { NewRowID = (int)objParams.Parmeters["NewRowID"].Value; } //else send it back as output

            //Trap or return the Stored Procedure's return code
            RC = (int)objParams.Parmeters["RC"].Value;
            if ( RC < 0)
            { throw new Exception("Error reported in Stored Procedure: " + objParams.Parmeters["RC"].Value.ToString()); }
        }
        catch (Exception)
        {
            throw;
        }
        return RC;
    }

    public int UpdCustomer(int CustomerID, string CustomerName, int CustomerTypeID)
    {
        int RC = -1; //Used to trap the Stored Procedure's return code
        IParameterFactory objParams = new CustomersParameterFactory(CustomerName: CustomerName, CustomerTypeID: CustomerTypeID); 
        string strSQLCode = @"Exec @RC = pUpdCustomer " +
                        "  @CustomerID = " + CustomerID.ToString() +
                        ", @CustomerName = '" + CustomerName + "'" +  // Don't forget the SINGLE Quotes!!!
                        ", @CustomerTypeID = " + CustomerTypeID.ToString();
        try
        {
            this.Context.ObjectContext.ExecuteStoreCommand(strSQLCode
                                                        , objParams.Parmeters["RC"]
                                                        , objParams.Parmeters["CustomerID"]
                                                        , objParams.Parmeters["CustomerName"]
                                                        , objParams.Parmeters["CustomerTypeID"]
                                                        );
            //Trap or return the Stored Procedure's return code
            if ((int)objParams.Parmeters["RC"].Value < 0)
            { throw new Exception("Error reported in Stored Procedure: " + objParams.Parmeters["RC"].Value.ToString()); }
        }
        catch (Exception)
        {
            throw;
        }
        return RC;
    }

    public int DelCustomer(int CustomerID)
    {
        int RC = -1; //Used to trap the Stored Procedure's return code
        IParameterFactory objParams = new CustomersParameterFactory(CustomerID: CustomerID);
        string strSQLCode = @"Exec @RC = pDelCustomer @CustomerID = " + CustomerID.ToString() + ";";
        try
        {
            this.Context.ObjectContext.ExecuteStoreCommand(strSQLCode
                                                          , objParams.Parmeters["RC"]
                                                          , objParams.Parmeters["CustomerID"]);

            //Trap or return the Stored Procedure's return code
            if ((int)objParams.Parmeters["RC"].Value < 0)
            { throw new Exception("Error reported in Stored Procedure: " + objParams.Parmeters["RC"].Value.ToString()); }
        }
        catch (Exception)
        {
            throw;
        }
        return RC;
    }

    #endregion

    #region Support for table Query processing

    public IEnumerable<Customer> SelCustomer(int CustomerID = 0, string CustomerName = "", int CustomerTypeID = 0)
    {
        IParameterFactory objParams = new CustomersParameterFactory(CustomerID: CustomerID, CustomerName: CustomerName, CustomerTypeID: CustomerTypeID);
        string strSQLCode;
        List<Customer> objResults;
        if (CustomerID == 0)
        {
            strSQLCode = @"Exec @RC = pSelCustomer";
        }
        else
        {
            strSQLCode = @"Exec @RC = pSelCustomer " +
                            "  @CustomerID = " + CustomerID.ToString() +
                            ", @CustomerName = '" + CustomerName + "'" +  // Don't forget the SINGLE Quotes!!!
                            ", @CustomerTypeID = " + CustomerTypeID.ToString();
        }
        try
        {
            ObjectResult<Customer> objData = this.Context.ObjectContext.ExecuteStoreQuery<Customer>(strSQLCode
                                                        , objParams.Parmeters["RC"]
                                                        , objParams.Parmeters["CustomerID"]
                                                        , objParams.Parmeters["CustomerName"]
                                                        , objParams.Parmeters["CustomerTypeID"]
                                                        );
            if (objData != null)
            { objResults = objData.ToList<Customer>(); }
            else
            {
                objResults = new List<Customer>();
                objResults.Add(new Customer() { CustomerID = -0, CustomerName = "no rows found", CustomerTypeID = -1 });
            }

            if ((int)objParams.Parmeters["RC"].Value < 0)
            { throw new Exception("Error reported in Stored Procedure!"); }
        }
        catch (Exception)
        {
            throw;
        }
        return objResults;
    }

    public IEnumerable<Customer> QueryCustomersView()
    {
        string strSQLCode = "Select CustomerID, CustomerName, CustomerTypeID From vCustomers;";
        ObjectResult<Customer> objResults;
        try
        {
            objResults = Context.ObjectContext.ExecuteStoreQuery<Customer>(strSQLCode);
        }
        catch (Exception)
        {
            throw;
        }
        return objResults.ToList<Customer>();
    }
    #endregion

    public override string ToString()
    {
        return CustomerID.ToString() + "," + CustomerName + "," + CustomerTypeID.ToString();
    }
}//end class

#endregion
}//end namespace