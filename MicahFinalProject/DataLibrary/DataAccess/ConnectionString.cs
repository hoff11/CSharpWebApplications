using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataLibrary.DataAccess
{
    public static class ConnectionString
    {
        //connection string function
        public static string GetConnStr(string connectionName = "MicahFinalProjectDB")
        {
            return ConfigurationManager.ConnectionStrings[connectionName].ConnectionString;
        }
    }
}
