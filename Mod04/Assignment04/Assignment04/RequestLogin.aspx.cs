using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assignment04
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["NewUserForm"].ConnectionString;
        protected void RegisterButon(object sender, EventArgs e)
        {
            using (SqlConnection connection = new SqlConnection(cs))
            {
                try
                {
                    SqlCommand command = new SqlCommand();
                    command.CommandText = "spUser_New";
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.Add("@name", SqlDbType.VarChar).Value = TextBox1.Text.Trim();
                    command.Parameters.Add("@username", SqlDbType.VarChar).Value = TextBox2.Text.Trim();
                    command.Parameters.Add("@email", SqlDbType.VarChar).Value = TextBox3.Text.Trim();
                    command.Parameters.Add("@reason", SqlDbType.Text).Value = TextBox4.Text.Trim();
                    command.Connection = connection;
                    connection.Open();
                    command.ExecuteNonQuery();
                    Label1.Text = "Data inserted succesfully!";
                }
                catch (Exception ex) { Label1.Text += "<b>" + ex.ToString() + "</b>"; }
                finally { connection.Close(); } 
            }
        }
    }
}