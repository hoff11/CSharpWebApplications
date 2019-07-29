using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace Assignment06
{
    public partial class Default : MasterPage
    {
        protected void Page_Load (object sender, EventArgs e)
        {
            if (Session["objP"] != null)
            {
                UserName.Text = "Hello " + Session["objP"].ToString() + "!";
            }
            else
            {
                UserName.Text = "";
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
    }
}