//For EF and ADO.NET
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Data;
using System.Data.Entity.Core.Objects;

namespace TypicalClassLibrary
{
    public class EFDbContext : DbContext
    {
        //Set up the connection using the Constructor
        public EFDbContext()
            : base("name=EFDbContext")
        {
            //Stop EF from automatically mapping to a missing "Customer" table
            DbModelBuilder objDBMB = new DbModelBuilder();
            objDBMB.Ignore<Customer>();
            //objDBMB.Ignore<CustomerType>();//I would add a line for each table in the DB
        }
    }//end class
}//end namespace
