using System;
using System.Data.SqlClient;

namespace ClassRegistrations.App_Code // Make sure to change the Build Action Property to Compile!
{
    public class LocalProcessor
    {
        private void SetupParameters(ref SqlCommand objCmd)
        {
            SqlParameter objP0 = new SqlParameter();
            objP0.Direction = System.Data.ParameterDirection.ReturnValue;
            objP0.ParameterName = "@RC";
            objP0.SqlDbType = System.Data.SqlDbType.Int;
            objCmd.Parameters.Add(objP0);

            SqlParameter objP1 = new SqlParameter();
            objP1.Direction = System.Data.ParameterDirection.Input;
            objP1.ParameterName = "@StudentID";
            objP1.SqlDbType = System.Data.SqlDbType.Int;
            objCmd.Parameters.Add(objP1);

            SqlParameter objP2 = new SqlParameter();
            objP2.Direction = System.Data.ParameterDirection.Input;
            objP2.ParameterName = "@StudentName";
            objP2.SqlDbType = System.Data.SqlDbType.NVarChar;
            objP2.Size = 100;
            objCmd.Parameters.Add(objP2);

            SqlParameter objP3 = new SqlParameter();
            objP3.Direction = System.Data.ParameterDirection.Input;
            objP3.ParameterName = "@StudentEmail";
            objP3.SqlDbType = System.Data.SqlDbType.NVarChar;
            objP3.Size = 100;
            objCmd.Parameters.Add(objP3);

            SqlParameter objP4 = new SqlParameter();
            objP4.Direction = System.Data.ParameterDirection.Input;
            objP4.ParameterName = "@StudentLogin";
            objP4.SqlDbType = System.Data.SqlDbType.NVarChar;
            objP4.Size = 50;
            objCmd.Parameters.Add(objP4);

            SqlParameter objP5 = new SqlParameter();
            objP5.Direction = System.Data.ParameterDirection.Input;
            objP5.ParameterName = "@StudentPassword";
            objP5.SqlDbType = System.Data.SqlDbType.NVarChar;
            objP5.Size = 50;
            objCmd.Parameters.Add(objP5);
        }

        public int Insert(string ConnectionString, int StudentID, string StudentName, string StudentEmail, string StudentLogin, string StudentPassword)
        {
            try
            {
                SqlConnection objCon = new SqlConnection(ConnectionString);
                SqlCommand objCmd = new SqlCommand("pInsStudents", objCon);
                objCmd.CommandType = System.Data.CommandType.StoredProcedure;
                SetupParameters(ref objCmd);
                objCmd.Parameters["@StudentID"].Value = StudentID;
                objCmd.Parameters["@StudentName"].Value = StudentName;
                objCmd.Parameters["@StudentEmail"].Value = StudentEmail;
                objCmd.Parameters["@StudentLogin"].Value = StudentLogin;
                objCmd.Parameters["@StudentPassword"].Value = StudentPassword;
                try
                {
                    objCon.Open();
                    objCmd.ExecuteNonQuery();
                    if ((int)objCmd.Parameters["@RC"].Value < 0) { throw (new Exception("An internal problem was reported by the stored procedure: " + objCmd.Parameters["@RC"].Value.ToString())); }
                }
                catch { throw; }
                finally { objCon.Close(); }
                return (int)objCmd.Parameters["@RC"].Value;
            }
            catch (Exception)
            {
                throw;
            }
        }

    }
}