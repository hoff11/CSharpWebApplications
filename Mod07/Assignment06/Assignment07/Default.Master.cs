using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace Assignment07
{
    public partial class Default : MasterPage
    {
        protected void Page_Load (object sender, EventArgs e)
        {
            if (Request.Cookies["Login"] != null)
            {
                if (Session["objP"] != null)
                {
                    hello.Text = "Hello ";
                    string sessionData = Session["objP"].ToString();
                    nameEditable.Text = sessionData;
                    logout.Visible = true;
                    Login.Visible = false;
                    nameStorage.Value = sessionData;
                }
                else
                {
                    nameEditable.Text = "";
                }
            }
        }
        protected void HomeButton(object sender, EventArgs e)
        {
            Response.Redirect("Home.aspx");
        }
        protected void RequestLoginButton(object sender, EventArgs e)
        {
            Response.Redirect("RequestLogin.aspx");
        }
        protected void AboutUsButton(object sender, EventArgs e)
        {
            Response.Redirect("AboutUs.aspx");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("ApiCall.aspx");
        }

        protected void Login_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }

        protected void logout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("Login.aspx");
        }

        protected void Admin_Click(object sender, EventArgs e)
        {
            Response.Redirect("Admin.aspx");
        }
    }
}