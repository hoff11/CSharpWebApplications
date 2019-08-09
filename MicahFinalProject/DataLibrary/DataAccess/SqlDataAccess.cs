﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dapper;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace DataLibrary.DataAccess
{
    public static class SqlDataAccess
    {
        //connection string function
        public static string GetConnStr(string connectionName = "MicahFinalProjectDB")
        {
            return ConfigurationManager.ConnectionStrings[connectionName].ConnectionString;
        }

        //load from sql using dapper
        //no params you're getting all of it
        //load into model T
        //return a list of model T
        //call string sql select *, stored proc, etc
        public static List<T> LoadData<T>(string sql)
        {
            using(IDbConnection conn = new SqlConnection(GetConnStr()))
            {
                return conn.Query<T>(sql).ToList();
            }
        }

        //save one model T
        //model data you pass in, should have parameters matched to sql statement
        public static int SaveData<T>(string sql, T data)
        {
            using (IDbConnection conn = new SqlConnection(GetConnStr()))
            {
                //return number of rows affected should be 1
                return conn.Execute(sql, data);
            }
        }
    }
}