using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assignment07
{
    public partial class WebForm5 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void LoginButton_Click(object sender, EventArgs e)
        {
            //Not secure but testing
            //add cookie
            string cs = ConfigurationManager.ConnectionStrings["NewUserForm"].ConnectionString;
            SqlDataAdapter sqlDataAdapter = new SqlDataAdapter("Select * from newuser Where name='" + txtboxName.Text + "' and email='" + txtboxEmail.Text + "'", cs);
            DataTable data = new DataTable();
            sqlDataAdapter.Fill(data);

            if(data.Rows.Count.ToString() == "1")
            {
                HttpCookie cookie = new HttpCookie("Login");
                cookie["username"] = data.Rows[0]["name"].ToString();
                cookie.Expires = DateTime.Now.AddDays(10d);
                Response.Cookies.Add(cookie);
                string usrName = txtboxName.Text;
                Session["objP"] = usrName;
                Response.Redirect("Home.Aspx");
            }
            else
            {
                HyperLink register = new HyperLink();
                register.NavigateUrl = "RequestLogin.aspx";
                register.Text = "Request Login";
                
                loginnotification.Text = $"Please check your Name and email, or register here: <a href=\"RequestLogin.aspx\">Register</a>.";
            }

        }
    }
}