//For EF and ADO.NET
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Data.Entity.Core.Objects;

namespace TypicalClassLibrary
{
    interface IParameterFactory 
    {
        Dictionary<string, SqlParameter> Parmeters { get; set; }
    }

    public abstract class ParameterFactory:IParameterFactory
    {
        public ParameterFactory()
        {
            objParmeters = new Dictionary<string, SqlParameter>();
            SqlParameter objNewRowID = new SqlParameter("@NewRowID", SqlDbType.Int);
            objNewRowID.Direction = ParameterDirection.Output; //Needed since Output is not default
            Parmeters.Add("NewRowID", objNewRowID);

            SqlParameter objRC = new SqlParameter("@RC", SqlDbType.Int);
            //objRC.Direction = ParameterDirection.ReturnValue; EF does not support ReturnValue directly
            objRC.Direction = ParameterDirection.Output; //But you can use Output!
            Parmeters.Add("RC", objRC);
        }

        private Dictionary<string, SqlParameter> objParmeters;        
        public Dictionary<string, SqlParameter> Parmeters
        {
            get
            {
                return objParmeters;
            }
            set
            {
                objParmeters = value;
            }
        }
    }

    public class CustomersParameterFactory: ParameterFactory
    {   
        //Customers
        public CustomersParameterFactory (int CustomerID = 0, string CustomerName = "", int CustomerTypeID = 0)
        {
            SqlParameter objCustomerID = new SqlParameter();
            objCustomerID.Direction = ParameterDirection.Input; //Note: Input is the default
            objCustomerID.ParameterName = "@CustomerID"; //The name must match the SQL argument's name!
            objCustomerID.SqlDbType = SqlDbType.Int; // The data type must match what is in the database!
            objCustomerID.Value = CustomerID; // Value you want to pass in
            this.Parmeters.Add("CustomerID", objCustomerID);

            SqlParameter objCustomerName = new SqlParameter("@CustomerName", CustomerName);
            objCustomerName.SqlDbType = SqlDbType.NVarChar;
            objCustomerName.Size = 100;
            this.Parmeters.Add("CustomerName", objCustomerName);

            SqlParameter objCustomerTypeID = new SqlParameter("@CustomerTypeID", CustomerTypeID);
            objCustomerTypeID.SqlDbType = SqlDbType.Int;
            this.Parmeters.Add("CustomerTypeID", objCustomerTypeID);
        }
    }//end class

    public class CustomerTypesParameterFactory : ParameterFactory
    {
        //Customers
        public CustomerTypesParameterFactory(int CustomerTypeID = 0, string CustomerName = "")
        {
            //Lab Add code for parameters
        }
    }//end class

}//end namespace
