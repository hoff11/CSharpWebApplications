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
    public interface ICustomerTypeRepository
    {
        //Table Data
        IEnumerable<CustomerType> CustomerTypes { get; set; }
        int CustomerTypeID { get; set; }
        string CustomerTypeName { get; set; }

        //Transaction Processing
        int InsCustomerType(string CustomerTypeName, out int NewRowID);
        int UpdCustomerType(int CustomerTypeID, string CustomerTypeName);
        int DelCustomerType(int CustomerTypeID);

        //Query Processing
        IEnumerable<CustomerType> SelCustomerType(int CustomerTypeID = 0, string CustomerTypeName = "");
        IEnumerable<CustomerType> QueryCustomerTypesView();

    }//end class
    #endregion

    public class CustomerType : ICustomerTypeRepository
    {
        public IEnumerable<CustomerType> CustomerTypes
        {
            get
            {
                throw new NotImplementedException();
            }
            set
            {
                throw new NotImplementedException();
            }
        }

        public int CustomerTypeID
        {
            get
            {
                throw new NotImplementedException();
            }
            set
            {
                throw new NotImplementedException();
            }
        }

        public string CustomerTypeName
        {
            get
            {
                throw new NotImplementedException();
            }
            set
            {
                throw new NotImplementedException();
            }
        }

        public int InsCustomerType(string CustomerTypeName, out int NewRowID)
        {
            throw new NotImplementedException();
        }

        public int UpdCustomerType(int CustomerTypeID, string CustomerTypeName)
        {
            throw new NotImplementedException();
        }

        public int DelCustomerType(int CustomerTypeID)
        {
            throw new NotImplementedException();
        }

        public IEnumerable<CustomerType> SelCustomerType(int CustomerTypeID = 0, string CustomerTypeName = "")
        {
            throw new NotImplementedException();
        }

        public IEnumerable<CustomerType> QueryCustomerTypesView()
        {
            throw new NotImplementedException();
        }
    }//end class
}
