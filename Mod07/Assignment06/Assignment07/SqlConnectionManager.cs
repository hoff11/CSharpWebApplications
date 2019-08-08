using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.OleDb;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace Assignment07
{
    public static class SqlConnectionManager
    {
        public static class ConnectionManager
        {
            public static SqlConnection GetSqlConnection()
            {
                string connectionString = ConfigurationManager.ConnectionStrings["UW"].ConnectionString;
                var connection = new SqlConnection(connectionString);
                return connection;
            }

            public static OleDbConnection GetOleDbConnection()
            {
                string connectionString = ConfigurationManager.ConnectionStrings["UW"].ConnectionString;
                var connection = new OleDbConnection(connectionString);
                return connection;
            }
        }
    }
}