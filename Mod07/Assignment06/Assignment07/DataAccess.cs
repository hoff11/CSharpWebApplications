using Dapper;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace Assignment07
{
    public class DataAccess
    {
        public List<AvailableClass> GetClass()
        {
            using (var connection = new SqlConnection(SqlHelper.ConnValue("UW")))
            {
                var output = connection.Query<AvailableClass>("dbo.pSelClassesByStudentId @StudentId", new { StudentId = 1 }).ToList();
                return output;
            }
        }
    }
}